import flixel.FlxState;
import flixel.FlxSprite;
import flixel.ui.FlxButton;
import flixel.FlxG;
import sys.io.File;
import haxe.Json;
import flixel.text.FlxText;



class MenuState extends FlxState {
    var background: FlxSprite;
    var logo: FlxSprite;
    var singleplayerButton: FlxButton;

    override public function create(): Void {
        super.create();
        createUI();
        loadNickname();
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

    private function loadNickname(): Void {
        var fileName: String = "assets/data/person/nick.json";
        var fileContent: String = File.getContent(fileName);

        if (fileContent != null && fileContent != "") {
            var jsonData: Dynamic = Json.parse(fileContent);
            if (jsonData.nickname != null) {
                var nickname: String = jsonData.nickname;
                var nicknameText: FlxText = new FlxText(0, FlxG.height - 100, FlxG.width, "Nickname: " + nickname);
                nicknameText.setFormat(null, 24, 0xffffff, "center");
                add(nicknameText);
            }
        }
    }
}
