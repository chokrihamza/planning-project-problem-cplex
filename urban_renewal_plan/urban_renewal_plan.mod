/*********************************************
 * OPL 20.1.0.0 Model
 * Author: chokrihamza
 * Creation Date: 13 déc. 2021 at 21:44:20
 *********************************************/
 // les indices
int projects=...;
int duration=...;

range Proj=1..projects;
range Periode=1..duration;

// les paramètres //


// les varaibles de décisions //

dvar float+ Percent[Proj][Periode];
// la fonction objective 

dexpr float maxIncome=0.05*(4*Percent[1][1]+3*Percent[1][2]+2*Percent[1][3])
+0.07*(3*Percent[2][2]+2*Percent[2][3]+Percent[2][4])
+0.15*(4*Percent[3][1]+3*Percent[3][2]+2*Percent[3][3]+Percent[3][4])
+0.02*(2*Percent[4][3]+Percent[4][4] );

maximize 1000*maxIncome;

// les contraintes 

subject to{
  Percent[1][1]+Percent[1][2]+Percent[1][3]==1;
  Percent[4][3]+Percent[4][4]==1;
  Percent[2][2]+Percent[2][3]+Percent[2][4]+Percent[2][5] >= 0.25;
  Percent[2][2]+Percent[2][3]+Percent[2][4]+Percent[2][5] <=1;
  Percent[3][1]+Percent[3][2]+Percent[3][3]+Percent[3][4]+Percent[3][5]>= 0.25;
  Percent[3][1]+Percent[3][2]+Percent[3][3]+Percent[3][4]+Percent[3][5]<= 1;
  5*Percent[1][1]+15*Percent[3][1]<=3;
  5*Percent[1][2]+8*Percent[2][2]+15*Percent[3][2]<=6;
  5*Percent[1][3]+8*Percent[2][3]+15*Percent[3][3]+1.2*Percent[4][3]<=7;
  8*Percent[2][4]+15*Percent[3][4]+1.2*Percent[4][4]<=7;
  8*Percent[2][5]+15*Percent[3][5]<=7;
 }

execute{
  
  writeln("********************* La solution******************************");
  writeln("********************* La valeur optimale est ******************************");
  writeln("1)" +cplex.getObjValue()+"$");
  writeln("********************* Les valeurs optimales des xij sont ******************************");
  writeln("1)" +cplex.getObjValue()+" $");
  for(i in thisOplModel.Proj){
     for(j in thisOplModel.Periode){
       if(Percent[i][j]!=0){
         writeln("Percent["+i+"]["+j+"]="+thisOplModel.Percent[i][j]);
       }
      
  }
 
  }
  
   writeln("********************* End of Project ******************************");
}



