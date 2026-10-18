import java.awt.*;
import java.awt.event.*;
import java.io.*;
import java.util.*;

import java.util.Date;
import java.text.DecimalFormat;


public class MDFileHandler implements Runnable{

private static final int TEST_MSG = 0; // 

private Thread tForFileWrite;
private FileOutputStream fileObj; 

//boolean newBlockWaitingToWriteToFile = false;

private byte[][] fileDataBuffer;	// stores data to write into file
private int[] fileDataBufferActualSize; //stores the actual number of data to write into file from the corresponding buffer 	
							//be careful. It is the position of the next data to write to. 
private static final int FILE_DATA_BUFF_PAGE_NUM = 3; // number of buffer pages
private int actBuffPage = 0;  // stores the actual buffer page
private int buffPageToWrite = 0; // stores the buffer page to write into file

private int buffSize;  //size of one page of the buffer 
private int buffPtr = 0; // actual position where data should be written

private boolean programRunning = false;

	
	//************************************************************************************
	// constructor
	public MDFileHandler(FileOutputStream fileObj, int buffSize) throws FileNotFoundException{
		fileDataBuffer = new byte[FILE_DATA_BUFF_PAGE_NUM][buffSize];
		fileDataBufferActualSize = new int[FILE_DATA_BUFF_PAGE_NUM];
		this.fileObj  = fileObj;
		this.buffSize = buffSize;
		
		/*
		String dummyWriteSpace  = new String(" ");
		try{
			fileObj.write( dummyWriteSpace.getBytes() );
			fileObj.flush();
		} catch (Exception e){	
			System.out.println("Error at writing dummy space.");
		}*/
		
		programRunning = true;
		tForFileWrite = new Thread(this);
      	tForFileWrite.start();
      	
      	try{
			this.write(32);
			forceBufferChange();
		} catch(Exception e){
			System.out.println("Error at forceBufferChange");
		}

	}

	//************************************************************************************
	// store data temporarily before they are written to file
	public synchronized void write(int dataToWriteFile) throws IOException{
		byte [] tmpByte = new byte[1];
		tmpByte[0] = (byte) dataToWriteFile;
		write(tmpByte);
	}
	
	//************************************************************************************
	// store data temporarily before they are written to file
	public synchronized void write(byte[] dataToWriteFile) throws IOException{
		int buffPageToWriteLoc = getBuffPageToWrite();
		
		// if there is not enough space in the buffer, switch to a new buffer
		if (  (buffPtr + dataToWriteFile.length) > buffSize  ){
			//save buffer pointer and than reset
			fileDataBufferActualSize[actBuffPage] = buffPtr;
			buffPtr = 0;
			// step to the next page
			actBuffPage = actBuffPage + 1; 
			if (actBuffPage >= FILE_DATA_BUFF_PAGE_NUM){
				actBuffPage = 0;
			}
			
			if (actBuffPage==buffPageToWrite){
				/*if (TEST_MSG==2){
					System.out.println("Buff. write timeout!");
				}*/
				//writeNewBlockToFile();
			}
		}
		
		// static void 	arraycopy(Object src, int srcPos, Object dest, int destPos, int length) 
		//System.arraycopy(dataToWriteFile, 0, fileDataBuffer[actBuffPage], buffPtr, dataToWriteFile.length) 
		//buffPtr += dataToWriteFile.length;
		for(int ii=0; ii<dataToWriteFile.length; ii++) {
			fileDataBuffer[actBuffPage][buffPtr] = dataToWriteFile[ii];
			buffPtr++;
		}
		
		/*if (TEST_MSG==2){
			System.out.println("dataToWriteFile.length: " + dataToWriteFile.length);
			System.out.print("buffPtr = " + buffPtr + "; ");
			System.out.print("actBuffPage = " + actBuffPage + "; ");
			System.out.println("buffPageToWrite = " + buffPageToWrite);
			System.out.println(" ");
		}*/
	}
	
	//************************************************************************************
	//returns the page number which has to be written to file
	private synchronized int getBuffPageToWrite(){
		int buffPageToWriteLoc = buffPageToWrite;
		return buffPageToWriteLoc;
	}

	//************************************************************************************
	//returns the page number which has to be written to file and steps to the next position
	private synchronized int getAndStepBuffPageToWrite(){
		int buffPageToWriteLoc = buffPageToWrite;
		buffPageToWrite++;		
		if (buffPageToWrite >= FILE_DATA_BUFF_PAGE_NUM){
			buffPageToWrite = 0;
		}
		return buffPageToWriteLoc;
	}
	
	//************************************************************************************
	//terminate file writing
	public void close() throws IOException{
		programRunning = false;
		
		// are there any more filled buffers
		while (getNewBlockWaitingToWriteToFile()){
			writeNewBlockToFile();
			/*
			int buffPageToWriteLoc = getAndStepBuffPageToWrite();				
			try{
				fileObj.write(fileDataBuffer[buffPageToWriteLoc],0,fileDataBufferActualSize[buffPageToWriteLoc]);
				System.out.println("Number of bytes written to file: " + fileDataBufferActualSize[buffPageToWriteLoc]);
				System.out.println("actual / written buffs - new writt buff: " + actBuffPage + "/" + buffPageToWriteLoc + "-" + getBuffPageToWrite());
			} catch (Exception e){	
				System.out.println("Error at writing to file.");
			}*/
		}
		
		if (buffPtr>0){
			try{
				fileObj.write(fileDataBuffer[actBuffPage],0,buffPtr);
				/*if ((TEST_MSG==2) || (TEST_MSG==1)){
					System.out.println("Save remaining data. Number of bytes written to file: " + buffPtr);
				}*/
				//System.out.println("actual / written buffs - new writt buff: " + actBuffPage + "/" + buffPageToWriteLoc + "-" + getBuffPageToWrite());
			} catch (Exception e){	
				System.out.println("Error at writing to file.");
			}
		}
		
		//várni kell mielõtt lezárjuk a file-t egyébként nem tud minden adatot kiírni
		long waitBeforeFileClose = (new Date()).getTime(); 
		while(((new Date()).getTime()-waitBeforeFileClose)<10) {};
		
		fileObj.close(); 

	}
	
	//************************************************************************************
	// return true if there is some buffer pages to write into file 
	private synchronized boolean getNewBlockWaitingToWriteToFile(){
		return (buffPageToWrite!=actBuffPage);
	}


	//************************************************************************************
	// return true if there is some buffer pages to write into file 
	public synchronized void forceBufferChange(){
		//save buffer pointer and than reset
		fileDataBufferActualSize[actBuffPage] = buffPtr;
		buffPtr = 0;
		// step to the next page
		actBuffPage = actBuffPage + 1; 
		if (actBuffPage >= FILE_DATA_BUFF_PAGE_NUM){
			actBuffPage = 0;
		}
		//writeNewBlockToFile();
	}

	//************************************************************************************
	// write a page or portion of it into a file
	private void writeNewBlockToFile(){
		System.out.println(this.fileObj.toString());
		System.out.println("****************************************************");
		System.out.println("****************************************************");
		System.out.println("****************************************************");
		System.out.println("****************************************************");
		System.out.println("****************************************************");
		int buffPageToWriteLoc = getAndStepBuffPageToWrite();				
		try{
			fileObj.write(fileDataBuffer[buffPageToWriteLoc],0,fileDataBufferActualSize[buffPageToWriteLoc]);
			/*if ((TEST_MSG==2) || (TEST_MSG==1)){
				System.out.println("Number of bytes written to file: " + fileDataBufferActualSize[buffPageToWriteLoc]);
				System.out.println("actual / written buffs - new writt buff: " + actBuffPage + "/" + buffPageToWriteLoc + "-" + getBuffPageToWrite());
			}*/
		} catch (Exception e){	
			System.out.println("Error at writing to file.");
		}	
		
	}

	//************************************************************************************
	// thread funcionality: checks whether there is data to be written to file
	public void run() {
		while (programRunning) {			
			if (getNewBlockWaitingToWriteToFile()){				
				writeNewBlockToFile();				
			}
			
	        try { 
	        	//System.out.println("Thread filehandler is going to sleep.");
	        	Thread.sleep(50); //Thread.sleep(500);            
	        } catch (InterruptedException e) {}
	    }
    }
	
	
}


