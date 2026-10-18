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
gwyID        = 4;  %Figyelem! Magasabb mintavételi frekvencián az ID MSByte-ja 1-re van állítva

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

TimeBase1    = 1/8e6;  % uC órajelének periódusideje a szenzoron
TimeBaseDiv1 = 4444;   % mintavételezés osztószáma a szenzoron
sampleTime1  = TimeBaseDiv1*TimeBase1; %mintavételi idõköz a szenzoron

TimeBase2    = 1/8e6;   % uC órajelének periódusideje a bázisállomáson
if (length(moteGwyData)>0)   %idöbélyeg
    if (moteGwyData(2,1)>0)  % mintavételezés osztószáma a bázisállomáson
        TimeBaseDiv2 = 4395;
    else
        TimeBaseDiv2 = 4444;
    end

sampleTime2   = TimeBaseDiv2*TimeBase2;  %mintavételi idõköz a bázisállomáson
sampleTimeGwy = sampleTime2;


if (length(syncDat)>0)   %van-e szinkronizációs pont

% lokális idõ a szenzoron
synchPoints1R = 256.^([0:4-1])*syncDat(5:5+4-1,:);  %szinkronizációs pontok kialakítása: egész számú kvantum mintavételi idõközben kifejezve
synchPoints1F = 256.^([0:2-1])*syncDat(9:9+2-1,:);  %mintavételi idõköz törtrésze
synchPoints1  = synchPoints1R*sampleTime1 + synchPoints1F*TimeBase1; %valós szinkronizációs pont

% lokális idõ a bázisállomáson
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

end %if (length(syncDat)>0)   %van-e szinkronizációs pont

else
    TimeBaseDiv2 = 4444;
end  %if (length(moteGwyData)>0)   %idöbélyeg


% **************************************************************************
% **************************************************************************
%
% Bázisállomás üzeneteinek formátum konverziója
%
% **************************************************************************
% **************************************************************************

% samples
if (length(moteGwyData)>0)   %van-e adat a gateway-tõl
    
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
fprintf(FIDGwyP,'%d %1.9f %3.3d %3.3d %3.3d %3.3d %3.3d %3.3d %3.3d %3.3d %3.3d %3.3d %3.3d %3.3d %3.3d %3.3d %3.3d %3.3d %3.3d %3.3d %3.3d %3.3d %3.3d %3.3d %3.3d %3.3d %3.3d \r\n', [msgSeq.' moteGwyTimeStamps.'  gwySamples.'].');
%                       0  1           5             10             15             20             25  
fclose(FIDGwyP);


FIDSensP = fopen('pre_gwySampFull.dat','w');
fprintf(FIDSensP,'%1.9f %3.3d \r\n', [moteGwyTimeStampsFull(:)  gwySamplesFull].');
fclose(FIDSensP);

%formátum:
% Msg_ID_1   t1=TimeStamp_1  phase(t1)  rez1Re(t1) rez1Im(t1) rez2Re(t1) rez2Im(t1) ... rez5Re(t1) rez5Im(t1)  1-5/odd
% Msg_ID_2   t2=TimeStamp_2  phase(t2)  rez1Re(t2) rez1Im(t2) rez2Re(t2) rez2Im(t2) ... rez5Re(t2) rez5Im(t2)  1-5/odd
% Msg_ID_3   t3=TimeStamp_3  phase(t3)  rez1Re(t3) rez1Im(t3) rez2Re(t3) rez2Im(t3) ... rez5Re(t3) rez5Im(t3)  1-5/odd
%  .
%  .
%  .
end  %if (length(moteGwyData)>0)   %idöbélyeg

% **************************************************************************
% **************************************************************************
%
% A szenzor üzeneteinek formátum konverziója (Fourier együtthatók tárolása)
%
% **************************************************************************
% **************************************************************************


% struct MicOlvMsg
%  {
%   uint16_t forrasMoteID;            //bytes: 1, 2
%   uint16_t csomagSzam;              //bytes: 3, 4
%   uint32_t ui32SampleTimeStamp;     //bytes: 5, 6, 7, 8
%   uint8_t  adat[BUFFER_SIZE];       //bytes: 9, 10 ... 33
%   uint32_t ui32LocTick;             //bytes: 34, 35, 36, 37  -- küldés idõpontja: durva felbontás
%   uint16_t ui16FineTimeStamp;       //bytes: 38, 39          -- küldés idõpontja: finom felbontás
%   uint16_t phaseAtSend;             //bytes: 40, 41   // format : 0ppp_ppp__pppp_ppp0  : elsõ és utolsó bit nulla
%  };
% a 31-edik byte jelzi, hogy az elsõ 5 vagy a páratlan harmonikusokat
% számítja
%  31. bit: 
%        0: res: 1...5;;;  
%        1: odd: 1,3,5,7,9

numOfResonator = 5;

%az egész mintavételi idõpontban olvassa ki a fázist, így elég az egész
%mintavételi idõpontot felhasználni idõbélyegként
%------------------S------|-----------S------------------S------------------S
%                         |
%               phase     |
%               send      send time fine
%
moteSensPhaseAtSend  = 256.^([0:2-1])*moteSensData(40:40+2-1,:) / 2^15 * 2*pi; %a fázis értéke a küldés idejében
moteSensResSendTime = 256.^([0:4-1])*moteSensData(34:34+4-1,:)*sampleTime1;  %a változók küldésének idõpontja

moteSensResModeOdd   = all(moteSensData(31,:)>0); 

%üzenet sorszám
msgSeq = 256.^([0:2-1])*moteSensData(3:3+2-1,:);

%a rezonátorok értékeinek a [9...(9+25-1)] byteok vannak fenntartva
%ebbõl az elsõ 2 byte nem hasznos
%az ezt követõ 2*2*5=20 byte a következõ formátumú:
%x_1_real_low x_1_real_high x_1_imag_low x_1_imag_high ... x_k_real_low x_k_real_high x_k_imag_low x_k_imag_high
%A többi byte nem hasznos
moteSensResonator   = moteSensData(9:9+datPerPack-1,:); 
moteSensResonator   = moteSensResonator(3:end,:);  %DC rezonátor eltávolítása
moteSensResonator   = moteSensResonator(1: 2*2*numOfResonator,:);  %azon komponensek eltávolítása, melyek nem tartalmaznak hasznos adatot
moteSensResonator(2:2:end,:) = (moteSensResonator(2:2:end,:)>=128)*(-256)+moteSensResonator(2:2:end,:); %átalakítás kettes komplemens kódból
resConversionMx  = []; 
for resSel=1:2*numOfResonator resConversionMx = blkdiag(resConversionMx,256.^([0:2-1]));end
%resConversionMx=
%|1 256 0  0  0  0  0   0   0   0  |
%|0  0  1 256 0  0  0   0   0   0  |
%|0  0  0  0  1 256 0   0   0   0  |
%|0  0  0  0  0  0  1  256  0   0  |
%|0  0  0  0  0  0  0   0   1  256 |
%
% A mátrix megfelelõ súlyozással "összeadja" az LSB és MSB byte-okat és meghagyja a sorokat
moteSensResonator   = resConversionMx*moteSensResonator;
moteSensResonator   = j *moteSensResonator(1:2:end,:) +  moteSensResonator(2:2:end,:);
moteSensResonator   = moteSensResonator.'/16/2;

numForm = '%+3.5f ';
fileFormatStr = ['%d %1.9f %1.6f     ' repmat(numForm,1,5) '   ' repmat(numForm,1,5) '%d' '\r\n'];
FIDSensP = fopen('pre_sensorResonator.dat','w');
fprintf(FIDSensP,fileFormatStr, [msgSeq.' moteSensResSendTime.' moteSensPhaseAtSend.' real(moteSensResonator)  imag(moteSensResonator) ones(size(msgSeq.'))*moteSensResModeOdd ].');  %moteSensResModeOdd.'
%fprintf(FIDSensP,'%f',20);
fclose(FIDSensP);

disp(['Az elofeldolgozas befejezodott.'])

%plot3(moteSensResSendTime,real(moteSensResonator),  imag(moteSensResonator) )

%formátum:
% Msg_ID_1   t1=TimeStamp_1  phase(t1)  rez1Re(t1) rez1Im(t1) rez2Re(t1) rez2Im(t1) ... rez5Re(t1) rez5Im(t1)  1-5/odd
% Msg_ID_2   t2=TimeStamp_2  phase(t2)  rez1Re(t2) rez1Im(t2) rez2Re(t2) rez2Im(t2) ... rez5Re(t2) rez5Im(t2)  1-5/odd
% Msg_ID_3   t3=TimeStamp_3  phase(t3)  rez1Re(t3) rez1Im(t3) rez2Re(t3) rez2Im(t3) ... rez5Re(t3) rez5Im(t3)  1-5/odd
%  .
%  .
%  .

%formátum:
% Msg_ID_1   t1=TimeStamp_1  phase(t1)  rez1Re(t1) rez2Re(t1) ... rez5Re(t1) rez1Im(t1) rez2Im(t1) ... rez5Im(t1)  1-5/odd
% Msg_ID_2   t2=TimeStamp_2  phase(t2)  rez1Re(t2) rez2Re(t2) ... rez5Re(t2) rez1Im(t2) rez2Im(t2) ... rez5Im(t2)  1-5/odd
% Msg_ID_3   t3=TimeStamp_3  phase(t3)  rez1Re(t3) rez2Re(t3) ... rez5Re(t3) rez1Im(t3) rez2Im(t3) ... rez5Im(t3)  1-5/odd
%  .
%  .
%  .





















