# 🦀 Crabs
A simple video game built in Octave

## About

I am creating this game as part of my STEM Professionals class in college. The game is simple in nature, being only a captain that moved around the screen to attack a crab, but it has taken alot of work to get it working. Specifically, I...
- Created many files for different functions for the game
- Learned to import images into the game/window
- Learned how to construct dynamic character points & lines
- Learned to do matrix multiplation to translate & rotate the captain

## Functions used

| Name       | Description | Calls | Arguements | Returns
| --- | --- | --- | --- | --- |
| crabs | Runs full game system, initializing captain & drawing captain and map. | `drawMap()` `drawCapt()` | | |
| drawMap | Draws map background and sets up window for drawing on it. | | Name of bg image `*String` | Width & Hight of canvas
| drawCapt | Gets captain points, gets and applies transformation, forms lines, then draws captain. | `getCapt()` `getRotation()` `getTranslation()` `drawLine()` | xCapt, yCapt, thetaCapt, sizeCapt `*All Numbers` | Captain Graphics Vector
| getCapt | Generates captains points. | `scaleInRange()` | sizeCapt `*Number`, leftSpear, rightSpear `*Both Bool`, jab (percent) `*Number` | Captain points matrix
| scaleInRange | Scales a value between two ranges | | value, min & max (input), min & max (output) `*All Numbers` | Scaled value
| drawLine | Draws a line *(of a color)* between two points | | pointA, pointB `*Both Numbers`, color `*String` | Plotted line
| getTranslation | Generates a transform matrix for captain | | xCapt, yCapt `*All Numbers` | Transform matrix
| getRotation | Generates a rotation matrix for captain | | thetaCaptain `*number` | Rotation matrix


> Last edited: 9/29/23
