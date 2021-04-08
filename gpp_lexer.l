%{
    #include "y.tab.h"  
%}

%%
[;;][^\n]* 
[(] {return OP_OP;}
[)] {return OP_CP;}
[ ] ;
[\n\r] 
and {return KW_AND;}
or {return KW_OR;}
not {return KW_NOT;}
equal {return KW_EQUAL;}
less {return KW_LESS;}
nil {return KW_NIL;}
list {return KW_LIST;}
append return KW_APPEND;
concat return KW_CONCAT;
set {return KW_SET;}
deffun 
for return KW_FOR;
if return KW_IF;
exit {return KW_EXIT;}
load 
disp 
true {return KW_TRUE;}
false {return KW_FALSE;}
[+] {return OP_PLUS;}
[-] {return OP_MINUS;}
[*] {return OP_MULT;}
[/] return OP_DIV;
"**" return OP_DBLMULT;
["].*["] 
[,] 
[+-/*]+[A-Za-z]+ printf("SYNTAX_ERROR1!\n"); return 1;
[0-9]+[A-Za-z]+ printf("SYNTAX_ERROR2!\n"); return 1;
[A-Za-z]+[+-/*]+ printf("SYNTAX_ERROR3!\n"); return 1;
[0]+[0-9]+ printf("SYNTAX_ERROR4!\n"); return 1;
[0-9]* {yylval.num = atoi(yytext); return NUMBER;}
[A-Za-z][A-Za-z0-9]* {strcpy(yylval.id, yytext); return IDENTIFIER;}

. printf("SYNTAX_ERROR! %s\n", yytext); return 1;
%%

int yywrap(){
    return 1;   
}

