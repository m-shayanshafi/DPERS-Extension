package gr.uom.java.pattern.gui;

import gr.uom.java.pattern.PatternInstance;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.Iterator;
import java.util.Vector;
import java.sql.SQLException;
import java.util.logging.ConsoleHandler;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.swing.*;
import javax.swing.tree.DefaultMutableTreeNode;
import javax.swing.tree.DefaultTreeModel;

public class MatrixInternalFrame extends JInternalFrame {
    //private DefaultTableModel model;
	private JTree patternInstanceTree;

    public MatrixInternalFrame(String title) {
		super(title,true,true,true,true);
		/*
        String[] columnNames = {"Pattern", "Instances", "Classes"};
        model = new DefaultTableModel(columnNames, 0) {
            public boolean isCellEditable(int row, int col) {
                return col == 2;
            }
        };
        JTable table = new JTable(model) {
            public TableCellRenderer getCellRenderer(int row, int column) {
				TableColumn tableColumn = getColumnModel().getColumn(column);
				TableCellRenderer renderer = tableColumn.getCellRenderer();
				if (renderer == null) {
					Class c = getColumnClass(column);
					if( c.equals(Object.class) ) {
						Object o = getValueAt(row,column);
						if( o != null )
							c = getValueAt(row,column).getClass();
					}
					renderer = getDefaultRenderer(c);
				}
				return renderer;
			}

            public TableCellEditor getCellEditor(int row, int column) {
				TableColumn tableColumn = getColumnModel().getColumn(column);
				TableCellEditor editor = tableColumn.getCellEditor();
				if (editor == null) {
					Class c = getColumnClass(column);
					if( c.equals(Object.class) ) {
						Object o = getValueAt(row,column);
						if( o != null )
							c = getValueAt(row,column).getClass();
					}
					editor = getDefaultEditor(c);
				}
				return editor;
			}
        };
        table.setDefaultEditor(JComponent.class, new JComponentCellEditor());
        table.setDefaultRenderer(JComponent.class, new TableCellRenderer() {
            public Component getTableCellRendererComponent(JTable table, Object value,
			boolean isSelected, boolean hasFocus, int row, int column) {
			    return (JComponent)value;
		    }
	    });
        table.getColumnModel().getColumn(0).setMinWidth(160);
        table.getColumnModel().getColumn(0).setMaxWidth(160);
        table.getColumnModel().getColumn(1).setMinWidth(60);
        table.getColumnModel().getColumn(1).setMaxWidth(60);
        JScrollPane scrollPane = new JScrollPane(table);
 		*/
		this.patternInstanceTree = new JTree(new DefaultMutableTreeNode());
		
		JScrollPane scrollPane = new JScrollPane(patternInstanceTree);
        this.setContentPane(scrollPane);
		this.setVisible(true);
		this.setLocation(0,0);
	}
    /*
    public void addRow(String patternName, JComboBox comboBox) {
        model.addRow(new Object[] {patternName, comboBox.getItemCount(), comboBox} );
    }
    */
    //Natasha Khan
    public void populateDBwithPattern(PatternInstance.Entry entry, String patternName) throws Exception {
    	
    	String roleName = entry.getRoleName();
    	String elementName = entry.getElementName();
    	int patternID = 0;
    	int patternInstanceID = 0;
    	PreparedStatement insertStatement;
    	Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/designpatternrepo","root","");
    	PreparedStatement getStatement1 = con.prepareStatement("select * from patterns where name = ?");
    	getStatement1.setString(1, patternName);
    	ResultSet result1 = getStatement1.executeQuery();
    	while(result1.next()){
    		patternID=result1.getInt(2);
    	}
    	
    	PreparedStatement getStatement2 = con.prepareStatement("select patternInstanceID from patterninstance where patternID = ?");
    	getStatement2.setInt(1, patternID);
    	ResultSet result2 = getStatement2.executeQuery();
    	while(result2.next()){
    		patternInstanceID=result2.getInt(1);
    	}
    	
    	if(roleName.contains("()")){
    	roleName.replace("()", "");
    	String element[] = elementName.split(":");
    	insertStatement =con.prepareStatement("INSERT INTO `methodnames` (`patternInstanceID`, `roleName`, `methodName`, `className`) VALUES (?,?,?,?);");
    	insertStatement.setInt(1, patternInstanceID);
    	insertStatement.setString(2, roleName.replace("()", ""));
    	insertStatement.setString(3, element[2].replace("()", ""));
    	insertStatement.setString(4, element[0]);
    	}
    	else{
    		insertStatement =con.prepareStatement("INSERT INTO `classnames` (`patternInstanceID`, `roleName`, `className`) VALUES (?,?,?);");
    		insertStatement.setInt(1, patternInstanceID);
        	insertStatement.setString(2, roleName);
        	insertStatement.setString(3, elementName);
    	}
    	
    	
    	int result = insertStatement.executeUpdate();
    	System.out.print(result);
    	con.close();
    	
    }
    public void addPatternNode(String patternName, Vector<PatternInstance> instances) throws Exception {
    	DefaultMutableTreeNode parent = new DefaultMutableTreeNode(patternName);
    	int counter = 1;
    	for(PatternInstance instance : instances) {
    		DefaultMutableTreeNode instanceChild = new DefaultMutableTreeNode("instance " + counter);
    		parent.add(instanceChild);
    		Iterator<PatternInstance.Entry> entryIterator = instance.getRoleIterator();
    		while(entryIterator.hasNext()) {
    			PatternInstance.Entry entry = entryIterator.next();
    			DefaultMutableTreeNode entryChild = new DefaultMutableTreeNode(entry);
    			instanceChild.add(entryChild);
    			populateDBwithPattern(entry,patternName);
    			
    		}
    		counter++;
    	}
    	DefaultMutableTreeNode root = (DefaultMutableTreeNode)patternInstanceTree.getModel().getRoot();
    	root.add(parent);
    	((DefaultTreeModel)patternInstanceTree.getModel()).reload();
    }
}