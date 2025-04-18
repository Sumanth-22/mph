import java.util.Scanner;
public class Train
{
	public static void main(String[] args) {
	    
	    Scanner sc = new Scanner(System.in);
		System.out.print("Enter a length of train : ");
		int len=sc.nextInt();
		System.out.print("Enter a speed of train : ");
		int speed=sc.nextInt();
		System.out.print("Enter a time to cross bridge : ");
		int time=sc.nextInt();
		double lenBridge=(((speed*0.277777778)*time)-len);
		System.out.println("lenth of bridge is : "+lenBridge+"m");
	
	}
}
/*dsfmeiugiorekngrgregrdfge

tytry
yytr
tyhyth

*/