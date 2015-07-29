# linter-clang package

This linter plugin for [Linter](https://github.com/AtomLinter/Linter) provides an interface to clang. It will be used with files that have the "C++", "C", "Objective-C" and "Objective-C++" syntax.

### Plugin installation
Press ctrl and ',' or cmd and ',' , click on 'Packages', search 'linter clang', or:
```
$ apm install linter-clang
```

## Project-specific include paths
If your project has some extra include directories, put them in a file called ".linter-clang-includes" and list them line by line.
The linter will open the file and use the specified paths when linting in your project.

You can put your ".linter-clang-includes" files in subdirectories, too, the linter will find them and include the paths relative to the file they are specified in.

## Project-specific compiler flags
If your project has some extra compiler flags, put them in a file called ".linter-clang-flags" and list all flags.
The linter will open the file and use the specified flags when linting in your project.
You can put your flag file in subdirectories, too, however, no resolving of paths will take place.
For that, you can use macros (see below).

Note: Whenever there is a space in the flag file it will separate the strings before and after
when passing them as arguments to the compiler (like in the command line).
If you have a filename with a space, put it into quotes. Everything between quotes won't
be separated. The quotes will be removed after parsing.
Using quotes is therefore not supported yet (TODO: let the user put a backslash to escape the quote).

## Macros

The linter will expand the following macros in your ".linter-clang-includes" and ".linter-clang-flags" files:
 * `%d` -> the directory of the file being linted
 * `%p` -> the project path
 * `%%` -> `%`

## Contributing
If you would like to contribute enhancements or fixes, please do the following:

1. Fork the plugin repository.
1. Hack on a separate topic branch created from the latest `master`.
1. Commit and push the topic branch.
1. Make a pull request.
1. welcome to the club

Please note that modifications should follow these coding guidelines:

- Indent is 2 spaces.
- Code should pass coffeelint linter.
- Vertical whitespace helps readability, don’t be afraid to use it.

Thank you for helping out!

## Other Available linters
- [linter-php](https://atom.io/packages/linter-php), for PHP using `php -l`
- [linter-phpcs](https://atom.io/packages/linter-phpcs), for PHP, using `phpc`
- [linter-phpmd](https://atom.io/packages/linter-phpmd), for PHP, using `phpmd`
- [linter-pylint](https://atom.io/packages/linter-pylint), for Python, using `pylint`
- [linter-javac](https://atom.io/packages/linter-javac), for Java, using `javac`
- [linter-jshint](https://atom.io/packages/linter-jshint), for JavaScript and JSON, using `jshint`
- [linter-jscs](https://atom.io/packages/linter-jscs), for JavaScript, using `jscs`
- [linter-scss-lint](https://atom.io/packages/linter-scss-lint), for SASS/SCSS, using `scss-lint`
- [linter-coffeelint](https://atom.io/packages/linter-coffeelint), for CoffeeScript, using `coffeelint`
- [linter-csslint](https://atom.io/packages/linter-csslint), for CSS, using `csslint`
- [linter-rubocop](https://atom.io/packages/linter-rubocop), for Ruby, using `rubocop`
- [linter-tslint](https://atom.io/packages/linter-tslint), for Typescript, using `tslint`
- [linter-xmllint](https://atom.io/packages/linter-xmllint), for XML, using `xmllint`
- [linter-shellcheck](https://atom.io/packages/linter-shellcheck), for Bash, using `shellcheck`
- [linter-scalac](https://atom.io/packages/linter-scalac), for Scala, using `scalac`

Check out [AtomLinter](https://github.com/AtomLinter)!

## Donation
[![Share the love!](https://chewbacco-stuff.s3.amazonaws.com/donate.png)](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=KXUYS4ARNHCN8)
