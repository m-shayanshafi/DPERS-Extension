package gr.uom.java.pattern.gui;

import java.awt.BorderLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.BorderFactory;
import javax.swing.JDialog;
import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.JProgressBar;
import javax.swing.Timer;

public class ProgressBarDialog extends JDialog {
    private JProgressBar progressBar;
    private Timer timer;

    public ProgressBarDialog(JFrame owner, final LongTask task) {
        super(owner);

        progressBar = new JProgressBar(0, task.getLengthOfTask());
        progressBar.setValue(0);
        progressBar.setStringPainted(true);
        timer = new Timer(100, new ActionListener() {
            public void actionPerformed(ActionEvent evt) {
                progressBar.setValue(task.getCurrent());
                if (task.isDone()) {
                    timer.stop();
                    //setCursor(null); //turn off the wait cursor
                    dispose();
                }
            }
        });

        JPanel panel = new JPanel();
        panel.setBorder(BorderFactory.createCompoundBorder(
                        BorderFactory.createTitledBorder("detection progress..."),
                        BorderFactory.createEmptyBorder(5,5,5,5)));
        panel.add(progressBar, BorderLayout.CENTER);
        this.setContentPane(panel);
        this.setDefaultCloseOperation(JDialog.DO_NOTHING_ON_CLOSE);
        this.setLocationRelativeTo(owner);
        this.pack();
        this.setResizable(false);
        this.setVisible(true);

        //setCursor(Cursor.getPredefinedCursor(Cursor.WAIT_CURSOR));
        task.go();
        timer.start();
    }
}
