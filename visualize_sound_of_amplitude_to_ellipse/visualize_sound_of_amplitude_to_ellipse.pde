/*****
< Explain of this code >
This program visualize amplitude of sounds to radius of ellipse. 

< environment >
Processing version 3.2.3

< Reference >
http://r-dimension.xsrv.jp/classes_j/minim/
*****/


import ddf.minim.*;  //Import minim library

Minim minim; // Declar minim instance of Minim type
AudioInput in; // var for audio input
int waveH = 1000; // Height of amplitude
 
void setup()
{
  size(512, 512);
  frameRate(30);
  minim = new Minim(this);  // Initialize minim instance
  // Buffer which is memory space. Set variable "in" to use mic input
  in = minim.getLineIn(Minim.STEREO, 512);
}
 
 
void draw()
{
  background(0);
  noStroke();
  // Draw wave
  // waveH * 1000 : To see height of amplitude easily.
  
  for(int i = 0; i < in.bufferSize()-1; i++)
  {
    float x = random(0,width);
    float y = random(0,height);
    float w = random(1,50);
    fill(random(0,255),random(0,255),random(0,255));
    // Set ellipse radius to height of amplitude
    ellipse(x, y, in.left.get(i)*waveH, in.right.get(i)*waveH);
  }
}
 
void stop()
{
  in.close();
  minim.stop();
  super.stop();
}