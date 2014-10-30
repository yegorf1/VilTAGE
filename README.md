VilTAGE
=======

![VilTAGE logo](http://s28.postimg.org/lcfi75lf1/Vil_TAGE_logo.png)

Stands for **ViliX's Text/ASCII Game Engine**. It's more of a framework than a game engine.

In the future, VilTAGE should be able to provide an easy way of making Dart ASCII based games.

### Getting Started
* [Watch YouTube tutorials on VilTAGE](https://www.youtube.com/playlist?list=PLf5vEuOWKqWisq5UsJYqEWSjQ6RJPxMpq)

or

* [Set up your IDE (Dart Editor, others)](https://github.com/ViliX64/VilTAGE/wiki/Setting-up-IDE)
* [Create your first project](https://github.com/ViliX64/VilTAGE/wiki/Creating-first-project)
* [Display some stuff](https://github.com/ViliX64/VilTAGE/wiki/Adding-entities)
* [Read the Wiki](https://github.com/ViliX64/VilTAGE/wiki)

### Creating new game

To demonstrate how simple it is to create a new VilTAGE game (read more on wiki), here are three steps you need to make to create new game:

1. add `dependency viltage: any` to your project's pubspec.yaml
2. add `import 'package:viltage/viltage.dart';` to the top of your main .dart file
3. add those two lines to your `main()` function:
```
VilTAGEConfig vtc = new VilTAGEConfig(querySelector("#game_canvas"));
VilTAGE mygame = new VilTAGE(vtc);
```
This will take a canvas element and create a blank grid of dots, which becomes a foundation for a new game.

![](http://s3.postimg.org/l9z9k3d37/Untitled_1.png)

### Contact

You can contact me on Twitter [@ViliX64](https://twitter.com/ViliX64) where I'll happily explain everything about VilTAGE to you.

### Contributing & Source

The author of VilTAGE is Vilém Zouhar (@ViliX64) (@rustilnee contributed to!). I'm constantly improving the code base. Reporting any issues/suggesting new things is the best way how to improve VilTAGE. You can also change the code itself and commit changes!

### License

VilTAGE is licensed under the MIT License, meaning you can use it/change as long as you mention at least somewhere in the description that your game uses VilTAGE.