%The_Main_Facts--------------
%Total_people----------------
people(alice).
people(husband).
people(brother).
people(son).
people(daughter).

%Total_male----------------
male(husband).
male(brother).
male(son).

%Total_female----------------
female(alice).
female(daughter).

%Total_twins----------------
twins(brother,alice).
twins(son,daughter).

%Total_Child----------------
child(son).
child(daughter).

%Not_alone_twins----------------
not_alone(alice).
not_alone(brother).

%Not_getting_together----------------
together(husband,alice).
together(son,daughter).

%Not_in_beach----------------
no_beach(husband,alice).
no_beach(son,daughter).

%Killer_will_be_Younger----------------
older(alice,son).
older(alice,daughter).
older(husband,son).
older(husband,daughter).
older(brother,son).
older(brother,daughter).

%Rules------------------
atbar(M,F):-male(M),female(F). /*Two_of_them_at_bar*/
alone(C):-child(C). /*One_child_at_home*/
twin_victim_is(X):-twins(X,Y). /*One_being_murdered*/

%Quary------------------
murderer(Victim,Killer,BarMale,BarFemale,HomeAlone):- 
twin_victim_is(Victim),people(Killer),
Killer\=@=Victim, /*killer_and_victim_are_not_the_same*/

not(twins(Victim,Killer)), /*Two_of_them_are_not_killer_and_victim*/

not(older(Killer,Victim)), /*Killer_Must_be_Younger*/

not(together(Killer,Victim)), /*Husband_And_Alice_Are_Not_together*/

atbar(BarMale,BarFemale), /*Two_of_them_at_bar_are_not_victim_or_killer*/
BarMale\=@=Killer,BarMale\=@=Victim,
BarFemale\=@=Killer,BarFemale\=@=Victim,

alone(HomeAlone), /*At_Home_not_victim_or_killer*/
HomeAlone\=@=BarMale,HomeAlone\=@=BarFemale,
HomeAlone\=@=Killer,HomeAlone\=@=Victim.

%To_Find_Result_Use_It------------------
%murderer(Victim,Killer,BarMale,BarFemale,HomeAlone).

