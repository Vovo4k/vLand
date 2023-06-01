import flixel.FlxGame;
import openfl.display.Sprite;
import sys.io.File;
import CharacterSelectionState;
import MenuState;

class Main extends Sprite {
    public function new() {
        super();

        var fileName: String = "assets/data/person/nick.json";
        var fileContent: String = File.getContent(fileName);

        if (fileContent != null && fileContent != "") {
            // Ник уже сохранен, переключаемся в меню
            addChild(new FlxGame(0, 0, MenuState));
        } else {
            // Ник не сохранен, переключаемся в состояние ввода ника
            addChild(new FlxGame(0, 0, CharacterSelectionState));
        }
    }
}
