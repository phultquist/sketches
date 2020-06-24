import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class maker extends PApplet {

// Reference 1: http: // forum.processing.org/topic/help-with-dialog-setup#25080000001811353
// Reference 2L https://forum.processing.org/two/discussion/9562/simple-choose-your-own-adventure
// rest written by Patrick Hultquist
// dialog done by Ben Weber, Eric Pan, Teodor
 
DialogLine[] dialogLines =
{ 
  new DialogLine("0",
  "You're tired and you go to bed after seeing the creature open his yellow eye. You're frustrated and its already one in the morning. Your eyes have a hard time staying open.",
  new Animation(),
  "Go to bed#7"),
  new DialogLine("1",
    "You stay quiet and Justine is convicted and then killed for the crime. This causes you an insane amount of grief and you begin to fall ill again. You go to the mountains in order to relax and heal. While in the mountains, you see the monster",
    new Animation(new ImageDisplay("monster.png", 250,250,100,142)),
    "Attempt to kill the monster for killing William#30",
    "Listen to what the monster has to say#2"),
  new DialogLine("2", 
    "The monster admits to the murder of William but asks for understanding. The monster says that he was trying to hurt you by hurting William because he was mad at being created and because he is so lonely. Because of his loneliness, the monster begs you to make a female monster for him.", 
    new Animation(
      new ImageDisplay("monster.png", 200,250,100,142)), 
    "Accept to creating the female monster#3", 
    "Decline#5"), 
  new DialogLine("3", 
    "You accept and travel to the U.K. with Henry in order to do research. You then leave Henry and goes to a secluded island to create the monster. One night when getting close to finishing the new monster, you sees the monster looking in at your work with a hideous smile on his face.", 
    new Animation(
      new ImageDisplay("monster.png", 200,250,100,142)), 
    "Continue to create the monster#15", 
    "Destroy your work in terror#4"),
  new DialogLine("4", 
    "The monster sees you destroy your work and vows revenge. He says that he will be with you on your wedding night. He also murders Henry Clerval on the mainland and frames you for it. You are held in prison for three months and grow very sick before being exonerated and returning to Geneva with your father. You return home.", 
    new Animation(
      new ImageDisplay("monster.png", 200,250,100,142)), 
    "Marry Elizabeth despite the monster’s threat#8", //DEAD END
    "Call off the wedding in fear#9"), 
  new DialogLine("5", 
    "The monster is extremely mad and does not understand the reasoning for the hatred his creator has for him. The monster extends this hatred to all people related to Victor and then by extension, all humans. The monster begins to attack you (“make me a mate or I will destroy you”)", 
    new Animation(
      new ImageDisplay("monster.png", 200,250,100,142)), 
    "Try to kill the monster#6",
    "Rush home and try to hide all loved ones#14"), 
  new DialogLine("6", 
    "The monster is stronger and more powerful than you and rips your arms off and beats you to death with your arms. You die..", 
    new Animation(
      new ImageDisplay("monster.png", 200,250,100,142), 
      new ImageDisplay("bed.png", 280,275,65,125), 
      new ImageDisplay("victor.png", 250,250,125,125)), 
    "End Game#99"), 
  new DialogLine("7", 
    "You wake up to see the monster staring at you.", 
    new Animation(
      new ImageDisplay("monster.png", 200,250,100,142), 
      new ImageDisplay("bed.png", 280,275,65,125), 
      new ImageDisplay("victor.png", 250,250,125,125)), 
    "Run out of the house#40", 
    "Stay and interact with the monster#41" ), 
  new DialogLine("8",  //Dead end
    "You marry Elizabeth anyway and on your wedding night you fear that you will be killed so you send Elizabeth away and prepare to fight the monster alone. The monster, however, doesn’t attack you but instead attacks and kills Elizabeth. You return home and your father also dies.", 
    new Animation(
      new ImageDisplay("monster.png", 200,250,100,142)), 
    "Devote your life to finding and killing the monster#10", 
    "Stay home and try to find purpose in your life#11"), 
  new DialogLine("9", //Dead End
    "Elizabeth thinks that she is bringing you despair and that you hate her so you begin to drift apart from each other despite your mother’s wish to be married. A few years later you begin to think that you could get married safely and the monster has to die.", 
    new Animation(
      new ImageDisplay("monster.png", 200,250,100,142)), 
    "Not risk Elizabeth’s safety and again choose not to get married#13", //DEAD END 
    "Marry Elizabeth hoping that it has been long enough#12"), 
  new DialogLine("10", 
    "You chase the monster using hints and clues and follow him all the way to the Arctic and you almost freeze to death. You are then rescued by Walton before finally dying on Walton’s ship. The End. ", 
    new Animation(
      new ImageDisplay("monster.png", 200,250,100,142)), 
    "End Game#99"),
  new DialogLine("11", 
    "You spend years without purpose going through the motions of life and barely hanging on. You are lonely and your life is terrible. You have no friends, no family, and nobody cares about you. You die and nobody comes to your funeral.", 
    new Animation(
      new ImageDisplay("monster.png", 200,250,100,142)), 
    "End Game#99"),
  new DialogLine("12", 
    "You reach out to Elizabeth and get married just like your mother’s wishes. You are worried the whole day and night about your monster. As you and Elizabeth go to bed that night, the monster comes and kills you both. You die.", 
    new Animation(
      new ImageDisplay("monster.png", 200,250,100,142)), 
    "End Game#99"), 
  new DialogLine("13", 
    "You choose again to not marry Elizabeth but then after a few more years, you regret not marrying her. You try to reach out to her but she has married another man and has two kids. You continue to live alone and eventually die of loneliness. You die. Nobody comes to your funeral", 
    new Animation(
      new ImageDisplay("monster.png", 200,250,100,142)), 
    "End Game#99"), 
  new DialogLine("14", 
    "You rush home and take Elizabeth, your father, and the rest of your family away and into hiding. The monster goes on a killing rampage trying to find you and kills millions of people before finally finding you and killing you and your family. You die. Most of the world dies.", 
    new Animation(
      new ImageDisplay("monster.png", 200,250,100,142)), 
    "End Game#99"), 
  new DialogLine("15", 
    "You create the mate for the monster and they both leave and you don’t hear from them or about them for months. Life is going well. Eventually, the monster and his mate return to ask you if they would be able to conceive a child. You knows that it is indeed possible.", 
    new Animation(
      new ImageDisplay("monster.png", 200,250,100,142)), 
    "Tell them that it is possible despite the possibility of them continuing to reproduce and creating a race more powerful than humans#16", 
    "Lie to them and say it is impossible#17"),
  new DialogLine("16", 
    "They go off and conceive children who then continue to reproduce and reproduce and within a few generations there are hundreds of the monster, they are known to a lot of people, and they have their own small town. You eventually marry Elizabeth and have kids but live in constant fear of the monsters you created", 
    new Animation(
      new ImageDisplay("monster.png", 200,250,100,142)), 
    "End Game#99"),
  new DialogLine("17", 
    "You lie to them and say that it is impossible for them to conceive. They really want a child, however, and so they ask you to create one for them.", 
    new Animation(
      new ImageDisplay("monster.png", 200,250,100,142)), 
    "Create the child and hope that it is the last thing you are asked to create#28", 
    "Reject their request#18"),
  new DialogLine("18", 
    "The monster is enraged and vows revenge saying that he will be with you on your wedding night. You return home.", 
    new Animation(
      new ImageDisplay("monster.png", 200,250,100,142)), 
    "Marry Elizabeth anyway#8", 
    "Call off the wedding in fear#9"),  
  new DialogLine("19", 
    "The creature is amazed with all of the knowledge in the world, and begins to become curious about what else he can do. He wants to know if he can go to school, because he is invested in learning and readings so much. ", 
    new Animation(
      new ImageDisplay("monster.png", 200,250,100,142)), 
    "Let him go to school#21", 
    "Keep teaching him at home#26"),
  new DialogLine("20", 
    "You only teach the monster basic life skills but the monster wants to learn more. He asks you questions but you refuse to answer them. The monster starts to find books on his own and teach himself. The monster is angered by how little you taught him. The monster confronts you.", 
    new Animation(
      new ImageDisplay("monster.png", 200,250,100,142)), 
    "Apologize and teach him everything#22", 
    "Refuse his request#23"),
  new DialogLine("21", 
    "He goes to school but is ridiculed and hated by the students as well as the teachers. Everybody at the school is disgusted and hates him. ", 
    new Animation(
      new ImageDisplay("monster.png", 200,250,100,142)), 
    "Keep teaching him at home#26"),
  new DialogLine("22", 
    "You start to teach him more in-depth things such as maths and science. The monster learns very quickly and you need to keep teaching him more and more. Eventually, the monster asks you what it means to be alive.", 
    new Animation(
      new ImageDisplay("monster.png", 200,250,100,142)), 
    "Explain life and death and reproduction to him#42", 
    "Say that it is beyond his comprehension#23"),
  new DialogLine("23", 
    "The monster is angered and begins to attack you despite your screams to stop.", 
    new Animation(
      new ImageDisplay("monster.png", 200,250,100,142)), 
    "Fight back#24", 
    "Run away from the monster#25"),
  new DialogLine("24", 
    "You try to fight back but the monster overpowers you and tears you limb from limb. You die.", 
    new Animation(
      new ImageDisplay("monster.png", 200,250,100,142)), 
    "End Game#99"),
  new DialogLine("25", 
    "You run away from the monster and hide. However, a couple of weeks later you get a letter saying that your brother William was killed. You rush home and find that Justine Moritz was accused of the crime but she maintains her innocence. You suspect the monster did it.", 
    new Animation(
      new ImageDisplay("monster.png", 200,250,100,142)), 
    "Stay Silent#1", 
    "Come forward and claim that you know who did it#29"),
  new DialogLine("26", 
    "You give him something to read: Paradise Lost. He loves it and he looks for his own “tree of knowledge.” He thinks that you’re his tree of knowledge and ultimately respects you, but worries God will get mad about it. You become his best friend, and don’t have to worry about him acting up. He wants to help you with science.", 
    new Animation(
      new ImageDisplay("monster.png", 200,250,100,142)), 
    "Let him help you in the laboratory#43", 
    "Deny him the chance#27"),
  new DialogLine("27", 
    "The monster gets mad and flees, running away from you forever. You never see him again.", 
    new Animation(
      new ImageDisplay("monster.png", 200,250,100,142)), 
    "End Game #99"),
  new DialogLine("28", 
    "Create the child for them: The monster, his mate, and their new child leave again. After another couple of months, they come back. Their child is lonely and they want another child so they ask you once again for a child.", 
    new Animation(
      new ImageDisplay("monster.png", 200,250,100,142)), 
    "Once again create the child#39",
    "Reject their request#18"),
  new DialogLine("29", 
    "You are met with a lot of doubt, and nobody believes what you are saying. This causes you to get heavily mocked and people start to hate your from your home town. You want to leave, but if you do Justine will be found guilty.", 
    new Animation(
      new ImageDisplay("monster.png", 200,250,100,142)), 
    "Pursue and convince everyone the monster did it#32", 
    "Give up and go back#33"), 
  new DialogLine("30", 
    "The monster is physically superior and is able to easily fight you and beat you. He then breaks your forearm, takes the protruding bone and stabs you with it. You die. The End.", 
    new Animation(
      new ImageDisplay("monster.png", 200,250,100,142)), 
    "End Game#99"),
  new DialogLine("31", 
    "You’re flooded with questions: “Why didn’t you save him?” “What happened, how?” “What is wrong with you?” “Why would you wait till now to tell us.” Your only option here is to flee.", 
    new Animation(
      new ImageDisplay("monster.png", 200,250,100,142)), 
    "Give up and go back#33"),
  new DialogLine("32", 
    "You look like a fool in front of your whole town. Everyone wants to know more about this, and they are very skeptical of how you know. Of course, they ask.", 
    new Animation(
      new ImageDisplay("monster.png", 200,250,100,142)), 
    "Tell them you made the monster#34", 
    "Claim you saw him murder William#31"),
  new DialogLine("33", 
    "You flee the town because you’re scared of what could happen if you were honest. You go up to the mountains, where you see the monster.", 
    new Animation(
      new ImageDisplay("monster.png", 200,250,100,142)), 
    "Attempt to kill the monster for killing William#30", 
    "Listen to what the monster has to say#2"),
  new DialogLine("34", 
    "You two have told the public about it, and people are skeptical if it is true or not. Before demonstrating the possibilities, you get a knock at your door.", 
    new Animation(
      new ImageDisplay("monster.png", 200,250,100,142)), 
    "Answer it#35", 
    "Run#36"),
  new DialogLine("35", 
    "You open the door, and before you can even see who it is, you’re shot dead. The End.", 
    new Animation(
      new ImageDisplay("monster.png", 200,250,100,142)), 
    "End Game#99"),
  new DialogLine("36", 
    "You leave out the back door. Someone is standing there too. You’re shot, and right before you die you wonder where the monster will end up. The End.", 
    new Animation(
      new ImageDisplay("monster.png", 200,250,100,142)), 
    "End Game#99"),
  new DialogLine("37", 
    "William is, of course, shocked and runs home. A couple of weeks later you hear on the news a story about a boy who was strangled who miraculously came back to life. William tells the media that his brother (you) was involved somehow. You’re investigated, and the jury concludes you kidnapped him. You spend the rest of your life in prison. The End.", 
    new Animation(
      new ImageDisplay("monster.png", 200,250,100,142)), 
    "End Game#99"),
  new DialogLine("38", 
    "The monster is gone, and you become worried. Where is he, and what could he possibly be doing? You never hear from him or even hear about him. You’re always worried about him. Is it out of care or out of fear? You spend the rest of your life wondering this. The End.", 
    new Animation(
      new ImageDisplay("monster.png", 200,250,100,142)), 
    "End Game#99"),
  new DialogLine("39", 
    "You create the second child for them and then they come back again after a little while. They come back again asking for a different family so that they can all have friends beyond their own family. You know that if you continue creating more then they will continue to come back for more and more forever. How many more monsters do you set as your limit:", 
    new Animation(
      new ImageDisplay("monster.png", 200,250,100,142)), 
    "Tell them you will create one last monster for them#54",
    "Tell them you will create this one more small family for them but then be done#55",
    "Tell them you will create this family and one more family but that is it#56"),
  new DialogLine("40", 
    "After running out of the house, you run into Henry who then guides him back home. The monster has left but you begin to fall ill for months. You then get a letter from your father saying that your little brother William has died. You rush home and Justine Moritz is accused of the crime even though she maintains her innocence and you suspect the monster.",
    new Animation(
      new ImageDisplay("victor.png", 450,250,125,125),
      new ImageDisplay("monster.png", 250,250,100,142)),
    "Stay Silent#1", 
    "Come forward and claim that you know who did it#29"),
  new DialogLine("41", 
    "You begin to teach the monster about life and speaking and the world. You teach the monster how to speak and begin to show the monster books.",
    new Animation(new ImageDisplay("victor.png", 250,250,150,150)),
    "Show and expose the creature to everything that you can to teach him the most about the world#19", 
    "Be more selective on what you teach the monster#20"),
  new DialogLine("42", 
    "You explain everything about how life works. The monster is extremely interested, which is a little bit concerning. At the end, he flees and you never see him again. ", 
    new Animation(
      new ImageDisplay("monster.png", 200,250,100,142)), 
    "Spend your life chasing the monster, potentially saving the Earth#10", 
    "Let the monster free and trust that he can only do good for the world#57"),
  new DialogLine("43", 
    "The monster goes and helps you out with all of life science based on what he read in the books you gave him. You and him create a useful machine to reanimate a dead person.", 
    new Animation(
      new ImageDisplay("monster.png", 200,250,100,142)), 
    "Release your technology to the public#34", 
    "Bring William back to life#44",
    "Keep it in your garage for the rest of your life#38"),
  new DialogLine("44", 
    "You go home to Geneva and find William’s grave. In the middle of the night, you start to dig him up. After a couple of tries, he’s back alive. Laying flat on the floor, William breathes hard and tries to comprehend what has happened to him. He asks you and the monster.", 
    new Animation(
      new ImageDisplay("monster.png", 200,250,100,142)), 
    "Tell him he died and you and your creation revived him years later#45", 
    "Tell him a fake story about how he got lost and fainted in a graveyard#37"),
  new DialogLine("45", 
    "He, of course, is beyond confused. He begs to go home and see his family.", 
    new Animation(
      new ImageDisplay("monster.png", 200,250,100,142)), 
    "Kill him#46", 
    "Don’t let him go; keep him with you#49",
    "Let him see his family#50"),
  new DialogLine("46", 
    "After killing William, you’re worried about the knowledge that still exists. You and the monster are the only ones who know. You are absolutely positive that this cannot happen again.", 
    new Animation(
      new ImageDisplay("monster.png", 200,250,100,142)), 
    "Kill yourselves#48", 
    "Destroy the books as well and hope that neither of you remember exactly how to reanimate the dead#47"),    
  new DialogLine("47", 
    "Thankfully, neither of you remember how to reanimate someone despite the anxiety. You two are both bored out of your minds and the monster ends up fleeing. You never see him again.", 
    new Animation(
      new ImageDisplay("monster.png", 200,250,100,142)), 
    "End Game#99"),
  new DialogLine("48", 
    "You both die on a Sunday evening in your home. Your house starts to smell.", 
    new Animation(
      new ImageDisplay("monster.png", 200,250,100,142)), 
    "End Game#99"),
  new DialogLine("49", 
    "You, the monster, and William — what a great team! Soon, an argument arises between the group. It gets so bad that everybody splits up individually, and they go off on their own. You never see them again.", 
    new Animation(
      new ImageDisplay("monster.png", 200,250,100,142)), 
    "End Game#99"),
  new DialogLine("50", 
    "He goes home to see his family and you assume his mother is relieved. You never see them again. Realizing the danger of this, you ponder whether or not you should destroy this machine.", 
    new Animation(
      new ImageDisplay("monster.png", 200,250,100,142)), 
    "Destroy the machine#51", 
    "Keep it#52"),
  new DialogLine("51", 
    "After destroying the machine, you’re worried about the knowledge that still exists. You and the monster are the only ones who know. You are absolutely positive that this cannot happen again.", 
    new Animation(
      new ImageDisplay("monster.png", 200,250,100,142)), 
    "Kill yourselves#48", 
    "Destroy the books as well and hope that neither of you remember exactly how to reanimate the dead#47"),
  new DialogLine("52", 
    "Keeping the machine, you want to reanimate someone else. The monster is so excited!", 
    new Animation(
      new ImageDisplay("monster.png", 200,250,100,142)), 
    "Reanimate Isaac Newton#53", 
    "Reanimate your mother#53"),
  new DialogLine("53", 
    "It’s not that easy. You can’t find their grave after weeks of searching. You realize it’s not worth it and settle into a random town you entered. Your life ends as an old man here without the monster.", 
    new Animation(
      new ImageDisplay("monster.png", 200,250,100,142)), 
    "End Game#99"),
  new DialogLine("54", 
    "You create one last monster but then tell them that’s it. Your original monster, his mate, and his children all stay away. The new monster, however, comes back lonely and asks for a mate of his own. You refuse and he kills you. You die. The End.", 
    new Animation(
      new ImageDisplay("monster.png", 200,250,100,142)), 
    "End Game#99"),
  new DialogLine("55", 
    "You create this one family: You create the one family of monsters and everything is calm for years. You mary Elizabeth and life is good. But after a few years, the monsters come back and ask for two more families to be created to finish out their small community and then they will be done asking you forever. ", 
    new Animation(
      new ImageDisplay("monster.png", 200,250,100,142)), 
    "Refuse their request#57",
    "Create two more families#56"),
  new DialogLine("56", 
    "You create two more families of monsters for them but then they are able to convince you to make more and more and you eventually become a slave to the growing community of monsters. They force you to continuously create monster after monster for their growing community. You eventually perfect the art of creating life and as you are growing older, the monsters force you to teach them. You eventually die after having created thousands of monsters throughout your life. The End.", 
    new Animation(
      new ImageDisplay("monster.png", 200,250,100,142)), 
    "End Game#99"),
  new DialogLine("56", 
    "You refuse their request for two more families and they retreat back to where they lived for those many years. You have children with Elizabeth and grow old with her. You are fairly content. The End.", 
    new Animation(
      new ImageDisplay("monster.png", 200,250,100,142)), 
    "End Game#99"),
  new DialogLine("57",
  "The monster is gone, and you become worried. Where is he, and what could he possibly be doing? You never hear from him or even hear about him. You’re always worried about him. Is it out of care or out of fear? You spend the rest of your life wondering this. The End.",
    new Animation(),
    "End Game #99"),
  new DialogLine("99", 
    "Your game has ended.", 
    new Animation(), 
    "Restart Game#RESTART", 
    "Close App#CLOSE"),
  };
  // The dialog lines indexed by their id, for easy lookup
  HashMap<String, DialogLine> dialogTree = new HashMap<String, DialogLine>();
// The line currently displayed
DialogLine currentLine;
// The dialog so far
ArrayList<String> dialog = new ArrayList<String>();
// 
public void setup ()
{
  //size(800, 800);
  
  
  for (DialogLine dl : dialogLines)
  {
    dialogTree.put(dl.id, dl);
  }
 
  // start point is 7 - see <a href="http://www.atariarchives.org/adventure/chapter2.php" target="_blank" rel="nofollow">http://www.atariarchives.org/adventure/chapter2.php</a>
  currentLine = dialogTree.get("0");
  globalSectionNumber = "0";
  dialog.add(currentLine.line);
 
  state=startScreen;
}
 
final int startScreen = 0; // possible states
final int play = 1;
final int playerIsDead = 2;
final int playerWon = 3;
PImage victorImage;
 
int state = startScreen; // current state 

String globalSectionNumber;
 
public void draw () {
  background(255);
  // now states: 
  switch(state) {
  case startScreen:
    showStartScreen();
    break; 
  case play:
    play();
    break;
  default:
    //error
    println ("unknown state line 64");
    exit();
    break;
  } // switch
} // func 
 
 
public void showStartScreen() {
 
  fill(0xff004499);
 
  textSize(32);
  text ("Frankenstein's Revenge", 70, 70);
 
  textSize(20);
  int y_value = 130;
 
  text ("Welcome to our maker project. There is no turning back.", 20, y_value, width-40, 100);
 
  y_value+=90;
  text ("This choose-your-own-adventure game is based upon Mary Shelley's Frankenstein."
    +" There are multiple endings, multiple ways to die, but it is very hard to end up happy!", 20, y_value, width-40, 200);
  y_value+=220;
  text ("Press any key. ", 120, y_value);
}
 
public void play() {  
  
  fill(0xff004499);
  textSize(20);
  text(currentLine.line, 10, 30, width-30, 360);
  // textWidth
  // Display the choice of answers
  fill(0xff0077EE);
  textSize(15);
  int y = 390;
  int toChoose = 1;
  for (String ch : currentLine.choices)
  {
    // DialogLine choice = dialogTree.get(ch);
    String [] myArray = split(ch, "#");  
    text(toChoose++ + ": " + myArray[0], 20, y);
    y += 22;
  }
  
  
  
  
   //image("victor.png", 250, 250, 50,50);
   //currentLine.animation.show();
   //image(victorImage, 250, 250);

  // for testing: 
  text (globalSectionNumber, width-30, height-30);
 
  
}

class ImageDisplay{
  String image;
  int x, y, w, h;
  ImageDisplay(String imgname, int px, int py, int wx, int hy){
    //image(victorImage, img, px, py, w, h);
    image = imgname;
    x = px;
    y = py;
    w = wx;
    h = hy;
  }
  
  public void show(){
    image(loadImage(image), x, y, w, h);
  }
}
// inputs ---------------------------------------------------------
 
public void keyPressed()
{
  // now states: 
  switch(state) {
  case startScreen:
    // start the game 
    state=play;
    break; 
  case play:
    // 
    int choiceNb = currentLine.choices.length;
    int choice = key - '1';
    if (choice < 0 || choice >= choiceNb)
      return; // Ignore
 
    String choiceMade = currentLine.choices[choice];
    String [] myArray = split(choiceMade, "#");  
 
    String choiceId = myArray[1]; // qqq
   if (choiceId.equals("RESTART")){
     frameCount = -1;
   } else if (choiceId.equals("CLOSE")){
     exit();
   }
    globalSectionNumber = choiceId;
 
    DialogLine chosenAnswer = dialogTree.get(choiceId);
    if (chosenAnswer != null)
    {
      currentLine = dialogTree.get(choiceId);
      dialog.add(currentLine.line);
    }

    break;
  default:
    //error
    println ("unknown state line 148");
    exit();
    break;
  } // switch
}
 
/*
void mousePressed() {
 // now states: 
 switch(state) {
 case startScreen:
 state=play;
 break; 
 case play:
 // do nothing
 break;
 default:
 //error
 println ("unknown state line 148");
 exit();
 break;
 } // switch
 } 
 */
 
// =================================
 
/**
 * A dialog line: an id, the line itself, and a list of choices,
 * ie. of possible answers to this line.
 */
class DialogLine
{
  String id;
  String line;
  String[] choices;
  //ArrayList<ImageDisplay> imgs = new ArrayList<ImageDisplay>();
  Animation animation;
 
  DialogLine(String i, String l, Animation a, String... c)
  {
    id = i;
    line = l;
    choices = c;
    animation = a;
  }
 
  public String toString()
  {
    return id + " - " + line + " (" + choices.length + ")";
  }
} // class 

class Animation{
  ArrayList<ImageDisplay> images = new ArrayList<ImageDisplay>();
  //ImageDisplay images[];
  Animation(ImageDisplay... i){
    for (int j = 0; j<i.length;j++){
      images.add(i[j]);
    }
  }
  
  public void show(){
    for (int k = 0; k< images.size(); k++){
      images.get(k).show();
    }
  }
}
  public void settings() {  fullScreen();  smooth(); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "maker" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
