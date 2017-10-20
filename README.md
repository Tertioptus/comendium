# Compendium

Compendium is a user-story tracking system for agile team collaboration, project management, and resource sharing, that can be shared across multiple desktop terminals. 

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

`[s.<status>][l.<level>][a.<architecture>]-<narrative>/`

`<status>	:= \d
<level>		:= \d{2}
<architecture>	:= \c
<narrative> 	:= \w{1,100}(-<context>)?
<context>	:= \(\w{1,20} <context>?\)`

`e.g."[s.X][l.00][a.F]-Profiles Projection (Date (Any))"`

And then adding the following files in the story directory:

[story directory]/
> tag.story

> \#[hash code]

The xp tool set can be used to initiate a story entry session by typing the following command:

`xp add`

You will then be guided through the story building by a series of terminal prompts.


### Understanding the story schema
[Not documented yet]
#### From the backlog
[Not documented yet]
#### Within a story
[Not documented yet]
## Modifying a story
[Not documented yet]
## Relating two stories
[Not documented yet]
## Tallying the backlog score
[Not documented yet]
## Adding a scenario to a story
[Not documented yet]
