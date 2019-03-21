PImage img;
Cell[] cellArray;
int RAD = 1;  // The width / height for neighborhood checking
int REPEATS = 10;
boolean processed = false;

void setup()
{
  surface.setResizable(true);
  img = loadImage("image.jpg");
  surface.setSize(img.width, img.height);
  cellArray = new Cell[img.width*img.height];
}

void draw()
{
  image(img, 0, 0);
}

void keyPressed()
{
  if (key == 's'){
    saveFrame();
  }
  println("Processing...");
  if (key == ' ') {
    for (int l = 0; l < REPEATS; l++) {
      img.loadPixels();
      for (int i = 0; i < img.pixels.length; i++) {
        color C = color(img.pixels[i]);
        Cell cell = new Cell(C, i, width, height);
        cellArray[i] = cell;
      }

      for (Cell cell : cellArray) {
        ArrayList<Integer> indices = new ArrayList<Integer>();
        indices = cell.getIndices(RAD);
        for (int test : indices) {
          cell.redAvg += red(img.pixels[test]);
          cell.greenAvg += green(img.pixels[test]);
          cell.blueAvg += blue(img.pixels[test]);
        }
        if (cell.idx == 18745) println(cell.redAvg, cell.greenAvg, cell.blueAvg);
        cell.redAvg /= indices.size();
        cell.greenAvg /= indices.size();
        cell.blueAvg /= indices.size();
        img.pixels[cell.idx] = color(cell.redAvg, cell.greenAvg, cell.blueAvg);
      } 
      if (l+1 == REPEATS) println("Processing FINISHED.");
      img.updatePixels();
    }
  }
}
