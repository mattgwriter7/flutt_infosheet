# flutt_infosheet (version 1.0.alpha.4)
This is an attractive UI for an Information Screen.  It has a background design (on top, and on bottom), information text with stylized fonts, and a button with an icon and text underneath.

## DESCRIPTION
README.md is a general info, NOTES.md is for longer stuff.

## LEFT OFF
* replaced heading image with dots
* hardcoded corner image

## NEXT
* the corner image is hardcoded 
  + refactor Sheet() (add corner_image_src, and corner_image_size)
* tweak fonts 
  + use better Google font for headline
  + improve color (and use differen color for each sheet)
* research animation effects
  + having text "shoot in", or
  + have text revealed as a panel shifts away
    would be cool!
* consider page transition package
* consider adding Provider to make it easier to customize Info_Page,.dart

## CONSIDERATIONS
I am considering:
* refactor InfoSheet() 
  + should I just call it Sheet() ?
  + make Constructor load default sheet
* add G Skinner animation package?
* add Girl Sprite to bottom right corner
  + thumbs up 
  + fist pump  ("Hurray!")
  + defeated (arms balled at side, slumped shoulders) 
  + "What gives?" (open palms)
  + "Doh!" (palms pressed on forehead)
  + DREAM: Have these animated!!!




