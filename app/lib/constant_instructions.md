
# Material Theme Builder Flutter Export

## Basics

This archive contains a number of files defining a Material 3 theme:

 * colors_schemes.g.dart        - contains all colors used by your theme
 * main.g.dart                  - sample MyApp file using the generated color scheme

Your colors and schemes will be generated in a color_schemes.g.dart file to avoid collision
with other files that may exist in your project. A template My App file has been included for 
your convenience. You will need to replace the home with your content.


## Extended Color

Material Theme Builder allows you to specify a number of colors that live along side your theme that may have a specific meaning or relevance in your theme. Flutter ThemeExtensions allow you to use these colors like you would for any other color in a core theme.

To enable dynamic color and custom color in Flutter, make sure to add the dynamic_color package:
    
    flutter pub add dynamic_color
    
Each custom color adds four entries for each color, one entry for the source color, and four corresponding to the color roles that used in applications:    

  * \<color>                   - base color 
  * on\<color>                 - color for text/icons appearing on that base color
  * \<color>Container          - container color
  * on\<color>Container        - color for text/icons appearing on that container

where \<color> is your custom color name. In the generated archive, new data will be stored in two locations:
    
- main.g.dart, and, 
- custom_color.g.dart.
    
The generated main file will now include a generated CustomColors class with properties for each custom color in each of the four color roles along with a sample DynamicColors instance.

Custom colors and the helper classes to use them as theme extensions are populated in custom_color.g.dart.
    
Below is an example theme extension class with a single color defined. Your generated class will contain the color roles and properties listed above for each
  color you added in
      Material Theme Builder
          .The generated MyApp class does the work of registering the
              CustomColors extensions with the appropriate light or dark theme.

      You can assess those colors by calling extension on the theme with the
          parameterized CustomColors
class.After which,
    you can use it in any color property field.

                      final custom1Container
= Theme.of(context).extension<CustomColors>()!.custom1Container;
final onCustom1Container =
    Theme.of(context).extension<CustomColors>()!.oncustom1Container;
final custom2Container =
    Theme.of(context).extension<CustomColors>()!.custom2Container;
final onCustom2Container =
    Theme.of(context).extension<CustomColors>()!.oncustom2Container;


Card(
  color: custom2Container,
  child: ConstrainedBox(
      constraints: BoxConstraints(minWidth: 90, minHeight: 100),
      child: Stack(children: <Widget>[
        Column(children: <Widget>[
          Text("153",
              style: textTheme.displaySmall
                  ?.copyWith(color: onCustom2Container)),
          Text("Brea",
              style: textTheme.titleMedium
                  ?.copyWith(color: onCustom2Container))
        ])
      ]))),
      {{/ colorNames}}
    );
  }


For more information and examples, check out our the [dynamic_color package](https://pub.dev/packages/dynamic_color) on pub.dev.
