#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <sys/types.h>
#include <sys/wait.h>
#include<windows.h>
#include<unistd.h>
#include <math.h>
int hp = 0;
int menu(){
    int choise;
    printf("\n###-------------------------------- Select from the below options -------------------------------###\n");
    printf("\nContinue battles with the same stats :  Press (1)\n");
    printf("\nSmall Rest : Continue battles with the same heal 10/100 hp and lose 10/100 XP :  Press (2)\n");
    printf("\nBig Rest : Continue battles with the same heal 20/100 hp and lose 20/100 XP :  Press (3)\n");
    scanf("%d",&choise);
    return choise;
}
void update_hero_stats(int points_lost) {
    hp -= points_lost;
    if (hp < 0) {
        hp = 0;  // Make sure hit points don't go below zero
    }
}
void print_stats_player(int level,int hp,int damage,int XP){
    printf("\nHero stats : level %d , Hit Points : %d , Damage : %d , XP : %d " , level,hp,damage,XP);
}

int * generate_monster(int diff ){
    srand(time(0)); 
    static int monster_stats[2];
    int monster_hp = (rand() % (diff *2-  diff + 1)) + diff; 
    int monster_damage = (rand() % (diff/2 -  diff/4 + 1)) + diff/4; 
    printf("\nMonster stats : Hit Points : %d , Damage : %d ," , monster_hp,monster_damage);
    monster_stats[0]=monster_hp;
    monster_stats[1] =monster_damage;
    return monster_stats;
}

int  gainXP(int moster_hp,int monster_damage){
    return moster_hp+monster_damage;
}
int holdHp(int old_hp){
    int new_hp ;
    return new_hp = old_hp; 
}
int fight(int level,int hp,int damage,int monster_hp,int monster_damage,int num_battles){
    printf("\n###------------------------------- ( Battle:  %d ) -----------------------------### \n",num_battles);
    int round =1;
    while(hp>0 && monster_hp>0){
        printf("\n----------------------------------- round:  %d ----------------------------- ",round);
        monster_hp -=damage ;
        update_hero_stats(monster_damage);
        printf("\nMonster hp : %d",monster_hp);
        if (monster_hp <= 0){
            break;
        }
        hp -=  monster_damage;
        printf("\nHero hp : %d",hp);
        if(hp<=0){
            break;
        }
        round++;
    }

    if (hp<=0){
        printf("\nHero die");
        //HoldHp(hp);
        return 0;  // Hero lose
    }
    else{
        //update_hero_stats(hp);
        printf("\nMonster die");
        //HoldHp(hp);
        return 1; //Hero Win 
    }
}

int main(){
    int level = 1;
    hp = 100;
    int new_hp = 100;
    int damage =10;
    int diff = 20; 
    int XP=0;
    int *monster_stats;
    print_stats_player(level,hp,damage,XP);
    monster_stats = generate_monster(diff);


    int choise;
    int num_battles = 1;

    while(fight(level, hp, damage,*(monster_stats),*(monster_stats+1),num_battles) !=0){
        XP+=gainXP(*(monster_stats) ,*(monster_stats+1));

        if(XP>=  50*pow(2,level)){
            sleep(4);
            level++;
            damage +=5;
            hp =new_hp;
            hp+=20;
            new_hp = hp;
            //printf("\033[0;31m"); //Set the text to the color red
            printf("\n Congratulation you level up \n Boost your Hp and Damage \n");
            print_stats_player(level,hp,damage,XP);
        }
        
        else{
            choise = menu();
            if(choise==1){
                //print_stats_player(level,hp,damage,XP);
                //continue;
            }
            else if(choise ==2){
                hp=hp+10/100 * hp;
                XP=XP-10/100*XP;
                //print_stats_player(level,hp,damage,XP);
            }
            else if (choise == 3){
                hp=hp+20/100 * hp;
                XP=XP-20/100*XP;  
                //print_stats_player(level,hp,damage,XP);
            }
            //system("clear");
        }
        diff+=4;
        printf("\n %d \n",diff);
        monster_stats = generate_monster(diff);
        
        print_stats_player(level,hp,damage,XP);
        num_battles ++;
    }
}