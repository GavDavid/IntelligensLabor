//package net.tinyos.sajat.BeagyLabSerial;

import java.awt.*;
import java.awt.event.*;
import java.io.*;
import java.util.*;
import javax.comm.*;
import java.util.Date;


class SimpleSerialSend implements ActionListener {

OutputStream out;
InputStream in;
Label cimke;
TextField datNum;
int sendNo;
RezDataColl serH;

	public SimpleSerialSend(InputStream in,OutputStream out, Label cimke, TextField datNum, RezDataColl serH) {
		this.in = in;
		this.out = out;
		this.cimke = cimke;
		this.datNum = datNum;
		this.serH = serH;
	}


	public void actionPerformed(ActionEvent e)
	{
		if (e.getSource().equals(serH.buttSTART)) {STARTmote();}
		if (e.getSource().equals(serH.buttSTOP))  {STOPmote();}
		if (e.getSource().equals(serH.sendFrequency))  {sendFrequencyValue(6);}//sendFrequencyValue();sendFrequencyValue();sendFrequencyValue();sendFrequencyValue();}
		if (e.getSource().equals(serH.fundFrequency))  {sendFrequencyValue(6);}//sendFrequencyValue();sendFrequencyValue();sendFrequencyValue();sendFrequencyValue();}		

	}
	
	
public void STOPmote(){
//		int numB = new Integer(datNum.getText()).intValue();;
//		sendNo += numB;
		serH.cimke.setText(serH.dataCollStop);
		if (serH.writeDataToFile){
			serH.writeDataToFile = false;
			waitForMsec(1000);
			//serH.writeDataToFile = true;
			serH.closeAllFiles();
			serH.backupAllFiles();
			//serH.closeBackupFiles();
		}

	}	


public void STARTmote(){
	
		serH.createDataLoggerFiles();
		serH.cimke.setText(serH.dataCollStart);
		
		String newFreqInString = serH.fundFrequency.getText();
		newFreqInString = newFreqInString.replace(','  ,  '.');
		
		/*
		FileDialog fDialog = new FileDialog(serH.ablak, "This is a file dialog",FileDialog.SAVE); //, "This is a file dialog",,FileDialog.SAVE/LOAD
		fDialog.setVisible(true);
		System.out.println("Dir: "+fDialog.getDirectory() + "; file:" + fDialog.getFile());
		File fileFreq = new File(fDialog.getDirectory(), fDialog.getFile());
		try{
			if (fileFreq.exists()){
				BufferedReader freqFileRead = new BufferedReader(new FileReader(fileFreq));
				System.out.println("old freq: " +  freqFileRead.readLine());
				System.out.println();
				freqFileRead.close();
			}
			
			BufferedWriter freqFileWrite = new BufferedWriter(new FileWriter(fileFreq));
			freqFileWrite.write(newFreqInString);                           freqFileWrite.newLine(); 
			freqFileWrite.write("this file contains the frequency in Hz."); freqFileWrite.newLine(); 
			freqFileWrite.close();
			
		} catch (IOException excFrFile){
			System.out.println(excFrFile);
		}
*/	
		
		try{
			//save the frequency		
			File fileFreqF = new File("./motedata/signalFreq.dat");
			BufferedWriter freqFileWriteF = new BufferedWriter(new FileWriter(fileFreqF));
			freqFileWriteF.write(newFreqInString);  freqFileWriteF.newLine(); 
			freqFileWriteF.close();
			
			fileFreqF = new File(serH.backupDir + "/signalFreq.dat");
			freqFileWriteF = new BufferedWriter(new FileWriter(fileFreqF));
			freqFileWriteF.write(newFreqInString);  freqFileWriteF.newLine(); 
			freqFileWriteF.close();
		} catch (IOException excFrFile){
			System.out.println(excFrFile);
		}
		System.out.println();
		
		sendStopCommand();
				long waitBeforRestartMote = (new Date()).getTime();
				while(((new Date()).getTime()-waitBeforRestartMote)<100) {};
		
		//searches for new frame
		serH.searchingForNewFrame   = true;
		serH.typeOfTheCurrentFrame  = serH.NO_VALID_FRAME;
		serH.newDataPacketFromGWY   = false;
		serH.newResonatorFromSensor = false;
		serH.newFrameSynch          = false;
		serH.newTimeStampSynch      = false;

		//enables writing to file
		serH.writeDataToFile = true;
		//starts the mote
		sendStartCommand();
		serH.idoKezd = (new Date()).getTime(); //set the start time of the data logging
		serH.szaml = 0; //set the data counter to zero				

	}	


public void sendStartCommand(){
		byte[] flushBuffer = new byte[100];
		try{
        	int avail=in.available();
        	in.skip(avail);
    } catch(IOException e) {System.out.println(e);}
          
		byte [] instrBytes = new byte[8];
		for (byte i=0;i<4;i++){
			instrBytes[i] = (byte)(255);
		}
		for (byte i=4;i<7;i++){
			instrBytes[i] = (byte)(0);
		}

		instrBytes[7] = 2;
		
		try{
			out.flush(); //kell, különben lefagy
			for (byte i=0;i<8;i++){
				out.flush(); //kell, különben lefagy
				out.write(instrBytes[i]);
				long timeStartUART = (new Date()).getTime();
				while(((new Date()).getTime()-timeStartUART)<2) {};
			//	for (long il=0;il<100000;il++){}
			}/**/

			//--out.write(instrBytes);
			//if (numB>1){	out.write(bytes);}
			
			
		} catch(IOException err){System.out.println(err);}
		//cimke.setText(new Integer(sendNo%256).toString() + " <- " + new Integer(sendNo).toString());
//		cimke.setText("mote started");
}

public void sendStopCommand(){
		byte [] instrBytes = new byte[8];
		for (byte i=0;i<4;i++){
			instrBytes[i] = (byte)(255);
		}
		for (byte i=4;i<7;i++){
			instrBytes[i] = (byte)(0);
		}

		instrBytes[7] = 1;
		
		try{
			out.flush(); //kell, különben lefagy
			for (byte i=0;i<8;i++){
				out.flush(); //kell, különben lefagy
				out.write(instrBytes[i]);
				long timeStartUART = (new Date()).getTime();
				while(((new Date()).getTime()-timeStartUART)<2) {};
			//	for (long il=0;il<100000;il++){}
			}/**/
			//--out.write(instrBytes);
			
			
		} catch(IOException err){System.out.println(err);}
		//cimke.setText(new Integer(sendNo%256).toString() + " <- " + new Integer(sendNo).toString());
//		cimke.setText("mote stopped");
}

/*!
*This function sends the frequency value over serial port
*
*/	
public void  sendFrequencyValue(){
	sendFrequencyValue(1);
}

public void  sendFrequencyValue(int howManyTimes){
	for (int ii=0;ii<howManyTimes;ii++){
		//serH.fundFrequency.setText("OK");
		boolean isParseableFrequency = true;
		double fundFrequencyDouble = 0.0; //value of the fundamental frequency
		try{
			String newFreqInString = serH.fundFrequency.getText();
			newFreqInString = newFreqInString.replace(','  ,  '.');
			//System.out.println("New freq=" + newFreqInString);
			fundFrequencyDouble = Double.parseDouble(newFreqInString);
		} catch (NumberFormatException except){
			isParseableFrequency = false;
		}

		//the textfield contains a valid number
		if (isParseableFrequency){
			try{
	        	int avail=in.available();
	        	in.skip(avail);
	    	} catch(IOException e) {System.out.println(e);}
	          
			byte [] instrBytes = new byte[8];
			for (byte i=0;i<4;i++){
				instrBytes[i] = (byte)(255);
			}
			for (byte i=4;i<7;i++){
				instrBytes[i] = (byte)(0);
			}
	
			instrBytes[7] = 3;
			
			double fs = 8e6/4444.0;
			//fs = 1800;
			//-----fundFrequencyDouble = 504.0;
			int freqValueInInt = (int)(fundFrequencyDouble/fs*java.lang.Math.pow(2.0, 24.0)); 
			//freqValueInInt = 0x0C0D0E0F;
			//freqValueInInt = freqValueInInt;
			instrBytes[4] = (byte)((freqValueInInt    ) & 0x0FF);
			instrBytes[5] = (byte)((freqValueInInt>>8 ) & 0x0FF);
			instrBytes[6] = (byte)((freqValueInInt>>16) & 0x0FF);
			//instrBytes[4] = (byte)210;
			//instrBytes[5] = 101;
			//instrBytes[6] = 100;
			int [] instrByteToInt = new int[8];
			for (int convInstrFor=0;convInstrFor<8;convInstrFor++){
				instrByteToInt[convInstrFor] = (instrBytes[convInstrFor]+256)%256;
			}
			System.out.println("Send freq = " + (instrByteToInt[4]) + "_" + instrByteToInt[5] + "_" + instrByteToInt[6] + "_" + instrByteToInt[7]);
			//MATLAB code for conversion
			//fhx=dec2hex(round(50/(8e6/4444)*2^24));fhx=[repmat('0',1,6-length(fhx)) fhx];hex2dec(fhx([5:6;3:4;1:2]))
			//fhxDSP=dec2hex(round(55/(2000)*2^24));fhxDSP=[repmat('0',1,6-length(fhxDSP)) fhxDSP];hex2dec(fhxDSP([5:6;3:4;1:2]))
			
			//freqValueInInt = (14 + 131*256 + 64*256*256)
			//14 131 64
			//instrBytes[4] = (byte)(14);
			//instrBytes[5] = (byte)(131);
			//instrBytes[6] = (byte)(64);
			//serH.fundFrequency.setText(Integer.toString(freqValueInInt));
			
//			instrBytes[4] = (byte)128;
//			instrBytes[5] = (byte)144;
//			instrBytes[6] = (byte)160;

			/* ----  This is a good code
			if (serH.enableToSendNewFreq){
			try{
				out.flush(); //kell, különben lefagy
				for (byte i=0;i<8;i++){
					out.flush(); //kell, különben lefagy
					out.write(instrBytes[i]);
					long timeStartUART = (new Date()).getTime();
					while(((new Date()).getTime()-timeStartUART)<2) {};
				//	for (long il=0;il<100000;il++){}
				}
	
				//--out.write(instrBytes);
				//if (numB>1){	out.write(bytes);}
				
				
			} catch(IOException err){System.out.println(err);}
			
		}//if (serH.enableToSendNewFreq)
	*/	sendByteArray(instrBytes,8);
		} //if (isParseableFrequency)
	}//for (ii=0;ii<howManyTimes;ii++)

}//public void  sendFrequencyValue(double frequency){


/**
*Set the output resonator
*/
public void setOutputResonator(int selectedResonator){
			byte [] instrBytes = new byte[serH.LENGTH_FRAMING_RES_SYNC + serH.LENGTH_GEN_COMMAND_FRAME];
			
			//send a synchronization frame
			for (byte i=0;i<4;i++){
				instrBytes[i] = (byte)(255);
			}
			for (byte i=4;i<serH.LENGTH_FRAMING_RES_SYNC + serH.LENGTH_GEN_COMMAND_FRAME;i++){
				instrBytes[i] = (byte)(0);
			}
			
			instrBytes[serH.LENGTH_FRAMING_RES_SYNC + 0] = (byte)serH.GEN_COMMAND_FRAME;
			instrBytes[serH.LENGTH_FRAMING_RES_SYNC + 1] = 0;
			
			instrBytes[serH.LENGTH_FRAMING_RES_SYNC + 2] = (byte)serH.GEN_COMMAND_FRAME_SET_OUT_RES;
			
			instrBytes[serH.LENGTH_FRAMING_RES_SYNC + 3] = (byte)selectedResonator;
			
			float outRe = serH.outRez_x_re[selectedResonator];
			if (outRe>=(1.0f-1f/32768f)) {outRe=(1.0f-1f/32768f);}
			if (outRe<=(-1.0f+1f/32768f)) {outRe=(-1.0f+1f/32768f);}
			int outReInt = (int)(outRe *32768.0f);
			instrBytes[serH.LENGTH_FRAMING_RES_SYNC + 4] = (byte)((outReInt    ) & 0x0FE);
			instrBytes[serH.LENGTH_FRAMING_RES_SYNC + 5] = (byte)((outReInt>>8 ) & 0x0FF);
			
			float outIm = serH.outRez_x_im[selectedResonator];
			if (outIm>=(1.0f-1f/32768f)) {outIm=(1.0f-1f/32768f);}
			if (outIm<=(-1.0f+1f/32768f)) {outIm=(-1.0f+1f/32768f);}
			int outImInt = (int)(outIm *32768.0f);
			instrBytes[serH.LENGTH_FRAMING_RES_SYNC + 6] = (byte)((outImInt    ) & 0x0FE);
			instrBytes[serH.LENGTH_FRAMING_RES_SYNC + 7] = (byte)((outImInt>>8 ) & 0x0FF);
			
			sendByteArray(instrBytes,(serH.LENGTH_FRAMING_RES_SYNC + serH.LENGTH_GEN_COMMAND_FRAME));
//			System.out.println("(serH.LENGTH_FRAMING_RES_SYNC + serH.LENGTH_GEN_COMMAND_FRAME)" + (serH.LENGTH_FRAMING_RES_SYNC + serH.LENGTH_GEN_COMMAND_FRAME));
//				for (byte i=0;i<(serH.LENGTH_FRAMING_RES_SYNC + serH.LENGTH_GEN_COMMAND_FRAME);i++){
//					System.out.println(instrBytes[i]);
//				}
			
}

/**
*Set ALL of the the output resonators
*/
public void setAllOutputResonators(){
			byte [] instrBytes = new byte[serH.LENGTH_FRAMING_RES_SYNC + serH.LENGTH_GEN_COMMAND_FRAME];
			
			//send a synchronization frame
			for (byte i=0;i<4;i++){
				instrBytes[i] = (byte)(255);
			}
			for (byte i=4;i<serH.LENGTH_FRAMING_RES_SYNC + serH.LENGTH_GEN_COMMAND_FRAME;i++){
				instrBytes[i] = (byte)(0);
			}
			
			instrBytes[serH.LENGTH_FRAMING_RES_SYNC + 0] = (byte)serH.GEN_COMMAND_FRAME;
			instrBytes[serH.LENGTH_FRAMING_RES_SYNC + 1] = 0;
			
			instrBytes[serH.LENGTH_FRAMING_RES_SYNC + 2] = (byte)serH.GEN_COMMAND_FRAME_SET_ALL_OUT_RES;
			
			//instrBytes[serH.LENGTH_FRAMING_RES_SYNC + 3] = (byte)selectedResonator;
			
			int [] selectHarmList = {0,1,2,3,4,6,8};
			for (int harmSelFromList=0;harmSelFromList<7;harmSelFromList++){
				float outRe = serH.outRez_x_re[selectHarmList[harmSelFromList]];
				if (outRe>=(1.0f-1f/32768f)) {outRe=(1.0f-1f/32768f);}
				if (outRe<=(-1.0f+1f/32768f)) {outRe=(-1.0f+1f/32768f);}
				int outReInt = (int)(outRe *32768.0f);
				instrBytes[serH.LENGTH_FRAMING_RES_SYNC + 4*harmSelFromList + 4] = (byte)((outReInt    ) & 0x0FE);
				instrBytes[serH.LENGTH_FRAMING_RES_SYNC + 4*harmSelFromList + 5] = (byte)((outReInt>>8 ) & 0x0FF);
				
				float outIm = serH.outRez_x_im[selectHarmList[harmSelFromList]];
				if (outIm>=(1.0f-1f/32768f)) {outIm=(1.0f-1f/32768f);}
				if (outIm<=(-1.0f+1f/32768f)) {outIm=(-1.0f+1f/32768f);}
				int outImInt = (int)(outIm *32768.0f);
				instrBytes[serH.LENGTH_FRAMING_RES_SYNC + 4*harmSelFromList + 6] = (byte)((outImInt    ) & 0x0FE);
				instrBytes[serH.LENGTH_FRAMING_RES_SYNC + 4*harmSelFromList + 7] = (byte)((outImInt>>8 ) & 0x0FF);
		} //for (int harmSelFromList=0;harmSelFromList<7;harmSelFromList++){
			
			sendByteArray(instrBytes,(serH.LENGTH_FRAMING_RES_SYNC + serH.LENGTH_GEN_COMMAND_FRAME));
//			System.out.println("(serH.LENGTH_FRAMING_RES_SYNC + serH.LENGTH_GEN_COMMAND_FRAME)" + (serH.LENGTH_FRAMING_RES_SYNC + serH.LENGTH_GEN_COMMAND_FRAME));
//				for (byte i=0;i<(serH.LENGTH_FRAMING_RES_SYNC + serH.LENGTH_GEN_COMMAND_FRAME);i++){
//					System.out.println(instrBytes[i]);
//				}
			
}

public void resetAllOutputResonators(){
			byte [] instrBytes = new byte[serH.LENGTH_FRAMING_RES_SYNC + serH.LENGTH_GEN_COMMAND_FRAME];
			
			//send a synchronization frame
			for (byte i=0;i<4;i++){
				instrBytes[i] = (byte)(255);
			}
			for (byte i=4;i<serH.LENGTH_FRAMING_RES_SYNC + serH.LENGTH_GEN_COMMAND_FRAME;i++){
				instrBytes[i] = (byte)(0);
			}
			
			instrBytes[serH.LENGTH_FRAMING_RES_SYNC + 0] = (byte)serH.GEN_COMMAND_FRAME;
			instrBytes[serH.LENGTH_FRAMING_RES_SYNC + 1] = 0;
			
			instrBytes[serH.LENGTH_FRAMING_RES_SYNC + 2] = (byte)serH.GEN_COMMAND_RESET_ALL_OUT_RES;
			
			sendByteArray(instrBytes,(serH.LENGTH_FRAMING_RES_SYNC + serH.LENGTH_GEN_COMMAND_FRAME));
	
}



public void enableOutput(boolean enableOut){
			byte [] instrBytes = new byte[serH.LENGTH_FRAMING_RES_SYNC + serH.LENGTH_GEN_COMMAND_FRAME];
			
			//send a synchronization frame
			for (byte i=0;i<4;i++){
				instrBytes[i] = (byte)(255);
			}
			for (byte i=4;i<serH.LENGTH_FRAMING_RES_SYNC + serH.LENGTH_GEN_COMMAND_FRAME;i++){
				instrBytes[i] = (byte)(0);
			}
			
			instrBytes[serH.LENGTH_FRAMING_RES_SYNC + 0] = (byte)serH.GEN_COMMAND_FRAME;
			instrBytes[serH.LENGTH_FRAMING_RES_SYNC + 1] = 0;
			
			if (enableOut){
				 instrBytes[serH.LENGTH_FRAMING_RES_SYNC + 2] = (byte)serH.GEN_COMMAND_ENABLE_OUT;
			} else {
				 instrBytes[serH.LENGTH_FRAMING_RES_SYNC + 2] = (byte)serH.GEN_COMMAND_DISABLE_OUT;
			}
			
			sendByteArray(instrBytes,(serH.LENGTH_FRAMING_RES_SYNC + serH.LENGTH_GEN_COMMAND_FRAME));
//				for (byte i=0;i<(serH.LENGTH_FRAMING_RES_SYNC + serH.LENGTH_GEN_COMMAND_FRAME);i++){
//					System.out.println(i + " : " +instrBytes[i]);
//				}
	
} //enableOutput

public void sendModifiers(boolean changeTheState, boolean useTheModifiersFlag){
			byte [] instrBytes = new byte[serH.LENGTH_FRAMING_RES_SYNC + serH.LENGTH_GEN_COMMAND_FRAME];
			
			//send a synchronization frame
			for (byte i=0;i<4;i++){
				instrBytes[i] = (byte)(255);
			}
			for (byte i=4;i<serH.LENGTH_FRAMING_RES_SYNC + serH.LENGTH_GEN_COMMAND_FRAME;i++){
				instrBytes[i] = (byte)(0);
			}
			
			instrBytes[serH.LENGTH_FRAMING_RES_SYNC + 0] = (byte)serH.GEN_COMMAND_FRAME;
			instrBytes[serH.LENGTH_FRAMING_RES_SYNC + 1] = 0;
			
			instrBytes[serH.LENGTH_FRAMING_RES_SYNC + 2] = (byte)serH.GEN_COMMAND_SEND_MOD;
			
			if (changeTheState){
				if (useTheModifiersFlag){
					 instrBytes[serH.LENGTH_FRAMING_RES_SYNC + 3] = (byte)serH.GEN_COMMAND_SEND_MOD_AND_ENABLE;
				} else {
					 instrBytes[serH.LENGTH_FRAMING_RES_SYNC + 3] = (byte)serH.GEN_COMMAND_SEND_MOD_AND_DISABLE;
				} //if (useTheModifiersFlag){
			} else {	
				instrBytes[serH.LENGTH_FRAMING_RES_SYNC + 3] = (byte)serH.GEN_COMMAND_SEND_MOD_NO_CHANGE;
			} //if (changeTheState){
			
			int [] selectHarmList = {0,1,2,3,4,6,8};
			for (int harmSelFromList=0;harmSelFromList<7;harmSelFromList++){
				float modRe = serH.rezDatModifRe[selectHarmList[harmSelFromList]];
				int modReInt = (int)(modRe *32768.0f/128.0f); //it is divided by 128 since we have to allow modifiers abowe 1 and below -1. Multiplying just by 32768 cause the turnover of the 16 bit variable for modifiers above absolute value 1
				//the ofset serH.LENGTH_FRAMING_RES_SYNC in the array is required since this array contains two messages and this is the second while the length of the first is serH.LENGTH_FRAMING_RES_SYNC
				instrBytes[serH.LENGTH_FRAMING_RES_SYNC + 4*harmSelFromList + 4] = (byte)((modReInt    ) & 0x0FE);
				instrBytes[serH.LENGTH_FRAMING_RES_SYNC + 4*harmSelFromList + 5] = (byte)((modReInt>>8 ) & 0x0FF);
				
				float modIm = serH.rezDatModifIm[selectHarmList[harmSelFromList]];
				int modImInt = (int)(modIm *32768.0f/128.0f);
				instrBytes[serH.LENGTH_FRAMING_RES_SYNC + 4*harmSelFromList + 6] = (byte)((modImInt    ) & 0x0FE);
				instrBytes[serH.LENGTH_FRAMING_RES_SYNC + 4*harmSelFromList + 7] = (byte)((modImInt>>8 ) & 0x0FF);
			}
			sendByteArray(instrBytes,(serH.LENGTH_FRAMING_RES_SYNC + serH.LENGTH_GEN_COMMAND_FRAME));
//				for (byte i=0;i<(serH.LENGTH_FRAMING_RES_SYNC + serH.LENGTH_GEN_COMMAND_FRAME);i++){
//					System.out.println(instrBytes[i]);
//				}
}//sendModifiers



public void setDSPMode(int modeOfOperation, int submodeOfOperation){
			byte [] instrBytes = new byte[serH.LENGTH_FRAMING_RES_SYNC + serH.LENGTH_GEN_COMMAND_FRAME];
			
			//send a synchronization frame
			for (byte i=0;i<4;i++){
				instrBytes[i] = (byte)(255);
			}
			for (byte i=4;i<serH.LENGTH_FRAMING_RES_SYNC + serH.LENGTH_GEN_COMMAND_FRAME;i++){
				instrBytes[i] = (byte)(0);
			}
			
			instrBytes[serH.LENGTH_FRAMING_RES_SYNC + 0] = (byte)serH.GEN_COMMAND_FRAME;
			instrBytes[serH.LENGTH_FRAMING_RES_SYNC + 1] = 0;
			
			instrBytes[serH.LENGTH_FRAMING_RES_SYNC + 2] = (byte)serH.GEN_COMMAND_SET_DSP_MODE;
			
			instrBytes[serH.LENGTH_FRAMING_RES_SYNC + 3] = (byte)modeOfOperation;
			instrBytes[serH.LENGTH_FRAMING_RES_SYNC + 4] = (byte)submodeOfOperation;
			
			sendByteArray(instrBytes,(serH.LENGTH_FRAMING_RES_SYNC + serH.LENGTH_GEN_COMMAND_FRAME));
//				for (byte i=0;i<(serH.LENGTH_FRAMING_RES_SYNC + serH.LENGTH_GEN_COMMAND_FRAME);i++){
//					System.out.println(i + " : " +instrBytes[i]);
//				}
	
} //enableOutput



/**
*
* Set mu value
*/
public void setMu(long lMuValue){
			byte [] instrBytes = new byte[serH.LENGTH_FRAMING_RES_SYNC + serH.LENGTH_GEN_COMMAND_FRAME];
			
			//send a synchronization frame
			for (byte i=0;i<4;i++){
				instrBytes[i] = (byte)(255);
			}
			for (byte i=4;i<serH.LENGTH_FRAMING_RES_SYNC + serH.LENGTH_GEN_COMMAND_FRAME;i++){
				instrBytes[i] = (byte)(0);
			}
			
			instrBytes[serH.LENGTH_FRAMING_RES_SYNC + 0] = (byte)serH.GEN_COMMAND_FRAME;
			instrBytes[serH.LENGTH_FRAMING_RES_SYNC + 1] = 0;
			
			instrBytes[serH.LENGTH_FRAMING_RES_SYNC + 2] = (byte)serH.GEN_COMMAND_SET_ANC_MU;
			
			instrBytes[serH.LENGTH_FRAMING_RES_SYNC + 3] = (byte)(((lMuValue&0xFF000000)>>24)&0x0FF);
			instrBytes[serH.LENGTH_FRAMING_RES_SYNC + 4] = (byte)(((lMuValue&0x00FF0000)>>16)&0x0FF);
			instrBytes[serH.LENGTH_FRAMING_RES_SYNC + 5] = (byte)(((lMuValue&0x0000FF00)>> 8)&0x0FF);
			instrBytes[serH.LENGTH_FRAMING_RES_SYNC + 6] = (byte)(((lMuValue&0x000000FF)    )&0x0FE);  //!!!0xFE
			
			//System.out.println("1.:" + (instrBytes[serH.LENGTH_FRAMING_RES_SYNC + 3]) + "   2.:" + (instrBytes[serH.LENGTH_FRAMING_RES_SYNC + 4])  + "   3.:" + (instrBytes[serH.LENGTH_FRAMING_RES_SYNC + 5]) + "   4.:" + (instrBytes[serH.LENGTH_FRAMING_RES_SYNC + 6]));
			
			sendByteArray(instrBytes,(serH.LENGTH_FRAMING_RES_SYNC + serH.LENGTH_GEN_COMMAND_FRAME));
			
}  //public void setMu(long lMuValue)			

/**
*@fn waitForMsec(int msec)
*@param msec number of millisecs the function delays the running of the program
*/
public void waitForMsec(int msec){
		long waitVariable = (new Date()).getTime();
		while(((new Date()).getTime()-waitVariable)<msec) {};

}

synchronized public void sendByteArray(byte [] arrayToSend, int length){
			try{
				out.flush(); //kell, különben lefagy
				for (byte i=0;i<length;i++){
					out.flush(); //kell, különben lefagy
					out.write(arrayToSend[i]);
					long timeStartUART = (new Date()).getTime();
					//while(((new Date()).getTime()-timeStartUART)<2) {};
					try{Thread.sleep(2);} catch(Exception e){}
				}
			} catch(IOException err){System.out.println(err);}	
}

	
}










/*
		int [] selectHarmList = {0,1,2,3,4,7,9};
		for (int harmSelFromList=0;harmSelFromList<7;harmSelFromList++){
			float outRe = serH.outRez_x_re[selectHarmList[harmSelFromList]];
			if (outRe>=(1.0f-1f/32768f)) {outRe=(1.0f-1f/32768f);}
			if (outRe<=(-1.0f+1f/32768f)) {outRe=(-1.0f+1f/32768f);}
			int outReInt = (int)(outRe *32768.0f);
			instrBytes[serH.LENGTH_FRAMING_RES_SYNC + 4*harmSelFromList + 4] = (byte)((outReInt    ) & 0x0FE);
			instrBytes[serH.LENGTH_FRAMING_RES_SYNC + 4*harmSelFromList + 5] = (byte)((outReInt>>8 ) & 0x0FF);
			
			float outIm = serH.outRez_x_im[selectHarmList[harmSelFromList]];
			if (outIm>=(1.0f-1f/32768f)) {outIm=(1.0f-1f/32768f);}
			if (outIm<=(-1.0f+1f/32768f)) {outIm=(-1.0f+1f/32768f);}
			int outImInt = (int)(outIm *32768.0f);
			instrBytes[serH.LENGTH_FRAMING_RES_SYNC + 4*harmSelFromList + 6] = (byte)((outImInt    ) & 0x0FE);
			instrBytes[serH.LENGTH_FRAMING_RES_SYNC + 4*harmSelFromList + 7] = (byte)((outImInt>>8 ) & 0x0FF);
		}

*/
