import de.bezier.guido.*;
int NUM_ROWS = 20; 
int NUM_COLS = 20;
int NUM_BOMBS = 100;
private MSButton[][] buttons; //2d array of minesweeper buttons
private ArrayList <MSButton> bombs; //ArrayList of just the minesweeper buttons that are mined

void setup ()
{
  size(400, 400);
  textAlign(CENTER, CENTER);

  // make the manager
  Interactive.make( this );
  bombs = new ArrayList<MSButton>(); 
  //your code to declare and initialize buttons goes here
  buttons = new MSButton[NUM_ROWS][NUM_COLS];
  for (int r = 0; r < NUM_ROWS; r++)
    for (int c = 0; c < NUM_COLS; c++)  
      buttons[r][c] = new MSButton(r, c);
  for (int b = 0; b < NUM_BOMBS; b++)
    setBombs();
  //System.out.println(isValid(NUM_ROWS, NUM_COLS));
}
public void setBombs()
{
  int row = (int)(Math.random()*NUM_ROWS);
  int col = (int)(Math.random()*NUM_COLS);
  if (!bombs.contains(buttons[row][col]))
    bombs.add(buttons[row][col]);
  System.out.println(row + "," + col);
}

public void draw ()
{
  background( 0 );
  if (isWon())
    displayWinningMessage();
}
public boolean isWon()
{
  //your code here
  return false;
}
public void displayLosingMessage()
{
  //your code here
}
public void displayWinningMessage()
{
  //your code here
}

public class MSButton
{
  private int r, c;
  private float x, y, width, height;
  private boolean clicked, marked;
  private String label;

  public MSButton ( int rr, int cc )
  {
    width = 400/NUM_COLS;
    height = 400/NUM_ROWS;
    r = rr;
    c = cc; 
    x = c*width;
    y = r*height;
    label = "";
    marked = clicked = false;
    Interactive.add( this ); // register it with the manager
  }
  public boolean isMarked()
  {
    return marked;
  }
  public boolean isClicked()
  {
    return clicked;
  }
  // called by manager

  public void mousePressed () 
  {
    clicked = true;
    //your code here
  }

  public void draw () 
  {    
    if (marked)
      fill(0);
    else if ( clicked && bombs.contains(this) ) 
      fill(255, 0, 0);
    else if (clicked)
      fill( 200 );
    else 
    fill( 100 );

    rect(x, y, width, height);
    fill(0);
    text(label, x+width/2, y+height/2);
  }
  public void setLabel(String newLabel)
  {
    label = newLabel;
  }
  public boolean isValid(int r, int c)
  {
    if (r>=0 || r < NUM_ROWS && c >=0 || c < NUM_COLS)
      return true;
    return false;
  }
  public int countBombs(int row, int col)
  {
    int numBombs = 0;
    if (isValid(row-1, col) && bombs.contains(buttons[row-1][col]))
      numBombs +=1;     
    System.out.println(numBombs);
    if (isValid(row+1, col) && bombs.contains(buttons[row+1][col]))
      numBombs +=1;
    if (isValid(row, col-1) && bombs.contains(buttons[row][col-1]))
      numBombs +=1;
    if (isValid(row, col+1) && bombs.contains(buttons[row][col+1]))
      numBombs +=1;
    if (isValid(row-1, col-1) && bombs.contains(buttons[row-1][col-1]))
      numBombs +=1;
    if (isValid(row-1, col+1) && bombs.contains(buttons[row-1][col+1]))
      numBombs +=1;
    if (isValid(row+1, col+1) && bombs.contains(buttons[row+1][col+1]))
      numBombs +=1;
    if (isValid(row+1, col-1) && bombs.contains(buttons[row+1][col-1]))
      numBombs +=1;
    System.out.println(numBombs);
    return numBombs;
  }
}