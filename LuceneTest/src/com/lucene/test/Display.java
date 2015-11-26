package com.lucene.test;

import java.awt.*;
import java.awt.event.*;
import java.sql.SQLException;

import javax.swing.*;

public class Display extends JFrame {

	public Display(String resultsFor, String output) {
		setTitle(resultsFor);
		output = parseOutput(output);
		
		addWindowListener(new WindowAdapter()
		{
			public void windowClosing(WindowEvent e)
			{
				String[] args = {};
				try {
					LuceneTest.main(args);
				} catch (InstantiationException | IllegalAccessException | ClassNotFoundException | SQLException e1) {
					e1.printStackTrace();
				}
				e.getWindow().dispose();
			}
		});
		settingJPanel(output);
	}

	private void settingJPanel(String output) {
		setExtendedState(JFrame.MAXIMIZED_BOTH);
		Container contentPane = getContentPane();
		JScrollPane panelPane = settingTextArea(output);
		contentPane.add(panelPane);
	}

	private JScrollPane settingTextArea(String output) {
		JTextArea textArea = new JTextArea(output);
		textArea.setFont(new Font("Serif", Font.TRUETYPE_FONT, 16));
		textArea.setLineWrap(true);
		textArea.setWrapStyleWord(true);
		textArea.setAutoscrolls(true);
		textArea.setBackground(new Color(209,239,241));
		textArea.setEditable(false);

		JScrollPane panelPane = new JScrollPane(textArea);
		return panelPane;
	}

	private String parseOutput(String output) {
		try{
			output = output.replace("=", "");
			output = output.replace("::", ":");
			int index = output.indexOf("Start");
			String searchFor = output.substring(index-4);
			String searchTitle = output.substring(0, index-4);
			output = searchTitle + "\n" + searchFor;
			output = output.replace("Start Record", "Result:");
			output = output.replace("End Record", "");
			return output;
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
			return "No or Bad results";
		}
	}
}

