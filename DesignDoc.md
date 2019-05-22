# Homonym Tracker

## Overview
Create an app that can access the Treit homonym list on iPhones.

## Problem
Treits like to discover homonyms but it's hard to keep track of them all across family members. We need a central repository for discovered homonyms.

## Definition of Homonym
For the purose of this app, a homonym is defined in the Treit manner as:

*Two or more words having the same pronunciation but different spellings and meanings. For example, rap and wrap.*

Note that technically a homonym in English may include words with the same spelling but different meanings. These are not Treit homonyms. 

## Goals
The app should work on iPhones and store data in a central repository so all Treits can access the current list of homonyms. The base list will be imported from Mom's 75th birthday yellow pad.

## Non-Goals
Commercialization, or expansion beyond a simple tracking app.

## Milestones
June 1 - Propose language and tools that will be used to create the app.
*Exploring Kivy/Python solution - May 22. Kivy probably not what I want, researching alternatives including BeeWare Project*

**Final decision is to write this app in Swift for iOS**

June 1 - Finish Swift Tutorials

June 10th - App can read centralized list

June 30th - App can write to centralized list.

July 15th - Beta version installed on Treit phones.

August 1 - v 1.0 tested and shipped

## Proposed Solution
V 1.0 Create an app that will read the stored  homonym list and can display an alphabetical list of all discovered homonyms. 

V 1.1 add search feature

## Use Cases
### Search for Homonyms
**Actor** User

**Description** - User looks up a single word and the system returns search result. Search result includes related homonyms.

### Browse Homonyms
**Actor** User

**Description** - Display a list of the current homonyms in alphabetical order.

### Add Homonyms
**Actor** User

**Description** - Add homonym sets to list. Sets may be two words or more.

### Add Users
*Actor* Admin

**Description** - Add users who can access the list.

## Test Cases
Give to Treits
Fix probelems they find.

---
## Development Tools Decisions
May 22 - tried installing Kivy on Mac OS X. Can not get Kivy to run. Others have had similar issues. Before spending time troubleshooting looked up other options. Found out Kivy does not suppot iOS "look and feel" but rather a custom UI, which is not what I want. Now researching BeeWare project. BeeWare looks promising but is still pretty new. Best, most stable option is just to use Swift.

Discovering that writing iOS apps in Python is still a relatively new field. May have to learn Swift.

Have decided to learn Swift.