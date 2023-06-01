package;

import flixel.FlxState;
import flixel.FlxG;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import sys.io.File;
import haxe.Json;
import flixel.ui.FlxButtonEvent;

class CharacterSelectionState extends FlxState {
    var nickname: String;
    var invisibleText: FlxText;

    override public function create(): Void {
        super.create();
        createUI();
    }

    private function createUI(): Void {
        var title: FlxText = new FlxText(0, 100, FlxG.width, "Nickname Selection");
        title.setFormat(null, 48, 0xffffff, "center");
        add(title);

        var fileContent: String = File.getContent("assets/data/person/nick.json");

        if (fileContent != null && fileContent != "") {
            // File exists and contains data
            var jsonData: Dynamic = Json.parse(fileContent);
            if (jsonData.nickname != null) {
                // Nickname exists in the file, load it
                nickname = jsonData.nickname;
            }
        }

        if (nickname == null || nickname == "") {
            // Nickname is not set or file is empty, show invisible text
            invisibleText = new FlxText(FlxG.width / 2 - 150, FlxG.height / 2 + 20, 300, null, 24, 0xffffff, "center");
            invisibleText.visible = false; // Set visible to false to hide the text
            add(invisibleText);

            var confirmButton: FlxButton = new FlxButton(FlxG.width / 2 - 50, FlxG.height / 2 + 80);
            confirmButton.loadGraphic("assets/images/button.png");
//            confirmButton.label.setFormat(null, 24, 0xffffff, "center");
            confirmButton.onUp.add(onConfirmButtonClick);
            add(confirmButton);
        } else {
            // Nickname exists, switch to menu state
            FlxG.switchState(new MenuState());
        }
    }

    private function onConfirmButtonClick(): Void {
        nickname = invisibleText.text;
        saveNickname();
        FlxG.switchState(new MenuState());
    }

    private function saveNickname(): Void {
        var fileName: String = "assets/data/person/nick.json";
        var json: String = Json.stringify({ "nickname": nickname });
        File.saveContent(fileName, json);
    }
}
