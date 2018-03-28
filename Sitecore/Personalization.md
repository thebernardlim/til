Source of below definition: https://www.degdigital.com/insights/sitecore-personalization-profiles/

Profile: Profiles are used for organizational purposes, not to create a user profile.
Profile keys: Profile keys are attributes that are applied to your personas – think of audience segments or content categories.
Profile cards (Personas): Profile cards are groups of profile keys (attributes) that are used to assign values to content items or components.
Pattern cards: Pattern cards are used to map profile values to your website visitors. These cards are used to profile your audience and make assumptions about who specific types of visitors are and what you want them to see.

** 	Profile cards : What applies value points onto a user's experience
	Pattern cards : What that experience gets matched to if the points align to the pattern

1. Define personas
2. Define profile keys
3. Define profile cards (a list of profile keys with points (1- 10) )
4. Define pattern cards 
5. Tag content items with profile cards (so that user will accrue points when visiting the items). Multiple profile cards can be assigned to a single content item. Percentage must be specified if multiple profile cards


Example:
	
Activity
- Gymnastics
- Oly
- Cardio

Destination
- Asia
- Europe
- US

Profiles: Activity, Destination
Profile Keys: Gymnastics, Oly, Asia, Europe

Profile Cards:
- WOD Throwdown Events
- Running Events
- Spartan Events

Pattern Cards:
- Crossfitter
- Runner
- Bootcamper

When a visitor navigates through a website, they accumulate the profile values of all the pages and resources that they request. 
Sitecore calculates the average score that the visitor has accumulated for each profile and maps the visitor to the pattern card that is the closest match.
A visitor can only be mapped to one pattern card at a time. However, as a visitor navigates through your website, 
the pattern card that they are mapped to can change as they interact with different items and resources.
Sitecore matches 1 pattern card per profile
Personalization rule: When current visit matches the "Crossfitter pattern" in the Activity Pattern, show 'xxx' content
	
Examples:
Profile : 	Crossfit 
Profile Keys : 	Snatch, CnJ, Pullups
Profile cards : Froning (Excels in all 3)
		MrGymnast (Excels in weightlifting only)
Pattern cards : All rounder
		Gymnast	
For each page, tag a profile card
Example: snatch, cnj to Froning. Pullups to Gymnast
Each click to snatch / cnj , will score on Froning?
Each click to pullup page, will score on Gymnast?
Hence end of day, can see which profile scores higher.

For home page, featured article component, personalize so that All Rounder can see 'Snatch' page, and Gymnast will see 'Pullups' page

------------------------------------------------------------------------------------------------------------------------------------------------------------------------

To identify a user:
Sitecore.Analytics.Tracker.Current.Session.Identify(email)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Engagement where goal has points assigned

Goal - Type of Page Event
Outcome & Personalization

Example scenario: When a user clicks 'Subscribe', hide the Subscribe form.

1. Create outcome defintion under Marketing Control Panel -> Outcomes called 'Subscribed'
2. In specific controller method, example 'Index' method in 'Subscribe' controller, 
   - Create outcome (Sitrecore.Analytics.Outcome.Model.ContactOutcome)
   - Constructor requires Random ID, ID of the outcome defintion item, current contact's ID
3. In Experience Editor, under 'Controls', choose 'Personalize' and choose Outcome related interaction and set specific rules. Example 'hide component when subscribed'


   

