# NOTES 
This is a place for stuff that doesn't fit under README

## NAMING CONVENTIONS
* variables are "lowercase_with_hyphens"
* methods are "camelCased()"...
* programming classes should be capitalized, and always have the filename exactly match the class name (so the "Config" class is "Config.dart", for instance)
  + But, CSS classes will be "lowercase_with_hyphens"
* REALLY_IMPORTANT variables can be all caps and underscored
   + but there should only be 1 or 2 "really important" variables in an app

## SHEETS
Each "sheet" is contained in the Sheet() class.  
This is where things like:   
* headline
* lines (an array of the text to show)
* theme (colors, background images to use)
* the images in the corner
* etc., etc.

This allows all of the "sheets" to be updated in one place.

## INFO_PAGE 
The Info_Page is the dart page that displays the sheets.  Each sheet has an index number.  For the demo:
> Config.info_sheet_num   

is used to indicate which sheet to load in initState().
