public class Operators{
public static void main(String args[]){
  
  String name = "Sumanth";
  String Qual = "BTech";
  float s1=55,s2=25,s3=50,s4=65,s5=72,s6=89,total,s11,s22,s33,s44,s55,s66;
  total = s1+s2+s3+s4+s5+s6;  
  s11=(s1/100)*100;
  s22=(s2/100)*100;
  s33=(s3/100)*100;
  s44=(s4/100)*100;
  s55=(s5/100)*100;
  s66=(s6/100)*100;
  float per = (total/600)*100;
 System.out.println("my name is : "+name);
 System.out.println("my qualification is : "+Qual);
 System.out.println("my total marks is : "+total);
 System.out.println("my percentage is : "+per);
if(s1 >=36){
System.out.println("S1 is Pass");
}
else{
System.out.println("S1 is fail");
}
if(s2 >=36){
System.out.println("S2 is Pass");
}
else{
System.out.println("S2 is fail");
}
if(s3 >=36){
System.out.println("S3 is Pass");
}
else{
System.out.println("S3 is fail");
}
if(s4 >=36){
System.out.println("S4 is Pass");
}
else{
System.out.println("S4 is fail");
}
if(s5>=36){
System.out.println("S5 is Pass");
}
else{
System.out.println("S5 isfail");
}
if(s6 >=36){
System.out.println("S6 is Pass");
}
else{
System.out.println("S6 is fail");
}
if(per>=50 && s1>=36 && s2>=36 && s3>=36 && s4>=36 && s5>=36 && s6>=36)
{
System.out.println("overall Pass");
}
else{
System.out.println("overall fail");
}
/*if(per >= 50)
{
System.out.println("overall Pass");
}
else{
System.out.println("overall fail");
}*/


}
}
 
