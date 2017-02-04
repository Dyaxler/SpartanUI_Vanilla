# SpartanUI

Welcome to SpartanUI for Vanilla WoW 1.12 - backported from version 2.1.3 written by Ansu. 

There isn't much left of his original code as I've had to re-write/delete most of it to get it all 
to function correctly with Vanilla WoW. I'm fairly certain that it's stable enough to be considered
an Alpha level release so I've tagged it as version .9 - I'll consider it stable enough for release
once I use it for a while with my own toons and mods. So, use at your own risk. If you see a bug,
please document it as best you can and shoot me an email. In game switch is /sui or /spartanui

Most of the features you know from the later versions of SpartanUI are present. For example,
SpartanUI users can see what spec you are by targeting you and hovering over your class icon. You
both have to be members of the same Party (I'll add back the guild and raid channels later). This
is achieved by using Blizzards AddOn MSG channel. In the later versions they added a WHISPER
channel so you could ask another SpartanUI user what their spec is without having to be in the same
Party/Guild/Raid – yeah, I had to trim that feature down a little and completely rewrite it.
SpartanUI users can also see that you're Flagged AFK or during a RAID when the Raid leader does a
ReadyCheck, you can see if members of your party clicked Yes or No. Kind of limited but I thought
it was cool enough to keep. Of course the famous SpinCam is still present!

The Player Cast Bar was horribly broken for too many reasons that I'm not going to explain but I
got it working along with correcting all the math for calculating spell delays and interrupts along
with all the buffs/debuff icons properly showing as much as the Default Blizzard UI would allow.
The Debuffs appear on an enemy target but no timers and no Buffs. I would have had to add an
embedded database for that and most players have their own enemy Debuff/Buff tracker they like and
would prefer to use anyway so I decided to stick with keeping the features Blizzard like - of
course with a nicer looking skin!

The later versions of SpartanUI began using Bartender3. I’ve completely rewritten Bartender2 and
created an embedded version specifically for this version of SpartanUI. Sorry… default number of
Blizzard Bars with this version. I’ve considered disjoining the buttons from the default bar
containers and building a custom set (Bartender3 like) of my own but after reading through all the
code and checking out how other Bar mods do it… sheesh. Forget it. Besides, you don’t always get
the same buttons in the same place so if I were to ever update it to a later code base, you’d have
to move all your buttons around. What a pain in the arse.

I could have added some new goodies, bells and whistles but I decided to try and stick to a
SpartanUI everyone knows and loves – or at least as much as one can do in Vanilla WoW! Don’t forget
to check out the in game options menu for things that you can try out and toggle.

**There is a fairly large Vanilla WoW MobInfo database included with this release. I recommend that
you use it because it will populate your target frame with Mobs real (or close to real/average)
HP/Mana data. Just move MobInfo2.lua from 'Backup MobInfo' to your global 'SavedVariables' folder
and it will be available for all your toons.


	..\%WOWROOT%

		\WTF
		
			\Account
			
				\%USERNAME%
				
					\SavedVariables  <--