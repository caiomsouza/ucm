*;
/*----G_Functional begin----*/
length _NORM4 $ 4;
_NORM4 = put( Functional , $4. );
%DMNORMIP( _NORM4 )
drop _NORM4;
select(_NORM4);
when("MAJ1" ) G_Functional = 2;
when("MAJ2" ) G_Functional = 1;
when("MIN1" ) G_Functional = 2;
when("MIN2" ) G_Functional = 2;
when("MOD " ) G_Functional = 2;
when("SAL " ) G_Functional = 0;
when("SEV " ) G_Functional = 1;
when("TYP " ) G_Functional = 3;
otherwise substr(_WARN_, 2, 1) = 'U';
end;
label G_Functional="Grouped Levels for Functional";
/*----G_Functional end----*/
