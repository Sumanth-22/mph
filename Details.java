import java.util.Scanner;
public class Details{
	public static void main(String[] args){
	
		Scanner sc = new Scanner(System.in);
       			System.out.print("Enter a name : ");
		String name = sc.nextLine();
			System.out.print("Enter a enter a age : ");
		String age = sc.nextLine();
			System.out.print("Enter a mail : ");
		String Mail = sc.nextLine();
			System.out.print("Enter a gender : ");
		String gender= sc.nextLine();
			System.out.print("Please enter sub1 below 100 Marks : ");
		float sub1 = sc.nextFloat();		
			System.out.print("Please enter sub2 below 100 Marks : ");
		float sub2 = sc.nextFloat();
			System.out.print("Please enter sub3 below 100 Marks : ");
		float sub3 = sc.nextFloat();		
			System.out.print("Please enter sub4 below 100 Marks : ");
		float sub4 = sc.nextFloat();
			System.out.print("Please enter sub5 below 100 Marks : ");
		float sub5 = sc.nextFloat();		
			System.out.print("Please enter sub6 below 100 Marks : ");
		float sub6 = sc.nextFloat();

 		float total = sub1 + sub2+sub3+sub4+sub5+sub6;
		
		System.out.println("Name : " + name);
		System.out.println("Age : " + age);
		System.out.println("Email : " + Mail);
		System.out.println("Gender : " + gender);
		System.out.println("Entered sub1 marks are " + sub1);
		System.out.println("Entered sub2 marks are " + sub2);
		System.out.println("Entered sub3 marks are " + sub3);
		System.out.println("Entered sub4 marks are " + sub4);
		System.out.println("Entered sub5 marks are " + sub5);
		System.out.println("Entered sub6 marks are " + sub6);
		System.out.println("Total marks are " + total);
		float per = (total/600)*100;
		System.out.println("Percentage is " + per);
			if(per>=50 && sub1>=50 && sub2>=50 && sub3>=50 && sub4>=50 && sub5>=50 && sub6>=50)
                              {
                                     System.out.println("overall Passed, You passed in all subjects");

                        if(per >=50  && per <60)
			System.out.print("obtained grade is : C  ");
			else if(per>=60 && per<70)
			System.out.println("obtained grade is : B  " );
			else if(per>=70 && per<90)
			System.out.println("obtained grade is : A  ");
			else if(per>=90)
			System.out.println("obtained grade is : A+ Distinction " );
			else
			System.out.println("sorry u failed");
			}
			else
				{
					System.out.println("overall failed, because You failed");
                                   }
}
}
			
		

		

		
		

		

























/*Write a program to take input of a student ,Name,age,email,gender,s1,s2,s3,s4,s5,s6	and calculate totalMarks,percentage and g give grade as per our previous task, also print pass/fail	
	o/p 
		Name : Dinesh
		Age : 33
		Email : din@gmail.com
		Gender : M
		Subject1 : 100
		Subject2 : 100
		Subject3 : 100
		Subject4 : 100
		Subject5 : 100
		Subject6 : 100
		TotalMarks : 600
		Percentage : 100
		Grade : A+
		Result : Passed in Distinction*/
