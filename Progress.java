import java.util.Scanner;
public class Progress{
	 
	public static void main(String[] args){
		
		Scanner sc = new Scanner(System.in);
		System.out.print("Enter a day : ");
		String day = sc.nextLine();
		switch(day){
			
			case "Monday":
				System.out.println("Today you have Android Class");
				break;
			case "Tuesday":
				System.out.println("Today you have Java Class");
				break;
			case "Wednesday":
				System.out.println("Today you have python Class");
				break;
			case "Thursday":
				System.out.println("Today you have PHP Class");
				break;
			case "Friday":
				System.out.println("Today you have HTML Class");
				break;
			case "Saturday":
				System.out.println("Today you have SQL Class");
				break;
			default:
				System.out.println("Today you have No Class");
	}
}
}
			

			












/*2.Write a program to take day as input and print the subject on that day using switch
	Monday: Android
	Tuesday: Java
	Wednesday: Python
	Thursday: PHP
	Friday: HTML
	Saturday: SQL

		Enter day : Monday
		o/p: Today you have Android Class

*/		