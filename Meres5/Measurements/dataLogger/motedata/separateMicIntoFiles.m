disp('==================================')
disp('==================================')
disp('==================================')

%FIDmd = fopen('./../mic.dat');
FIDmd = fopen('E:/users/Orosz/Oktatas/MScInfromFeldolg/RezDataDisp/motedata/mic.dat');

dataIn = fscanf(FIDmd,'%f\n');
fclose(FIDmd);

FIDmote1 = fopen('mote1.dat','w');
FIDmote2 = fopen('mote2.dat','w');
FIDsync  = fopen('sync.dat','w');
FIDerror = fopen('error.dat','w');
FIDFrameRes = fopen('frameAndResSync.dat','w');


datPerPack = 25;
actReadPos = 1;

moteDrawColor(1)='k';
moteDrawColor(2)='r';

lengthOfMsg     = ones(1,68)*(length(dataIn)+1);
lengthOfMsg(16) = 39+2;
lengthOfMsg(68) = 16;
lengthOfMsg(4)  = 33;
lengthOfMsg(255)= 8; %frames


FIDselectionTable     = ones(1,68)*FIDerror;
FIDselectionTable(16) = FIDmote1;  %sensor
FIDselectionTable(68) = FIDsync;
FIDselectionTable(4)  = FIDmote2;  %gateway
FIDselectionTable(255) = FIDFrameRes;  %frame and resSynch

enableToContinue = (length(dataIn)-actReadPos+1) >=  lengthOfMsg(dataIn(actReadPos)) ;

while (enableToContinue)
    moteID = dataIn(actReadPos);
    fprintf(   FIDselectionTable(moteID),  '%d\n',  dataIn([actReadPos:actReadPos+lengthOfMsg(moteID)-1])    );
    try 
        actReadPos = actReadPos + lengthOfMsg(moteID);
    catch 
        enableToContinue = false;
    end
    try 
        if (actReadPos<=length(dataIn))
            moteID = dataIn(actReadPos);
            enableToContinue = (length(dataIn)-actReadPos+1) >=  lengthOfMsg(dataIn(actReadPos)) ;
        else 
            enableToContinue = false;
        end
    catch
        enableToContinue = false;
        waring('Problem with the structure of the data file. The file isn`t processed entirely.')
    end
end



fclose(FIDmote1);
fclose(FIDmote2);
fclose(FIDsync);
fclose(FIDerror);


FIDgen    = fopen('mote1.dat');
mote1Data = fscanf(FIDgen,'%f\n',[lengthOfMsg(16) inf]);
fclose(FIDgen);

FIDgen    = fopen('mote2.dat');
mote2Data = fscanf(FIDgen,'%f\n',[lengthOfMsg(4)  inf]);
fclose(FIDgen);

FIDgen    = fopen('sync.dat');
syncData  = fscanf(FIDgen,'%f\n',[lengthOfMsg(68) inf]);
fclose(FIDgen);

%----------------------------- 
TimeBase1    = 1/8e6;
TimeBaseDiv1 = 4444;
sampleTime1  = TimeBaseDiv1*TimeBase1;

TimeBase2    = 1/8e6;
if (mote2Data(2,1)>0)
    TimeBaseDiv2 = 4395;
else
    TimeBaseDiv2 = 4444;
end
sampleTime2  = TimeBaseDiv2*TimeBase2;
%-----------------------------

mote1PackSeq    = 256.^([0:2-1])*mote1Data(3:3+2-1,:); 
mote2PackSeq    = 256.^([0:2-1])*mote2Data(3:3+2-1,:); 
syncPackSeq     = 256.^([0:2-1])*syncData(3:3+2-1,:); 


mote1Samples    = mote1Data(9:9+datPerPack-1,:); mote1Samples = mote1Samples(:);
mote1TimeStampsRaw = 256.^([0:4-1])*mote1Data(5:5+4-1,:);
mote1TimeStamps = 256.^([0:4-1])*mote1Data(5:5+4-1,:);
mote1TimeStamps = repmat(mote1TimeStamps,datPerPack,1);
mote1TimeStamps = (mote1TimeStamps + [0:datPerPack-1]'*ones(1,length(mote1TimeStamps)))*sampleTime1;
mote1TimeStamps = mote1TimeStamps(:);

mote2Samples    = mote2Data(9:9+datPerPack-1,:); mote2Samples = mote2Samples(:);
mote2TimeStamps = 256.^([0:4-1])*mote2Data(5:5+4-1,:);
mote2TimeStamps = repmat(mote2TimeStamps,datPerPack,1);
mote2TimeStamps = (mote2TimeStamps + [0:datPerPack-1]'*ones(1,length(mote2TimeStamps)))*sampleTime2;
mote2TimeStamps = mote2TimeStamps(:);

%--------------------
synchPoints1R = 256.^([0:4-1])*syncData(5:5+4-1,:);
synchPoints1F = 256.^([0:2-1])*syncData(9:9+2-1,:);
synchPoints1  = synchPoints1R*sampleTime1 + synchPoints1F*TimeBase1;

synchPoints2R = 256.^([0:4-1])*syncData(11:11+4-1,:);
synchPoints2F = 256.^([0:2-1])*syncData(15:15+2-1,:);
synchPoints2  = synchPoints2R*sampleTime2 + synchPoints2F*TimeBase2;

datNum = min([length(mote1TimeStamps),length(mote2TimeStamps),datPerPack*length(synchPoints1),datPerPack*length(synchPoints2)]);

mote1Samples    = mote1Samples(1:datNum);  
mote2Samples    = mote2Samples(1:datNum);

mote1Samples    = mote1Samples-mean(mote1Samples);  
mote2Samples    = mote2Samples-mean(mote2Samples);
warning('DC removed')

mote1TimeStamps = mote1TimeStamps(1:datNum);
mote2TimeStamps = mote2TimeStamps(1:datNum);
synchPoints1    = synchPoints1(1:datNum/datPerPack);
synchPoints2    = synchPoints2(1:datNum/datPerPack);
%-----------------------------

m2datNum = length(mote2Samples);
fs2 = 1/sampleTime2;
Ts2 = 1/fs2;
df2 = fs2/m2datNum;
fM2 = [0:m2datNum-1]*df2;
tM2 = [0:m2datNum-1]*Ts2;
tM2 = mote2TimeStamps;

winfun=hanning(m2datNum); winfun=winfun/sum(winfun);
MOTE2Samples = fft(mote2Samples.*winfun);

fig=figure(101090723);
set(fig,'Name',['MOTE2: time function of data of mote2. fs=' sprintf('%4.1f',1/sampleTime2)])
plot(tM2,mote2Samples,moteDrawColor(2))
grid

fig=figure(102090723);
set(fig,'Name',['MOTE2: spectrum of data of mote2. fs=' sprintf('%4.1f',1/sampleTime2)])
plot(fM2,20*log10(abs(MOTE2Samples)),moteDrawColor(2))
grid
%-----------------------------
m1datNum = length(mote1Samples);
fs1 = 1/sampleTime1;
Ts1 = 1/fs1;
df1 = fs1/m1datNum;
fM1 = [0:m1datNum-1]*df1;
tM1 = [0:m1datNum-1]*Ts1;
tM1 = mote1TimeStamps;

winfun=hanning(m1datNum); winfun=winfun/sum(winfun);
MOTE1Samples = fft(mote1Samples.*winfun);

fig=figure(103090723);
set(fig,'Name',['MOTE1: time function of data of mote1. fs=' sprintf('%4.1f',1/sampleTime1)])
plot(tM1,mote1Samples,moteDrawColor(1))
grid

fig=figure(104090723);
set(fig,'Name',['MOTE1: spectrum of data of mote1. fs=' sprintf('%4.1f',1/sampleTime1)])
plot(fM1,20*log10(abs(MOTE1Samples)),moteDrawColor(1))
grid

%time stamp conversation with regression
PTimeTr = polyfit(synchPoints1,synchPoints2,1);
tM1Conv = polyval(PTimeTr,tM1); %time stamp transformation with polynom fitting

%time stamp conversation with continuous offset compenstaion
timeOffs = (synchPoints2-synchPoints1); timeOffs = repmat(timeOffs,datPerPack,1);timeOffs=timeOffs(:);
tM1Conv = tM1+timeOffs; 

synchPoints1Conv = polyval(PTimeTr,synchPoints1); 



fig=figure(105090723);
set(fig,'Name','MOTE1+MOTE2: comparison with original time stamps')
plot(tM1,mote1Samples,[moteDrawColor(1) 'o-']     ,tM2,mote2Samples,[moteDrawColor(2) 's-'])
legend('sensor','gateway')
grid

fig=figure(106090723);
set(fig,'Name','MOTE1+MOTE2: comparison with transformed time stamps')
clf;
plot(tM1Conv,mote1Samples,[moteDrawColor(1) 'o-'], tM2,mote2Samples,[moteDrawColor(2) 's-'])
legend('sensor','gateway')
grid
%%

selectTime = 40:6000;
mote1SamplesInterp   = zeros(length(selectTime),1);
mote1SamplesInterpLS = zeros(length(selectTime),1);
nInt  = 5;  np1Int = nInt+1;
selMx = eye(nInt)>0;

ptrS = 1;
for ptrGwy = selectTime
    tAct      = tM2(ptrGwy);
    while (tM1Conv(ptrS)<tAct)
        ptrS = ptrS + 1; %this is the next sample
    end
    TsCalcInt = tM1Conv(ptrS) - tM1Conv(ptrS-1);
    dTInt     = tM2(ptrGwy)   - tM1Conv(ptrS-1);
    dTIntCo   = TsCalcInt-dTInt;
    %first order interpolation
    mote1SamplesInterp1st(ptrGwy-selectTime(1)+1)  = ( dTInt*mote1Samples(ptrS) + dTIntCo*mote1Samples(ptrS - 1) )/TsCalcInt;
    %zero order hold
    mote1SamplesInterpZoh(ptrGwy-selectTime(1)+1) = mote1Samples(ptrS - 1);
    %n-th order interpolation
    tSel = (  tM1Conv(ptrS+[-(np1Int)/2:(np1Int)/2-1])  ).';
    interpVal = 0;
    for interpSt=1:np1Int
        tvInt = tSel; tvInt(interpSt) = [];
        Lpoly = prod(tAct-tvInt) / prod(tSel(interpSt)-tvInt);
        interpVal = interpVal + mote1Samples(ptrS-(np1Int/2)+interpSt-1)*Lpoly;
    end
    mote1SamplesInterpnth(ptrGwy-selectTime(1)+1) = interpVal;
    nLS = 8;
%     Pinterp = polyfit(tM1Conv(ptrS+[-nLS/2:nLS/2]),mote1Samples(ptrS+[-nLS/2:nLS/2]),5);
%     mote1SamplesInterpLS(ptrGwy-selectTime(1)+1) = polyval(Pinterp,tAct);
end

tMinterp1 = tM2(selectTime);

%%
fig=figure(107090723);
set(fig,'Name','MOTE1+MOTE2: comparison with interpolated signals')
plot(tM2(selectTime),mote2Samples(selectTime),[moteDrawColor(2) 's-'],...     
     tMinterp1,mote1SamplesInterpnth,'mo-',...  
     tMinterp1,mote1SamplesInterpnth,'ko-',...  
     tMinterp1,mote1SamplesInterpZoh,'go-',...  
     tMinterp1,mote1SamplesInterp1st,'bo-' )  
 %tM1Conv,mote1Samples,[moteDrawColor(1) 'o-'],...
grid

legend('gateway',['LS'],['n-th order'],'zoh','1st ord')

diffVarZoh = var(mote2Samples(selectTime)-mote1SamplesInterpZoh.');
diffVar1st = var(mote2Samples(selectTime)-mote1SamplesInterp1st.');
diffVarnth = var(mote2Samples(selectTime)-mote1SamplesInterpnth.');
diffVarLS  = var(mote2Samples(selectTime)-mote1SamplesInterpLS);
disp(' ')
disp(['------'])
disp(['deviation from the raw sensor`s data'])
disp(['mean square difference (zoh): ' num2str(diffVarZoh)])
disp(['mean square difference (1st): ' num2str(diffVar1st)])
disp(['mean square difference (nth): ' num2str(diffVarnth)])
disp(['mean square difference (LS):  ' num2str(diffVarLS)])

%%
interpRat = 10;
fcFIR = 1/interpRat;
NFIRinterp = 403;
bFIRpm = firpm(NFIRinterp-1,[0 fcFIR fcFIR*1.2 1],[1 1 0 0],[3 1]);
aFIRpm = 1;

%[bFIRpm aFIRpm] = butter(10,0.09);
%figure;freqz(bFIRpm,aFIRpm);
%%
selectFromSensData = round(sum(max( tM2(selectTime) ) > tM1Conv)*1.1); %only those samples are selected from the sensor's data that are in the timeinterval of interest

%tMinterpFilt = [tM1(:).';zeros(interpRat-1,length(tM1))];
tMinterpFilt = repmat(tM1Conv(1:selectFromSensData).',interpRat,1);
tMinterpFilt = tMinterpFilt + [0:interpRat-1]'*ones(1,length(tMinterpFilt))*sampleTime1/interpRat;
tMinterpFilt = tMinterpFilt(:);

mote1DataForInterp = mote1Samples(1:selectFromSensData);
mote1DataForInterp = [mote1DataForInterp(:).';zeros(interpRat-1,length(mote1DataForInterp))]; 
mote1DataForInterp = mote1DataForInterp(:)*interpRat;

mote1SamplesInterpInteg = filtfilt(bFIRpm,aFIRpm,mote1DataForInterp); tM2IntegInterp=tM2;
%mote1SamplesInterpInteg = filter(bFIRpm,aFIRpm,mote1DataForInterp);tM2IntegInterp=tM2+(NFIRinterp-1)/2*sampleTime1/interpRat;
 
fig=figure(108090723);
set(fig,'Name','MOTE1: integer interp; MOTE2: simple')
plot(tMinterpFilt,mote1SamplesInterpInteg,'o-k',...
    tM2IntegInterp(selectTime),mote2Samples(selectTime),[moteDrawColor(2) 's-']...
    )
legend('sensor','gateway')

%calculation of gwy's data from the interpolated sensor's data
%==============================================================
%==============================================================
mote1SamplesIntegerInterp   = zeros(length(selectTime),1);
mote1SamplesIntegerInterpLS = zeros(length(selectTime),1);
ptrS = 1;
for ptrGwy = selectTime
    tAct      = tM2IntegInterp(ptrGwy);
    while (tMinterpFilt(ptrS)<tAct)
        ptrS = ptrS + 1; %this is the next sample
    end
    TsCalcInt = tMinterpFilt(ptrS) - tMinterpFilt(ptrS-1);
    dTInt     = tM2IntegInterp(ptrGwy)   - tMinterpFilt(ptrS-1);
    dTIntCo   = TsCalcInt-dTInt;
    %first order interpolation
    mote1SamplesIntegerInterp1st(ptrGwy-selectTime(1)+1)  = ( dTInt*mote1SamplesInterpInteg(ptrS) + dTIntCo*mote1SamplesInterpInteg(ptrS - 1) )/TsCalcInt;
    %zero order hold
    mote1SamplesIntegerInterpZoh(ptrGwy-selectTime(1)+1) = mote1SamplesInterpInteg(ptrS - 1);
    %n-th order interpolation
    tSel = (  tMinterpFilt(ptrS+[-(np1Int)/2:(np1Int)/2-1])  ).';
    interpVal = 0;
    for interpSt=1:np1Int
        tvInt = tSel; tvInt(interpSt) = [];
        Lpoly = prod(tAct-tvInt) / prod(tSel(interpSt)-tvInt);
        interpVal = interpVal + mote1SamplesInterpInteg(ptrS-(np1Int/2)+interpSt-1)*Lpoly;
    end
    mote1SamplesIntegerInterpnth(ptrGwy-selectTime(1)+1) = interpVal;
    nLS = 8;
%     Pinterp = polyfit(tM1Conv(ptrS+[-nLS/2:nLS/2]),mote1Samples(ptrS+[-nLS/2:nLS/2]),5);
%     mote1SamplesInterpLS(ptrGwy-selectTime(1)+1) = polyval(Pinterp,tAct);
end

tMinterp1 = tM2IntegInterp(selectTime);

fig=figure(109090723);
set(fig,'Name','MOTE1+MOTE2: comparison with integer interpolated signals')
plot(tM2IntegInterp(selectTime),mote2Samples(selectTime),[moteDrawColor(2) 's-'],...     
     tMinterp1,mote1SamplesIntegerInterpnth,'mo-',...  
     tMinterp1,mote1SamplesIntegerInterpnth,'ko-',...  
     tMinterp1,mote1SamplesIntegerInterpZoh,'go-',...  
     tMinterp1,mote1SamplesIntegerInterp1st,'bo-' )  
 %tM1Conv,mote1Samples,[moteDrawColor(1) 'o-'],...
grid

legend('gateway',['LS'],['n-th order'],'zoh','1st ord')

diffVarIntegerZoh = var(mote2Samples(selectTime)-mote1SamplesIntegerInterpZoh.');
diffVarInteger1st = var(mote2Samples(selectTime)-mote1SamplesIntegerInterp1st.');
diffVarIntegernth = var(mote2Samples(selectTime)-mote1SamplesIntegerInterpnth.');
diffVarIntegerLS  = var(mote2Samples(selectTime)-mote1SamplesIntegerInterpLS);

disp(' ')
disp(['------'])
disp(['deviation using integer interpolation of the sensor`s raw data'])

disp(['mean square difference (zoh): ' num2str(diffVarIntegerZoh)])
disp(['mean square difference (1st): ' num2str(diffVarInteger1st)])
disp(['mean square difference (nth): ' num2str(diffVarIntegernth)])
disp(['mean square difference (LS):  ' num2str(diffVarIntegerLS)])


fig=figure(110090723);
set(fig,'Name','time stamp differences')
%plot(synchPoints1F-synchPoints2F)
%subplot(2,1,1)
plot(tM1Conv(1:end-1),diff(tM1Conv)/sampleTime1)
%subplot(2,1,2)
%plot(diff(tM1Conv)/sampleTime1)


figure(106090723);
wrongSampDiff = tM1Conv([diff(tM1Conv)]/sampleTime1>1.2);
%wrongSampDiff = tM1Conv([diff(mote1Samples)==0]);
if (length(wrongSampDiff)>0)
    %hold on;plot(synchPoints2([0 diff(synchPoints2)]*1800.2>30),0,'bo','MarkerSize',8,'LineWidth',2);hold off
    hold on;plot(wrongSampDiff,0,'bo','MarkerSize',8,'LineWidth',2);hold off
end




mote1TimeStampsRaw;

%%
%plot(synchPoints1F-synchPoints2F)%: rossz jel, ha ebben ugrás van
%plot(diff(synchPoints2))
%synchPoints2(diff(synchPoints2)*1800.2>30)
%hold on;plot(synchPoints2(diff(synchPoints2)*1800.2>30),0,'gx');hold off
%plot(synchPoints2,synchPoints2F)















