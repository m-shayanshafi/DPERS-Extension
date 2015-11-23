package com.lucene.test;

import java.awt.*;
import java.awt.event.*;
import javax.swing.*;

	class Display extends JFrame {
		
	  public Display(String s, String output) {
		  
		setTitle(s);
		setExtendedState(JFrame.MAXIMIZED_BOTH);
		
		output = output.replace("=", "");
		output = output.replace("::", ":");
		
		int index = output.indexOf("Start");
		String searchFor = output.substring(index-4);
		String searchTitle = output.substring(0, index-4);
		output = searchTitle + "\n" + searchFor;
		
		output = output.replace("Start Record", "Result:");
		output = output.replace("End Record", "");
		
		// Window Listeners
		addWindowListener(new WindowAdapter() {
		  public void windowClosing(WindowEvent e) {
			System.exit(0);
		  } //windowClosing
		}); //addWindowLister
	
		Container contentPane = getContentPane();
	
		JLabel searchLabel = new JLabel(searchTitle);
		
		JTextArea textArea = new JTextArea(output);
		    textArea.setFont(new Font("Serif", Font.TRUETYPE_FONT, 16));
		    textArea.setLineWrap(true);
	        textArea.setWrapStyleWord(true);
	        //textArea.setBounds(100, 100, 1024, 1246);
	        textArea.setAutoscrolls(true);
	        textArea.setBackground(new Color(209,239,241));
	        textArea.setEditable(false);
	        
		    JScrollPane panelPane = new JScrollPane(textArea);
		    panelPane.add(searchLabel);
		    contentPane.add(panelPane);
	  }
	}
	
	