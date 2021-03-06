import sfml/[Graphics, Windows, PausableClock]
 
main: func {
    clock := PausableClock new()
    // Create a new window of 600*470 pixels, with title Hello World!.
    //Optional arguments: style of the window and context settings of the window
    win := RenderWindow new(VideoMode new(600,470), "Hello World!")
    // load an image
    image := Image new("data/cool_sprite.jpg")
    // make a sprite and load the image into it
    sprite := Sprite new(image)
    // Equivalent to
    // sprite := Sprite new()
    // sprite setImage(image)
    // It is a helper function, there is no such creation from image in sfml/csfml
    // There are many helper functions
    // Many of them are to emulate the c++ API while using the csfml backend
    // Like the Vector2 class and the helper functions that use it
    // Or the optional parameters in many calls
 
    // While the window is opened
    // Note the "?"
    // It is a legal character in ooc 
    // All is[Something] c++ calls become something? in ooc
    while(win opened?()) {
        evt: Event
        // we check the events to see if user wants to close window
        while(win pollEvent(evt&)) {
            if(evt type == EventType closed) {
                // if he does, close it
                win close()
            }
            else if(evt type == EventType keyPressed && evt keyEvent code == KeyCode P) {
                if(clock paused?) { clock start() }
                else { clock pause() }
            }
        }
    
        clock getTime() toString() println()
    
        // clear the window, draw the sprite and display it :) 
        win clear()
        win draw(sprite)
        win display()
    }
}
 
