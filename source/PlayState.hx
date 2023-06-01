package game;

import flixel.FlxState;
import flixel.FlxG;

class PlayState extends FlxState {
    override public function create(): Void {
        // Add your game logic and entities here
        
        // Transition to the menu state
        FlxG.switchState(new MenuState());
    }
}
