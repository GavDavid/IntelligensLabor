clear

%egy csomagban lévõ adatok száma
datPerPack = 25;

%a rezonátoregyütthatók küldésének gyakorisága mintavételi idõközben kifejezve
resSendInterval = 125;
actReadPos = 1;

%szenzor mót azonosítója
sensorMoteID = 16+128;
%szinkronüzenet azonosítója
synchMsgID   = 68;
%bázisállomás (gateway) azonosítója
gwyID        = 4;

FIDMic = fopen('mic.dat');
micData = fscanf(FIDMic,'%f\n'); %az összes adat beolvasása
fclose(FIDMic);


%adott típusú üzenetek hossza
lengthOfMsg     = ones(1,256)*(length(micData)+1);
lengthOfMsg(sensorMoteID) = 39+2; %szenzor
lengthOfMsg(synchMsgID) = 16;     %szinkronüzenet
lengthOfMsg(gwyID)  = 33;         %gateway
lengthOfMsg(255)  = 8;            %frames

%rezonátorok száma
numOfResonator = 5;

%

% define BUFFER_SIZE 25
%
%struct MicOlvMsg
%  {
%	uint16_t forrasMoteID;
%	uint16_t csomagSzam;
%	uint32_t ui32SampleTimeStamp;
%	uint8_t  adat[BUFFER_SIZE];
% a következõ három elemet a bázisállomás nem küldi soros porton saját maga csomagjában csak
% a szenzor adatainak továbbításában
%	uint32_t ui32LocTick;         TS: lásd: (ábra: szinkronizációs pontok)
%	uint16_t ui16FineTimeStamp;   ts: lásd: (ábra: szinkronizációs pontok)
%  uint16_t phaseAtSend; // format : 0ppp_ppp__pppp_ppp0  : first and last bits are zero 
%  }; 


FIDSens    = fopen('sensorData.dat');
moteSensData = fscanf(FIDSens,'%f\n',[lengthOfMsg(sensorMoteID) inf]);  %eredetileg mote1Data
fclose(FIDSens);

FIDGwy  = fopen('gwySamp.dat');
moteGwyData = fscanf(FIDGwy,'%f\n',[lengthOfMsg(gwyID)  inf]);  %eredetileg mote2Data
fclose(FIDGwy);

FIDSyncP = fopen('stmpSync.dat');
syncDat = fscanf(FIDSyncP,'%f\n',[lengthOfMsg(synchMsgID) inf]);
fclose(FIDSyncP);

% **************************************************************************
% **************************************************************************
%
%
%  Szinkronizációs pontok formátumkonverziója
%
%
% **************************************************************************
% **************************************************************************

%A szinkronizációs pontokat tároló csomag formátuma:
%typedef struct SyncPoint{
%	uint16_t forrasMoteID;                  //bytes: 1,2 
%	uint16_t csomagSzam;                    //bytes: 3,4 
%	uint32_t ui32LocTickAtSender;           //bytes: 5,6,7,8 
%	uint16_t ui16FineTimeStampAtSender;     //bytes: 9,10
%	uint32_t ui32LocTickAtReceiver;         //bytes: 11,12,13,14
%	uint16_t ui16FineTimeStampAtReceiver;   //bytes: 15,16
%   }SyncPointType;

% ábra: szinkronizációs pontok
%sensor
%             TSync_s
%<----------------------------->|
%                               |
%                            ts |
%            1            |<--->| 
%------------+------------+-----S------+------------+------------+------------+----------->
%                      TS=2     |
%                               |
%                               |
%                         tr    |
%gateway             |<-------->|
%                    |          V
%-------+------------+----------R-+------------+------------+------------+------------+--->
%       1         TR=2          |
%                               |
%<----------------------------->|
%         TSync_g
%
% A szinkronizációs pontok az üzenet küldésének (S) és fogadásának (R) idõpontja a szenzor
% és a gateway lokális ideje alapján. Az idõbélyeg két részben kerül továbbításra:
% 1) az adott egység (szenzor vagy gateway) bekapcsolása óta eltelt idõ mintavételekben kifejezve
%      az ábrán ez TS illetve TR
% 2) az utolsó mintavétel óta eltelt idõ: ts ileltve tr
% ezen két adatból igen pontosan visszaállítható a valódi idõ


TimeBase1    = 1/8e6;  % uC órajelének periódusideje a szenzoron
TimeBaseDiv1 = 4444;   % mintavételezés osztószáma a szenzoron
sampleTime1  = TimeBaseDiv1*TimeBase1; %mintavételi idõköz a szenzoron
sampleTimeSens = sampleTime1;

TimeBase2    = 1/8e6;   % uC órajelének periódusideje a bázisállomáson
if (moteGwyData(2,1)>0)  % mintavételezés osztószáma a bázisállomáson
    TimeBaseDiv2 = 4395;
else
    TimeBaseDiv2 = 4444;
end
sampleTime2   = TimeBaseDiv2*TimeBase2;  %mintavételi idõköz a bázisállomáson
sampleTimeGwy = sampleTime2;
% lokális idõ a szenzoron: a csomag 5...8 -adik byte 32bites unsigned-ként a mintavételi idõközben mért idõ
% lokális idõ a szenzoron: a csomag 9,10 -edik byte 16bites unsigned-ként a mintavételi idõköz tört részében mért idõ
synchPoints1R = 256.^([0:4-1])*syncDat(5:5+4-1,:);  %szinkronizációs pontok kialakítása: egész számú kvantum mintavételi idõközben kifejezve
synchPoints1F = 256.^([0:2-1])*syncDat(9:9+2-1,:);  %mintavételi idõköz törtrésze
synchPoints1  = synchPoints1R*sampleTime1 + synchPoints1F*TimeBase1; %valós szinkronizációs pont

% lokális idõ a bázisállomáson: a csomag 11...14 -edik byte 32bites unsigned-ként a mintavételi idõközben mért idõ
% lokális idõ a bázisállomáson: a csomag 15,16 -odik byte 16bites unsigned-ként a mintavételi idõköz tört részében mért idõ
synchPoints2R = 256.^([0:4-1])*syncDat(11:11+4-1,:);  %szinkronizációs pontok kialakítása: egész számú kvantum mintavételi idõközben kifejezve
synchPoints2F = 256.^([0:2-1])*syncDat(15:15+2-1,:);  %mintavételi idõköz törtrésze
synchPoints2  = synchPoints2R*sampleTime2 + synchPoints2F*TimeBase2; %valós szinkronizációs pont

%fileformátum:
% lokális idõ a bázisállomáson_1    lokális idõ a szenzoron_1
% lokális idõ a bázisállomáson_2    lokális idõ a szenzoron_2
% lokális idõ a bázisállomáson_3    lokális idõ a szenzoron_3
FIDSyncP = fopen('pre_stmpSync.dat','w');
fprintf(FIDSyncP,'%1.9f %1.9f\n', [synchPoints2.' synchPoints1.'].');
fclose(FIDSyncP);




% **************************************************************************
% **************************************************************************
%
% Bázisállomás üzeneteinek formátum konverziója
%
% **************************************************************************
% **************************************************************************

% samples
gwySamples = moteGwyData(9:9+datPerPack-1,:);  %data in byte positions [9-33] are the samples
gwySamplesFull = gwySamples(:);

%time stamps
moteGwyTimeStamps = 256.^([0:4-1])*moteGwyData(5:5+4-1,:)*sampleTimeGwy;  %data in byte positions [5-8] are the time stamp of the packet
moteGwyTimeStampsFull = repmat(moteGwyTimeStamps,datPerPack,1);
moteGwyTimeStampsFull = (moteGwyTimeStampsFull + [0:datPerPack-1]'*ones(1,length(moteGwyTimeStampsFull))*sampleTimeGwy);
moteGwyTimeStampsFull = moteGwyTimeStampsFull(:);

%msg sequence numbers
msgSeq = 256.^([0:2-1])*moteGwyData(3:3+2-1,:);

FIDGwyP = fopen('pre_gwySamp.dat','w');
fprintf(FIDGwyP,'%d %1.9f %3.3d %3.3d %3.3d %3.3d %3.3d %3.3d %3.3d %3.3d %3.3d %3.3d %3.3d %3.3d %3.3d %3.3d %3.3d %3.3d %3.3d %3.3d %3.3d %3.3d %3.3d %3.3d %3.3d %3.3d %3.3d \n', [msgSeq.' moteGwyTimeStamps.'  gwySamples.'].');
%                       0   1                       5                            10                             15                            20                           25  
fclose(FIDGwyP);
%formátum:
% Msg_ID_1   TimeStamp_1   d1   d2   d3   ....   d25
% Msg_ID_2   TimeStamp_2   d26  d27  d28  ....   d50
% Msg_ID_3   TimeStamp_3   d51  d52  d53  ....   d75
%  .
%  .
%  .


FIDSensP = fopen('pre_gwySampFull.dat','w');
fprintf(FIDSensP,'%1.9f %3.3d \n', [moteGwyTimeStampsFull(:)  gwySamplesFull].');
fclose(FIDSensP);


% **************************************************************************
% **************************************************************************
%
% Szenzor üzeneteinek formátum konverziója
%
% **************************************************************************
% **************************************************************************


% samples
sensSamples = moteSensData(9:9+datPerPack-1,:);  %data in byte positions [9-33] are the samples
sensSamplesFull = sensSamples(:);

%time stamps
moteSensTimeStamps = 256.^([0:4-1])*moteSensData(5:5+4-1,:)*sampleTimeSens;  %data in byte positions [5-8] are the time stamp of the packet
moteSensTimeStampsFull = repmat(moteSensTimeStamps,datPerPack,1);
moteSensTimeStampsFull = (moteSensTimeStampsFull + [0:datPerPack-1]'*ones(1,length(moteSensTimeStampsFull))*sampleTimeSens);
moteSensTimeStampsFull = moteSensTimeStampsFull(:);

%msg sequence numbers
msgSeq = 256.^([0:2-1])*moteSensData(3:3+2-1,:);

FIDSensP = fopen('pre_sensorData.dat','w');
fprintf(FIDSensP,'%d %1.9f %3.3d %3.3d %3.3d %3.3d %3.3d %3.3d %3.3d %3.3d %3.3d %3.3d %3.3d %3.3d %3.3d %3.3d %3.3d %3.3d %3.3d %3.3d %3.3d %3.3d %3.3d %3.3d %3.3d %3.3d %3.3d \n', [msgSeq.' moteSensTimeStamps.'  sensSamples.'].');
%                       0   1                       5                            10                             15                            20                           25  
fclose(FIDSensP);
%formátum:
% Msg_ID_1   TimeStamp_1   d1   d2   d3   ....   d25
% Msg_ID_2   TimeStamp_2   d26  d27  d28  ....   d50
% Msg_ID_3   TimeStamp_3   d51  d52  d53  ....   d75
%  .
%  .
%  .

FIDSensP = fopen('pre_sensorDataFull.dat','w');
fprintf(FIDSensP,'%1.9f %3.3d \n', [moteSensTimeStampsFull(:)  sensSamplesFull].');
fclose(FIDSensP);






%Time stamps are generated for each packet but not for each sample.
%Time stamps are extended for each sample as follows: the time stamp i.e., T_t(n) is
%applied to the first sample in the packet. The k-th sample in the packet
%is generated as follows: T_sample(k) = T_t(n) + Ts*k , where Ts is the
%samplint period
%-----mote1TimeStampsRaw = 256.^([0:4-1])*mote1Data(5:5+4-1,:);
%-----mote1TimeStamps    = 256.^([0:4-1])*mote1Data(5:5+4-1,:);
% First step: compose the vector T_tv of time stamps:
% T_tv = [T_t(0) T_t(1) T_t(2) T_t(3) T_t(4) T_t(5) ... ]
% Second step: extend the vector by pereating it datPerPack times (datPerPack is the number of samples in one packet)
% T_tm = [T_t(0) T_t(1) T_t(2) T_t(3) T_t(4) T_t(5) ... ]
%        [T_t(0) T_t(1) T_t(2) T_t(3) T_t(4) T_t(5) ... ]
%                       .
%                       .
%                       .
%        [T_t(0) T_t(1) T_t(2) T_t(3) T_t(4) T_t(5) ... ]
%        [T_t(0) T_t(1) T_t(2) T_t(3) T_t(4) T_t(5) ... ]
% third step: add the time ofsets 
%
% T_tm = [T_t(0)+0*Ts    T_t(1)+0*Ts    T_t(2)+0*Ts    T_t(3)+0*Ts    T_t(4)+0*Ts    T_t(5)+0*Ts ... ]
%        [T_t(0)+1*Ts    T_t(1)+1*Ts    T_t(2)+1*Ts    T_t(3)+1*Ts    T_t(4)+1*Ts    T_t(5)+1*Ts ... ]
%                                .
%                                .
%                                .
%        [T_t(0)+p*Ts    T_t(1)+p*Ts    T_t(2)+p*Ts    T_t(3)+p*Ts    T_t(4)+p*Ts    T_t(5)+p*Ts ... ]
%        [T_t(0)+q*Ts    T_t(1)+q*Ts    T_t(2)+q*Ts    T_t(3)+q*Ts    T_t(4)+q*Ts    T_t(5)+q*Ts ... ]
%
% fourth step: read the values columnwise
%time stamps of the sensor
%----mote1TimeStamps = repmat(mote1TimeStamps,datPerPack,1); 
%----mote1TimeStamps = (mote1TimeStamps + [0:datPerPack-1]'*ones(1,length(mote1TimeStamps)))*sampleTime1;

disp(['Az elofeldolgozas befejezodott.'])


