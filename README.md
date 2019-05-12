# Compendium

Compendium is a user-story tracking specification for agile team collaboration, project management, and resource sharing.  XP is a companion script for the compendium specification, that can be shared across multiple desktop terminals.

## Contents

- [Installation](#installation)
- [Creating a repository](#creating-a-repository)
- [Adding a story](#adding-a-story)
- [Understanding the story schema](#understanding-the-story-schema)

The following terminal command creates **.compendium** file in the current directory which signifies the root of a compendium repository:

`xp init`

An initial repository name can be specified by appending it to the init command:

`xp init [repository name]`

Also, added to the root directory, a "backlog" folder for story tracking and a "history" folder for releases.

The ideal directory structure would look like the following:

`[code base root directory]/[repository name]/[compendium files]`

Compendium files:

- `.compendium` 
- `backlog/`  
- `history/`  

## Adding a story

A feature story can be added by making a directory in the backlog folder with the following structure:

`<status><release><rank>-<narrative>/`

Grammar:

- `<status>	:= [_ACDRSXZacdrsxz]`
- `<release>	:= \d{2}`
- `<rank>	:= \d{2}`
- `<narrative> 	:= <subject>\.<object>\.<verb> (<context>)*`
- `<subject> 	:= \w{1,100}`
- `<object>	:= \w{1,100}`
- `<verb>	:= \w{1,100}`
- `<context>	:= (\w{1,20} <context>?)`

`e.g."X0002-Profiles.Projection.Run (Date (Any))"`


### Status
labels set such that the alphanumeric ordering represents priority of execution	

- [_] - uninitiated/undocumented story
- a - approved
- c - completed
- d - documented
- r - reserved, registered (story must have an owner)
- s - suspended, waiting for story deliverable
- x - closed
- z - asleep

rank = 81 - points
	
And then adding the following files in the story directory:

`[story directory]/[story components]`

Story components:

- `narrative`

- `\(owner.\<user email address\>\)?`
	
- `\(requirement.\<required story\>\)*`

- `\#[hash code]`

The xp tool set can be used to initiate a story entry session by typing the following command:

`xp add`

You will then be guided through the story building by a series of terminal prompts.
