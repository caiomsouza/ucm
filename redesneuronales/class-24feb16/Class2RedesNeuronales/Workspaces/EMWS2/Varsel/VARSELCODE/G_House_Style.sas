*;
/*----G_House_Style begin----*/
length _NORM6 $ 6;
_NORM6 = put( House_Style , $6. );
%DMNORMIP( _NORM6 )
drop _NORM6;
select(_NORM6);
when("1.5FIN" ) G_House_Style = 1;
when("1.5UNF" ) G_House_Style = 0;
when("1STORY" ) G_House_Style = 4;
when("2.5FIN" ) G_House_Style = 5;
when("2.5UNF" ) G_House_Style = 4;
when("2STORY" ) G_House_Style = 5;
when("SFOYER" ) G_House_Style = 2;
when("SLVL  " ) G_House_Style = 3;
otherwise substr(_WARN_, 2, 1) = 'U';
end;
label G_House_Style="Grouped Levels for House_Style";
/*----G_House_Style end----*/
