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


class ResonatorParams extends Panel implements ActionListener{
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


public int       outputResonatorPanelHight = 20;
public Panel     outputResonatorPanel;
public Button    resetOutputResonators;     //resets all resonators
public Button    resetOutputResonatorButt;  //resets the actual resonator
public Label     outputResonatorVal;

public Panel     outputResonatorSetPanel;
public Label     o_rez_x_re_before;  //output resonator re
public TextField o_rez_x_re_value_tf;  //output resonator re
public Label     o_rez_x_im_before;  //output resonator re
public TextField o_rez_x_im_value_tf;  //output resonator im
public Button    sendParamsButt;
public Button    outputEnableOnButt;  //enable signal output
		public String outputEnableOnButt_Enable = new String("Enable out");
		public String outputEnableOnButt_Disable = new String("Disable out");
public boolean   useTheModifiersFlag = false;
public Button    getResonatorValuesAndWriteToOut;

public int       resDisplayCorrectHight = 20;
public Panel     resDisplayCorrectPanel;
public Button    resetModifiers;
public Label     modifierVal;

public Panel     resDisplayCorrectSetPanel;
public Label     modif_re_before;  //resonator modifier
public TextField modif_re_value_tf;  //resonator modifier
public Label     modif_im_before;  //resonator modifier
public TextField modif_im_value_tf;  //resonator modifier
public Button    activateModifierButt;
public Button    resetModifierButt;
public Button    useTheModifiersButt;
		public String useTheModifiersButt_Enable = new String("Use Modifier");
		public String useTheModifiersButt_Disable = new String("Don't use Modifier");

public RezDataColl mainProg; //this is a reference to the main prog

SimpleSerialSend commandGenerator;

//Constructor
public ResonatorParams(RezDataColl mainProg){
		this.mainProg = mainProg;
		
		this.setLayout(null);
		//this.setLayout(new FlowLayout());
		//this.setLayout(new GridLayout(2,4));
		this.setSize(700,100);

//siaplay the output resonators
//---------------------------------------------------------------			
		iGapAfterPrev  = 10;
		iCompHight     = outputResonatorPanelHight;
		iNextVertPos   += iGapAfterPrev + iCompHight;
		iActualVertPos = iNextVertPos - iCompHight;

		outputResonatorPanel = new Panel();//"Kimeneti rezonátor:"
		outputResonatorPanel.setLayout(null);		

		outputResonatorVal   = new Label("Kimeneti együttható: x_out["+(mainProg.selectedResonator+1)+"] = 0 + 0j");
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
		outputResonatorPanel.setLocation(10,iActualVertPos);

//set the output resonators		
//----------------------------------------------------
		iGapAfterPrev  = 15;
		iCompHight     = 20;
		iNextVertPos   += iGapAfterPrev + iCompHight;
		iActualVertPos = iNextVertPos - iCompHight;
		
		outputResonatorSetPanel = new Panel();//"Kimeneti rezonátor:"
		outputResonatorSetPanel.setLayout(null);		
		
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
		
		getResonatorValuesAndWriteToOut = new Button("Get res");
		getResonatorValuesAndWriteToOut.setSize(80,iCompHight);
		getResonatorValuesAndWriteToOut.setLocation(490,0);
		outputResonatorSetPanel.add(getResonatorValuesAndWriteToOut);
		getResonatorValuesAndWriteToOut.addActionListener(this);
		
				
		outputResonatorSetPanel.setSize(600,iCompHight);
		outputResonatorSetPanel.setLocation(10,iActualVertPos);
		this.add(outputResonatorSetPanel);

//display the modifier
//---------------------------------------------------------------			
		iGapAfterPrev  = 10;
		iCompHight     = resDisplayCorrectHight;
		iNextVertPos   += iGapAfterPrev + iCompHight;
		iActualVertPos = iNextVertPos - iCompHight;

		resDisplayCorrectPanel = new Panel();//módosító érték
		resDisplayCorrectPanel.setLayout(null);		

		modifierVal   = new Label("Módosító együttható: m["+(mainProg.selectedResonator+1)+"] = 1 + 0j");
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
		resDisplayCorrectPanel.setSize(500,iCompHight);
		resDisplayCorrectPanel.setLocation(10,iActualVertPos);
		
		//set the modifier
//----------------------------------------------------
		iGapAfterPrev  = 15;
		iCompHight     = 20;
		iNextVertPos   += iGapAfterPrev + iCompHight;
		iActualVertPos = iNextVertPos - iCompHight;

		resDisplayCorrectSetPanel = new Panel();//"Kimeneti rezonátor:"
		resDisplayCorrectSetPanel.setLayout(null);		
		
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
		
						
		resDisplayCorrectSetPanel.setSize(600,iCompHight);
		resDisplayCorrectSetPanel.setLocation(10,iActualVertPos);
		this.add(resDisplayCorrectSetPanel);

//========================================================
		
		//set the size
		this.setSize(this.getWidth(),iNextVertPos+10);
		
		this.validate();
		this.setVisible(true);

			
		} //end of constructor public ResonatorParams

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
		if (e.getSource().equals(sendParamsButt)) {
			float numVal;
			String numValS;
			//numValS = o_rez_x_re_value_tf.getText();
			numValS = makeNumberString(o_rez_x_re_value_tf.getText());
			mainProg.outRez_x_re[mainProg.selectedResonator] = Float.parseFloat( numValS );
			numValS = makeNumberString(o_rez_x_im_value_tf.getText());
			mainProg.outRez_x_im[mainProg.selectedResonator] = Float.parseFloat( numValS );
			outputResonatorVal.setText("Kimeneti együttható: x_out["+(mainProg.selectedResonator+1)+"] = " + mainProg.outRez_x_re[mainProg.selectedResonator] + "+" + mainProg.outRez_x_im[mainProg.selectedResonator] + "j");
			//commandGenerator.setOutputResonator(mainProg.selectedResonator);
			commandGenerator.setAllOutputResonators();
		}
		
		if (e.getSource().equals(resetOutputResonators)) {
			for (int harm=0;harm<2*mainProg.harmNum;harm++){
				mainProg.outRez_x_re[harm] = 0.0f;
				mainProg.outRez_x_im[harm] = 0.0f;
			}
			outputResonatorVal.setText("Kimeneti együttható: x_out["+(mainProg.selectedResonator+1)+"] = " + mainProg.outRez_x_re[mainProg.selectedResonator] + "+" + mainProg.outRez_x_im[mainProg.selectedResonator] + "j");
			o_rez_x_re_value_tf.setText("0");
			o_rez_x_im_value_tf.setText("0");
			commandGenerator.resetAllOutputResonators();
		}
		
		if (e.getSource().equals(resetOutputResonatorButt)) {
			mainProg.outRez_x_re[mainProg.selectedResonator] = 0f;
			mainProg.outRez_x_im[mainProg.selectedResonator] = 0f;
			outputResonatorVal.setText("Kimeneti együttható: x_out["+(mainProg.selectedResonator+1)+"] = " + mainProg.outRez_x_re[mainProg.selectedResonator] + "+" + mainProg.outRez_x_im[mainProg.selectedResonator] + "j");
			o_rez_x_re_value_tf.setText("0");
			o_rez_x_im_value_tf.setText("0");
			commandGenerator.setOutputResonator(mainProg.selectedResonator);
		}
		
		if (e.getSource().equals(outputEnableOnButt)) {
			if (outputEnableOnButt.getLabel().equals(outputEnableOnButt_Enable)){
				outputEnableOnButt.setLabel(outputEnableOnButt_Disable);
				commandGenerator.enableOutput(true);
			} else {
				outputEnableOnButt.setLabel(outputEnableOnButt_Enable);
				commandGenerator.enableOutput(false);
			}
		}
		
		if (e.getSource().equals(getResonatorValuesAndWriteToOut)) {
			//mainProg.outRez_x_re[mainProg.selectedResonator] = mainProg.rezDatRe[mainProg.selectedResonator];
			//mainProg.outRez_x_im[mainProg.selectedResonator] = mainProg.rezDatIm[mainProg.selectedResonator];
			o_rez_x_re_value_tf.setText(""+mainProg.rezDatRe[mainProg.harmListSelectedIndex]);
			o_rez_x_im_value_tf.setText(""+mainProg.rezDatIm[mainProg.harmListSelectedIndex]);
		}
		
		
		/**
		*    MODIFIER related buttons
		*/  
		
		if (e.getSource().equals(activateModifierButt)) {
			String numValS;
			numValS = makeNumberString(modif_re_value_tf.getText());
			mainProg.rezDatModifRe[mainProg.selectedResonator] = Float.parseFloat(numValS );
			numValS = makeNumberString(modif_im_value_tf.getText());
			mainProg.rezDatModifIm[mainProg.selectedResonator] = Float.parseFloat( numValS);
			modifierVal.setText("Módosító együttható: m["+(mainProg.selectedResonator+1)+"] = " + mainProg.rezDatModifRe[mainProg.selectedResonator] + "+" + mainProg.rezDatModifIm[mainProg.selectedResonator] + "j");
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
				useTheModifiersFlag = true;
				commandGenerator.sendModifiers(true, useTheModifiersFlag);
				useTheModifiersButt.setLabel(useTheModifiersButt_Disable);
			} else {
				useTheModifiersFlag = false;
				commandGenerator.sendModifiers(true, useTheModifiersFlag);
				useTheModifiersButt.setLabel(useTheModifiersButt_Enable);
			}
		}
		
		/**
		*
		* Initialization of the system
		*/
		if (e.getSource().equals(mainProg.initializeDSPAndGUI)) {
			System.out.println();
			System.out.println("System initialization in progress");
			System.out.println("   Initialization of frequency");
				commandGenerator.sendFrequencyValue();
			System.out.println("   Initialization of output resonators");
				outputEnableOnButt.setLabel(outputEnableOnButt_Enable);
				commandGenerator.enableOutput(false);
				commandGenerator.setAllOutputResonators();
			System.out.println("   Initialization of modifiers");
				commandGenerator.sendModifiers(true, useTheModifiersFlag);
				useTheModifiersButt.setLabel(useTheModifiersButt_Enable);				
			System.out.println("System initialization is ready");
			System.out.println();
		}
			
		
	}

/**
* Updates the values of output Fourier-coefficients 
* according to the selected resonator order
*/
void updateOutputResonatorValues(int selectedResonator){
	o_rez_x_re_value_tf.setText(""+mainProg.outRez_x_re[selectedResonator]);
	o_rez_x_im_value_tf.setText(""+mainProg.outRez_x_im[selectedResonator]);
	outputResonatorVal.setText("Kimeneti együttható: x_out["+(mainProg.selectedResonator+1)+"] = " + mainProg.outRez_x_re[mainProg.selectedResonator] + "+" + mainProg.outRez_x_im[mainProg.selectedResonator] + "j");	
}

/**
* Updates the values of resonator modifiers 
* according to the selected resonator order
*/
void updateResonatorModifierValues(int selectedResonator){
	modif_re_value_tf.setText(""+mainProg.rezDatModifRe[selectedResonator]);
	modif_im_value_tf.setText(""+mainProg.rezDatModifIm[selectedResonator]);
	modifierVal.setText("Módosító együttható: m["+(mainProg.selectedResonator+1)+"] = " + mainProg.rezDatModifRe[selectedResonator] + "+" + mainProg.rezDatModifIm[selectedResonator] + "j");
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

}//end of the class