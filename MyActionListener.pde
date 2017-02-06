//何かアクションがあった時に実行されるクラス ex) ボタンを押す
class MyActionListener implements ActionListener {
  public void actionPerformed(ActionEvent e) {
    println(true);
    String cmd = e.getActionCommand();
    if ( cmd.equals("Add New Menu") ) {
      pane.remove(menubar);
      menubar.add( new JMenu(area.getText()) );
      pane.add(menubar);
    } else if ( cmd.equals("Add New Menu Item") ) {
      menubar.getMenu(0).add( new JMenuItem(area.getText()) );
    }
  }
}