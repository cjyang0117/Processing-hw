// import everything necessary to make sound.
import ddf.minim.*;
import ddf.minim.ugens.*;

// create all of the variables that will need to be accessed in
// more than one methods (setup(), draw(), stop()).
Minim minim;
AudioOutput out;
Midi2Hz midi2Hz;
// Every instrument must implement the Instrument interface so 
// playNote() can call the instrument's methods.
class ToneInstrument implements Instrument
{
  // create all variables that must be used throughout the class
  Oscil sineOsc;
  Damp  damp;
  AudioOutput out;

  // constructors for this instrument  
  ToneInstrument(float note, float amplitude, AudioOutput output)
  {
    // equate class variables to constructor variables as necessary
    out = output;
    midi2Hz = new Midi2Hz();
    // create new instances of the UGen objects for this instrument
    Line line = new Line( 1.0, note, note);
    sineOsc = new Oscil( 440, amplitude, Waves.TRIANGLE );
    damp = new Damp( 0.001, 0.8 );
    line.patch(midi2Hz).patch( sineOsc.frequency);
    // patch everything together up to the final output
    sineOsc.patch( damp );
  }
  
  // every instrument must have a noteOn( float ) method
  void noteOn(float dur)
  {
    // set the damp time from the duration given to the note
    damp.setDampTimeFromDuration( dur );
    // activate the damp
    damp.activate();
    // and finally patch the damp to the output
    damp.patch( out );
  }
  
  // every instrument must have a noteOff() method
  void noteOff()
  {
    // the damp time of a damp can be changed after damp has been started,
    // so unpatching after the entire damp is over is useful.
    damp.unpatchAfterDamp( out );
  }
}

void setup()
{
  size(400, 400);
  background( 0 );
  PFont pf = createFont("TimesRoman", 100);
  textFont(pf);
}
float pt = millis();
int sec = 0;
String time="";
boolean START=false;
void draw()
{
  if(START && sec != 0){
     if( millis() - pt > 1000 ){
       background( 0 );
       sec -= 1;
       pt = millis();
       text(sec, width/2-50, height/2+50);
     }
     if( sec == 0 ) {
         play();
         START=false;
         time="";
         //noLoop();
         background(color(255, 0, 0));
         text(0, width/2-50, height/2+50);
     }
  }   
}
void keyPressed(){
  if(!START){
    if(key == BACKSPACE){
       if(time.length()>0){
          background( 0 );
          time=time.substring(0, time.length()-1);
          text(time, width/2-50, height/2+50);
       }
    }else if(time.length()<3){
      try{
        Integer.parseInt(String.valueOf(key));
        time=time+key;
        sec=Integer.parseInt(time);
        background( 0 );
        text(time, width/2-50, height/2+50);
      }catch(Exception e){
        //text("請輸入數字", 10, 10); 
      }
    }
    if(key == ENTER){
      START=true; 
      time="";
    }
  }else if(key == 's'){
    START=false;
  }
}
void play(){
  minim = new Minim( this );
  out = minim.getLineOut( Minim.MONO, 2048 );
  
  // pause time when adding a bunch of notes at once
  out.pauseNotes();
  
  // one can add an offset to all notes until the next noteOffset
  out.setNoteOffset( 2f );

  // one can set the tempo of the piece in beats per minute, too
  out.setTempo( 70f );

  out.playNote(0.00, 0.5, new ToneInstrument( 64, 1.0, out));
  out.playNote(0.5, 0.5, new ToneInstrument( 64, 1.0, out));
  out.playNote(1.0, 0.5, new ToneInstrument( 65, 1.0, out));
  out.playNote(1.5, 0.5, new ToneInstrument( 67, 1.0, out));

  out.playNote(2.0, 0.5, new ToneInstrument( 67, 1.0, out));
  out.playNote(2.5, 0.5, new ToneInstrument( 65, 1.0, out));
  out.playNote(3.0, 0.5, new ToneInstrument( 64, 1.0, out));
  out.playNote(3.5, 0.5, new ToneInstrument( 62, 1.0, out));

  float b = 4.0;
  out.playNote(b+0.00, 0.5, new ToneInstrument( 60, 1.0, out));
  out.playNote(b+0.5, 0.5, new ToneInstrument( 60, 1.0, out));
  out.playNote(b+1.0, 0.5, new ToneInstrument( 62, 1.0, out));
  out.playNote(b+1.5, 0.5, new ToneInstrument( 64, 1.0, out));

  out.playNote(b+2.0, 0.75, new ToneInstrument( 64, 1.0, out));
  out.playNote(b+2.75, 0.25, new ToneInstrument( 62, 1.0, out));
  out.playNote(b+3.0, 1.0, new ToneInstrument( 62, 1.0, out));
  
  /*b = b+4.0;
  out.playNote(b+0.00, 0.5, new ToneInstrument( 64, 1.0, out));
  out.playNote(b+0.5, 0.5, new ToneInstrument( 64, 1.0, out));
  out.playNote(b+1.0, 0.5, new ToneInstrument( 65, 1.0, out));
  out.playNote(b+1.5, 0.5, new ToneInstrument( 67, 1.0, out));

  out.playNote(b+2.0, 0.5, new ToneInstrument( 67, 1.0, out));
  out.playNote(b+2.5, 0.5, new ToneInstrument( 65, 1.0, out));
  out.playNote(b+3.0, 0.5, new ToneInstrument( 64, 1.0, out));
  out.playNote(b+3.5, 0.5, new ToneInstrument( 62, 1.0, out));
  
  b = b+4.0;
  out.playNote(b+0.00, 0.5, new ToneInstrument( 60, 1.0, out));
  out.playNote(b+0.5, 0.5, new ToneInstrument( 60, 1.0, out));
  out.playNote(b+1.0, 0.5, new ToneInstrument( 62, 1.0, out));
  out.playNote(b+1.5, 0.5, new ToneInstrument( 64, 1.0, out));

  out.playNote(b+2.0, 0.75, new ToneInstrument( 62, 1.0, out));
  out.playNote(b+2.75, 0.25, new ToneInstrument( 60, 1.0, out));
  out.playNote(b+3.0, 1.0, new ToneInstrument( 60, 1.0, out));
  
  b = b+4.0;
  out.playNote(b, 0.5, new ToneInstrument( 62, 1.0, out));
  out.playNote(b+0.5, 0.5, new ToneInstrument( 62, 1.0, out));
  out.playNote(b+1.0, 0.5, new ToneInstrument( 64, 1.0, out));
  out.playNote(b+1.5, 0.5, new ToneInstrument( 60, 1.0, out));
  
  out.playNote(b+2.0, 0.5, new ToneInstrument( 62, 1.0, out));
  out.playNote(b+2.5, 0.25, new ToneInstrument( 64, 1.0, out));
  out.playNote(b+2.75, 0.25, new ToneInstrument( 65, 1.0, out));
  out.playNote(b+3.0, 0.5, new ToneInstrument( 64, 1.0, out));
  out.playNote(b+3.5, 0.5, new ToneInstrument( 60, 1.0, out));

  b = b+4.0;
  out.playNote(b+0.00, 0.5, new ToneInstrument( 62, 1.0, out));
  out.playNote(b+0.5, 0.25, new ToneInstrument( 64, 1.0, out));
  out.playNote(b+0.75, 0.25, new ToneInstrument( 65, 1.0, out));
  out.playNote(b+1.0, 0.5, new ToneInstrument( 64, 1.0, out));
  out.playNote(b+1.5, 0.5, new ToneInstrument( 62, 1.0, out));

  out.playNote(b+2.0, 0.5, new ToneInstrument( 60, 1.0, out));
  out.playNote(b+2.5, 0.5, new ToneInstrument( 62, 1.0, out));
  out.playNote(b+3.0, 0.5, new ToneInstrument( 55, 1.0, out));
  out.playNote(b+3.5, 0.5, new ToneInstrument( 64, 1.0, out));
 
  b = b+4.0;
  out.playNote(b, 0.5, new ToneInstrument( 64, 1.0, out));
  out.playNote(b+0.5, 0.5, new ToneInstrument( 64, 1.0, out));
  out.playNote(b+1.0, 0.5, new ToneInstrument( 65, 1.0, out));
  out.playNote(b+1.5, 0.5, new ToneInstrument( 67, 1.0, out));
  
  out.playNote(b+2.0, 0.5, new ToneInstrument( 67, 1.0, out));
  out.playNote(b+2.5, 0.5, new ToneInstrument( 65, 1.0, out));
  out.playNote(b+3.0, 0.5, new ToneInstrument( 64, 1.0, out));
  out.playNote(b+3.5, 0.5, new ToneInstrument( 62, 1.0, out));
  
  b = b+4.0;
  out.playNote(b, 0.5, new ToneInstrument( 60, 1.0, out));
  out.playNote(b+0.5, 0.5, new ToneInstrument( 60, 1.0, out));
  out.playNote(b+1.0, 0.5, new ToneInstrument( 62, 1.0, out));
  out.playNote(b+1.5, 0.5, new ToneInstrument( 64, 1.0, out));
  
  out.playNote(b+2.0, 0.75, new ToneInstrument( 62, 1.0, out));
  out.playNote(b+2.75, 0.25, new ToneInstrument( 60, 1.0, out));
  out.playNote(b+3.0, 1.0, new ToneInstrument( 60, 1.0, out));
  
  // 低音伴奏部分
  out.playNote(0.0, 2.0, new ToneInstrument( 48, 1.0, out));
  out.playNote(0.0, 2.0, new ToneInstrument( 55, 1.0, out));
  
  out.playNote(2.0, 2.0, new ToneInstrument( 47, 1.0, out));
  out.playNote(2.0, 2.0, new ToneInstrument( 55, 1.0, out));
  
  b = 4.0;
  out.playNote(b+0.0, 1.0, new ToneInstrument( 52, 1.0, out));
  out.playNote(b+0.0, 1.0, new ToneInstrument( 55, 1.0, out));
  out.playNote(b+1.0, 0.5, new ToneInstrument( 50, 1.0, out));
  out.playNote(b+1.5, 0.5, new ToneInstrument( 48, 1.0, out));
  
  out.playNote(b+2.0, 2.0, new ToneInstrument( 55, 1.0, out));
  
  b = b+4.0;
  out.playNote(b+0.0, 2.0, new ToneInstrument( 48, 1.0, out));
  out.playNote(b+0.0, 2.0, new ToneInstrument( 55, 1.0, out));
  
  out.playNote(b+2.0, 2.0, new ToneInstrument( 47, 1.0, out));
  out.playNote(b+2.0, 2.0, new ToneInstrument( 55, 1.0, out));
  
  b = b+4.0;
  out.playNote(b+0.0, 1.0, new ToneInstrument( 52, 1.0, out));
  out.playNote(b+0.0, 1.0, new ToneInstrument( 55, 1.0, out));
  out.playNote(b+1.0, 0.5, new ToneInstrument( 50, 1.0, out));
  out.playNote(b+1.5, 0.5, new ToneInstrument( 48, 1.0, out));
  
  out.playNote(b+2.0, 0.75, new ToneInstrument( 53, 1.0, out));
  out.playNote(b+2.0, 0.75, new ToneInstrument( 55, 1.0, out));
  out.playNote(b+2.75, 0.25, new ToneInstrument( 52, 1.0, out));
  out.playNote(b+2.75, 0.25, new ToneInstrument( 55, 1.0, out));
  out.playNote(b+3.0, 1.0, new ToneInstrument( 52, 1.0, out));
  out.playNote(b+3.0, 1.0, new ToneInstrument( 55, 1.0, out));
  
  b = b+4.0;
  out.playNote(b+0.0, 1.0, new ToneInstrument( 47, 1.0, out));
  out.playNote(b+0.0, 1.0, new ToneInstrument( 55, 1.0, out));
  out.playNote(b+1.0, 1.0, new ToneInstrument( 48, 1.0, out));
  out.playNote(b+1.0, 1.0, new ToneInstrument( 55, 1.0, out));
  
  out.playNote(b+2.0, 1.0, new ToneInstrument( 47, 1.0, out));
  out.playNote(b+2.0, 1.0, new ToneInstrument( 55, 1.0, out)); 
  out.playNote(b+3.0, 1.0, new ToneInstrument( 48, 1.0, out));
  out.playNote(b+3.0, 1.0, new ToneInstrument( 55, 1.0, out));
  
  b = b+4.0;
  out.playNote(b+0.0, 1.0, new ToneInstrument( 47, 1.0, out));
  out.playNote(b+0.0, 1.0, new ToneInstrument( 55, 1.0, out));  
  out.playNote(b+1.0, 1.0, new ToneInstrument( 56, 1.0, out));
  
  out.playNote(b+2.0, 0.5, new ToneInstrument( 57, 1.0, out));
  out.playNote(b+2.5, 0.5, new ToneInstrument( 54, 1.0, out)); 
  out.playNote(b+3.0, 1.0, new ToneInstrument( 55, 1.0, out)); 
  
  b = b+4.0;
  out.playNote(b+0.0, 2.0, new ToneInstrument( 48, 1.0, out));
  out.playNote(b+0.0, 2.0, new ToneInstrument( 55, 1.0, out));  
  
  out.playNote(b+2.0, 2.0, new ToneInstrument( 47, 1.0, out));
  out.playNote(b+2.0, 2.0, new ToneInstrument( 55, 1.0, out));   
  
  b = b+4.0;
  out.playNote(b+0.0, 1.0, new ToneInstrument( 52, 1.0, out));
  out.playNote(b+0.0, 1.0, new ToneInstrument( 55, 1.0, out));
  out.playNote(b+1.5, 1.0, new ToneInstrument( 50, 1.0, out));
  out.playNote(b+2.0, 1.0, new ToneInstrument( 48, 1.0, out));
  
  out.playNote(b+2.0, 0.75, new ToneInstrument( 53, 1.0, out));
  out.playNote(b+2.0, 0.75, new ToneInstrument( 55, 1.0, out));
  out.playNote(b+2.75, 0.25, new ToneInstrument( 52, 1.0, out));
  out.playNote(b+2.75, 0.25, new ToneInstrument( 55, 1.0, out));
  out.playNote(b+3.0, 1.0, new ToneInstrument( 52, 1.0, out));
  out.playNote(b+3.0, 1.0, new ToneInstrument( 55, 1.0, out)); */ 
  // resume time after a bunch of notes are added at once
  out.resumeNotes();  
}