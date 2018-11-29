# PGPBXToCMake
**THIS IS VERY EARLY WORK!** 
It doesn't do anything yet besides read in the PList project file,
create an object tree out of it, and then print out some debugging statements.


## Description
This application is a command-line utility for Linux to build projects
developed using Apple's XCode IDE. It will read the project's project.pbxproj
file and, depending on the command line options provided, create a
[CMAKE](https://cmake.org) CMakeLists.txt file or simply build the project
directly.

## Building
In order to build this project you will need to have the
[Rubicon framework](https://github.com/GalenRhodes/Rubicon) which you can get from here:
[https://github.com/GalenRhodes/Rubicon](https://github.com/GalenRhodes/Rubicon)

And, of course, it goes without saying that you will need [GNUstep](https://github.com/gnustep):
[https://github.com/gnustep](https://github.com/gnustep).

To build this project, enter the following from the command line:

```bash
> git clone https://github.com/GalenRhodes/PGPBXToCMake.git PGPBXToCMake
> mkdir -p PGPBXToCMake/build
> cd PGPBXToCMake/build
> cmake -G Unix\ Makefiles -DCMAKE_BUILD_TYPE=Release ..
> make
> ./PGPBXToCMake/PGPBXToCMake ../PGPBXToCMake/SupportingFiles/Sample.plist

```
