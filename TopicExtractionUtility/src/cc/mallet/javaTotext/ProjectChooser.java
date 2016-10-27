package cc.mallet.javaTotext;

import javax.swing.*;
import java.awt.event.*;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.awt.*;
import java.util.*;
import javax.swing.event.DocumentEvent;
import javax.swing.event.DocumentListener;
import java.awt.event.ActionEvent;
import javax.swing.text.BadLocationException;
import javax.swing.GroupLayout.*;


public class ProjectChooser extends JPanel
implements ActionListener {
	JButton btnDPERS;
	JButton btnAntiPattern;
	JButton btnQandA;

	JFileChooser chooser;
	public static JLabel statusLabel;
	
	String choosertitle;

	public static void setStatusLabel(String s)
	{
		statusLabel.setText(s);
	}
	public ProjectChooser() {
		btnDPERS = new JButton("DPERS only");
		btnDPERS.addActionListener(this);	
		btnAntiPattern = new JButton("DPERS+AntiPattern");
		btnAntiPattern.addActionListener(this);
		btnQandA = new JButton("Q and A");
		btnQandA.addActionListener(this);
		
		statusLabel= new JLabel();
		
		add(btnDPERS);
		add(btnAntiPattern);
		add(btnQandA);
		add(statusLabel);
	}

	public void actionPerformed(ActionEvent e) {
		int result;
		String btnPressed = e.getActionCommand();
		System.out.println(btnPressed);
		
		if (btnPressed=="DPERS only" || btnPressed=="DPERS+AntiPattern") {
			chooser = new JFileChooser(); 
			chooser.setCurrentDirectory(new java.io.File("."));
			chooser.setDialogTitle(choosertitle);

			chooser.setFileSelectionMode(JFileChooser.DIRECTORIES_ONLY);
			chooser.setAcceptAllFileFilterUsed(false);
			//    
			if (chooser.showOpenDialog(this) == JFileChooser.APPROVE_OPTION) { 
				System.out.println("getCurrentDirectory(): " 
						+  chooser.getCurrentDirectory());
				System.out.println("getSelectedFile() : " 
						+  chooser.getSelectedFile());
				
				try {
					if (btnPressed=="DPERS only"){
						javaTotext.run(chooser.getSelectedFile());
					}else {
						/* the code for the antipattern project will be called here.
						 * Use a separate package for your development. You should
						 * take a file like the above line and output a String
						 * containing the recommended design pattern
						*/
					}
				} catch (Exception e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				} catch (Throwable e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
			}
			else {
				System.out.println("No Selection ");
			}
		}else if (btnPressed=="Q and A") {
			/* the code for the q and a project goes here.
			 * Call a package that starts with a JFrame consisting
			 * of your questions. Do your processing and just output a 
			 * String with a design pattern here.
			 */ 
			 
		}
	}

	public Dimension getPreferredSize(){
		return new Dimension(400, 100);
	}

	public static void main(String args[]) {
		JFrame frame = new JFrame("");
		ProjectChooser panel = new ProjectChooser();
		File file = new File("");
		frame.addWindowListener(new WindowAdapter() {public void windowClosing(WindowEvent e) {System.exit(0);}});
		frame.getContentPane().add(panel,"Center");
		frame.setSize(panel.getPreferredSize());
		frame.setVisible(true);
		setStatusLabel("Welcome to the DPERS Extension Project!\n");     
	}
}