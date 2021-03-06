//this example shows how to manipulate an imported file
import colladaLoader.*;

ColladaLoader model;

float rotX = -0.6509995f;
float rotY = -0.52000004f;
int x = -15;
int y = 517;
float changeSize = 2.1501188f;


void setup()
{
      size(500, 500, P3D);
      //because we use the draw() methode from loader we set 2nd parameter to "this"
      //copy truck manually to processing's "data" folder first
      model = ColladaLoader.getInstance("./data/truck5_8.dae", this);
      textFont(createFont("Arial", 20));      
      frameRate(10);
}

void draw()
{
      background(16);

      lights();
      
      translate(x, y);
      rotateX(rotY);
      rotateY(rotX);
      scale(changeSize);
      
      model.draw(); 
      

       fill(255,0,0);
       text("press 'c' key", 60,-50,-100);      
}
//this methode changes colors of model
void keyPressed()
    {
      if (key == 'c')
      {

          for (Triangle tri : model.getTriangles())
          {

              if (!tri.containsTexture)
              {
                  float red = tri.colour.red;
                  float green = tri.colour.green;
                  float blue = tri.colour.blue;

                  tri.colour.red = blue;
                  tri.colour.green = red;
                  tri.colour.blue = green;

              } 


          }
      }

    }




