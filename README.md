# TransAPEX
Fully translate Oracle APEX ( >= version 5.1 ) applications from within APEX.
Trans APEX is an APEX application that enables you to keep track of translation process in APEX - create projects containing multiple languages, automatically translate the texts using translation services (eg. Google Translator), review them and translate unique strings instead of multiple occurrences of the same text within an application. 


4-March-2016 : 
Initial release.
10 March-2016 : EA 1.01 
Changes to TRS_TRANSLATE_STRING_JSON, from now on APEX_JSON is used so PL/JSON is no longer needed (this was also missing from the initial manual).
15 March-2016 : EA 1.02 
Changes to TRS_TRANSLATE_STRING_JSON, fixed limitation of 2000 characters per translation string.
16 March-2016 : EA 1.03 
Addition : Create synonym for WWV_FLOW_LANGUAGES.
21 March-2016 : EA 1.04 
Changes to TRS_TRANSLATE_STRING_GOOGLE so this supports longer strings and works similar to the “commercial” version TRS_TRANSLATE_STRING_JSON which requires HTTPS and a Google API key. Now the default installation should be sufficient for most environments.
22 March-2016 : EA 1.05 
Changes to TRS_TRANSLATE_STRING_GOOGLE, no need to use the JSON version with API key anymore as long as google translate does not change the format. Default install should work just as good as the API version of google.
22 November-2016 : EA 1.06 
Typos in document. Created workspace selector on create project screen to first select a workspace. Value is also shown on the project overview report..
15 October-2017 : EA 1.07 
Corrected typos in document. Fixed 32k limit for translation strings. Improved default for “translation setting” REGEXP_INSTR_SKIP_DISTINCT_STRING_SOURCE_TXT which enables you to exclude strings containing a certain pattern from the automatic ( google ) translation.
28-November-2017 : EA 1.08
Added installation check for execute grant on UTL_HTTP
19-June-2018 : EA 1.09
Added support for APEX text messages. These are now integrated as part of the translation process. Only text messages which al already defined in the standard application language will be included and suggested for translation. The field “SOURCE” on the “Translation strings” contains either the value “APPLICATION” for standard application texts, or “MESSAGES” for APEX text messages. The translation process for standard texts and text messages is the same, the only difference is that changes for messages don’t need to be published on order to be visible ( similar to standard APEX ). 
Also a simple grid is added to the unique strings page to speeden up the process of translation large amounts of short texts.
