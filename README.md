# BR1 SQFLib

This library is meant to serve as a repository of BR1's collective knowledge with Arma 3 mission building using SQF scripts and definition files to hopefully make missions more dynamic and interesting to play for our members.

## How to use

Simply find a script/definition you want to use, and either copy the file, or read through the file and copy/paste the portion you need. Every file is documented as to what they do, including links to the BIwiki for relevant functions.

## Sections

### definitions

Contains missionfile definitions, this is mostly things such as defining custom factions, music files, graphics for briefing/splash screens, etc.

For more information on using definitions, see HOWTO_DEFINITIONS.md

### scripts

SQF scripts designed to be callable either standalone, or via paste into triggers/units code blocks.

Calling an SQF script is very easy, but can be complicated by the introduction of how script execution works over network.

For more information on script execution, see HOWTO_SCRIPTS.md

### Caveats about content (audio & images)

Arma 3 is a strange game, at least from a content-maker's perspective.

For the most part, you should be ok with using PNG or JPEG files for images, however on the very likely chance it doesn't, you'll need to convert it to a .paa file, which is Bohemia's internal image file format. This can be done by using the Arma 3 Tools to convert images to paa.

Additionally, Arma 3 doesn't like working with images that aren't Base-2, this means that the width or height must be in base-2, For example, 561x920 for an image size will likely fail, but 512x1024 will work.

Just use 2^whatever to find a size that works best for you

For audio, Arma 3 works with oggvorbis encoded sounds, these are simply .ogg files. Do keep in mind, that these files like any audio file, can be hefty. Try to compress the files as much as possible to save space while not compromising the quality of the sound you're adding.

Any audio editor with OGGVorbis support will be fine for dealing with music/sounds.

Keep filesize in mind at all times, remember that anytime a user connects to the mission, they have to download the entire file, this includes every and all audio and image data you have in the mission file. No one want's to wait 3min to download a missionfile unless it's absolutely worth it.

### Post-Processing FX

There exists on the workshop, a fantastic scenario that allows you to edit post-processing effects and export the code to use them to your clipboard. This is very useful to toy around and find out exactly what each effect does.

The scenario can be found here: <https://steamcommunity.com/sharedfiles/filedetails/?id=350606620>

Using it is as simple as hitting export, then pasting the code wherever you need it.
