# HexaGongsX
This repository contains the source code for the [TMS XData](https://www.tmssoftware.com/site/xdata.asp) server used in the  [HexaGongs](https://www.hexagongs.com) project.  More details about this project can be found in the [HexaGongs Repository](https://github.com/500Foods/HexaGongs) as well as a series of blog posts on the [TMS Software](https://www.tmssoftware.com) website, starting with [Part 1](https://www.tmssoftware.com/site/blog.asp?post=1106).

## Getting Started
The project was created initially using the standard TMS XData Application Template, using Delphi 10.3.  It was then updated to include some of the code from the [TMS XData Template Demo Data](https://github.com/500Foods/TMS-XData-TemplateDemoData) repository, which included support for a configuration JSON file that is used to override the default URL, icon folder, and so on.  Even without the configuration JSON present, however, the defaults should still work without any issues.  Once compiled, the standard XData interface is shown, with all kinds of information related to the startup environment.

![image](https://github.com/500Foods/HexaGongsX/assets/41052272/b512db9e-7fd2-4367-b7c0-a5adb7eba46e)

In order for the XData server to be able to serve up Audio Clips or Icon Sets as part of its function, the "audio-clips" and "icon-sets" folders need to be populated.  These folders by default are subfolders of wherever the XData is run from, but their location can be modified in the configuration JSON, if one is supplied.  The location of the configuration JSON can also be changed by passing a parameter to the executable. Please refer to the [TMS XData Template Demo Data](https://github.com/500Foods/TMS-XData-TemplateDemoData) for more information about the configuration JSON contents and the parameters that are used for this.

## Repository Information
[![Count Lines of Code](https://github.com/500Foods/HexaGongsX/actions/workflows/main.yml/badge.svg)](https://github.com/500Foods/HexaGongsX/actions/workflows/main.yml)
<!--CLOC-START -->
```
Last Updated at 2023-12-24 05:17:46 UTC
-------------------------------------------------------------------------------
Language                     files          blank        comment           code
-------------------------------------------------------------------------------
Pascal                           5            171            115            890
Delphi Form                      2              0              0            128
YAML                             2              9             12             33
Markdown                         1              6              2             25
-------------------------------------------------------------------------------
SUM:                            10            186            129           1076
-------------------------------------------------------------------------------
```
<!--CLOC-END-->

## Sponsor / Donate / Support
If you find this work interesting, helpful, or valuable, or that it has saved you time, money, or both, please consider directly supporting these efforts financially via [GitHub Sponsors](https://github.com/sponsors/500Foods) or donating via [Buy Me a Pizza](https://www.buymeacoffee.com/andrewsimard500). Also, check out these other [GitHub Repositories](https://github.com/500Foods?tab=repositories&q=&sort=stargazers) that may interest you.

## More TMS WEB Core and TMS XData Content
If you're interested in other TMS WEB Core and TMS XData content, follow along on 𝕏 at [@WebCoreAndMore](https://x.com/WebCoreAndMore), join our 𝕏 [Web Core and More Community](https://twitter.com/i/communities/1683267402384183296), or check out the [TMS Software Blog](https://www.tmssoftware.com/site/blog.asp).
