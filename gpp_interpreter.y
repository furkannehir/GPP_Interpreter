%{  
    #include <ctype.h>  
    #include <stdio.h> 
    #include <stdlib.h>
    #include "uthash.h"
    void yyerror(char* s);
    int yylex();

    typedef struct ide{
        int value;
        char id[32];
        UT_hash_handle hh;
    }identifier;
    identifier* identifier_table = NULL;
    void add_id_table(char* id, int value){
        
        identifier* temp;
        HASH_FIND_STR(identifier_table, id, temp);
        if(temp){
            temp->value = value;
        }
        else{
            temp = (identifier*)malloc(sizeof(identifier));
            strcpy(temp->id, id);
            temp->value = value;
            HASH_ADD_STR(identifier_table, id, temp);
        }
    }
    int get_table(char* id){
        identifier* temp;
        
        HASH_FIND_STR( identifier_table, id, temp);
        if (temp) 
            return temp->value;
        else 
            printf("%s is not declared!", id);
            exit(0);
    }
    void clear_table(){
        identifier* temp;
        identifier* del;
        HASH_ITER(hh, identifier_table, temp, del) {
            HASH_DEL(identifier_table, temp);
            free(temp);
        }
    }
    
%}
%union {
    int num;
    char id[32];
    int* list_t;
}
%start input
%token OP_OP OP_CP OP_PLUS OP_MINUS OP_MULT OP_DIV OP_DBLMULT
%token KW_AND KW_OR KW_NOT KW_EQUAL KW_LESS KW_NIL KW_TRUE KW_FALSE KW_SET KW_FOR KW_IF
%token KW_EXIT 
%token KW_LIST KW_APPEND KW_CONCAT
%token <id> IDENTIFIER
%token <num> NUMBER
%type <num> expi input expb
%type <list_t> list list_values 



%% 
input: expi { printf("%d\n", $1);}
    | input expi { printf("%d\n", $2);};
    | expb {if($1) printf("TRUE\n"); else printf("FALSE\n");}
    | input expb {if($2) printf("TRUE\n"); else printf("FALSE\n");}
    | list {for(int i = 1; i <= $1[0]; ++i) printf("%d ", $1[i]); printf("\n");}
    | input list {for(int i = 1; i <= $2[0]; ++i) printf("%d ", $2[i]); printf("\n");}
    | OP_OP KW_EXIT OP_CP {printf("BYE!\n"); exit(0);};
expi: OP_OP OP_PLUS expi expi OP_CP {$$ = $3 + $4;}
    | OP_OP OP_MINUS expi expi OP_CP {$$ = $3 - $4;}
    | OP_OP OP_MULT expi expi OP_CP {$$ = $3 * $4;}
    | OP_OP OP_DIV expi expi OP_CP {$$ = $3 / $4;}
    | OP_OP OP_DBLMULT expi expi OP_CP {$$=1; for(int i = 0; i < $4; i++){$$ = $$ * $3;}}
    | OP_OP KW_SET IDENTIFIER NUMBER OP_CP {$$ = $4; add_id_table($3, $4);}
    | OP_OP KW_IF expb expi expi OP_CP {if($3) $$ = $4; else $$ = $5;}
    | OP_OP KW_IF expb expi OP_CP {if($3) $$ = $4; else $$ = 0;}
    | NUMBER {$$ = $1;}
    | IDENTIFIER {$$ = get_table($1);};
expb: OP_OP KW_AND expb expb OP_CP {if($3 && $4) $$ = 1; else $$ = 0;}
    | OP_OP KW_OR expb expb OP_CP {if($3 || $4) $$ = 1; else $$ = 0;}
    | OP_OP KW_NOT expb OP_CP {if($3) $$ = 0; else $$ = 1;}
    | KW_TRUE {$$ = 1;}
    | KW_FALSE {$$ = 0;}
    | OP_OP KW_EQUAL expi expi OP_CP {if($3 == $4) $$ = 1; else $$ = 0;}
    | OP_OP KW_LESS expi expi OP_CP {if($3 < $4) $$ = 1; else $$ = 0;};
list: OP_OP KW_LIST list_values OP_CP {$$ = $3;}
    | OP_OP KW_LIST OP_CP {$$ = NULL;}
    | OP_OP KW_LIST KW_NIL OP_CP {$$ = NULL;};
list_values: NUMBER {$$ = malloc(sizeof(int)*2); $$[0] = 1; $$[1] = $1;}
    | list_values NUMBER {$$ = realloc($$, $1[0]+2); $$[0]++; $$[$$[0]] = $2;};
%%
 
   void yyerror(char* s){
       printf("%s\n", s);
   }
int main(void)  
{ 
    yyparse(); 
    free(yylval.list_t);
    clear_table();
        
}   