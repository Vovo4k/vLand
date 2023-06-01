import flixel.FlxGame;
import flixel.FlxG;
import flixel.FlxState;
import flixel.FlxSprite;
import flixel.ui.FlxButton;

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
        // Implement your logic for the singleplayer button click here
    }
}

class Main extends FlxGame {
    public function new() {
        super(640, 480, MenuState);
    }
}
