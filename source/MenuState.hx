import flixel.FlxState;
import flixel.FlxSprite;
import flixel.ui.FlxButton;
import flixel.FlxG;

class MenuState extends FlxState {
    var background: FlxSprite;
    var logo: FlxSprite;
    var singleplayerButton: FlxButton;

    override public function create(): Void {
        super.create();
        createUI();
    }

    private function createUI(): Void {
        background = new FlxSprite(0, 0).loadGraphic("assets/images/menu/bg.png");
        add(background);

        logo = new FlxSprite((FlxG.width - 300) / 2, 100).loadGraphic("assets/images/menu/logo.png");
        add(logo);

        var buttonWidth = 200;
        var buttonHeight = 40;

        singleplayerButton = new FlxButton(
            (FlxG.width - buttonWidth) / 2,
            (FlxG.height - buttonHeight) / 2,
            "Singleplayer",
            onSingleplayerClick
        );

        singleplayerButton.width = buttonWidth;
        singleplayerButton.height = buttonHeight;

        add(singleplayerButton);
    }

    private function onSingleplayerClick(): Void {
        // Create a new state for the character selection screen
        var characterSelectionState = new CharacterSelectionState();

        // Switch to the character selection state
        FlxG.switchState(characterSelectionState);
    }
}
