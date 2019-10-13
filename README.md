# AutoHotKey
AHK files on to go!

This is a repository I can access at work, where I can see if everything is working as intended. Majority of these files and tools 
have not been created by myself.

One of my work responsibilities involves a repetitive task that may be broken into three parts. It involves going through an excel spreadsheet and "awarding" an approval or denial status (based on defined criteria) using a 3rd party program. If, a profile already has an award status (approval or denial). Then, I check to see if I had previously manually awarded it by checking any comments. If I did award it then I mark the ID cell using the Styles ribbon on the original excel sheet (APPROVAL=GREEN, DENIAL=RED). If it was awarded automatically or by another person, I change the text color to blue or red. 

If there is no award present. Then, I manually award an approval or denial based on certain criteria and place a timestamped awarding comment in a special comment window. 

In practice, here's how it kind of plays out on an average day. 

1. Copy IDN form excel into 3rd party program.

2. See if the profile has one of several unique letter codes in a certain screen area. 
- If there is already an award I check who awarded it by opening into a separate comment window.
- If I previously awarded it then I mark the IDN cell using the Styles ribbon in the original excel sheet 
- If it was previously awarded automatically or by another person, I change the text color to blue or red on the original excel sheet. 

3. To "award" an approval or denial, based on certain criteria, to a profile.
[It involves clicking a particular button (only available on a certain screen) to move to a particular screen, checking to see what text is present in certain textbox locations on that screen. Compare that information to the requirements (I have printed and hanging on my wall). Then I have to make sure the location box is displaying the correct location (if it's not then I manually change it) by going into another screen by clicking another button (only available on a certain screen). Then, click another button (or F9 shortcut) until I get back to my original screen to save the changes.]

- Once an approval or denial is awarded I need to copy/paste the ID to an excel spreadsheet under an approved/denied collum.
