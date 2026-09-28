import java.awt.Graphics;
import java.*;
import java.awt.Graphics2D;
import java.awt.geom.Line2D;

import java.awt.Color;
import java.awt.Container;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.awt.event.MouseMotionAdapter;

import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.*;
import javax.*;

import java.io.*;
import java.awt.*;
import java.net.*;
import java.awt.event.*;
import java.util.Date;
import java.lang.Math.*;
import java.lang.*;
import java.awt.Image;
import java.util.*;
import javax.comm.*;
import java.util.Date;
import java.lang.Math;
import java.text.DecimalFormat;


class ResonatorParamsCompl extends Panel implements ActionListener{
private int iActualVertPos = 0; //the actual vertical position
private int iNextVertPos   = 0;   //the next vertical position
private int iGapAfterPrev  = 0;  //the gap after the previous component
private int iCompHight     = 0;     //the hight of the component

private int iActualHorPos    = 0; //the actual horisontal position
private int iNextHorPos      = 0;   //the next horisontal position
private int iHorGapAfterPrev = 0;  //the gap after the previous component
private int iCompWidth       = 0;     //the width of the component



//public Label     o_rez_x_re_value_la;  //output resonator re
//public Label     o_rez_x_im_value_la;  //output resonator im

//public Label     o_rez_x_value_la;  //output resonator value

/**
Resonator display
*/
public int       outputResonatorPanelHight = 20;
public int       outputResonatorPanelWidth = 600;
public Panel     outputResonatorPanel;
public Button    resetOutputResonators;     //resets all resonators
public Button    resetOutputResonatorButt;  //resets the actual resonator
public Label     outputResonatorVal;

public Panel     outputResonatorSetPanel;
//public Label     o_rez_x_re_before;  //output resonator re
//public TextField o_rez_x_re_value_tf;  //output resonator re
//public Label     o_rez_x_im_before;  //output resonator re
//public TextField o_rez_x_im_value_tf;  //output resonator im
public Label     o_rez_x_before;       //output resonator
public TextField o_rez_x_value_tf;  //output resonator 

public Button    sendParamsButt;
public Button    outputEnableOnButt;  //enable signal output
		public String outputEnableOnButt_Enable =  new String("Enable out");
		public String outputEnableOnButt_Disable = new String("Disable out");
public JLabel    outputEnableIndicator;  //indicates wether enable signal is enabled
		public String outputEnableIndicator_Enabled  = new String(" Output enabled");
		public String outputEnableIndicator_Disabled = new String(" Output disabled");
		public Color outputEnableIndicatorColor_Enabled  = new Color(0,255,0);
		public Color outputEnableIndicatorColor_Disabled = new Color(255,0,0);
		public boolean useOutputIndicator = true;

public boolean   useTheModifiersFlag = false;
//obtain resonator values
public Button    getResonatorValuesAndWriteToOut;
public TextField rez_x_getValue_tf;  //resonator value obtained by getResonatorValuesAndWriteToOut
public Panel     getResonatorValuesPanel;

private Color colorOfResonatorPanel = new Color(120,220,220);


/**
Modifier
*/

public int       resDisplayCorrectHight = 20;
public Panel     resDisplayCorrectPanel;
public Button    resetModifiers;
public Label     modifierVal;

public Panel     resDisplayCorrectSetPanel;
//public Label     modif_re_before;  //resonator modifier
//public TextField modif_re_value_tf;  //resonator modifier
//public Label     modif_im_before;  //resonator modifier
//public TextField modif_im_value_tf;  //resonator modifier
public Label     modif_before;  //resonator modifier
public TextField modif_value_tf;  //resonator modifier
public Button    activateModifierButt;
public Button    resetModifierButt;
public Button    useTheModifiersButt;
		public String useTheModifiersButt_Enable = new String("Use Modifier");
		public String useTheModifiersButt_Disable = new String("Don't use Modifier");
public JLabel    useTheModifiersIndicator;  //indicates wether modifier is enabled
		public String useTheModifiersIndicator_Enabled  = new String(" ON ");
		public String useTheModifiersIndicator_Disabled = new String(" OFF ");
		public Color useTheModifiersIndicatorColor_Enabled  = new Color(0,255,0);
		public Color useTheModifiersIndicatorColor_Disabled = new Color(255,0,0);
		public boolean useUseTheModifiersIndicator = true;
		
private Color colorOfModifierPanel = new Color(030,230,230);

//--------------------------------
public RezDataColl mainProg; //this is a reference to the main prog

SimpleSerialSend commandGenerator;

//Constructor
public ResonatorParamsCompl(RezDataColl mainProg){
		this.mainProg = mainProg;
		
		this.setLayout(null);
		//this.setLayout(new FlowLayout());
		//this.setLayout(new GridLayout(2,4));
		this.setSize(700,100);

//display the output resonators
//---------------------------------------------------------------			
		iGapAfterPrev  = 10;
		iCompHight     = outputResonatorPanelHight;
		iNextVertPos   += iGapAfterPrev + iCompHight;
		iActualVertPos = iNextVertPos - iCompHight;

		outputResonatorPanel = new Panel();//"Kimeneti rezonátor:"
		outputResonatorPanel.setLayout(null);		

		outputResonatorVal   = new Label("Kimeneti együttható: z_out["+(mainProg.selectedResonator+1)+"] = 0 + 0j");
		outputResonatorVal.setSize(300,iCompHight);
		outputResonatorVal.setLocation(0,0);
		outputResonatorPanel.add(outputResonatorVal);

		int gapBeforeResetRess = 10;

		resetOutputResonatorButt = new Button("Reset");		
		resetOutputResonatorButt.setSize(80,iCompHight);
		resetOutputResonatorButt.setLocation(outputResonatorVal.getWidth()+gapBeforeResetRess,0);
		outputResonatorPanel.add(resetOutputResonatorButt);
		resetOutputResonatorButt.addActionListener(this);

		resetOutputResonators = new Button("Reset All");		
		resetOutputResonators.setSize(80,iCompHight);
		resetOutputResonators.setLocation(resetOutputResonatorButt.getWidth() + outputResonatorVal.getWidth()+gapBeforeResetRess*2,0);
		outputResonatorPanel.add(resetOutputResonators);
		resetOutputResonators.addActionListener(this);

		this.add(outputResonatorPanel);
		outputResonatorPanel.setSize(resetOutputResonatorButt.getWidth() + resetOutputResonators.getWidth() + outputResonatorVal.getWidth()+gapBeforeResetRess*2,iCompHight);
		outputResonatorPanel.setSize(outputResonatorPanelWidth,iCompHight);
		
		outputResonatorPanel.setLocation(10,iActualVertPos);
		//outputResonatorPanel.setBackground(colorOfResonatorPanel);
		//outputResonatorPanel.setBackground(new Color(220,220,20));
		//setBackground(new Color(220,220,20));
//SET the output resonators		
//----------------------------------------------------
		iGapAfterPrev  = 5;
		iCompHight     = 20;
		iNextVertPos   += iGapAfterPrev + iCompHight;
		iActualVertPos = iNextVertPos - iCompHight;
		
		outputResonatorSetPanel = new Panel();//"Kimeneti rezonátor:"
		outputResonatorSetPanel.setLayout(null);		
		
		/*
		o_rez_x_re_before    = new Label("Real: ");
		o_rez_x_re_before.setSize(50,iCompHight);
		o_rez_x_re_before.setLocation(0,0);
		outputResonatorSetPanel.add(o_rez_x_re_before);
		o_rez_x_re_value_tf  = new TextField("0");
		o_rez_x_re_value_tf.setSize(100,iCompHight);
		o_rez_x_re_value_tf.setLocation(55,0);
		outputResonatorSetPanel.add(o_rez_x_re_value_tf);
		
		//act hor pos = 155
		o_rez_x_im_before    = new Label("Imag: ");
		o_rez_x_im_before.setSize(40,iCompHight);
		o_rez_x_im_before.setLocation(165,0);
		outputResonatorSetPanel.add(o_rez_x_im_before);
		o_rez_x_im_value_tf  = new TextField("0");
		o_rez_x_im_value_tf.setSize(100,iCompHight);
		o_rez_x_im_value_tf.setLocation(210,0);
		outputResonatorSetPanel.add(o_rez_x_im_value_tf);
		*/
		o_rez_x_before  = new Label("z_out= ");
		o_rez_x_before.setSize(50,iCompHight);
		o_rez_x_before.setLocation(0,0);
		outputResonatorSetPanel.add(o_rez_x_before);

		o_rez_x_value_tf  = new TextField("0");
		o_rez_x_value_tf.setSize(100+150,iCompHight);
		o_rez_x_value_tf.setLocation(55,0);
		outputResonatorSetPanel.add(o_rez_x_value_tf);					
		o_rez_x_value_tf.addActionListener(this);

		sendParamsButt = new Button("Set");
		sendParamsButt.setSize(80,iCompHight);
		sendParamsButt.setLocation(310,0);
		outputResonatorSetPanel.add(sendParamsButt);
		sendParamsButt.addActionListener(this);
		
		outputEnableOnButt = new Button(outputEnableOnButt_Enable);
		outputEnableOnButt.setSize(80,iCompHight);
		outputEnableOnButt.setLocation(400,0);
		outputResonatorSetPanel.add(outputEnableOnButt);
		outputEnableOnButt.addActionListener(this);
		
		outputEnableIndicator = new JLabel();
		outputEnableIndicator.setSize(120,iCompHight);
		outputEnableIndicator.setLocation(500,0);
		outputResonatorSetPanel.add(outputEnableIndicator);
		outputEnableIndicator.setOpaque(true); //the background can be changed only if it isn't opaque

				
		disableOutput(false);
				
		outputResonatorSetPanel.setSize(outputResonatorPanelWidth,iCompHight);
		outputResonatorSetPanel.setLocation(10,iActualVertPos);
		this.add(outputResonatorSetPanel);
		//outputResonatorSetPanel.setBackground(colorOfResonatorPanel);

//GET the output resonators		
//----------------------------------------------------
		iGapAfterPrev  = 5;
		iCompHight     = 20;
		iNextVertPos   += iGapAfterPrev + iCompHight;
		iActualVertPos = iNextVertPos - iCompHight;
		
		getResonatorValuesPanel = new Panel();//"Kimeneti rezonátor:"
		getResonatorValuesPanel.setLayout(null);		

		Label get_rez_x_before  = new Label("x_in= ");
		get_rez_x_before.setSize(50,iCompHight);
		get_rez_x_before.setLocation(0,0);
		getResonatorValuesPanel.add(get_rez_x_before);

		rez_x_getValue_tf  = new TextField("0");
		rez_x_getValue_tf.setSize(100+150,iCompHight);
		rez_x_getValue_tf.setLocation(55,0);
		getResonatorValuesPanel.add(rez_x_getValue_tf);					
		//o_rez_x_value_tf.addActionListener(this);

		getResonatorValuesAndWriteToOut = new Button("Get res");
		getResonatorValuesAndWriteToOut.setSize(80,iCompHight);
		getResonatorValuesAndWriteToOut.setLocation(310,0);
		getResonatorValuesAndWriteToOut.addActionListener(this);
		getResonatorValuesPanel.add(getResonatorValuesAndWriteToOut);
		
		getResonatorValuesPanel.setSize(outputResonatorPanelWidth,iCompHight);
		getResonatorValuesPanel.setLocation(10,iActualVertPos);
		this.add(getResonatorValuesPanel);
	
//public Button    getResonatorValuesAndWriteToOut;
//public TextField rez_x_getValue_tf;  //resonator value obtained by getResonatorValuesAndWriteToOut
//public Panel     getResonatorValuesPanel;


//display the modifier
//---------------------------------------------------------------			
		iGapAfterPrev  = 20;
		iCompHight     = resDisplayCorrectHight;
		iNextVertPos   += iGapAfterPrev + iCompHight;
		iActualVertPos = iNextVertPos - iCompHight;

		resDisplayCorrectPanel = new Panel();//módosító érték
		resDisplayCorrectPanel.setLayout(null);		

		modifierVal   = new Label("Módosító együttható: w["+(mainProg.selectedResonator+1)+"] = 1 + 0j");
		modifierVal.setSize(300,iCompHight);
		modifierVal.setLocation(0,0);
		resDisplayCorrectPanel.add(modifierVal);

		resetModifierButt = new Button("Reset");
		resetModifierButt.setSize(80,iCompHight);
		resetModifierButt.setLocation(310,0);
		resDisplayCorrectPanel.add(resetModifierButt);
		resetModifierButt.addActionListener(this);

		resetModifiers = new Button("Reset All");		
		resetModifiers.setSize(80,iCompHight);
		resetModifiers.setLocation(400,0);
		resDisplayCorrectPanel.add(resetModifiers);
		resetModifiers.addActionListener(this);
		

		this.add(resDisplayCorrectPanel);
		resDisplayCorrectPanel.setSize(outputResonatorPanelWidth,iCompHight);
		resDisplayCorrectPanel.setLocation(10,iActualVertPos);
		
//set the modifier
//----------------------------------------------------
		iGapAfterPrev  = 5;
		iCompHight     = 20;
		iNextVertPos   += iGapAfterPrev + iCompHight;
		iActualVertPos = iNextVertPos - iCompHight;

		resDisplayCorrectSetPanel = new Panel();//"Kimeneti rezonátor:"
		resDisplayCorrectSetPanel.setLayout(null);		
		
		/*
		modif_re_before    = new Label("Real: ");
		modif_re_before.setSize(50,iCompHight);
		modif_re_before.setLocation(0,0);
		resDisplayCorrectSetPanel.add(modif_re_before);
		modif_re_value_tf  = new TextField("1");
		modif_re_value_tf.setSize(100,iCompHight);
		modif_re_value_tf.setLocation(55,0);
		resDisplayCorrectSetPanel.add(modif_re_value_tf);
		
		//act hor pos = 155
		modif_im_before    = new Label("Imag: ");
		modif_im_before.setSize(40,iCompHight);
		modif_im_before.setLocation(165,0);
		resDisplayCorrectSetPanel.add(modif_im_before);
		modif_im_value_tf  = new TextField("0");
		modif_im_value_tf.setSize(100,iCompHight);
		modif_im_value_tf.setLocation(210,0);
		resDisplayCorrectSetPanel.add(modif_im_value_tf);
		*/
		modif_before    = new Label("w= ");
		modif_before.setSize(50,iCompHight);
		modif_before.setLocation(0,0);
		resDisplayCorrectSetPanel.add(modif_before);
		modif_value_tf  = new TextField("1");
		modif_value_tf.setSize(100+150,iCompHight);
		modif_value_tf.setLocation(55,0);
		resDisplayCorrectSetPanel.add(modif_value_tf);
		modif_value_tf.addActionListener(this);

		activateModifierButt = new Button("Activate");
		activateModifierButt.setSize(80,iCompHight);
		activateModifierButt.setLocation(310,0);
		resDisplayCorrectSetPanel.add(activateModifierButt);
		activateModifierButt.addActionListener(this);
		
		useTheModifiersButt = new Button(useTheModifiersButt_Enable);
		useTheModifiersButt.setSize(120,iCompHight);
		useTheModifiersButt.setLocation(400,0);
		resDisplayCorrectSetPanel.add(useTheModifiersButt);
		useTheModifiersButt.addActionListener(this);
		
		useTheModifiersIndicator = new JLabel();
		useTheModifiersIndicator.setSize(80,iCompHight);
		useTheModifiersIndicator.setLocation(540,0);
		resDisplayCorrectSetPanel.add(useTheModifiersIndicator);
		useTheModifiersIndicator.setOpaque(true); //the background can be changed only if it isn't opaque
		
		disableModifiers(false);
		
						
		resDisplayCorrectSetPanel.setSize(outputResonatorPanelWidth,iCompHight);
		resDisplayCorrectSetPanel.setLocation(10,iActualVertPos);
		this.add(resDisplayCorrectSetPanel);

//========================================================
		
		//set the size
		this.setSize(this.getWidth(),iNextVertPos+10);
		
		this.validate();
		this.setVisible(true);

			
		} //end of constructor public ResonatorParamsCompl

public void setCommandGenerator(SimpleSerialSend commandGenerator){
	this.commandGenerator = commandGenerator;
	}		

/**
*
* Action Listener interface
*
*/		
public void actionPerformed(ActionEvent e){
		System.out.println(e.getSource());
		//if (e.getSource().equals(serH.buttSTART)) {STARTmote();}
		
		/**
		*    OUTPUT RESONATOR related buttons
		*/  
		if (  (e.getSource().equals(sendParamsButt)) || (e.getSource().equals(o_rez_x_value_tf)) ){
			//float numVal;
			//String numValS;
			//numValS = makeNumberString(o_rez_x_re_value_tf.getText());
			//mainProg.outRez_x_re[mainProg.selectedResonator] = Float.parseFloat( numValS );
			//numValS = makeNumberString(o_rez_x_im_value_tf.getText());
			//mainProg.outRez_x_im[mainProg.selectedResonator] = Float.parseFloat( numValS );
			ComplexNumber oRezVal = new InterpretComplexNumber(o_rez_x_value_tf.getText());
			mainProg.outRez_x_re[mainProg.selectedResonator] = (float)oRezVal.getReal();
			mainProg.outRez_x_im[mainProg.selectedResonator] = (float)oRezVal.getImag();
			outputResonatorVal.setText("Kimeneti együttható: z_out["+(mainProg.selectedResonator+1)+"] = " + mainProg.outRez_x_re[mainProg.selectedResonator] + "+" + mainProg.outRez_x_im[mainProg.selectedResonator] + "j");			
			o_rez_x_value_tf.setText(""+ mainProg.outRez_x_re[mainProg.selectedResonator] + "+" + mainProg.outRez_x_im[mainProg.selectedResonator] + "j");
			commandGenerator.setAllOutputResonators();
		}
		
		if (e.getSource().equals(resetOutputResonators)) {
			for (int harm=0;harm<2*mainProg.harmNum;harm++){
				mainProg.outRez_x_re[harm] = 0.0f;
				mainProg.outRez_x_im[harm] = 0.0f;
			}
			outputResonatorVal.setText("Kimeneti együttható: z_out["+(mainProg.selectedResonator+1)+"] = " + mainProg.outRez_x_re[mainProg.selectedResonator] + "+" + mainProg.outRez_x_im[mainProg.selectedResonator] + "j");
			//o_rez_x_re_value_tf.setText("0");
			//o_rez_x_im_value_tf.setText("0");
			o_rez_x_value_tf.setText("0");
			commandGenerator.resetAllOutputResonators();
		}
		
		if (e.getSource().equals(resetOutputResonatorButt)) {
			mainProg.outRez_x_re[mainProg.selectedResonator] = 0f;
			mainProg.outRez_x_im[mainProg.selectedResonator] = 0f;
			outputResonatorVal.setText("Kimeneti együttható: z_out["+(mainProg.selectedResonator+1)+"] = " + mainProg.outRez_x_re[mainProg.selectedResonator] + "+" + mainProg.outRez_x_im[mainProg.selectedResonator] + "j");
			//o_rez_x_re_value_tf.setText("0");
			//o_rez_x_im_value_tf.setText("0");
			o_rez_x_value_tf.setText("0");
			commandGenerator.setOutputResonator(mainProg.selectedResonator);
		}
		
		if (e.getSource().equals(outputEnableOnButt)) {
			if (outputEnableOnButt.getLabel().equals(outputEnableOnButt_Enable)){
				enableOutput();
			} else {
				disableOutput();
			}
		}
		
		if (e.getSource().equals(getResonatorValuesAndWriteToOut)) {
			//mainProg.outRez_x_re[mainProg.selectedResonator] = mainProg.rezDatRe[mainProg.selectedResonator];
			//mainProg.outRez_x_im[mainProg.selectedResonator] = mainProg.rezDatIm[mainProg.selectedResonator];
			//--o_rez_x_re_value_tf.setText(""+mainProg.rezDatRe[mainProg.harmListSelectedIndex]);
			//--o_rez_x_im_value_tf.setText(""+mainProg.rezDatIm[mainProg.harmListSelectedIndex]);
			//--o_rez_x_value_tf.setText(""+ mainProg.rezDatRe[mainProg.selectedResonator] + "+" + mainProg.rezDatRe[mainProg.selectedResonator] + "j");
			rez_x_getValue_tf.setText("("+ mainProg.rezDatRe[mainProg.harmListSelectedIndex] + "+" + mainProg.rezDatIm[mainProg.harmListSelectedIndex] + "j)");
		}
		
		
		/**
		*    MODIFIER related buttons
		*/  
		
		if ((e.getSource().equals(activateModifierButt)) || (e.getSource().equals(modif_value_tf) )  ){
			//String numValS;
			//numValS = makeNumberString(modif_re_value_tf.getText());
			//mainProg.rezDatModifRe[mainProg.selectedResonator] = Float.parseFloat(numValS );
			//numValS = makeNumberString(modif_im_value_tf.getText());
			//mainProg.rezDatModifIm[mainProg.selectedResonator] = Float.parseFloat( numValS);
			ComplexNumber modVal = new InterpretComplexNumber(modif_value_tf.getText());
			
			mainProg.rezDatModifRe[mainProg.selectedResonator] = (float)modVal.getReal();
			mainProg.rezDatModifIm[mainProg.selectedResonator] = (float)modVal.getImag();

			modifierVal.setText("Módosító együttható: w["+(mainProg.selectedResonator+1)+"] = " + mainProg.rezDatModifRe[mainProg.selectedResonator] + "+" + mainProg.rezDatModifIm[mainProg.selectedResonator] + "j");
			modif_value_tf.setText(""+ mainProg.rezDatModifRe[mainProg.selectedResonator] + "+" + mainProg.rezDatModifIm[mainProg.selectedResonator] + "j");
			commandGenerator.sendModifiers(false, false);
		}
		
		if (e.getSource().equals(resetModifiers)) {
			for (int harm=0;harm<2*mainProg.harmNum;harm++){
				mainProg.rezDatModifRe[harm] = 1.0f; 
				mainProg.rezDatModifIm[harm] = 0.0f; 
				//outRez_x_re[harm]   = 0.0f;
				//outRez_x_im[harm]   = 0.0f;
			}
			updateResonatorModifierValues(mainProg.selectedResonator);
			commandGenerator.sendModifiers(false, false);
		}

		if (e.getSource().equals(resetModifierButt)) {
			mainProg.rezDatModifRe[mainProg.selectedResonator] = 1.0f; 
			mainProg.rezDatModifIm[mainProg.selectedResonator] = 0.0f; 
			updateResonatorModifierValues(mainProg.selectedResonator);
			commandGenerator.sendModifiers(false, false);
		}

		if (e.getSource().equals(useTheModifiersButt)) {
			if (useTheModifiersButt.getLabel().equals(useTheModifiersButt_Enable)){
				enableModifiers();
			} else {
				disableModifiers();
			}
		}
		
		/**
		*
		* Initialization of the system
		*/
		if (e.getSource().equals(mainProg.initializeDSPAndGUI)) {
			mainProg.initializeDSPAndGUI.setLabel("Initializing System");
			System.out.println();
			System.out.println("System initialization in progress");
			System.out.println("   Initialization of frequency");
				commandGenerator.sendFrequencyValue();
			System.out.println("   Initialization of output resonators");
				disableOutput();
				commandGenerator.setAllOutputResonators();
			System.out.println("   Initialization of modifiers");
				disableModifiers();
				//useTheModifiersFlag = false;
				//useTheModifiersButt.setLabel(useTheModifiersButt_Enable); //Enable is displayed since it is disabled				
				//commandGenerator.sendModifiers(true, useTheModifiersFlag);
			System.out.println("   Initialization of DSP mode");
			    int modeOfDSP = mainProg.modeSelectionPanel.getDSPMode();
    			int DSPSubMode = 100; //A dummy value if it is out of interest
    			if (mainProg.DSP_MODE_ANC_MODE==modeOfDSP){
    				DSPSubMode = mainProg.ACTIVE_NOISE_REDUCTION_USING_IDENTIFIED_MODIFIERS;
    			}
    			commandGenerator.setDSPMode(modeOfDSP, DSPSubMode);    		
    			if (modeOfDSP==mainProg.DSP_MODE_IDENTIFICATION_MODE){
    				mainProg.modeSelectionPanel.setAFAState(false);    				
    			}
	    		commandGenerator.setDSPMode(mainProg.DSP_MODE_AFA_MODE, (mainProg.modeSelectionPanel.getAFAState()==true? mainProg.DSP_MODE_AFA_MODE_AFA_ON : mainProg.DSP_MODE_AFA_MODE_AFA_OFF ));    		
	    		
			System.out.println("   Initialization of mu value");
	    		mainProg.modeSelectionPanel.setMuValue();
	
			System.out.println("System initialization is ready");						
			System.out.println();
			mainProg.initializeDSPAndGUI.setLabel("Initialize System");
		}
			
		
	}

/**
* Updates the values of output Fourier-coefficients 
* according to the selected resonator order
*/
void updateOutputResonatorValues(int selectedResonator){
	//o_rez_x_re_value_tf.setText(""+mainProg.outRez_x_re[selectedResonator]);
	//o_rez_x_im_value_tf.setText(""+mainProg.outRez_x_im[selectedResonator]);
	o_rez_x_value_tf.setText(""+ mainProg.outRez_x_re[mainProg.selectedResonator] + "+" + mainProg.outRez_x_im[mainProg.selectedResonator] + "j");	outputResonatorVal.setText("Kimeneti együttható: z_out["+(mainProg.selectedResonator+1)+"] = " + mainProg.outRez_x_re[mainProg.selectedResonator] + "+" + mainProg.outRez_x_im[mainProg.selectedResonator] + "j");	
}

/**
* Updates the values of resonator modifiers 
* according to the selected resonator order
*/
void updateResonatorModifierValues(int selectedResonator){
	//modif_re_value_tf.setText(""+mainProg.rezDatModifRe[selectedResonator]);
	//modif_im_value_tf.setText(""+mainProg.rezDatModifIm[selectedResonator]);
	modif_value_tf.setText(""+mainProg.rezDatModifRe[mainProg.selectedResonator] + "+" + mainProg.rezDatModifIm[mainProg.selectedResonator] + "j");		
	modifierVal.setText("Módosító együttható: w["+(mainProg.selectedResonator+1)+"] = " + mainProg.rezDatModifRe[selectedResonator] + "+" + mainProg.rezDatModifIm[selectedResonator] + "j");
}


String makeNumberString(String inNumP){
	String newString = new String();
	char c;
	int writePosInStr = 0;
	String inNum = inNumP.replace(','  ,  '.');
	for(int forVar = 0; forVar<inNum.length();forVar++){
		c = inNum.charAt(forVar);
		if (  ((c>='0') & (c<='9')) || (c=='-')  || (c=='+') || (c=='.') || (c=='e')|| (c=='E')){
			newString = newString + c;
		}
	}
	
	return newString;
}

/**
Disable the output of the DSP. Set the labels and buttons correctly and send command to the DSP if required.
@param sendCommand send a command to the DSP
*/
public void disableOutput(boolean sendCommand){
	if (sendCommand){
		 commandGenerator.enableOutput(false);
	}
	outputEnableOnButt.setLabel(outputEnableOnButt_Enable);
	outputEnableIndicator.setText(outputEnableIndicator_Disabled);
	outputEnableIndicator.setBackground(outputEnableIndicatorColor_Disabled);
}
//If there is no explicit parameter, it automatically sends command.
public void disableOutput(){
	disableOutput(true);
}


/**
Enable the output of the DSP. Set the labels and buttons correctly and send command to the DSP if required.
@param sendCommand send a command to the DSP
*/
public void enableOutput(boolean sendCommand){
	if (sendCommand){
		commandGenerator.enableOutput(true);
	}
	outputEnableOnButt.setLabel(outputEnableOnButt_Disable);
	outputEnableIndicator.setText(outputEnableIndicator_Enabled);
	outputEnableIndicator.setBackground(outputEnableIndicatorColor_Enabled);
}
//If there is no explicit parameter, it automatically sends command.
public void enableOutput(){
	enableOutput(true);
}


/**
Disable the modifiers. Set the labels and buttons correctly and send command to the DSP if required.
@param sendCommand send a command to the DSP
*/
public void disableModifiers(boolean sendCommand){
	useTheModifiersFlag = false;
	if (sendCommand){
		 commandGenerator.sendModifiers(true, useTheModifiersFlag);
	}
	useTheModifiersButt.setLabel(useTheModifiersButt_Enable);
	useTheModifiersIndicator.setText(useTheModifiersIndicator_Disabled);
	useTheModifiersIndicator.setBackground(useTheModifiersIndicatorColor_Disabled);
}
//If there is no explicit parameter, it automatically sends command.
public void disableModifiers(){
	disableModifiers(true);
}


/**
Enable the modifiers. Set the labels and buttons correctly and send command to the DSP if required.
@param sendCommand send a command to the DSP
*/
public void enableModifiers(boolean sendCommand){
	useTheModifiersFlag = true;
	if (sendCommand){
		commandGenerator.sendModifiers(true, useTheModifiersFlag);
	}
	useTheModifiersButt.setLabel(useTheModifiersButt_Disable);
	useTheModifiersIndicator.setText(useTheModifiersIndicator_Enabled);
	useTheModifiersIndicator.setBackground(useTheModifiersIndicatorColor_Enabled);
}
//If there is no explicit parameter, it automatically sends command.
public void enableModifiers(){
	enableModifiers(true);
}


}//end of the class