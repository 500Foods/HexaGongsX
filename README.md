# HexaGongsX
This repository contains the source code for the [TMS XData](https://www.tmssoftware.com/site/xdata.asp) server used in the  [HexaGongs](https://www.hexagongs.com) project.  More details about this project can be found in the [HexaGongs Repository](https://github.com/500Foods/HexaGongs) as well as a series of blog posts on the [TMS Software](https://www.tmssoftware.com) website, starting with [Part 1](https://www.tmssoftware.com/site/blog.asp?post=1106).

## Getting Started
The project was created initially using the standard TMS XData Application Template, using Delphi 10.3.  It was then updated to include some of the code from the [TMS XData Template Demo Data](https://github.com/500Foods/TMS-XData-TemplateDemoData) repository, which included support for a configuration JSON file that is used to override the default URL, icon folder, and so on.  Even without the configuration JSON present, however, the defaults should still work without any issues.  Once compiled, the standard XData interface is shown, with all kinds of information related to the startup environment.

![image](https://github.com/500Foods/HexaGongsX/assets/41052272/4afbb6ad-2c33-469f-98c6-8f761dd71b1b)

In order for the XData server to be able to serve up Audio Clips or Icon Sets as part of its function, the "audio-clips" and "icon-sets" folders need to be populated.  These folders by default are subfolders of wherever the XData is run from, but their location can be modified in the configuration JSON, if one is supplied.  The location of the configuration JSON can also be changed by passing a parameter to the executable. Please refer to the [TMS XData Template Demo Data](https://github.com/500Foods/TMS-XData-TemplateDemoData) for more information about the configuration JSON contents and the parameters that are used for this.

## Sponsor / Donate / Support
If you find this work interesting, helpful, or useful, or that it has sved you time, money, or both, please consider direclty supporting these efforts financially via [GitHub Sponsors](https://github.com/sponsors/500Foods) or donating via [Buy Me a Pizza](https://www.buymeacoffee.com/andrewsimard500). Also, be sure to check out these other [GitHub Repositories](https://github.com/500Foods?tab=repositories&q=&sort=stargazers) that may be of interest to you.
