package DPERS.testing.testResults.generator;

import java.awt.Dimension;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import java.io.File;

import javax.swing.JButton;
import javax.swing.JFileChooser;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;




public class DirectoryChooser extends JPanel
implements ActionListener {
	JButton go;

	JFileChooser chooser;
	public static JLabel statusLabel;
	
	String choosertitle;

	public static void setStatusLabel(String s)
	{
		statusLabel.setText(s);
	}
	public DirectoryChooser() {
		go = new JButton("Please select the source folder of java files!!");
		go.addActionListener(this);	
		statusLabel= new JLabel();
		add(statusLabel);
		add(go);       
	}

	public void actionPerformed(ActionEvent e) {
		int result;

		chooser = new JFileChooser(); 
		chooser.setCurrentDirectory(new java.io.File("."));
		chooser.setDialogTitle(choosertitle);
		chooser.setFileSelectionMode(JFileChooser.DIRECTORIES_ONLY);
		//
		// disable the "All files" option.
		//
		chooser.setAcceptAllFileFilterUsed(false);
		//    
		if (chooser.showOpenDialog(this) == JFileChooser.APPROVE_OPTION) { 
			System.out.println("getCurrentDirectory(): " 
					+  chooser.getCurrentDirectory());
			System.out.println("getSelectedFile() : " 
					+  chooser.getSelectedFile());
			try {
				RetrievalSessionsSimulator.run(chooser.getSelectedFile());
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
	}

	public Dimension getPreferredSize(){
		return new Dimension(400, 100);
	}

	public static void main(String args[]) {
		JFrame frame = new JFrame("");
		DirectoryChooser panel = new DirectoryChooser();
		File file = new File("");
		frame.addWindowListener(new WindowAdapter() {public void windowClosing(WindowEvent e) {System.exit(0);}});
		frame.getContentPane().add(panel,"Center");
		frame.setSize(panel.getPreferredSize());
		frame.setVisible(true);
		setStatusLabel("Welcome!");     
	}
}