//package net.tinyos.sajat.BeagyLabSerial;

import java.awt.*;
import java.awt.event.*;
import javax.swing.*;
import javax.*;
import java.io.*;
import java.util.*;
import javax.comm.*;
import java.util.Date;
import java.lang.Math;
import java.text.DecimalFormat;





class RezDataColl implements Runnable, SerialPortEventListener,WindowListener, ActionListener{

/**
*
* resonator related variables
*/
final byte harmNum = 5;
public int harmListSelectedIndex=0;  //stores the selected index
public int harmListSelectedIndexOld=0;  //stores the selected index
public int selectedResonator = 0; //stores the order number of the selected resonator
public  java.awt.List harmList = new java.awt.List();
public Label selectedHarm = new Label(" ");
public float [] rezDatRe = new float[harmNum];  //stores the real values of the resonators
public float [] rezDatIm = new float[harmNum];  //stores the real values of the resonators
public float rezDatRe_x0_old;  //the old value of the fundamental harmonic resonator (real)
public float rezDatIm_x0_old;  //the old value of the fundamental harmonic resonator (imag)
public float changeRezPhase_x0; //the difference of the angle of the fundamental harmonic state variable between consecutive data
public float changeRezPhase_x0_avg = 0.0f; // exponential averaged value of the difference of the angle of the fundamental harmonic state variable between consecutive data
public float changeRezPhase_x0_avg_const = 0.95f;
public float [] outRez_x_re = new float[harmNum*2]; //stores the output resonator state variable
public float [] outRez_x_im = new float[harmNum*2]; //stores the output resonator state variable
public float [] rezDatModifRe = new float[harmNum*2];  //stores the real values of the resonator modifiers
public float [] rezDatModifIm = new float[harmNum*2];  //stores the real values of the resonator modifiers

public ResonatorParamsCompl panelForSetResPar;  //this class is responsible for displaying resonator modifier and output resonators

public byte [] tempDat = new byte[harmNum*2+2];
public int latestDat, newDat; //storest the newest data and the data before the newest
public int latestFourData[] = new int[]{0,0,0,0}; //store the latest four data. It is used for sensing the frame that is {0xFF 0xFF 0xFF 0xFF}
public byte[] readBuffer = new byte[100]; //buffer for the serial data
public boolean nextIsNo255=false;
public boolean firstByteOfNum = false;
public boolean realComes = true;
public boolean UARTdataValid = false;
public byte currentRes = 0;
//public int  positionInTheActualFrame = 0; //indicates the order of bytes in the packet
public int  bytePosInPack = 0; //indicates the order of bytes in the packet
public int  seqOfOldPacket;
public boolean searchingForNewFrame = true; //indicates that a new frame is expected
public int programIsInSynchronAgo = 0;  //the number of synchronization frames that are received without any fault; Even for 72 synch frame per second, the counter runs for 2147483647/72/60/60/24~1year wthout overturn

/**
*    T Y P E of the frames
*/
public final int DATA_FRAME_FROM_GWY = 4;  //data packet from the gateway
public final int RES_FROM_SENSOR     = 16 + 128; //resonator values from the sensor
public final int DAT_FROM_SENSOR     = 16; //resonator values from the sensor
public final int SYNC_POINTS         = 68; //synchronization points
public final int FRAMING_RES_SYNC    = 0;  //frame signal and resonator synchronization
public final int NO_VALID_FRAME      = 1024;//the frame is not valid
public final int SET_FREQ_FROM_DSP   = 32; //DSP sends the frequency
public final int GEN_COMMAND_FRAME   = 40; //general command frames. Further purposes are indicated by other variables
public int typeOfTheCurrentFrame = NO_VALID_FRAME;

/**
*    C O M M A N D definitions
*/
public final int GEN_COMMAND_FRAME_SET_OUT_RES       = 1; //set the value of output resonator given in the parameter list   40|0|1|res|re_LSB|re_MSB|im_LSB|im_MSB|0...
//public final int GEN_COMMAND_FRAME_SET_ALL_OUT_RES   = 8; //set the value of output of ALL output resonators 40|0|1|res|re_LSB|re_MSB|im_LSB|im_MSB|0...
public final int GEN_COMMAND_FRAME_SET_ALL_OUT_RES   = 2; //set all output resonators 40|0|2|low<1>(1...5)/odd<2>(1,3,5...)|re_LSB[1]|re_MSB[1]|im_LSB[1]|im_MSB[1]|re_LSB[2]|re_MSB[2]|im_LSB[2]|im_MSB[2]|....
public final int GEN_COMMAND_RESET_ALL_OUT_RES       = 3; //reset all output resonators
public final int GEN_COMMAND_ENABLE_OUT              = 4;
public final int GEN_COMMAND_DISABLE_OUT             = 5;
public final int GEN_COMMAND_SEND_MOD                = 6;
		public final int GEN_COMMAND_SEND_MOD_AND_ENABLE     = 1;
		public final int GEN_COMMAND_SEND_MOD_AND_DISABLE    = 2;
		public final int GEN_COMMAND_SEND_MOD_NO_CHANGE      = 3;
public final int GEN_COMMAND_SET_DSP_MODE            = 7;
		public final int DSP_MODE_NORMAL_MODE                = 1;
		public final int DSP_MODE_ANC_MODE                   = 2;
			public final int ACTIVE_DISTORTION_REDUCTION                       = 1;
			public final int ACTIVE_NOISE_REDUCTION                            = 2;
			public final int ACTIVE_NOISE_REDUCTION_USING_IDENTIFIED_MODIFIERS = 3;
		public final int DSP_MODE_IDENTIFICATION_MODE        = 3;
		public final int DSP_MODE_AFA_MODE                   = 5;
			public final int  DSP_MODE_AFA_MODE_AFA_ON   = 1;
			public final int  DSP_MODE_AFA_MODE_AFA_OFF  = 2;
public final int GEN_COMMAND_SET_ANC_MU              = 8;

/**
*    L E N G T H of the frames
*/
public int LengthOfTheCurrentFrame = Integer.MAX_VALUE;
public final int LENGTH_DATA_FRAME_FROM_GWY = 33; //data packet from the gateway
public final int LENGTH_RES_FROM_SENSOR     = 41; //resonator values from the sensor
public final int LENGTH_DAT_FROM_SENSOR     = 41; //samples from the sensor
public final int LENGTH_SYNC_POINTS         = 16; //time stamp synchronization points
public final int LENGTH_FRAMING_RES_SYNC    = 8;  //frame signal and resonator synchronization
public final int LENGTH_SET_FREQ_FROM_DSP   = 10; //new freq from DSP
public final int LENGTH_GEN_COMMAND_FRAME   = 32; //length of the general command frame
public final int LENGTH_NO_VALID_FRAME      = Integer.MAX_VALUE;//the frame is not valid

public boolean newDataPacketFromGWY   = false;
public boolean newResonatorFromSensor = false;
public boolean newSamplesFromSensor   = false;
public boolean newFrameSynch          = false;
public boolean newTimeStampSynch      = false;
public boolean newFreqFromDSP         = false;
public boolean newGenCommandFrame     = false;

public boolean enableToSendNewFreq=true;

//select between normal and only odd resonator frequencies:
public final int RES_MODE_NORMAL   = 0x01;//  * In normal mode at given fundamental frequency f0, the resonator frequencies are: f1, 2*f1, 3*f1, ...
public final int RES_MODE_ODD      = 0x03;//  * In "odd mode" at given fundamental frequency f0,  the resonator frequencies are: f1, 3*f1, 5*f1, ...
public final int RES_MODE_SIGN_BIT = 0x01;//with this mast, one can select the bit which signs the 
public int rezCountMode    = RES_MODE_NORMAL; //all (1,2,3,4,5) or only odd resonators (1,3,5,7,9) are calculated
public int rezCountModeOld = RES_MODE_NORMAL; //the old value of rezCountMode



int refreshRezText = 0;  //how often is it necessary to update the displayed text values
public int numberOfResonatorPackets = 0;

public boolean drawingEnabled = true;



final byte moteNum = 3;
boolean [] moteActive = new boolean[10];

public final int avNum = 800*moteNum;
public int avCurrNum = 0;
public int [] datSum = new int[moteNum];


/**
*  File handler 
* 
*/

int szaml=0;
boolean fut=true;
public Frame ablak;
public String ablakTitle;
// original version 
/*
public FileOutputStream fos;
public FileOutputStream fosBackup;
public FileOutputStream fosRez;
public FileOutputStream fosGWYSample;
public FileOutputStream fosStampSync;
public FileOutputStream fosFrmSync;
*/

public MDFileHandler fos;
public MDFileHandler fosBackup;

public MDFileHandler fosRez;
public MDFileHandler fosGWYSample;
public MDFileHandler fosStampSync;
public MDFileHandler fosFrmSync;


public String backupDir = null;

public String [] bufferForFiles = new String[100];
public String [] bufferForDataFromDSP = new String[100];

/**
*   GUI related objects
*
*/

boolean mostKezd=true;
long idoKezd;
long osszByte=0;
public long actByteNo = 0;
public int TslocValue;
public Label dataRec;
public	Button butt;
public	Button buttSTART;
public	Button buttSTOP;
public		Panel cimkePan;
public      Button initializeDSPAndGUI;
public		Label cimke;
					String dataCollStop  = "data collection: stopped";
					String dataCollStart = "data collection: started";
public		Label cimkeDatRe;
public		Label cimkeDatIm;
public		Label cimkeDatAbs;
public		Label cimkeDatAng;
public		Label cimkeDatPhaseChange; //the difference of the angle of the fundamental harmonic state variable between consecutive data
public		Label cimkeDat0;
public		Label cimkeDat1;
public		Label cimkeDat2;
public		Label [] cimkeDat = new Label[moteNum];
public		Label cimkeTimeToThisPoint;
public		Label cimkeRecDatNum;
public		TextField datNum;
public		Label frekvenciaLabel;
public      TextField fundFrequency;
public      Button    sendFrequency;

public ModeSelector modeSelectionPanel;

public boolean writeDataToFile = true;

Panel kijelzo;
myCustomCanvas canv;
JScrollBar displayRatioSelection = null; //the scrollbar that shows the scale of the display of the resonator

public float angleOfCanv = 0;
//CheckboxGroup cbGroupMoteSel = new CheckboxGroup();
//Checkbox [] cbMoteSel = new Checkbox[moteNum];

/**
*  Serial port handler objects
*
*/

static CommPortIdentifier portId;
static Enumeration portList;
static Vector serialPortList; //contains the list of serial com ports
static int numOfSerialPorts=0; //number of available serial ports
static String sComPortName;
static int iComBaudRate;

InputStream inputStream;
//    SerialPort serialPort;
Thread readThread;
static   private SerialPort port;
public InputStream in;
public OutputStream out;
SimpleSerialSend sorKuld; //the handler class of the serial port and events




/**
*   Operation mode related objects
*
*/
public String selectedModeOfOperation;
public boolean resonatorsAreDislpayed;
static final String mode_simpleDataCollecting    = "data";   
static final String mode_resonatorDataCollecting = "rezdata";
static final String mode_DSPcontrol              = "DSP";

/**
*  indicate the difference between sampling at the sensor and gateway
*  
*/
public int sendAtSensor = 0;
public int recAtGwy = 0;
public int freqOfPrintSync = 0; //a couter which is used for timing the display of difference between sampling



/**
*           S T A R T    of the   C O N S T R U C T O R
*
*/
	
	public RezDataColl(String selectedModeOfOperation_loc) {
		selectedModeOfOperation = selectedModeOfOperation_loc;
		if (selectedModeOfOperation.compareTo(RezDataColl.mode_simpleDataCollecting)==0){
			resonatorsAreDislpayed = false;
		} else {
			resonatorsAreDislpayed = true;
		}
		System.out.println(" ");
		try{
			port.addEventListener(this);
			//--System.out.println("A portfigyelo megadva.");
		//System.out.println(BackupDirectory.exists() + ": Backup dir");

    	//Date d = new Date();
    	//System.out.println("Time of arrival: " + d.toString() );
    	//Calendar rightNow = Calendar.getInstance();
    	//System.out.println(  rightNow.get(Calendar.YEAR) + "_" + (rightNow.get(Calendar.MONTH)+1)  + "_" + rightNow.get(Calendar.DAY_OF_MONTH)   );
    	//System.out.println(  rightNow.get(Calendar.HOUR)  + "_" + rightNow.get(Calendar.MINUTE)  + "_" + rightNow.get(Calendar.SECOND) );
    
 
		//System.exit(0);
		

		
		//set the serial port for sending and receiving
		in  = port.getInputStream();
		out = port.getOutputStream();
		out.flush();	
       	int avail=in.available();
      	in.skip(avail);


		}catch(Exception e){System.out.println(e);}
		
		//try{ out.write((int)100);} catch(IOException e){System.out.println(e);}
		
		//ablak=new Frame("RezDataColl" + "(@"+sComPortName+")");
		ablak=new Frame();
		ablakTitle = "RezDataColl";
		ablak.addWindowListener(this);
		Panel ablakSouthBorder = new Panel(); //this stores the downpart of the frame
		ablakSouthBorder.setLayout(new GridLayout(2,1));
		ablakSouthBorder.setLayout(null);ablakSouthBorder.setSize(500,200);
		
		if (selectedModeOfOperation==mode_simpleDataCollecting){
			ablakTitle = "Data collection";
			//ablak.setTitle("Data collection" + "(@"+sComPortName+")");
		}
		ablak.setTitle(ablakTitle + "(@"+sComPortName+")");


/*

---------------------------------------------------
|                                                 |      
|                                                 |      
|--------------------------------------------------      
| c   |         |                                 |      
| i   |         | kijelzo: harmonikus kiválasztás |      
| m   |         |          grafika                |      
| k   |         |                                 |      
| e   |         |                                 |      
| P   |         |                                 |
| a   |         |                                 |      
| n   |         |                                 |
|     |         |                                 |      
|--------------------------------------------------
|        ablakSouthBorder: gombok/gombsorok       |
---------------------------------------------------


*/


		
	/**
	*
	* Creation of the GUI
	*
	*/
		
		//this contains the START STOP Send button and frequency
		//*****************************************************
		Panel buttPanel1 = new Panel();
		buttPanel1.setLayout(new GridLayout(1,5));
		buttPanel1.setLayout(null);buttPanel1.setVisible(true); 
		buttPanel1.setSize(500,40);
		buttPanel1.setLocation(5,5);
		ablakSouthBorder.add(buttPanel1);
		//ablakSouthBorder.add(new ResonatorParamsCompl(this));
		panelForSetResPar = new ResonatorParamsCompl(this);
		panelForSetResPar.setLocation(5,40);
		if (selectedModeOfOperation.compareTo(RezDataColl.mode_DSPcontrol)==0) {
			ablakSouthBorder.add(panelForSetResPar);	
		}
		
		
		//ablak.add(butt, BorderLayout.SOUTH);
		//

		frekvenciaLabel = new Label("frekvencia="); frekvenciaLabel.setSize(70,30);frekvenciaLabel.setLocation(0,0); //label
		fundFrequency   = new TextField("50.0");   fundFrequency.setSize(100,30);  fundFrequency.setLocation(200-130,0); //value of the fundamental resonator frequency
	    sendFrequency   = new Button("Set freq."); sendFrequency.setSize(100,30);  sendFrequency.setLocation(300-130,0); //send frequency button
		
		int STARTButtPos = 0;
		int STOPButtPos  = 0;
		
		if (resonatorsAreDislpayed){
			buttPanel1.add(frekvenciaLabel);
			buttPanel1.add(fundFrequency);
			buttPanel1.add(sendFrequency);
			STARTButtPos = 300;
			STOPButtPos  = 400;
		} else {
			STARTButtPos = 0;
			STOPButtPos  = 100;
		}
		buttSTART = new Button("START archiv"); buttSTART.setSize(100,30);buttSTART.setLocation(STARTButtPos,0);  //start button 
		buttSTOP  = new Button("STOP archiv");  buttSTOP.setSize(100,30); buttSTOP.setLocation(STOPButtPos,0); //stop button

		buttPanel1.add(buttSTART);     //add the start button
		buttPanel1.add(buttSTOP);      //add the stop button
		//--ablak.add(buttPanel1,BorderLayout.SOUTH);  //csak ezt kell ki/be kommentezni ha a gombokat látni szeretnénk vagy sem
		ablak.add(ablakSouthBorder,BorderLayout.SOUTH);  //csak ezt kell ki/be kommentezni ha a gombokat látni szeretnénk vagy sem
		ablakSouthBorder.setSize(Math.max(panelForSetResPar.getWidth(),buttPanel1.getWidth()), panelForSetResPar.getHeight() + buttPanel1.getHeight());
		if (selectedModeOfOperation.compareTo(RezDataColl.mode_DSPcontrol)==0) {
			ablakSouthBorder.setSize(700, panelForSetResPar.getHeight() + buttPanel1.getHeight());
		} else {
			ablakSouthBorder.setSize(700,100);
		}
		panelForSetResPar.getHeight();
		buttPanel1.getHeight();
		//ablakSouthBorder.pack();
		//*****************************************************
		//*****************************************************
		// END of the creation of the START, STOP, freq + resonator settiongs
		
/**
*     The creation of the lables that contain the parameters received from the mote and the related calculated parameters
*     Labels are : resonator real, imag / amplitude,phase ; change of the phase
*/		

//   cimkePan
// ---------------
// |  cimkeDatRe |
// |          Im | 
// |        Abs  | 
// |        Ang  | 
// |     AngDiff | 
// |             | 
// |             | 
// |             | 
// |             | 
// |             | 
// ---------------
//
		
		cimkePan    = new Panel();
		cimkePan.setLayout(new GridLayout(10,1));
		initializeDSPAndGUI  = new Button("Initialize System");
		initializeDSPAndGUI.addActionListener(panelForSetResPar);
		cimke       = new Label(dataCollStop); 
		cimkeDatRe  = new Label("rezRe  =         ");		
		cimkeDatIm  = new Label("rezIm  =         ");	
		cimkeDatAbs = new Label("rezAbs  =         ");		
		cimkeDatAng = new Label("rezAng  =         ");	
		cimkeDatPhaseChange = new Label("Angle difference");
			
		cimkeTimeToThisPoint = new Label("  ");	
		cimkeRecDatNum =       new Label("  ");	
		
		
		dataRec = new Label("            ");
		datNum  =new TextField("1",3+moteNum);
		if (selectedModeOfOperation.compareTo(RezDataColl.mode_DSPcontrol)==0) {
			cimkePan.add(initializeDSPAndGUI);
		}
		cimkePan.add(cimke);
		
		//add the labels to the container
		if (resonatorsAreDislpayed){
			cimkePan.add(cimkeDatRe);
			cimkePan.add(cimkeDatIm);
			cimkePan.add(cimkeDatAbs);
			cimkePan.add(cimkeDatAng);
			cimkePan.add(cimkeDatPhaseChange);
		}
		
		cimkePan.add(cimkeTimeToThisPoint);
		cimkePan.add(cimkeRecDatNum);
		ablak.add(cimkePan, BorderLayout.WEST);
		


//Az eredmények grafikus kijelzése START

//            kijelzo
//   ----------------------------
//   |harmSelAndMode: NORTH     |
//   |  ----------------------- |
//   |  |    harmSel    |     | |
//   |  ||------------| |     | |
//   |  || harmList   | |Mode | |
//   |  ||            | |     | |
//   |  ||selectedHarm| |     | |
//   |  |-------------- |     | |
//   |  ----------------------- |
//   |                          |
//   |   |-------------|        |
//   |   |canv         |   E R  |
//   |   |             |   A a  |
//   |   |  CENTER     |   S t  |
//   |   |             |   T i  |
//   |   |-------------|     o  |
//   |                          |
//   |                          |
//   ----------------------------


		int harmSelAndListHorSize = 200;
		int modeSelectionPanelHorSize = 240;

		kijelzo = new Panel();
		kijelzo.setLayout(new BorderLayout());
		
		Panel harmSelAndMode = new Panel();		
		
		//harmSelAndMode.setLayout(null);
		harmSelAndMode.setLayout(new FlowLayout(FlowLayout.LEADING  ,10,10) );

		
		Panel harmSel = new Panel();	//this panel makes possible to reduce the size of the selector list. Otherwise the List would expand until the right end of the window	
		harmSel.setLayout(new GridLayout(2,1));
		harmSel.setLayout(null);
		for (int harm=0;harm<harmNum;harm++){
			harmList.add(new String((harm+1) + ". harmonikus"),harm); 
		}
		harmList.setSize(harmSelAndListHorSize,90);
		harmList.setLocation(0,0);
		harmList.select(0);
		selectedHarm.setSize(harmSelAndListHorSize,40);
		selectedHarm.setLocation(0,harmList.getHeight()+10);
		selectedHarm.setText("megjelenített harmonikus: " + 1);		
		
		harmSel.add(harmList);
		harmSel.add(selectedHarm);
		harmSel.setSize(harmSelAndListHorSize,selectedHarm.getHeight()+harmList.getHeight()+00);
		harmSel.setLocation(0,0);
		
		// M O D E  selection panel		
		modeSelectionPanel = new ModeSelector(this, null);		
		modeSelectionPanel.setSize(   modeSelectionPanelHorSize,Math.max(harmSel.getHeight(),100)    );
		modeSelectionPanel.setSize(   modeSelectionPanelHorSize,Math.max(harmSel.getHeight(),100)    );
		modeSelectionPanel.setLocation(harmSel.getWidth()+20,0);
	    //cimkePan.add(modeSelectionPanel);
		//ablak.add(modeSelectionPanel, BorderLayout.NORTH);

		harmSelAndMode.setSize(harmSelAndListHorSize+modeSelectionPanelHorSize,200);
		harmSelAndMode.add(harmSel);
		if (selectedModeOfOperation.compareTo(RezDataColl.mode_DSPcontrol)==0) {
			harmSelAndMode.add(modeSelectionPanel);
		}

		//kijelzo.add(harmSel,BorderLayout.NORTH);
		kijelzo.add(harmSelAndMode,BorderLayout.NORTH);
		

//---------------------------------------------------------------
		


	    canv = new myCustomCanvas();
		
		kijelzo.add(canv,BorderLayout.CENTER);
		
		Panel displayRatioSelectionPanel = new Panel(); //this panel contains the scrollbar
		
		displayRatioSelectionPanel.setLayout(null);
		
		int displayRatioSelectionMin       = 0;
		int displayRatioSelectionMax       = 200;
		int displayRatioSelectionBarHeight = 10;
		
		
		try {
		displayRatioSelection = new JScrollBar(JScrollBar.VERTICAL,displayRatioSelectionMax/2,displayRatioSelectionBarHeight,displayRatioSelectionMin,displayRatioSelectionMax); //public Scrollbar(int orientation, int value,int visible,int minimum,int maximum)
		} catch (Exception e) {System.out.println("Hiba!");System.out.println(e);}
		displayRatioSelection.setUnitIncrement(10);
		//displayRatioSelection.setValue(100);
		//displayRatioSelection.validate();
		
		displayRatioSelection.setSize(20,200);
		displayRatioSelection.setLocation(0,100);
		displayRatioSelectionPanel.add(displayRatioSelection);  //add the component
		//muValScroll.addAdjustmentListener((AdjustmentListener) parentObject);
		//muValScroll.setVisible(partsExceptButtVisible);
		displayRatioSelectionPanel.setSize(displayRatioSelection.getWidth()+40,displayRatioSelection.getHeight());
		kijelzo.add(displayRatioSelectionPanel, BorderLayout.EAST);


		
		if (resonatorsAreDislpayed){
			 ablak.add(kijelzo,BorderLayout.EAST);
		}
		ablak.setResizable(true);


//^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
//**************************************************************************
//**************************************************************************
//      E N D    of creation of the GUI

		
		//
		
		if (resonatorsAreDislpayed){
			ablak.setSize(700,800); //450,400
		} else{
			ablak.setSize(300,300); //450,400
		}
		
		//ablak.pack();
		sorKuld = new SimpleSerialSend(in,out,cimke,datNum,this);
		panelForSetResPar.setCommandGenerator(sorKuld);  //give the reference of the serial port handler
		modeSelectionPanel.setCommandGenerator(sorKuld); //give the reference of the serial port handler
		
		buttSTART.addActionListener(sorKuld);
		buttSTOP.addActionListener(sorKuld);
		sendFrequency.addActionListener(sorKuld);
		fundFrequency.addActionListener(sorKuld); //adds action listener to text field of fundamental frequency
		
		//sorKuld.STOPmote();
		//sorKuld.STARTmote();
		
		/**
		Initialization of the varialbles
		*/
		//************************************************
		//VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
		
		for (int harm=0;harm<2*harmNum;harm++){
			rezDatModifRe[harm] = 1.0f; 
			rezDatModifIm[harm] = 0.0f; 
			
			outRez_x_re[harm]   = 0.0f;
			outRez_x_im[harm]   = 0.0f;
		}
		
		//^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
		//************************************************
		//       Initialization of the variables
		
		//initializes the microcontroller. Stops and starts the UART so we get in synchronized state
		writeDataToFile = false;
		sorKuld.sendStopCommand();
		waitForMsec(200);
		sorKuld.sendStartCommand();
		
		ablak.setVisible(true);
		
		port.notifyOnDataAvailable(true); 
//		port.notifyOnOutputEmpty(true);
		

	//	try{out.write((int)100);out.flush();} catch(IOException err){System.out.println(err);}		

        readThread = new Thread(this);
        readThread.start();
        while(fut) {
    		try{
    			Thread.sleep(50);}
			catch(Exception e){ System.out.println(e); } 
			
			//System.out.println("LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL");
		}
	}


/**
* Handlers of the window events
*
*
*/
	 //Ablak események
	 public void windowClosing(WindowEvent e) {
	// 	try{
	//		out.write((int)100);
	//	} catch(IOException err){System.out.println(err);}

	 	fut = false;
	 	sorKuld.STOPmote();
	 	//closeAllFiles();

	 	//writeDataToFile = false;
		//try{fos.close();}catch(Exception eF){System.out.println("Hiba a file lezarasakor.");}
		//try{fosBackup.close();}catch(Exception eF){System.out.println("Hiba a file lezarasakor.");}
		//try{fosRez.close();}catch(Exception eF){System.out.println("Hiba a Rez file lezarasakor.");}
		//try{fosGWYSample.close();}catch(Exception eF){System.out.println("Hiba a GWYSample file lezarasakor.");}
		//try{fosStampSync.close();}catch(Exception eF){System.out.println("Hiba a StampSync file lezarasakor.");}
		//try{fosFrmSync.close();}catch(Exception eF){System.out.println("Hiba a FrmSync file lezarasakor.");}

	
	 	
	 	long osszIdo=(new Date()).getTime()-idoKezd;
	 	
	 	System.out.println("A kommunikacio: "+osszIdo+" ms-ig tartott.");
	 	System.out.println("Az osszes fogadott byteok szama: "+osszByte);
	 	System.out.println("Ez: "+8.0*osszByte/osszIdo+" kbps");
		
		//for(int x=0;x<10000;x++){
		//	System.out.println("------------------------------------");
		//}
	 	
	 	System.exit(0);
	 }
	 public void windowActivated(WindowEvent e) {};
	 public void windowClosed(WindowEvent e) {};
	 public void windowDeactivated(WindowEvent e) {};
	 public void windowDeiconified(WindowEvent e) {};
	 public void windowIconified(WindowEvent e) {};
	 public void windowOpened(WindowEvent e) {};


	 public void actionPerformed(ActionEvent e){}


/**
*@fn public void serialEvent(SerialPortEvent event) 
* 
* Handles the serial port events, i.e. reads the data from the receive buffer
*
*
*/
    public void serialEvent(SerialPortEvent event) {
    	//System.out.println("Valami tortent.");
		String s;
		String sConversionIntToStr;
		String forRetransmit;
		String kiir;
      int avail=0;
      int numBytes=0;
      int igaziErt=0;
      int atlagErt=0;      
      
      

      if (SerialPortEvent.OUTPUT_BUFFER_EMPTY  == event.getEventType()){
      	System.out.println();
   		System.out.println("output buffer empty");
      	System.out.println();
      }
      
      
      /**
      *
      *    Handle the event when new data have arrived
      **/
      if (SerialPortEvent.DATA_AVAILABLE == event.getEventType()){
      	
          	if (mostKezd & writeDataToFile){
    		mostKezd=false;
    		//idoKezd = (new Date()).getTime();
    		}
    		
      
        try {
	//       if (event.getEventType()==SerialPortEvent.DATA_AVAILABLE) System.out.println("Uzenet erkezett"); 
	        avail=in.available();
	//--        System.out.println(avail+" bytenyi adat erkezett. Az uzenet:");
	        numBytes = in.read(readBuffer);
	//--          System.out.print(new String(readBuffer));
			osszByte+=numBytes;
	//      System.out.println(numBytes);

      } catch (IOException e) {System.out.println(e);}
 		//--System.out.println();
        //--System.out.println((szaml++));
        
		if (writeDataToFile ){
			long timeToThisPoint=((new Date()).getTime()-idoKezd)/1000;
	        szaml += numBytes;
    	    //--System.out.println("adat: " + szaml + ";   ido: " + timeToThisPoint + "[sec]");
    	    
	   		cimkeTimeToThisPoint.setText("idõ  =" + timeToThisPoint + " [sec]");	
			cimkeRecDatNum.setText("adat =" + szaml/(harmNum*2+2) + " [db]");
			
	   	}    
        

//--     System.out.println("Az uzenet ASCII kod sorozata:");
		try{
			
		/**
		*
		*Read the data from the buffer
		*/	
		for (int i = 0; i < numBytes; i++){
			
			
			igaziErt=((int)readBuffer[i]>=0) ? (int)readBuffer[i] : 256+(int)readBuffer[i];
      		s = Integer.toString(igaziErt);  //stringé alakitja a szamot
      		sConversionIntToStr= Integer.toString(igaziErt);  //stringé alakitja a szamot
      		atlagErt = atlagErt + igaziErt;
	
	//System.out.println(" " + s);
			if (writeDataToFile ){
				fos.write( s.getBytes()  );  //a stringet byteokra bontja
				fosBackup.write( s.getBytes()  );  //a stringet byteokra bontja
				fos.write( 10 );  //uj sor karakter
				fosBackup.write( 10 );  //uj sor karakter
			}//if (writeDataToFile ){	


				//disableDraw();

/*
public int LengthOfTheCurrentFrame = Integer.MAX_VALUE;
public final int LENGTH_DATA_FRAME_FROM_GWY = 33;  //data packet from the gateway
public final int LENGTH_RES_FROM_SENSOR     = 41; //resonator values from the sensor
public final int LENGTH_SYNC_POINTS         = 16; //time stamp synchronization points
public final int LENGTH_FRAMING_RES_SYNC    = 8;  //frame signal and resonator synchronization
public final int LENGTH_SET_FREQ_FROM_DSP   = 10;  //new freq from DSP
public final int LENGTH_NO_VALID_FRAME      = Integer.MAX_VALUE;//the frame is not valid
*/
				
//public int typeOfTheCurrentFrame = NO_VALID_FRAME;
//public final int DATA_FRAME_FROM_GWY = 4;  //data packet from the gateway
//public final int RES_FROM_SENSOR     = 16+128; //resonator values from the sensor
//public final int SYNC_POINTS         = 68; //synchronization points
//public final int FRAMING_RES_SYNC    = 0;  //frame signal and resonator synchronization
//public final int SET_FREQ_FROM_DSP   = 32; //DSP sends the frequency
//public final int NO_VALID_FRAME      = 1024;//the frame is not valid
				latestFourData[0] = latestFourData[1];
				latestFourData[1] = latestFourData[2];
				latestFourData[2] = latestFourData[3];
				latestFourData[3] = igaziErt;
				
				if (bytePosInPack>100){  //prevents the program to run unsynchronized for too long time
					searchingForNewFrame  = true;
					typeOfTheCurrentFrame = NO_VALID_FRAME;
					newDataPacketFromGWY   = false;
					newResonatorFromSensor = false;
					newSamplesFromSensor   = false;
					newFrameSynch          = false;
					newTimeStampSynch      = false;
					newFreqFromDSP         = false;
				}
				
//public boolean newDataPacketFromGWY   = false;
//public boolean newResonatorFromSensor = false;
//public boolean newFrameSynch          = false;
//public boolean newResSynch            = false;
//public boolean newFreqFromDSP         = false;				
				
				//new frame signal is detected anywhere
				if (/*(searchingForNewFrame) &*/(255==latestFourData[0])&(255==latestFourData[1])&(255==latestFourData[2])&(255==latestFourData[3])){
					typeOfTheCurrentFrame = FRAMING_RES_SYNC;
					searchingForNewFrame  = false;
					newFrameSynch         = true;
					bytePosInPack = 4-1;
					programIsInSynchronAgo++;		
					System.out.println("New frame: " + programIsInSynchronAgo+" ");		
				} //if ((255=latestFourData[0])&(255=latestFourData[1])&(255=latestFourData[2])&(255=latestFourData[3])){
				
				//data are received from the gateway
				if ((searchingForNewFrame) & (DATA_FRAME_FROM_GWY == latestFourData[2]) & (0==latestFourData[3])){
					typeOfTheCurrentFrame = DATA_FRAME_FROM_GWY;
					searchingForNewFrame  = false;
					newDataPacketFromGWY  = true;
					bytePosInPack = 2-1;
					//System.out.println("New data from gateway");
				} //if ((searchingForNewFrame) & (DATA_FRAME_FROM_GWY = latestFourData[2]) & (0==latestFourData[3])){
				
				//resonator data are received from the sensor
				if ((searchingForNewFrame) & (RES_FROM_SENSOR == latestFourData[2]) & (0==latestFourData[3])){
					typeOfTheCurrentFrame = RES_FROM_SENSOR;
					searchingForNewFrame  = false;
					newResonatorFromSensor=true;
					bytePosInPack = 2-1;
					//System.out.println("New resonator frame");
				}

				//samples are received from the sensor
				if ((searchingForNewFrame) & (DAT_FROM_SENSOR == latestFourData[2]) & (0==latestFourData[3])){
					typeOfTheCurrentFrame = DAT_FROM_SENSOR;
					searchingForNewFrame  = false;
					newSamplesFromSensor  = true;
					bytePosInPack = 2-1;
					//System.out.println("New resonator frame");
				}

				//time stamp synchronization data are received from the sensor
				if ((searchingForNewFrame) & (SYNC_POINTS == latestFourData[2]) & (0==latestFourData[3])){
					typeOfTheCurrentFrame = SYNC_POINTS;
					searchingForNewFrame  = false;
					newTimeStampSynch     = true;
					bytePosInPack = 2-1;
					//System.out.println("New timestamp");

					//if ((selectedModeOfOperation.compareTo(RezDataColl.mode_simpleDataCollecting)==0) & (freqOfPrintSync==10)){
					freqOfPrintSync++;	
					if ((freqOfPrintSync==10)){
						System.out.println("mintavetel kulonbseg: " + (sendAtSensor-recAtGwy));
						freqOfPrintSync=0;
					} else {
						//System.out.println("");
					}

				}

				//frequency received from sensor
				if ((searchingForNewFrame) & (SET_FREQ_FROM_DSP == latestFourData[2]) & (0==latestFourData[3])){
					typeOfTheCurrentFrame = SET_FREQ_FROM_DSP;
					searchingForNewFrame  = false;
					newFreqFromDSP        = true;
					bytePosInPack = 2-1;
					//System.out.println("New timestamp");
				}

				actByteNo++; //increase the total number of byte
				//long bytePosInPack = (actByteNo)%(harmNum*2+2);
				bytePosInPack++; //increase the position in a packet
				
				

							
		/**
		*
		*resonator data are received from the sensor
		*
		*/
				
						
		if (typeOfTheCurrentFrame == RES_FROM_SENSOR){
				
				if (newResonatorFromSensor){  //start of frame
					forRetransmit = Integer.toString(RES_FROM_SENSOR);
					//if (writeDataToFile ){
					//	fosRez.write( forRetransmit.getBytes()  );  //a stringet byteokra bontja
					//	fosRez.write( 10 );  //uj sor karakter
					//}//if (writeDataToFile ){						
					bufferForFiles[0] = new String(forRetransmit);

					newResonatorFromSensor = false;
					currentRes = 0;
					//bytePosInPack = 0;
					//nextIsNo255 = true;
					UARTdataValid = true;
					changeRezPhase_x0     = calculatePhaseDifference(rezDatRe[0],rezDatIm[0]  , rezDatRe_x0_old, rezDatIm_x0_old);
					//changeRezPhase_x0     = calculatePhaseDifference(0.0f,1.0f  , 1.0f, 0.0f);
					if (Float.isNaN(changeRezPhase_x0) ){
						changeRezPhase_x0 = 0.0f; //it must be set to zero, since in the exponential averaging NaN may cause permanent error
					}
					//exponential averaging
					//fi_aver = a*fi_aver + (1-a)*fi
					changeRezPhase_x0_avg = changeRezPhase_x0_avg_const*changeRezPhase_x0_avg + (1.0f-changeRezPhase_x0_avg_const)*changeRezPhase_x0;
					if (Float.isNaN(changeRezPhase_x0_avg) ){
						changeRezPhase_x0_avg = 0.0f; //it must be set to zero, since in the exponential averaging NaN may cause permanent error
					}
					rezDatRe_x0_old = rezDatRe[0];
					rezDatIm_x0_old = rezDatIm[0];
					numberOfResonatorPackets++;
				} else {
					//nextIsNo255 = false;	
				}
//public int RES_MODE_NORMAL = 01; //  In normal mode at given fundamental frequency f0, the resonator frequencies are: f1, 2*f1, 3*f1, ...
//public int RES_MODE_ODD    = 03; //  In "odd mode" at given fundamental frequency f0,  the resonator frequencies are: f1, 3*f1, 5*f1, ...
//public int rezCountMode    = RES_MODE_NORMAL; //all (1,2,3,4,5) or only odd resonators (1,3,5,7,9) are calculated
//public int rezCountModeOld = RES_MODE_NORMAL; //the old value of rezCountMode
				
				//if (bytePosInPack==21) {
				if (bytePosInPack==31) {
					if ( (igaziErt&RES_MODE_SIGN_BIT)>0 ) {
						rezCountMode=RES_MODE_ODD;
					} else {
						rezCountMode=RES_MODE_NORMAL;
					} 
					if (rezCountMode!=rezCountModeOld){
				 		harmListSelectedIndex = getSelectedHarmonicIndex();
						//for (int r=0;r<1000;r++){	System.out.println("Valami változott");}
						int multiplier    = (RES_MODE_ODD==rezCountMode)    ? 2 : 1;
						int multiplierOld = (RES_MODE_ODD==rezCountModeOld) ? 2 : 1;
						for (int harm=0;harm<harmNum;harm++){
							harmList.replaceItem(new String((harm*multiplier+1) + ". harmonikus"),harm); 
						}
						int selectedHarmRealOld = harmListSelectedIndex * multiplierOld + 1; //the previously selected real harmonic 
						int selectedHarmReal    = harmListSelectedIndex * multiplier    + 1; //the newly selected real harmonic 
						int activatedSelector = (selectedHarmRealOld-1)/multiplier; //which item is selected
						if (activatedSelector>=harmNum) {
							activatedSelector = harmNum-1;
						}
						if (activatedSelector<0) {
							activatedSelector = 0;
						}
						
						harmList.select(activatedSelector);
					}
					//System.out.println(rezCountMode +"  --  " +rezCountModeOld);
					rezCountModeOld = rezCountMode;
				}

				
				latestDat = newDat;
				newDat    = igaziErt;
				
				float scaleFactor = 1f/(512.0f*4.0f);
				int signValOfErt    = ((int)latestDat<128) ? (int)latestDat : -256+(int)latestDat;
				int signValOfnewDat = ((int)newDat<128)    ? (int)newDat    : -256+(int)newDat;
				
				//--System.out.println(UARTdataValid);
				
				if (bytePosInPack==11){
					firstByteOfNum = true;
					realComes      = true;
				}
				
				if ((firstByteOfNum==false) & (UARTdataValid) &(bytePosInPack>=11) &(bytePosInPack<=30)){
					firstByteOfNum=true; 
					if (realComes) {
						//rezDatRe[currentRes] = (float)(newDat + signValOfErt*256)*scaleFactor; //orig
						rezDatIm[currentRes] = (float)(latestDat + signValOfnewDat*256)*scaleFactor;
						realComes = false;
					} else {
						//rezDatIm[currentRes] = (float)(newDat + signValOfErt*256)*scaleFactor; //orig
						rezDatRe[currentRes] = (float)(latestDat + signValOfnewDat*256)*scaleFactor;
						//System.out.println(rezDatIm[currentRes]);
						//currentRes++;if (currentRes >=harmNum) {currentRes = 0;}
						if (currentRes < harmNum) {currentRes ++;} 
						realComes = true;
					}
					
				} //firstByteOfNo==false
				else {
					firstByteOfNum=false;	
				}
				
				
				if (currentRes == harmNum){
					UARTdataValid = false;
				}
				//if ((rezDatRe[harmListSelectedIndex]>0.25001f)|(rezDatRe[harmListSelectedIndex]<0.2499f)){
        		//	writeDataToFile = false;
        		//	System.out.println(""+rezDatRe[harmListSelectedIndex] + ";"+rezDatIm[harmListSelectedIndex] + ";"+(char)7);
        		//	System.out.println(""+currentRes+";"+harmListSelectedIndex);
        		//}	
				if ((bytePosInPack<=30) &((bytePosInPack>=11))){
					//--System.out.println("newDat=" + newDat + "  bytePosInPack= " + bytePosInPack); 
				} else {
					//System.out.println(" "); 
					//System.out.print("\f");
				}
			
			bufferForFiles[bytePosInPack-1] = new String(sConversionIntToStr);	

				if (bytePosInPack == LENGTH_RES_FROM_SENSOR){
					searchingForNewFrame  = true;
					typeOfTheCurrentFrame = NO_VALID_FRAME;
					if (writeDataToFile ){
						for (int fileWriteBuffer=0;fileWriteBuffer<LENGTH_RES_FROM_SENSOR;fileWriteBuffer++){
							fosRez.write( bufferForFiles[fileWriteBuffer].getBytes()  );  //a stringet byteokra bontja
							//System.out.println("" + fileWriteBuffer + " : " + bufferForFiles[fileWriteBuffer]);
							fosRez.write( 10 );  //uj sor karakter
						}
					}//if (writeDataToFile ){/**/
				}
			
				
				//enableDraw();
			} //if (typeOfTheCurrentFrame == RES_FROM_SENSOR){
			//=====================================================


		/**
		*
		* data are received from the sensor
		*
		*/
		if (typeOfTheCurrentFrame == DAT_FROM_SENSOR){
				
			if (newSamplesFromSensor){  //start of frame
				newSamplesFromSensor = false;
				forRetransmit = Integer.toString(DAT_FROM_SENSOR);
				bufferForFiles[0] = new String(forRetransmit);					
			}
			
			bufferForFiles[bytePosInPack-1] = new String(sConversionIntToStr);
				
			if (bytePosInPack == LENGTH_DAT_FROM_SENSOR){ //end of the frame
					searchingForNewFrame  = true;
					typeOfTheCurrentFrame = NO_VALID_FRAME;
					if (writeDataToFile ){
						for (int fileWriteBuffer=0;fileWriteBuffer<LENGTH_DAT_FROM_SENSOR;fileWriteBuffer++){
							fosRez.write( bufferForFiles[fileWriteBuffer].getBytes()  );  //a stringet byteokra bontja
							fosRez.write( 10 );  //uj sor karakter
						}
					}//if (writeDataToFile ){/**/
			}


		} //if (typeOfTheCurrentFrame == DAT_FROM_SENSOR)
		//===============================================================


		/**
		*
		* data are received from the gateway
		*
		*/
		if (typeOfTheCurrentFrame == DATA_FRAME_FROM_GWY){
				
			if (newDataPacketFromGWY){  //start of frame
				newDataPacketFromGWY = false;
				forRetransmit = Integer.toString(DATA_FRAME_FROM_GWY);
				bufferForFiles[0] = new String(forRetransmit);					
			}
			
			bufferForFiles[bytePosInPack-1] = new String(sConversionIntToStr);
			
			if (bytePosInPack == (4)){
				
				int seqOfCurrentPacket = Integer.parseInt( bufferForFiles[3-1] ) + 256*Integer.parseInt( bufferForFiles[4-1] );  //LSB of the sequence number
				
				int diffBetwIDs = seqOfCurrentPacket-seqOfOldPacket;
				
			    //if ((diffBetwIDs!=1) && (diffBetwIDs!=65535)){
				//	System.out.println("Packet ID: " + seqOfOldPacket);
				//	System.out.println((diffBetwIDs));
				//	System.out.print("\007");
				//	System.out.flush();
			    //}
			    
			    seqOfOldPacket = seqOfCurrentPacket;

			}
				
			if (bytePosInPack == LENGTH_DATA_FRAME_FROM_GWY){ //end of the frame
					searchingForNewFrame  = true;
					typeOfTheCurrentFrame = NO_VALID_FRAME;
					if (writeDataToFile ){
						for (int fileWriteBuffer=0;fileWriteBuffer<LENGTH_DATA_FRAME_FROM_GWY;fileWriteBuffer++){
							fosGWYSample.write( bufferForFiles[fileWriteBuffer].getBytes()  );  //a stringet byteokra bontja
							fosGWYSample.write( 10 );  //uj sor karakter
						}
					}//if (writeDataToFile ){/**/
			}


		} //if (typeOfTheCurrentFrame == DATA_FRAME_FROM_GWY)
		//===============================================================
		

		/**
		*
		* new frame and resonator synchron received
		*
		*/
		if (typeOfTheCurrentFrame == FRAMING_RES_SYNC){
				
			if (newFrameSynch){  //start of frame
				newFrameSynch = false;
				forRetransmit = Integer.toString(255);
				bufferForFiles[0] = new String(forRetransmit);
				bufferForFiles[1] = new String(forRetransmit);
				bufferForFiles[2] = new String(forRetransmit);
				//System.out.println(programIsInSynchronAgo + "-th Synchron point is received");
			}

			bufferForFiles[bytePosInPack-1] = new String(sConversionIntToStr);

			if (bytePosInPack == LENGTH_FRAMING_RES_SYNC){//end of the frame
				searchingForNewFrame  = true;
				typeOfTheCurrentFrame = NO_VALID_FRAME;
					if (writeDataToFile ){
						for (int fileWriteBuffer=0;fileWriteBuffer<LENGTH_FRAMING_RES_SYNC;fileWriteBuffer++){
							fosFrmSync.write( bufferForFiles[fileWriteBuffer].getBytes()  );  //a stringet byteokra bontja
							fosFrmSync.write( 10 );  //uj sor karakter
						}
					}//if (writeDataToFile ){/**/
			}

				
		} //if (typeOfTheCurrentFrame == FRAMING_RES_SYNC)
		//===============================================================
							


		/**
		*
		* new time stamp synchron received
		*
		*/
		if (typeOfTheCurrentFrame == SYNC_POINTS){
				
				if (newTimeStampSynch){  //start of frame
					newTimeStampSynch = false;
					forRetransmit = Integer.toString(SYNC_POINTS);
					bufferForFiles[0] = new String(forRetransmit);
				}

			bufferForFiles[bytePosInPack-1] = new String(sConversionIntToStr);
			
			if (bytePosInPack == LENGTH_SYNC_POINTS){//end of the frame
				searchingForNewFrame  = true;
				typeOfTheCurrentFrame = NO_VALID_FRAME;
					if (writeDataToFile ){
						for (int fileWriteBuffer=0;fileWriteBuffer<LENGTH_SYNC_POINTS;fileWriteBuffer++){
							fosStampSync.write( bufferForFiles[fileWriteBuffer].getBytes()  );  //a stringet byteokra bontja
							fosStampSync.write( 10 );  //uj sor karakter
						}
					}//if (writeDataToFile )
				sendAtSensor = 256*Integer.parseInt(bufferForFiles[10-1]) + Integer.parseInt(bufferForFiles[9-1]);
				recAtGwy     = 256*Integer.parseInt(bufferForFiles[16-1]) + Integer.parseInt(bufferForFiles[15-1]);	
				
			}
				
		} //if (typeOfTheCurrentFrame == SYNC_POINTS)
		//===============================================================
				//avCurrNum ++;
				
//				   LENGTH_SET_FREQ_FROM_DSP   SET_FREQ_FROM_DSP  bufferForDataFromDSP
		/**
		*
		* data are received from the DSP
		*
		*/
		if (typeOfTheCurrentFrame == SET_FREQ_FROM_DSP){
				
			if (newFreqFromDSP){  //start of frame
				newFreqFromDSP = false;
				forRetransmit = Integer.toString(SET_FREQ_FROM_DSP);
				bufferForDataFromDSP[0] = new String(forRetransmit);					
			}
			
			bufferForDataFromDSP[bytePosInPack-1] = new String(sConversionIntToStr);
				
			if (bytePosInPack == LENGTH_SET_FREQ_FROM_DSP){ //end of the frame
					searchingForNewFrame  = true;
					typeOfTheCurrentFrame = NO_VALID_FRAME;
					
					double newFreq=0.0;
					newFreq  = Double.parseDouble(bufferForDataFromDSP[2]);
					newFreq += Double.parseDouble(bufferForDataFromDSP[3])*256.0;
					newFreq += Double.parseDouble(bufferForDataFromDSP[4])*256.0*256.0;
					
					newFreq = newFreq / 16777216.0*2000.0;
					System.out.println("New freq = " + newFreq + ": " + bufferForDataFromDSP[0] + "_" +bufferForDataFromDSP[1] + "->" +bufferForDataFromDSP[2] + "_" + bufferForDataFromDSP[3] + "_" + bufferForDataFromDSP[4] + "_" + bufferForDataFromDSP[5] + "_" + bufferForDataFromDSP[6] + "_" + bufferForDataFromDSP[7] + "_" + bufferForDataFromDSP[8] + "_" + bufferForDataFromDSP[9] + "_" + bufferForDataFromDSP[10]);
					boolean wrongPack = false;
					for (int byteCheck=5; byteCheck<10; byteCheck++){
						if (!bufferForDataFromDSP[byteCheck].equals("0")){
							wrongPack = true;
							//System.out.println("Wrong package");
						}
					}
					newFreq = Math.round(newFreq * 1e4)*1e-4;
					DecimalFormat freqFormat = new DecimalFormat("00.0000");
					
					//newFreq = newFreq.replace(','  ,  '.');
					fundFrequency.setText(""+freqFormat.format(newFreq).replace(','  ,  '.'));					
					
					//if (!(bufferForDataFromDSP[2].equals("18"))  |  !(bufferForDataFromDSP[3].equals("131"))  |  !(bufferForDataFromDSP[4].equals("64"))){
						//enableToSendNewFreq = false;
						//System.out.println("enableToSendNewFreq=" + enableToSendNewFreq);
					//}
					
					//if (writeDataToFile ){
					//	for (int fileWriteBuffer=0;fileWriteBuffer<LENGTH_DATA_FRAME_FROM_SET_FREQ_FROM_DSP;fileWriteBuffer++){
					//		fosGWYSample.write( bufferForFiles[fileWriteBuffer].getBytes()  );  //a stringet byteokra bontja
					//		fosGWYSample.write( 10 );  //uj sor karakter
					//	}
					//}//if (writeDataToFile ){/**/
			}


		} //if (typeOfTheCurrentFrame == DATA_FRAME_FROM_GWY)
		//===============================================================
						
				

				
		}//for (int i = 0; i < numBytes; i++)
    		} catch (IOException e){
    			//System.out.println("Hiba a file irasakor.");
    			System.out.println(" ");
    			System.out.println(e);
    		}
    		
     } //if (SerialPortEvent.DATA_AVAILABLE == event.getEventType()){
     
     //^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^	
   	 //*********************************************************************	
 
    }  //public void serialEvent(SerialPortEvent event) {
    //^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^	
    //*********************************************************************	

synchronized void enableDraw(){
	drawingEnabled = true;
}

synchronized void disableDraw(){
	drawingEnabled = false;
}

/**
*
* @return drawingEnabled returns whether draw is enabled or not
*/
synchronized boolean getDrawEnabled(){
	return drawingEnabled;
}



/**********************************
***********************************
*
* run function is a thread started form this object.
* It is responsible for displaying resonator related data
*
***********************************/
   
        public void run() {
        	
        while(true){	
        try {
            Thread.sleep(100); //100
            
        } catch (InterruptedException e) {System.out.println(e);}
        
        //System.out.println("running");
        //System.out.println(angleOfCanv);
        //canv.setAbsAndAngle(0.35f,40f);
        //System.out.println(harmListSelectedIndex);
        //canv.setReAndIm(35f,40f);
        //if (getDrawEnabled()){
    	//}
    
//        System.out.println("+++++++++++++++++++"); 
		float scale = Math.round((float)(displayRatioSelection.getMaximum()-displayRatioSelection.getValue()) / (float)(displayRatioSelection.getMaximum()/2) * 10.0f) / 10.0f ;
		
		//System.out.println(scale);
       
       	harmListSelectedIndexOld = harmListSelectedIndex;
 		harmListSelectedIndex    = getSelectedHarmonicIndex();

        //System.out.println("index: " + harmListSelectedIndex);
        //rezDatRe[0] = -0.010f; //teszt: jól rajzol-e ki és jól számít-e szöget
        //rezDatIm[0] = -0.010f;
       	canv.setReAndIm(rezDatRe[harmListSelectedIndex],rezDatIm[harmListSelectedIndex],1/scale);
       	//canv.setReAndIm(0.1f,0.1f,4);
        canv.repaint();
//        System.out.println("-------------------");        
     	try{
        refreshRezText++;
        if (refreshRezText==5){
        	refreshRezText = 0;
        	cimkeDatRe.setText ("rezRe  = "+rezDatRe[harmListSelectedIndex]);
        	cimkeDatIm.setText ("rezIm  = "+rezDatIm[harmListSelectedIndex]);
        	double rezAmpl = Math.sqrt((rezDatRe[harmListSelectedIndex]*rezDatRe[harmListSelectedIndex])+(rezDatIm[harmListSelectedIndex]*rezDatIm[harmListSelectedIndex]));
        	rezAmpl = Math.round((rezAmpl*1e5))/1e5;
        	cimkeDatAbs.setText("|rez|  = "+rezAmpl);
        	cimkeDatAng.setText("fazis  = "+szogSzam(rezDatRe[harmListSelectedIndex],rezDatIm[harmListSelectedIndex]) + " fok");
        	//System.out.println(""+rezDatRe[harmListSelectedIndex] + ";"+rezDatIm[harmListSelectedIndex] );
        	//cimkeDatPhaseChange.setText("dFi = " + changeRezPhase_x0);
        	cimkeDatPhaseChange.setText("dFi/sec = " + Math.round(changeRezPhase_x0_avg*100)*0.001);        	
        	//cimkeDatPhaseChange.setText("packets = " + numberOfResonatorPackets);
        	selectedHarm.setText("megjelenített harmonikus: " + ((harmListSelectedIndex*((RES_MODE_ODD==rezCountMode)? 2: 1))+1));
 
    	}
    } catch(Exception e) {System.out.println(e);}

   	int multiplier    = (RES_MODE_ODD==rezCountMode)    ? 2 : 1;
    selectedResonator = harmListSelectedIndex*multiplier; //stores the order number of the selected resonator

    if (  (harmListSelectedIndex!=harmListSelectedIndexOld) || (rezCountModeOld!=rezCountMode) ){
    	panelForSetResPar.updateOutputResonatorValues(selectedResonator);
    	panelForSetResPar.updateResonatorModifierValues(selectedResonator);
    	System.out.println("harmonic updated");
    }
    	
    	if  (modeSelectionPanel.getDSPMode() != modeSelectionPanel.getDSPOldMode()){
    		System.out.println("DSP mode changed");
    		int modeOfDSP = modeSelectionPanel.getDSPMode();
    		int DSPSubMode = 100; //A dummy value if it is out of interest
    		if (DSP_MODE_ANC_MODE==modeOfDSP){
    			DSPSubMode = ACTIVE_NOISE_REDUCTION_USING_IDENTIFIED_MODIFIERS;
    		}
    		sorKuld.setDSPMode(modeOfDSP, DSPSubMode);    		
    		if (modeOfDSP==DSP_MODE_IDENTIFICATION_MODE){
    			modeSelectionPanel.setAFAState(false);
				//modifiers must be disabled in identification mode
				//--sorKuld.sendModifiers(true, false);
				//--panelForSetResPar.useTheModifiersButt.setLabel(panelForSetResPar.useTheModifiersButt_Enable);    			
				panelForSetResPar.disableModifiers();
    		}
    		
    	}
    	
    	if  (modeSelectionPanel.getAFAStateChanged()){
    		System.out.println("AFA mode changed");
    		sorKuld.setDSPMode(DSP_MODE_AFA_MODE, (modeSelectionPanel.getAFAState()==true? DSP_MODE_AFA_MODE_AFA_ON : DSP_MODE_AFA_MODE_AFA_OFF ));    		
    	}
    	
    	
    	//for (int x=300;x<349;x++){cimkeDatAng.setText("0"+(char)x);System.out.print((char)x);}
    	//System.out.println();
    	}  //while(true)  infinite loop in the run function
    	
    }  //run

/**
*  This function returns the ordinal number of the selected harmonic. 
*  It doesn't indicates the selected harmonic, but only the INDEX in the List.
*  The harmonic can be calculated when according to the resonator setting: 
*    every (1, 2, 3, 4, 5) or odd (1, 3, 5, 7, 9) harmonics are calculated 
*
*/
public int getSelectedHarmonicIndex(){
int harmListSelectedIndexLoc = 0;	

       harmListSelectedIndexLoc = harmList.getSelectedIndex();

		//if the selected harmonic is out of the desired interval it is read again x times
        int numOfTryOfReadSelectedIndex = 0;
        while (  (harmListSelectedIndexLoc>=harmNum) | (harmListSelectedIndexLoc<0)  ){
        	numOfTryOfReadSelectedIndex++;
        	System.out.println("Rossz index: " + harmListSelectedIndexLoc + "; try: " + numOfTryOfReadSelectedIndex);
        	for(long delayFor = 0; delayFor<1000000*100; delayFor++) {  }
   	        harmListSelectedIndexLoc = harmList.getSelectedIndex();
   	        if (numOfTryOfReadSelectedIndex>10){
   	        	break;
   	        }
         }
		//if the selected harmonic is out of the desired interval after the repeated readings, it is set to zero
        if (  (harmListSelectedIndexLoc>=harmNum) | (harmListSelectedIndexLoc<0)  ){
        	harmListSelectedIndexLoc = 0;
        }	
        
        return harmListSelectedIndexLoc;
}

/**
* returns the angle of a comples number
*
*/
public float szogSzam(float re,float im){
	float szog = (float)(Math.atan(Math.abs(im)/Math.abs(re))*180/Math.PI);
	if ((re>0) & (im>0)){
		szog = szog;	
	}

	if ((re>0) & (im<0)){
		szog = 360-szog;	
	}

	if ((re<0) & (im>0)){
		szog = 180-szog;	
	}

	if ((re<0) & (im<0)){
		szog = 180+szog;	
	}
	
	if ((re==0f) & im==0f) {szog = 0;}

	//System.out.println("szog: " + szog);
	return szog;
}

/**
*@brief calculates the phase difference between two complex numbers
*@param compl_a the real part of the first complex number
*@param compl_b the imag part of the first complex number
*@param compl_c the real part of the second complex number
*@param compl_d the imag part of the second complex number
*@return phaseDiff the phase difference
*/
//double calculatePhaseDifference(rezDatRe[0],rezDatIm[0]  , rezDatRe_x0_old, rezDatIm_x0_old);
float calculatePhaseDifference(float compl_a, float compl_b,   float compl_c, float compl_d){
float phaseDiff = 0;
float complTmp_re = 0;
float complTmp_im = 0;
float temp = 0;
/*	temp = 	(compl_a*compl_a + compl_b*compl_b);
	temp =  (float)java.lang.Math.sqrt((double)temp);
	compl_a = compl_a / temp; //normalization of the first complex number
	compl_b = compl_b / temp; //normalization of the first complex number

	temp = 	(compl_c*compl_c + compl_d*compl_d);
	temp =  (float)java.lang.Math.sqrt((double)temp);
	compl_c = compl_c / temp; //normalization of the second complex number
	compl_d = compl_d / temp; //normalization of the second complex number
*/	
	
	complTmp_re = (compl_a*compl_c + compl_b*compl_d) / (compl_c*compl_c + compl_d*compl_d);
	complTmp_im = (compl_b*compl_c - compl_a*compl_d) / (compl_c*compl_c + compl_d*compl_d);
	
	phaseDiff = (float)(java.lang.Math.atan2((double)complTmp_im,(double)complTmp_re) * 180.0/java.lang.Math.PI);
	return 	phaseDiff;
}

/**
*@fn public String createBackupTimestamp()
*@return Returns a time stamp that can be used for archivation
*
*/
public String createBackupTimestamp(){
	
    	Calendar rightNowTimestamp = Calendar.getInstance();
		DecimalFormat twoPlacesTimestamp = new DecimalFormat("00");
		
		String BackupTimestamp = new String(""+rightNowTimestamp.get(Calendar.YEAR) );
		
		BackupTimestamp = BackupTimestamp + "-" + twoPlacesTimestamp.format(rightNowTimestamp.get(Calendar.MONTH)+1);  
		BackupTimestamp = BackupTimestamp + "-" + twoPlacesTimestamp.format(rightNowTimestamp.get(Calendar.DAY_OF_MONTH));
		
		BackupTimestamp = BackupTimestamp  + "_" + twoPlacesTimestamp.format(rightNowTimestamp.get(Calendar.HOUR_OF_DAY));
		BackupTimestamp = BackupTimestamp  + "-" + twoPlacesTimestamp.format(rightNowTimestamp.get(Calendar.MINUTE)) ;
		BackupTimestamp = BackupTimestamp  + "-" + twoPlacesTimestamp.format(rightNowTimestamp.get(Calendar.SECOND)) ;
		
		return BackupTimestamp;
}


/**
*
* closes all files.
* The wait process is built in the function in order to prevent the function to close files in which other processes are writing
*
*/
public void closeAllFiles(){

	 	writeDataToFile = false;
	 	
		long waitBeforCloseFiles = (new Date()).getTime();
		while(((new Date()).getTime()-waitBeforCloseFiles)<100) {};

	 	
		try{fos.close();         }catch(Exception eF){System.out.println("Hiba a file lezarasakor.");}
		try{fosBackup.close();   }catch(Exception eF){System.out.println("Hiba a file lezarasakor.");}
		try{fosRez.close();      }catch(Exception eF){System.out.println("Hiba a Rez file lezarasakor.");}
		try{fosGWYSample.close();}catch(Exception eF){System.out.println("Hiba a GWYSample file lezarasakor.");}
		try{fosStampSync.close();}catch(Exception eF){System.out.println("Hiba a StampSync file lezarasakor.");}
		try{fosFrmSync.close();  }catch(Exception eF){System.out.println("Hiba a FrmSync file lezarasakor.");}
		System.out.println("Data logger files are closed.");
		System.out.println();

}


/**
*
* closes all files except of backup files.
* The wait process is built in the function in order to prevent the function to close files in which other processes are writing
*
*/
public void closeAllFilesExceptOfBackup(){

	 	writeDataToFile = false;
	 	
		long waitBeforCloseFiles = (new Date()).getTime();
		while(((new Date()).getTime()-waitBeforCloseFiles)<100) {};

	 	
		try{fos.close();         }catch(Exception eF){System.out.println("Hiba a file lezarasakor.");}
		//try{fosBackup.close();   }catch(Exception eF){System.out.println("Hiba a file lezarasakor.");}
		try{fosRez.close();      }catch(Exception eF){System.out.println("Hiba a Rez file lezarasakor.");}
		try{fosGWYSample.close();}catch(Exception eF){System.out.println("Hiba a GWYSample file lezarasakor.");}
		try{fosStampSync.close();}catch(Exception eF){System.out.println("Hiba a StampSync file lezarasakor.");}
		try{fosFrmSync.close();  }catch(Exception eF){System.out.println("Hiba a FrmSync file lezarasakor.");}
		System.out.println("Data logger files are closed.");
		System.out.println();

}

/**
*
* backups all files. 
* This method shall be called after the method createDataLoggerFiles() since it generates the path of the backup directory, i.e. backupDir
*
*/
public void backupAllFiles(){

	 	//writeDataToFile = false;
		//long waitBeforCloseFiles = (new Date()).getTime();
		//while(((new Date()).getTime()-waitBeforCloseFiles)<100) {};
		
//		backupDir = new String("motedata/Backups/BackupDIR_" + createBackupTimestamp());
//		File BackupDirectory = new File(backupDir);
//		if (BackupDirectory.exists()==false){
//			BackupDirectory.mkdirs();
//			System.out.println("A backup konyvtar letrehozva: " + backupDir);
//			ablak.setTitle("RezDataColl A legutolso backup konyvtar: " + backupDir.substring(17) );			
//		}		
		
	 	//new FileBackupClass(fos, new File(new String(backupDir+"/mic.dat")));
	 	//new FileBackupClass(fos, new File("proba.txt"));
	 	new FileBackupClass(new File("./motedata/frmSync.dat") , new File(backupDir + "/frmSync.dat") );
	 	new FileBackupClass(new File("./motedata/gwySamp.dat") , new File(backupDir + "/gwySamp.dat") );
	 	new FileBackupClass(new File("./motedata/mic.dat")     , new File(backupDir + "/mic.dat")     );
	 	new FileBackupClass(new File("./motedata/sensorData.dat")  , new File(backupDir + "/sensorData.dat")  );
	 	new FileBackupClass(new File("./motedata/stmpSync.dat"), new File(backupDir + "/stmpSync.dat"));
	 	System.out.println();
	 	
}

/**
*
* create the data logger files
*
*/
public void createDataLoggerFiles(){
	
		backupDir = new String("motedata/Backups/BackupDIR_" + createBackupTimestamp());
		File BackupDirectoryCr = new File(backupDir);
		if (BackupDirectoryCr.exists()==false){
			BackupDirectoryCr.mkdirs();
			System.out.println("A backup konyvtar letrehozva: " + backupDir);
			ablak.setTitle( ablakTitle + "(@"+sComPortName+")"+" ---  A legutolso backup konyvtar: " + backupDir.substring(17) );			
		}		
			
		File BackupDirectory = new File("motedata/Backups");
		if (BackupDirectory.exists()==false){
			BackupDirectory.mkdirs();
			System.out.println("A backup konyvtar letrehozva");
		}

	
		String BackupFileName = new String("motedata/Backups/" + "mic_"+createBackupTimestamp()+".dat");
		//System.out.println(  "Backup file neve 2ndVer: " + BackupFileName );
		

		try{
			FileOutputStream fos_file 		 = new FileOutputStream("motedata/mic.dat");
			FileOutputStream fosBackup_file	 = new FileOutputStream(BackupFileName);
			
			FileOutputStream fosRez_file	 = new FileOutputStream("motedata/sensorData.dat");
			FileOutputStream fosGWYSample_file = new FileOutputStream("motedata/gwySamp.dat");
			FileOutputStream fosStampSync_file = new FileOutputStream("motedata/stmpSync.dat");
			FileOutputStream fosFrmSync_file   = new FileOutputStream("motedata/frmSync.dat");

			fos 		 = new MDFileHandler(fos_file, 4*4096);
			fosBackup 	 = new MDFileHandler(fosBackup_file, 4*4096);
			
			fosRez		 = new MDFileHandler(fosRez_file, 4*4096);
			fosGWYSample = new MDFileHandler(fosGWYSample_file, 4*4096);
			fosStampSync = new MDFileHandler(fosStampSync_file, 4*4096);
			fosFrmSync   = new MDFileHandler(fosFrmSync_file, 4*4096);
			
			// original version when bytes are written separately and not with a buffered writer class
			/*
			fos 		 = new FileOutputStream("motedata/mic.dat");
			fosBackup 	 = new FileOutputStream(BackupFileName);
			
			fosRez 		 = new FileOutputStream("motedata/sensorData.dat");
			fosGWYSample = new FileOutputStream("motedata/gwySamp.dat");
			fosStampSync = new FileOutputStream("motedata/stmpSync.dat");
			fosFrmSync   = new FileOutputStream("motedata/frmSync.dat");
			*/

			
			System.out.println("Data logger files are created");
			System.out.println();
		} catch (FileNotFoundException fileNotF){
			System.out.println(fileNotF);
			System.out.println("Data logger files haven't been created");
		}
}


/**
*@fn waitForMsec(int msec)
*@param msec number of millisecs the function delays the running of the program
*/
public void waitForMsec(int msec){
		long waitVariable = (new Date()).getTime();
		while(((new Date()).getTime()-waitVariable)<msec) {};

}

/**
******************************************
******************************************
**
**              MAIN
**
******************************************
******************************************
*/

	public static void main(String args[]) {
		//System.out.println("Starting Ser...");
		System.out.println("Program elindult");
		System.out.println(" ");

		String selectedModeOfOperation_loc = null;

		String sComPort = new String("COM1");
		int iBaudRateCom = 115200;

		//get the list of ports
		portList = CommPortIdentifier.getPortIdentifiers();
		if (portList == null) {
		    System.out.println("No comm ports found!");
		    new NoCommPortDialog(new JFrame(), "Hiba!","    Nincs elérhetõ kommunikációs port   ");
		}
		
		//initialize the vector that contains the list of serial com ports
		serialPortList = new Vector(0,1);  //Vector(int initialCapacity, int capacityIncrement) 

		System.out.println("Elerheto portok: ");
        while (portList.hasMoreElements()) {
            portId = (CommPortIdentifier) portList.nextElement();
            System.out.print(portId.getName());
            
            if (portId.getPortType() == CommPortIdentifier.PORT_SERIAL) {
				System.out.println(": Soros port.");
				serialPortList.add((Object)portId);
            } else {System.out.println("");}
        }
      	System.out.println("------------------------------- ");
      	numOfSerialPorts = serialPortList.size();
      	System.out.println(numOfSerialPorts + " soros port elerheto:" );
      	for (int enumSerialPorts=0;enumSerialPorts<numOfSerialPorts;enumSerialPorts++){
      		portId = (CommPortIdentifier) serialPortList.get(enumSerialPorts);
      		System.out.println(portId.getName());
      	}
      	System.out.println("------------------------------- ");
      	
		portList = CommPortIdentifier.getPortIdentifiers();
		if (numOfSerialPorts == 0) {
	    	System.out.println("No communication port found");
	    	new NoCommPortDialog(new JFrame(), "Hiba!","    Nincs elérhetõ soros port   ");
		}
		
      	portId = (CommPortIdentifier) serialPortList.get(0);
		

      	System.out.println("------------------------------- ");
      	if (args.length>0){
      		
      		if ((args[0].compareTo("-h")==0) || (args[0].compareTo("--help")==0)|| (args[0].compareTo("-help")==0) || (args[0].compareTo("help")==0)){
      			System.out.println(" ");
      			System.out.println(" ");
      			System.out.println("Data collecting program");
      			System.out.println(" ");
      			System.out.println("Usage RezdataColl [options]");
      			System.out.println(" ");
      			System.out.println("Parameters:");
      			System.out.println("   --help                     : display help");      			
      			System.out.println("   --com  com port identifier : set serial port");
      			System.out.println("   --baud baud rate           : set baud rate");      			
      			System.out.println("   --mode mode_of_operation   : set the mode of operation [data | rezdata | DSP]");      			
      			System.out.println(" ");
      			System.out.println("Example: RezdataColl --com COM1 --baud 115200 --mode ");
      		}
      		//checks the parameters
      		for (int iArgCheck=0;iArgCheck<args.length;iArgCheck++){
      			//checks whether there is a com port given in the parameter list
      			if (args[iArgCheck].compareTo("--com")==0){
      				try{
      					sComPort = args[iArgCheck+1].toUpperCase();
      					System.out.println(sComPort);
      				} catch (Exception e){}
      			}
      			//checks whether the baud rate is given in the parameter list
      			if (args[iArgCheck].compareTo("--baud")==0){
      				try{
      					iBaudRateCom = Integer.parseInt(args[iArgCheck+1]);
      				} catch (Exception e){}
      			}
      			
      			
    			if (args[iArgCheck].compareTo("--mode")==0){
    				String modeArg = args[iArgCheck+1];
    				if (modeArg.compareTo(RezDataColl.mode_simpleDataCollecting)==0){
    					selectedModeOfOperation_loc = RezDataColl.mode_simpleDataCollecting;
    				} else if (modeArg.compareTo(RezDataColl.mode_resonatorDataCollecting)==0){
    					selectedModeOfOperation_loc = RezDataColl.mode_resonatorDataCollecting;
    				} else if (modeArg.compareTo(RezDataColl.mode_resonatorDataCollecting)==0){
    					selectedModeOfOperation_loc = RezDataColl.mode_DSPcontrol;
    				} 
    				System.out.println("mode: " + selectedModeOfOperation_loc);
    			}
				
      		}
      	} //if (args.length>0)
      	
    if (selectedModeOfOperation_loc==null) {
		System.out.println("Nincs mode kivalasztva. Inditas DSP modban.");
		System.out.println("Tovabbi informacioert inditsa: --help parameterrel.");
		selectedModeOfOperation_loc = mode_DSPcontrol;
	}  	

		//initializes the serial port
		initializeSerialPort(sComPort, false, iBaudRateCom, false);
// If the program doesn't work with initializeSerialPort(sComPort, false, iBaudRateCom, false);.
// uncomment the following block
/*	
    try {    
    portId = CommPortIdentifier.getPortIdentifier("COM1");
	port = (SerialPort)portId.open("RezDataColl", CommPortIdentifier.PORT_SERIAL);
	System.out.println("COM1 port megnyitva");

	port.setFlowControlMode(SerialPort.FLOWCONTROL_NONE);
	// These are the mote UART parameters
	port.setSerialPortParams(115200,
				 SerialPort.DATABITS_8,
				 SerialPort.STOPBITS_1,
				 SerialPort.PARITY_NONE); //PARITY_NONE
    //port.notifyOnDataAvailable(true);   /this must be asserted later, when the serial port handler objet is also initialized, otherwise error occurs
} catch(Exception e){System.out.println(e);}
*/
		RezDataColl mainProgObj = new RezDataColl(selectedModeOfOperation_loc);

    
    }  //public static void main(String args[]) 

		
/**********************************************
***********************************************
*
*
* This method initializes the serial port
* 
*  port   is automatically set
*  portID is automatically set
*  port is initialized
*
***********************************************
***********************************************
*/	
	
	static public void initializeSerialPort(String sComPort, boolean bDefaultComSett, int iBaudRateCom, boolean bDefaultBaudSett){
		
		boolean bOpenPortWithSuccess = true;
		
		//use the default port setting
		if (bDefaultComSett){ 
			portId = (CommPortIdentifier) serialPortList.get(0);
			sComPort = new String(portId.getName());
		}
		
		//use the default baud rate setting
		if (bDefaultBaudSett){
			iBaudRateCom = 115200;
		}

		try{
			portId = CommPortIdentifier.getPortIdentifier(sComPort);
		} catch (Exception excGetID){
			bOpenPortWithSuccess = false;
			System.out.println("Nincsen " + sComPort + " azonositoju soros port. Soros port megnyitasa default ertekkel.");
			if (bDefaultComSett){
				new NoCommPortDialog(new Frame(), "Hiba!","    Hiba a soros port megnyitásakor   ");
			} else {
				initializeSerialPort(" ", true, iBaudRateCom, bDefaultBaudSett);
				return;
			}
		}
		
		try{
			//get the handler to serial port. The name of application and port type is passed in the argument list
			port = (SerialPort)portId.open("RezdataColl", CommPortIdentifier.PORT_SERIAL); 		
		} catch(PortInUseException portInUse){
			bOpenPortWithSuccess = false;
			new NoCommPortDialog(new Frame(), "Hiba!"," A " + sComPort + " soros portot '" + portInUse.currentOwner + "' használja.");
		}

		try{
			port.setFlowControlMode(SerialPort.FLOWCONTROL_NONE);
		} catch (UnsupportedCommOperationException unsuppComm){
			bOpenPortWithSuccess = false;
			new NoCommPortDialog(new Frame(), "Hiba!","    Hiba a soros port konfigurálásakor.   ");
		}
			//port.disableReceiveFraming();
			//printPortStatus();
			// These are the mote UART parameters
		try{
			port.setSerialPortParams(iBaudRateCom,
				 SerialPort.DATABITS_8,
				 SerialPort.STOPBITS_1,
				 SerialPort.PARITY_NONE); //PARITY_NONE
		} catch(UnsupportedCommOperationException unsuppComm){
			bOpenPortWithSuccess = false;
			if (bDefaultBaudSett){
				new NoCommPortDialog(new Frame(), "Hiba!","    Hiba a soros port konfigurálásakor.   ");
			}
			System.out.println("Nem megfelelo sebesseg. Inicializalas default beallitassal.");
			port.close();
			initializeSerialPort(sComPort, bDefaultComSett, iBaudRateCom, true);
			return;
		}
		
		if (bOpenPortWithSuccess){
			System.out.println(sComPort + " port megnyitva " + iBaudRateCom + "kbps sebesseggel. 8N1.");
			sComPortName = sComPort;
			iComBaudRate = iBaudRateCom;
		}
		

	} //initializeSerialPort
		
		

		
} //End of class



/*		
	    String CurLine = ""; // Line read from standard in
	    InputStreamReader converter = new InputStreamReader(System.in);
		BufferedReader in = new BufferedReader(converter);
 
		do{
			try{
				CurLine = in.readLine();
	  		} catch(Exception e){System.out.println(e);}
			InterpretComplexNumber coplNum = new InterpretComplexNumber(CurLine);
			System.out.println("The complex number is: " + coplNum.getReal() + "+" + coplNum.getImag() + "i");
			System.out.println("---------------------------------------------------");
		} while (!(CurLine.equals("quit")));
*/		
/*
  //-------
  	Enumeration ports = CommPortIdentifier.getPortIdentifiers();
	
	if (ports == null) {
	    System.out.println("No comm ports found!");
	    return;
	}
	
	// print out all ports
	//--System.out.println("Elerheto portok: ");
	//--while (ports.hasMoreElements()) {
	//--    System.out.println("  " + ((CommPortIdentifier)ports.nextElement()).getName());
	//--}
  
  //--------
*/ 













