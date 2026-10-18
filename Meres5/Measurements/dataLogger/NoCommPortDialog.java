import java.awt.*;
import java.awt.event.*;
import javax.swing.*;
import javax.swing.event.*;


public class NoCommPortDialog extends Dialog implements ActionListener
{
	Button OK;
	public NoCommPortDialog(Frame parent, String uzenet,String kiir)
	{	
		super(parent,uzenet,true);
		setLocation(200,200);
		setLayout(new GridLayout(2,1));
		Label kiirni=new Label(kiir);
		add(kiirni);
		OK=new Button("OK");
		OK.addActionListener(this);
		add(OK);
		pack();
		setVisible(true);
	}
	public void actionPerformed(ActionEvent e) 
	{
		dispose();
		System.exit(0);
	}
	
}
