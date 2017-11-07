Source of below definition: https://www.degdigital.com/insights/sitecore-personalization-profiles/

Profile: Profiles are used for organizational purposes, not to create a user profile.
Profile keys: Profile keys are attributes that are applied to your personas – think of audience segments or content categories.
Profile cards (Personas): Profile cards are groups of profile keys (attributes) that are used to assign values to content items or components.
Pattern cards: Pattern cards are used to map profile values to your website visitors. These cards are used to profile your audience and make assumptions about who specific types of visitors are and what you want them to see.

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

Outcome & Personalization

Example scenario: When a user clicks 'Subscribe', hide the Subscribe form.

1. Create outcome defintion under Marketing Control Panel -> Outcomes called 'Subscribed'
2. In specific controller method, example 'Index' method in 'Subscribe' controller, 
   - Create outcome (Sitrecore.Analytics.Outcome.Model.ContactOutcome)
   - Constructor requires Random ID, ID of the outcome defintion item, current contact's ID
3. In Experience Editor, under 'Controls', choose 'Personalize' and choose Outcome related interaction and set specific rules. Example 'hide component when subscribed'


   

