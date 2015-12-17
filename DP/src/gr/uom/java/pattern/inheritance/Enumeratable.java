package gr.uom.java.pattern.inheritance;

import java.util.Enumeration;

import javax.swing.tree.DefaultMutableTreeNode;

public interface Enumeratable {

    public Enumeration getEnumeration();

    public int size();

    public DefaultMutableTreeNode getNode(String nodeName);
}
