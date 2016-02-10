float OG;
float FG;
int position;
int SRM;
int IBU;
float GperL;
Float ABV;
XML SRMxml;
color SRMcol;
String SRMval;
color SRMrgb;
void setup(){
  size(500,500);                      //loads SRM.xml which is a reference for turning
  SRMxml = loadXML("SRM.xml");        //into RGB.  Also creates the first beer
  createBeer();
  textSize(15);
  textAlign(CENTER);
  fill(0);
}
void draw(){
  background(255);
  drawSpecs(40);
}
void drawSpecs(int space){              //creates each line in the program, could be
  position=0;                           //replaced with a pop matrix but not sure how.
  text("Original Gravity:"+nf(OG,1,3),0,position,width,position+20);    //variable space indicates how big of a gap
  position+=space;                                                      //between each line
  text("Final Gravity:"+nf(FG,1,3),0,position,width,position+20);
  position+=space;
  text("ABV:"+nf(ABV,1,1)+"%",0,position,width,position+20);
  position+=space;
  text("SRM:"+SRMval,0,position,width,position+20);
  position+=space;
  text("IBU:"+IBU,0,position,width,position+20);
  position+=space;
  text("Aroma Hops:"+nf(GperL,1,1)+"g/L",0,position,width,position+20);
}
  
void createBeer(){
  OG = random(0.070)+1.020;             //creates random values for the beer
  FG = (OG-1)*(0.3)+1;           //FG is based off of 70% attenuation
  ABV = (OG-FG)*131;
  //SRM = int(random(400));
  SRM++;
  IBU = int(random(80)+10);
  GperL = random(20);
  println(SRM);
  println(SRMxml.getChild(SRM));//.getChild("SRM"));
  //SRMcol=color(SRMxml.getChild(SRM).getChild("RGB").getContent());
}
void mouseClicked(){        //creates a new beer on mouseclick, forgetting the old one
  createBeer();
}
