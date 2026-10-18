//Part 2; Java 2D specific-extend the drawing Component -Canvas-
// and override it's paint method.

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




class myCustomCanvas extends Canvas implements Runnable/*, MouseListener*/ {
Thread thr;
    private Image offscreen = null;
    private int   height;
    private int   width;
    private float angleOfCirc = 1;
    private float absOfCirc = 0f;

    private float reOfCircG = 0f;
    private float imOfCircG = 0f;
    private float nyujt = 1f;
    
    
    float [] highOfMoteDat = new float[3];
    
  public myCustomCanvas() {
  	//-- System.out.println("myCustCanv Created");
       //repaint(100);
            //new Thread(this).start();
     thr = new Thread(this,"dsfa"); thr.start();
     //--System.out.println(thr.isAlive());
     
     
        height = getHeight();
        width  = getWidth();
        height = 300; //200
        width  = 450; //250
        setSize(width,height);

        //if( !isDoubleBuffered() ){
            offscreen = createImage( width, height );
          //  offscreen = offscreen.getGraphics() ;
        //}
     

  }
  

   public void paint(Graphics g) {
   	
   	/*
     System.out.println("in paint  1");
     System.out.println(thr.isAlive());
//     Thread thr = new Thread(this,"dsfa"); thr.start();

     // step one of the recipe; cast Graphics object as Graphics2D
     Graphics2D g2d = (Graphics2D) g;

     // step two-set the graphics context
     g2d.setColor(Color.red); //setting context
     //g2d.clear();

     //step three-render something
     g2d.fill(new Rectangle.Float(200.0f,200.0f,75.0f,75.0f));
     
     
     
     int drawCirL=10000;
     for(int i=1;i<drawCirL;i++){
   	    //Line2D lin = new Line2D.Float(100, 100, Math.round(100+30*Math.cos(i/Integer(drawCirL).floatValue()*2.0*Math.PI)), Math.round(100+30*Math.sin(i/Integer(drawCirL).floatValue()*2.0*Math.PI)));
         g2d.setColor(Color.red); //setting context

   	    Line2D lin = new Line2D.Float(100, 100, Math.round(100+30*Math.cos(i/(float)(drawCirL)*2.0*Math.PI)), Math.round(100+30*Math.sin(i/(float)(drawCirL)*2.0*Math.PI)));
        g2d.draw(lin);
        g2d.setColor(Color.blue); //setting context

        g2d.drawLine(100, 100, (int)Math.round(100+20*Math.cos(i/(float)(drawCirL)*2.0*Math.PI)), (int)Math.round(100+20*Math.sin(i/(float)(drawCirL)*2.0*Math.PI)));
     }
     
 

     //g2d.rotate(100.0);
     */
     
   }

public void setAbsAndAngle(float circ,float abs){
	angleOfCirc = circ;

	if (angleOfCirc>1.0f) {angleOfCirc=1;}
	if (angleOfCirc<0.0f) {angleOfCirc=0;}
	
	absOfCirc = abs;

}


public void setReAndIm(float re,float im,float nyujt){
	reOfCircG = re;
    imOfCircG = im;
    
    this.nyujt = nyujt;

}

    
public void setAngleOfCirc(float circ){
	angleOfCirc = circ;
	
	//angleOfCirc = 0.1f;
	
	if (angleOfCirc>1.0f) {angleOfCirc=1;}
	if (angleOfCirc<0.0f) {angleOfCirc=0;}
}


public void setHight(float high1,float high2,float high3){
    highOfMoteDat[0] = high1;
    highOfMoteDat[1] = high2;
    highOfMoteDat[2] = high3;
	
}

   
public void kiir(){
       //-- System.out.println("Kiir Running");
	
	}   
   
   // override run() method in interface
public void run() {
      //--  System.out.println("Running");
        kiir();
       try{ 
           Thread.sleep((1000));
        } catch( InterruptedException e ) {
            System.out.println("Interrupted Exception caught");
        }
       // repaint();
       //thr.start();
    
}    
   
   
     public void update(Graphics g) {
     //--System.out.println("in update");

	//--super.update(g);  //elvileg kell a könyv szerint
     

   	Graphics offgc;
	Image offscreen = null;
	Dimension d = size();

	// create the offscreen buffer and associated Graphics
	offscreen = createImage(d.width, d.height);
	offgc = offscreen.getGraphics();
	// clear the exposed area
	offgc.setColor(getBackground());
	offgc.fillRect(0, 0, d.width, d.height);
	offgc.setColor(getForeground());
	// do normal redraw
	//paint(offgc);
	// transfer offscreen to window
	
        int drawCirL=10000;
  
  double sugar = (Math.random()*14.0+5.0);
//--      System.out.println("sugár: "+sugar);

  	float middleX = 200; //100
  	float middleY = 220; //120
  	float axisLenX = 180; //80
  	float axisLenY = 180; //80
  	float arrLen = 5;  //5
  	
  	float radiusOfArc = 80;
  	
  	float scaleOfReIm = Math.min(axisLenX,axisLenY)*0.8f;
  	
	float reOfCirc = scaleOfReIm * reOfCircG * nyujt;
	float imOfCirc = scaleOfReIm * imOfCircG * nyujt;


  	float rectLeftX = 150;
  	float rectLeftY = 80;
  	float rectWidth = 5;
  	float rectHight = 100;
  	float garpBetwRect = 10;
  	float rectaxisLenX = 80;
  	float rectaxisLenY = 80;
  	
  	
  	
  
          //--for(int i=1;i<(long)(drawCirL*angleOfCirc);i++){
   	    //Line2D lin = new Line2D.Float(100, 100, Math.round(100+30*Math.cos(i/Integer(drawCirL).floatValue()*2.0*Math.PI)), Math.round(100+30*Math.sin(i/Integer(drawCirL).floatValue()*2.0*Math.PI)));

//   	    Line2D lin = new Line2D.Float(400, 400, Math.round(400+30*Math.cos(i/(float)(drawCirL)*2.0*Math.PI)), Math.round(400+30*Math.sin(i/(float)(drawCirL)*2.0*Math.PI)));
  //      offgc.draw(lin);
  

//--        offgc.setColor(Color.blue); //setting context

//--        offgc.drawLine((int)Math.round(middleX), (int)Math.round(middleY), (int)Math.round(middleX+sugar*Math.cos(i/(float)(drawCirL)*2.0*Math.PI)), (int)Math.round(middleY-sugar*Math.sin(i/(float)(drawCirL)*2.0*Math.PI)));
     //--}  //for

        offgc.setColor(Color.black); //setting context
        offgc.setColor(new Color(80,80,80)); //setting context
        offgc.drawLine((int)Math.round(middleX+axisLenX), (int)Math.round(middleY), (int)Math.round(middleX-axisLenX), (int)Math.round(middleY));
        offgc.drawLine((int)Math.round(middleX), (int)Math.round(middleY+axisLenY), (int)Math.round(middleX), (int)Math.round(middleY-axisLenY));
        offgc.drawLine((int)Math.round(middleX+axisLenX), (int)Math.round(middleY), (int)Math.round(middleX+axisLenX-arrLen), (int)Math.round(middleY-arrLen));
        offgc.drawLine((int)Math.round(middleX+axisLenX), (int)Math.round(middleY), (int)Math.round(middleX+axisLenX-arrLen), (int)Math.round(middleY+arrLen));
        offgc.drawLine((int)Math.round(middleX), (int)Math.round(middleY-axisLenY), (int)Math.round(middleX-arrLen), (int)Math.round(middleY-axisLenY+arrLen));
        offgc.drawLine((int)Math.round(middleX), (int)Math.round(middleY-axisLenY), (int)Math.round(middleX+arrLen), (int)Math.round(middleY-axisLenY+arrLen));



        offgc.setColor(new Color(230,230,230)); //setting context
        offgc.setColor(new Color(200,200,200)); //setting context
		offgc.drawArc((int)Math.round(middleX-scaleOfReIm), (int)Math.round(middleY-scaleOfReIm),  (int)scaleOfReIm*2, (int)scaleOfReIm*2, 0, 360);        //System.out.println(" "+ (int)Math.round(middleY-absOfCirc*Math.cos((float)(angleOfCirc)*2.0*Math.PI)) + " " + middleY);
		
        offgc.setColor(Color.black); //setting context
		offgc.drawString(""+(1/nyujt),(int)Math.round(middleX+10), (int)(Math.round(middleY-scaleOfReIm-5)/*+scaleOfReIm*2*/));
        //System.out.println("... "+ absOfCirc);
		//  offgc.drawArc((int)Math.round(middleX-radiusOfArc/2), (int)Math.round(middleY-radiusOfArc/2), (int)radiusOfArc, (int)radiusOfArc, 0, (int)(angleOfCirc*360f));

        offgc.setColor(Color.black); //setting context
		offgc.drawString("Re",(int)(middleX+axisLenX), (int)(middleY-arrLen));
		offgc.drawString("Im",(int)(middleX+arrLen), (int)(middleY-axisLenY));
		
		
		
        offgc.setColor(Color.red); //setting context
     	//offgc.drawLine((int)Math.round(middleX), (int)Math.round(middleY), (int)Math.round(middleX+absOfCirc *Math.cos((float)(angleOfCirc)*2.0*Math.PI)), (int)Math.round(middleY-absOfCirc*Math.sin((float)(angleOfCirc)*2.0*Math.PI)));
		//offgc.fillArc((int)Math.round(middleX+absOfCirc *Math.cos((float)(angleOfCirc)*2.0*Math.PI)-2), (int)Math.round(middleY-absOfCirc*Math.sin((float)(angleOfCirc)*2.0*Math.PI)-2),  4,4, 0, 360);        //System.out.println(" "+ (int)Math.round(middleY-absOfCirc*Math.cos((float)(angleOfCirc)*2.0*Math.PI)) + " " + middleY);
     	offgc.drawLine((int)Math.round(middleX), (int)Math.round(middleY), (int)Math.round(middleX+reOfCirc), (int)Math.round(middleY-imOfCirc));
		offgc.fillArc((int)Math.round(middleX+reOfCirc-2), (int)Math.round(middleY-imOfCirc-2),  4,4, 0, 360);        //System.out.println(" "+ (int)Math.round(middleY-absOfCirc*Math.cos((float)(angleOfCirc)*2.0*Math.PI)) + " " + middleY);

/*
        offgc.setColor(Color.black); //setting context
        offgc.drawLine((int)Math.round(rectLeftX+rectaxisLenX), (int)Math.round(rectLeftY), (int)Math.round(rectLeftX), (int)Math.round(rectLeftY));
        offgc.drawLine((int)Math.round(rectLeftX), (int)Math.round(rectLeftY+rectaxisLenY*0), (int)Math.round(rectLeftX), (int)Math.round(rectLeftY-rectaxisLenY));
        offgc.drawLine((int)Math.round(rectLeftX+rectaxisLenX), (int)Math.round(rectLeftY), (int)Math.round(rectLeftX+rectaxisLenX-arrLen), (int)Math.round(rectLeftY-arrLen));
        offgc.drawLine((int)Math.round(rectLeftX+rectaxisLenX), (int)Math.round(rectLeftY), (int)Math.round(rectLeftX+rectaxisLenX-arrLen), (int)Math.round(rectLeftY+arrLen));
        offgc.drawLine((int)Math.round(rectLeftX), (int)Math.round(rectLeftY-rectaxisLenY), (int)Math.round(rectLeftX-arrLen), (int)Math.round(rectLeftY-rectaxisLenY+arrLen));
        offgc.drawLine((int)Math.round(rectLeftX), (int)Math.round(rectLeftY-rectaxisLenY), (int)Math.round(rectLeftX+arrLen), (int)Math.round(rectLeftY-rectaxisLenY+arrLen));
 */       
        
      //  offgc.setColor(Color.red); //setting context
      //  for (int mote=0;mote<3;mote++){
        	
      //  	offgc.fillRect((int) (rectLeftX +10 + mote*(rectWidth+garpBetwRect)), (int) (rectLeftY-rectHight*highOfMoteDat[mote]), (int) rectWidth, (int) (rectHight*highOfMoteDat[mote]));
        	//drawRect(int x, int y, int width, int height)	
       // }
        
	
	
	g.drawImage(offscreen, 0, 0, this);
	
	
	     paint(g);

}

}












/*    Graphics2D offscr= new Graphics();
     
          for(int i=1;i<drawCirL;i++){
   	    //Line2D lin = new Line2D.Float(100, 100, Math.round(100+30*Math.cos(i/Integer(drawCirL).floatValue()*2.0*Math.PI)), Math.round(100+30*Math.sin(i/Integer(drawCirL).floatValue()*2.0*Math.PI)));
         g2d.setColor(Color.red); //setting context

   	    Line2D lin = new Line2D.Float(400, 400, Math.round(400+30*Math.cos(i/(float)(drawCirL)*2.0*Math.PI)), Math.round(400+30*Math.sin(i/(float)(drawCirL)*2.0*Math.PI)));
        g2d.draw(lin);
        g2d.setColor(Color.blue); //setting context

        g2d.drawLine(400, 400, (int)Math.round(400+20*Math.cos(i/(float)(drawCirL)*2.0*Math.PI)), (int)Math.round(400+30*Math.sin(i/(float)(drawCirL)*2.0*Math.PI)));
     }
*/


