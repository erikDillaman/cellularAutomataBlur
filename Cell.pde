class Cell
{
  float redAvg, greenAvg, blueAvg;
  color col;
  int idx, x, y, w, h;
  //ArrayList<PVector> coords;
  int RAD = 1;   // Used to skip over RAD amount of pixels in the neighborhood

  Cell(color col, int idx, int w, int h) {
    this.col = col;
    this.idx = idx;
    this.w = w;
    this.h = h;
    x = setX();
    y = setY();
    //coords = new ArrayList<PVector>();
  }

  int setX() {
    return (idx%w);
  }

  int setY() {
    return (idx/w);
  }

  int getX() {
    return x;
  }

  int getY() {
    return y;
  }  

  float getRedAvg() {
    return redAvg;
  }

  float getGreenAvg() {
    return greenAvg;
  }

  float getBlueAvg() {
    return blueAvg;
  }

  color getColor() {
    return col;
  }

  void setColor() {
    col = color(redAvg, greenAvg, blueAvg);
  }

  ArrayList<Integer> getIndices(int radius) {

    ArrayList<Integer> indices = new ArrayList<Integer>();
    // This will create a square radius
    for (int i = -radius*RAD; i <= radius*RAD; i += radius*RAD) {   // Y AXIS
      if ((y-radius*RAD) > 0 && (y+radius*RAD) < h) {     
        for (int j = -radius*RAD; j <= radius*RAD; j+= radius*RAD) {     // X AXIS
          if ((x-radius*RAD) > 0 && (x+radius*RAD) < w) {     

            int addMe = ((y+i)%height)*width + (x+j)%width;
            indices.add(addMe);
          }
        }
      }
    }
    return indices;
  }
}