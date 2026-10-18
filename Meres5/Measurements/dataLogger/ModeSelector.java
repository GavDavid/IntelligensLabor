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


class ModeSelector extends Panel implements ActionListener{
	
	private int modeSelectorHight = 20;
	
	private int iActualVertPos = 0; //the actual vertical position
	private int iNextVertPos   = 0;   //the next vertical position
	private int iGapAfterPrev  = 0;  //the gap after the previous component
	private int iCompHight     = 0;     //the hight of the component
	
	private int iActualHorPos    = 0; //the actual horisontal position
	private int iNextHorPos      = 0;   //the next horisontal position
	private int iHorGapAfterPrev = 0;  //the gap after the previous component
	private int iCompWidth       = 0;     //the width of the component
	
	//----------------------------------------
	public Label modeLabel = new Label("Select mode:");
	//----------------------------------------
	public CheckboxGroup modeSelectionGroup;
	public Checkbox userControlMode;
	public Checkbox identMode;
	public Checkbox ANCMode;
	//........................................
		public Label     ANCmu;
		public TextField ANCmuValue;
	//----------------------------------------
	public Checkbox AFAIsOn;
	//----------------------------------------
	public CheckboxGroup ANCModeSelection;
	public Checkbox ANCModeUseManualIdentification;
	public Checkbox ANCModeUseAutomaticIdentification;
	public Checkbox automaticDistorionControl;

	public RezDataColl mainProg; //this is a reference to the main prog
	public SimpleSerialSend commandGenerator; //the object that send the commands phisically

	public int selectedDSPMode;
	public int selectedDSPModeOld = 0;
	
	public boolean AFAState    = false;
	public boolean AFAStateOld = !AFAState;
	
	private Color colorOfPanel = new Color(220,220,220);
	
/**
*          S T A R T   of the constructor
**/

	
public ModeSelector(RezDataColl mainProg, SimpleSerialSend commandGenerator){
		this.mainProg         = mainProg;
		this.commandGenerator = commandGenerator;
		
		modeSelectionGroup  = new CheckboxGroup();
			userControlMode = new Checkbox("user control", modeSelectionGroup, true);
			identMode       = new Checkbox("auto ident", modeSelectionGroup, false);
			ANCMode         = new Checkbox("ANC mode", modeSelectionGroup, false);
				ANCmu      = new Label("mu=");
				ANCmuValue = new TextField("0.000625");

		getDSPMode(); //by clling this function the value of selectedDSPMode is set
		
		
		ANCModeSelection = new CheckboxGroup();  	
			ANCModeUseManualIdentification    = new Checkbox("manual ID", ANCModeSelection, true);
			ANCModeUseAutomaticIdentification = new Checkbox("auto ID", ANCModeSelection, false);
		
		this.setLayout(null);	


//--------------------------------------------------------			
		iGapAfterPrev  = 5;
		iCompHight     = modeSelectorHight;
		iNextVertPos   += iGapAfterPrev + iCompHight;
		iActualVertPos = iNextVertPos - iCompHight;
			
		modeLabel.setSize(300,iCompHight);
		modeLabel.setLocation(10,iActualVertPos);
		modeLabel.setBackground(colorOfPanel);
		this.add(modeLabel);
//--------------------------------------------------------			
		iGapAfterPrev  = 5;
		iCompHight     = modeSelectorHight;
		iNextVertPos   += iGapAfterPrev + iCompHight;
		iActualVertPos = iNextVertPos - iCompHight;
			
		userControlMode.setSize(300,iCompHight);
		userControlMode.setLocation(10,iActualVertPos);
		userControlMode.setBackground(colorOfPanel);
		this.add(userControlMode);
//--------------------------------------------------------			
		iGapAfterPrev  = 0;
		iCompHight     = modeSelectorHight;
		iNextVertPos   += iGapAfterPrev + iCompHight;
		iActualVertPos = iNextVertPos - iCompHight;
			
		identMode.setSize(300,iCompHight);
		identMode.setLocation(10,iActualVertPos);
		identMode.setBackground(colorOfPanel);
		this.add(identMode);
//--------------------------------------------------------			
		iGapAfterPrev  = 0;
		iCompHight     = modeSelectorHight;
		iNextVertPos   += iGapAfterPrev + iCompHight;
		iActualVertPos = iNextVertPos - iCompHight;

		ANCMode.setSize(80,iCompHight);
		ANCMode.setLocation(10,iActualVertPos);
		ANCMode.setBackground(colorOfPanel);
		this.add(ANCMode);
		
		//......................................
				ANCmu.setSize(30,iCompHight);
				ANCmu.setLocation(100,iActualVertPos);
				ANCmu.setBackground(new Color(200,200,200)/*colorOfPanel*/);
				this.add(ANCmu);
				
				ANCmuValue.setSize(100,iCompHight);
				ANCmuValue.setLocation(130,iActualVertPos);
				//ANCmuValue.setBackground(colorOfPanel);
				this.add(ANCmuValue);
				//ANCmuValue = new TextField("0.000625");
				ANCmuValue.addActionListener(this);

		
//--------------------------------------------------------			
		iGapAfterPrev  = 10;
		iCompHight     = modeSelectorHight;
		iNextVertPos   += iGapAfterPrev + iCompHight;
		iActualVertPos = iNextVertPos - iCompHight;

		Label separatorLabel = new Label("___________");
		separatorLabel.setSize(100,20);
		separatorLabel.setLocation(00,iActualVertPos-10);
		separatorLabel.setBackground(colorOfPanel);
		this.add(separatorLabel);
		
		AFAIsOn = new Checkbox("AFA ON", AFAState);
		AFAIsOn.setSize(100,10);
		AFAIsOn.setLocation(10,iActualVertPos+10);
		AFAIsOn.setBackground(colorOfPanel);
		this.add(AFAIsOn);
		
		
			

		this.setSize(100,(modeSelectorHight+/*iGapAfterPrev*/ 5)*4+50);
		//this.setBorder(BorderFactory.createLineBorder(Color.black));
		
	}  //E N D   of the constructor     public ModeSelector(RezDataColl mainProg, SimpleSerialSend commandGenerator){
	
public void setCommandGenerator(SimpleSerialSend commandGenerator){
	this.commandGenerator = commandGenerator;
}		

public boolean getAFAState(){
	return (AFAIsOn.getState());
}

public void setAFAState(boolean AFANewState){
	AFAIsOn.setState(AFANewState);
}

public int getDSPMode(){
//	selectedDSPMode = mainProg.DSP_MODE_NORMAL_MODE;
	
	if (userControlMode.getState()){
		selectedDSPMode = mainProg.DSP_MODE_NORMAL_MODE;
	}
	
	if (identMode.getState()){
		selectedDSPMode = mainProg.DSP_MODE_IDENTIFICATION_MODE;
	}
	
	if (ANCMode.getState()){
		selectedDSPMode = mainProg.DSP_MODE_ANC_MODE;
	}
	return selectedDSPMode;
}	

public int getDSPOldMode(){
	int selectedDSPModeOldTmp = selectedDSPModeOld;
	selectedDSPModeOld = selectedDSPMode;
	return (selectedDSPModeOldTmp);
}

public boolean getAFAStateChanged(){
	AFAStateOld = AFAState;
	AFAState    = AFAIsOn.getState();
	return (AFAState!=AFAStateOld);
	
}

public void update ( Graphics g ) {
    this.paint(g);
}

public void paint(Graphics g){
	setBackground(colorOfPanel);	
}


/**
*   Action listener
*
*/
public void actionPerformed(ActionEvent e){
	
	
/**
*
*    New mu value is set
*/	
	if (  (e.getSource().equals(ANCmuValue)) ){   //|| (e.getSource().equals(o_rez_x_value_tf)) 
	
	    setMuValue();
	    
	}   //if (  (e.getSource().equals(ANCmuValue)) ){   
}


public void setMuValue(){
		float fMuValue;
		long   lMuValue;
		ComplexNumber muValInComplexForm;
		long   conversionFactorFloatLong = 4294967296l;//2^32 = 4294967296
		
		muValInComplexForm = new InterpretComplexNumber(ANCmuValue.getText());

		fMuValue = (float)muValInComplexForm.getReal();
		if (fMuValue<0.0f){
			fMuValue = 0.0f;
		}
		if (fMuValue>1.0f){
			fMuValue = 1.0f;
		}
		lMuValue = (long)(fMuValue * (float)conversionFactorFloatLong);
		if (lMuValue==0x0100000000l){
			lMuValue=0x00FFFFFFFEl;
		}
		lMuValue &=0x00FFFFFFFEl;  //the masking of the last bit is applied in order to exclude the case of four xFF bytes (new frame)
								//the masking of the four bytes is required since it is a 4 byte data block
		fMuValue = (float)lMuValue / (float)conversionFactorFloatLong;
		ANCmuValue.setText(Float.toString(fMuValue) );
		System.out.println("mu = " + fMuValue);
		//System.out.println("mu = " + new PrintfFormat("%x").sprintf(lMuValue));
		System.out.println("mu = " + Long.toHexString(lMuValue));
		

		commandGenerator.setMu(lMuValue);
	}
	
}  //class ModeSelector {