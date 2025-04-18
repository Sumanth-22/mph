import java.util.Scanner;
public class Payslip{
	public static void main(String[] args){
	 	 
		//double BasicSalary,HRA,PF;
		
		Scanner sc = new Scanner(System.in);
       			System.out.print("Enter a name : ");
		String name = sc.nextLine();
			System.out.print("Enter a enter a age : ");
		int age = sc.nextInt();
			System.out.print("Enter a mail : ");
		String Mail = sc.nextLine();
			System.out.print("Enter a gender : ");
		String gender = sc.nextLine();
			System.out.print("Enter a address : ");
		String address = sc.nextLine();
			System.out.print("Enter a Phone : ");
		String phone = sc.nextLine();
			System.out.print("Enter a Designation : ");
		String designation = sc.nextLine();
			System.out.print("Enter a company name : ");
		String CompanyName = sc.nextLine();
			System.out.print("Enter a Date of joining : ");
		String  doj = sc.nextLine();
			System.out.print("Enter a CTC : ");
		double CTC = sc.nextDouble();


			 double BasicSalary = CTC*0.4;
        		double HRA = BasicSalary *0.5 ;
        		double PF = BasicSalary*0.12;
                        double total = BasicSalary+HRA+PF;
			
			double BS1 = ((0.4*CTC)/12);
			double HRA1 =(BasicSalary *0.5)/12;
			double PF1 = (BasicSalary*0.12)/12;
			double t=BS1+HRA1+PF1;
			
			

   
                         System.out.println("Employee name is : "+name);
			 System.out.println("Employee age is : "+age);
			System.out.println("Employee mail is : "+Mail);
			System.out.println("Employee gender is : "+gender);
			System.out.println("Employee address is : "+address);
                  	System.out.println("Employee phone.No is : "+phone);
			System.out.println("Employee designation is : "+designation);
			System.out.println("Employee company name is : "+CompanyName);
			System.out.println("Employee Date of joining is : "+ doj);
			System.out.println("--------------------------------------------------------------------------------");	
			System.out.println("Employee total CTC is : "+CTC);
			System.out.println("Employee BasicSalary is : "+BasicSalary);
			System.out.println("Employee  HRA is : "+HRA);
			System.out.println("Employee  PF is : "+PF);
			System.out.println("Employee  yearly in hand salray is : "+total);
			System.out.println("--------------------------------------------------------------------------------");	
			System.out.println("Employee  monthly basicsalary is : "+BS1);
			System.out.println("Employee  monthly HRA  is : "+HRA1);
			System.out.println("Employee  monthly PF is : "+PF1);
			System.out.println("Employee  monthly in hand salary is : "+t);
}
}


/*
ljhfghfjghli
fygughku
fhtfjhk
gfjklkj
*/

		
			
