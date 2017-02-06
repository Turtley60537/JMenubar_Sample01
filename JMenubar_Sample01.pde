import javax.swing.JMenuBar;
import javax.swing.JMenu;
import javax.swing.JMenuItem;
import javax.swing.*;

import java.awt.*;
import java.awt.event.*;
import java.awt.event.ActionListener;

JMenuBar menubar;

JTextArea area;
JLayeredPane pane;

JButton addMenuButton;
JButton addMenuItemButton;

void setup() {
  size(400, 200);

  Canvas canvas = (Canvas)       surface.getNative();
  pane          = (JLayeredPane) canvas.getParent().getParent();

  //上記二行わからないので申し訳程度のprintln()
  println( surface.getNative().getClass() );
  //class processing.awt.PSurfaceAWT$SmoothCanvasと表示される
  println( canvas.getParent().getParent().getClass() );
  //class javax.swing.JLayeredPaneと表示

  //メニューバーの初期設定
  menubar = new JMenuBar();
  menubar.add( new JMenu("File") );
  menubar.add( new JMenu("Menu") );
  menubar.setBounds(0, 0, width, 30);
  pane.add(menubar);

  //テキストエリアの初期設定
  area = new JTextArea("");
  area.setLineWrap     (true);
  area.setWrapStyleWord(true);
  JScrollPane scrollPane = new JScrollPane(area);
  scrollPane.setBounds(0, 30, width, height-60);
  pane.add(scrollPane);

  //ボタンの初期設定
  addMenuButton = new JButton("Add New Menu");
  addMenuButton.setBounds(0, height-30, width/2, 30);
  addMenuButton.addActionListener( new MyActionListener() );
  addMenuButton.setActionCommand ( "Add New Menu" );           //MyActionListenerでの判別に利用
  pane.add(addMenuButton);

  addMenuItemButton = new JButton("Add New Menu Item");
  addMenuItemButton.setBounds(width/2, height-30, width/2, 30);
  addMenuItemButton.addActionListener( new MyActionListener() );
  addMenuItemButton.setActionCommand ( "Add New Menu Item" );  //MyActionListenerでの判別に利用
  pane.add(addMenuItemButton);
}