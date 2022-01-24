# How to use scripts

Overall, if you want to skip this file, you should at least be familiar with this wiki page before jumping in.

https://community.bistudio.com/wiki/Multiplayer_Scripting

## A primer on server-client scripting

An important note to start out with, is how scripts are called. For singleplayer, this is simple, as the server and client are the same machine. This however changes when running in multiplayer.

Typically, when you execute any code, it is only executed server-side. This would mean if you tried to run code that is supposed to appear for clients, such as music, it would only run for the server unless you properly execute the script to run for all the connected clients.

Read https://community.bistudio.com/wiki/Arma_3:_Remote_Execution for more information.

## Locality

Locality is simply put, where the effect of a command or function is expected to occur. Anyone familiar with the Esc debug menu will have already seen buttons for running scripts Global, Server, and Local.

This is the locality, or where we execute code.

https://community.bistudio.com/wiki/Multiplayer_Scripting#Locality is a good place to read up on Locality in more detail.

It is vital that you understand the locality of any command you intend to use, as it is drastically impacted when trying to take a mission from singleplayer to multiplayer.

For example, running code that plays music should run on client machines, so they should have a Global locaity.

Enabling a hidden object and changing it's state meanwhile is something that should only be run on the server (otherwise we're running it as many times as there are clients). Which would make it of Server locality.

Most of the functions on the BIWiki are well documented to include what locality the arguments and effects are, so you can determine in what context each needs to be run in.

Be warned, the initialization field for units & groups in mission runs for EVERY player both in mission, and joining.
