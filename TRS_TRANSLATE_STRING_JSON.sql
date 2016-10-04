set define off


create or replace function TRS_TRANSLATE_STRING_JSON
( IV_TEXT in nclob
, IV_SOURCE_LANGUAGE_CODE in varchar2
, IV_TARGET_LANGUAGE_CODE in varchar2
) return nclob
is

    LV_RESPONSE         apex_json.t_values;
    LV_OUTPUT           varchar2(32767) default '';
    LV_OUTPUT_ARR       UTL_HTTP.html_pieces;
    LV_GOOGLE_API_KEY   varchar2(4000) default 'YOUR KEY HERE';
    LV_WALLET_PATH      varchar2(255)  default 'file:<<YOUR WALLET HERE>>';
    LV_WALLET_PASSWORD  varchar2(255)  default '<<YOUR WALLET PASSWORD HERE>>';
    LV_UTL              varchar2(4000) default 'https://www.googleapis.com/language/translate/v2?key='||LV_GOOGLE_API_KEY||'&q=';
    begin

    LV_UTL:=LV_UTL||utl_url.escape(IV_TEXT,TRUE) ||'&source=' || IV_SOURCE_LANGUAGE_CODE || '&target=' || IV_TARGET_LANGUAGE_CODE;

    LV_OUTPUT_ARR := utl_http.request_pieces
    (   url => LV_UTL,
        max_pieces => 16,   
        proxy => '',
        wallet_path => LV_WALLET_PATH,
        wallet_password => LV_WALLET_PASSWORD
    );

    FOR i IN 1 .. LV_OUTPUT_ARR.COUNT
    LOOP
       LV_OUTPUT := LV_OUTPUT || LV_OUTPUT_ARR(i);
    END LOOP;   
     
    apex_json.parse(LV_RESPONSE, LV_OUTPUT);

    if length(APEX_JSON.GET_VARCHAR2(P_PATH=> 'error.message', P_VALUES=>LV_RESPONSE))>0 then
        return 'TRS_TRANSLATE_STRING_JSON error: '||APEX_JSON.GET_VARCHAR2(P_PATH=> 'error.message', P_VALUES=>LV_RESPONSE);
    else
        return apex_json.get_varchar2(P_PATH=> 'data.translations[%d].translatedText',P0=> 1, P_VALUES=>LV_RESPONSE);
    end if;

    return 'TRS_TRANSLATE_STRING_JSON unspecified error';

end TRS_TRANSLATE_STRING_JSON;
/

set define on
