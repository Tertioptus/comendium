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

[repository name]/
	
> .compendium

> backlog/

> history/

## Adding a story

A feature story can be added by making a directory in the backlog folder with the following structure:

`<status><layer><level>-<narrative>/`

Grammar:

- `<status>	:= \d`
- `<layer>	:= \c`
- `<level>	:= \d{2}`
- `<narrative> 	:= <subject>\.<object>\.<verb> (<context>)*`
- `<subject> 	:= \w{1,100}`
- `<object>	:= \w{1,100}`
- `<verb>	:= \w{1,100}`
- `<context>	:= \(\w{1,20} <context>?\)`

`e.g."XB00-Profiles.Projection.Run (Date (Any))"`


### Status
labels set such that the alphanumeric ordering represents priority of execution	

1. [_] - unintitated/undocumented story
2. a - approved
3. c - completed
4. d - documented
5. r - reserved, registered (story must have an owner)
6. s - suspended, waiting for story deliverable
7. x - cclosed
8. z - asleep

l - level, rank = 81 - points

### Layer

2. b - business
3. i - interface
4. l - logic
5. p - persistence
6. s - security
	
And then adding the following files in the story directory:

[story directory]/
> narrative

> \(owner.\<user email address\>\)?
	
> \(requirement.\<required story\>\)*

> \#[hash code]

The xp tool set can be used to initiate a story entry session by typing the following command:

`xp add`

You will then be guided through the story building by a series of terminal prompts.
