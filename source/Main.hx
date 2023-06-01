import flixel.FlxGame;
import flixel.FlxG;
import openfl.display.Sprite;
import sys.io.File;
import MenuState;

class Main extends Sprite {
    public function new() {
        super();

        var fileName: String = "assets/data/person/nick.json";
        var fileContent: String = File.getContent(fileName);

        // Всегда переключаемся в меню
        addChild(new FlxGame(0, 0, MenuState));
    }
}
