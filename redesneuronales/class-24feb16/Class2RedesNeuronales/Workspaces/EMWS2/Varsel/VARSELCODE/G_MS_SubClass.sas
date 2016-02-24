*;
/*----G_MS_SubClass begin----*/
length _NORM3 $ 3;
_NORM3 = put( MS_SubClass , $3. );
%DMNORMIP( _NORM3 )
drop _NORM3;
select(_NORM3);
when("020" ) G_MS_SubClass = 6;
when("030" ) G_MS_SubClass = 0;
when("040" ) G_MS_SubClass = 4;
when("045" ) G_MS_SubClass = 1;
when("050" ) G_MS_SubClass = 3;
when("060" ) G_MS_SubClass = 8;
when("070" ) G_MS_SubClass = 4;
when("075" ) G_MS_SubClass = 7;
when("080" ) G_MS_SubClass = 5;
when("085" ) G_MS_SubClass = 4;
when("090" ) G_MS_SubClass = 3;
when("120" ) G_MS_SubClass = 7;
when("150" ) G_MS_SubClass = 4;
when("160" ) G_MS_SubClass = 3;
when("180" ) G_MS_SubClass = 1;
when("190" ) G_MS_SubClass = 2;
otherwise substr(_WARN_, 2, 1) = 'U';
end;
label G_MS_SubClass="Grouped Levels for MS_SubClass";
/*----G_MS_SubClass end----*/
