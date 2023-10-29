# COSC-559-Bakeoff-2

You will be given source code for a simple application that displays a destination square (in red) and a logo square (in grey). You can think of the destination squares like locations in your mind where you want to try putting your logo. Destination squares have a random X/Y position, as well as a random rotation and scale (think of it as a Z position). Your mission is to create a multi-dimensional input method for rotating, scaling and translating the logo square onto the destinations as quickly and accurately as possible!

Download scaffold code: https://utk.instructure.com/courses/180084/files/folder/Bakeoff%20code

There is a short video explainer here: https://utk.instructure.com/courses/180084/files/folder/Bakeoff%20explainer%20videos

## Some basic rules:
1) This is a single-touch (single-finger) application only. Left-click only (no right-click). No scrolling. No multitouch. No keyboard.
2) You shouldn't change the code that verifies square matches (unless you have a good reason)
3) You should not change the code that randomly locates/sizes/rotates the destination squares.
4) There must be equal treatment of all possible X/Y/Z/R. In other words, no X/Y/Z/R should be easier to "select" than any other.  For example, 11.4° should be just as easy as 45°.

As before, there are other restrictions, but I don't want to bias your ideation. You should run ideas by me as in the other bakeoff.

To be completed in your **NEW** project groups. We'll do a bakeoff in ~2.5 weeks.

## Deliverables:

In a single zip file, please place your code and the video (details below).  Please name the folder you zip TeamX_Bakeoff2 (where X is your team number), and the zip file should be called TeamX_Bakeoff2.zip (or rar or equivalent common compression format).

Be sure your code is cross-platform (no special libraries or anything). I should be able to double click the .pde file and it just works.

Upload to canvas a short video of your ideas, design process and final design with a narrative description (voice over).  This doesn’t have to be fancy (smartphone footage is fine). I want to see the idea, not that you are a master filmmaker. No writeup required. More specifically, your video should include 8 headings (with title frames). This goes a lot faster if you capture media along the way (e.g., smartphone videos of any working prototypes) – designate someone to do this. 

1) Initial Ideas – What ideas did you brainstorm? Quick descriptions and sketches ok here.  Rapid fire is fine because you probably had many. 
2) 1st Prototype – What ideas did you pick to make into prototypes?  Show me any paper or working prototypes.
3) 1st Testing – How did you test your first prototypes, how many people?
4) 1st Refinement – How did you morph and narrow your ideas? 
5) 2nd round prototype – Show and describe at least one second round prototype.  What ideas did you iterate on or combine? 
6) 2nd Testing - How did you test your second prototype(s), how many people, and what was the performance?  Any other issues?  Be sure to benchmark against the scaffold design. 
7) Refinement & Final Prototype - What ideas did you end up using?  Give me a tour of your final design.
8) Final Testing - How did you test your final prototype, how many people, and what was the performance? Be sure to benchmark against the scaffold design. Any other issues you observed that you could fix if you had time? 

Max video length should be 5 minutes.  Less is fine. Max 500MB in size.

## Clarifications:

1) No snapping allowed. Even though you only see a subset of destinations, in reality (like in photoshop or powerpoint), all destinations would be possible.
2) No, you cannot auto advance to the next trial when all parameters are correct. The user needs to click the square, or a button, make a gesture, or something to confirm they wish to proceed.
3) You cannot e.g., have the cursor square jump to a position (rotation or size) instantly. Everything should be a continuous manipulation (e.g., dragging the square).
4) All square sizes, angles and positions should be equally accessible. For example, you cannot bias your rotation input towards e.g., 90 degrees to make it easier to align to the cursor square.
5) No keyboard input. No multitouch. No special regions of the trackpad. Just use regular trackpad input.

Note, in the scaffold code, there is a DPI setting. In general, you should leave this alone as 72. Processing is already applying a scalar to everything to account for things like retina displays.
