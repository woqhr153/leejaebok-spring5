package kr.or.test;
/**
 * 이 클래스는 
 * 1. 클래스 상속(extends)에 연습,
 * 2. 오브젝트(객체)생성에 필요한 new 키워드(예약어) 생성자메서드 사용 연습,
 * 3. 추상클래스(Abstract) 대한 연습
 * @author User
 *
 */
//오브젝트생성에 필요한 new 키워드 생성자메서드 사용한 실습 클래스(아래)
class Circle {
	private int r;//원의 반지름으로 사용할 변수
	//생성자 메서드(아래)
	//public Circle() { } 만들지 않아도 자동으로 만들어 집니다.
	public Circle(int radius) {
		r = radius;//Get|Set중에 셋 저장 멤버변수 처리
	}
	//원의 넓이를 구하는 메서드 반환(리턴)값의 크기가 더블형(아래)
	public double getCircle() {
		double result = r*r*3.14;//원의 넓이를 구하는 계산식
		return result;
	}
}
//클래스 상속에 대한 연습(아래)
class Employee { //고용(사원,취업)
	int mSalary;//m멤버변수 
	
}
public class ClassApp {

	public static void main(String[] args) {
		// 개발자가 입력한 반지름의 원의 넓이를 구하는 오브젝트를 생성(아래)
		Circle circle = new Circle(5);//반지름이 5인 원의 넓이를 구한는 객체생성
		System.out.println("원의 넓이는 " + circle.getCircle());
		circle = null;//오브젝트(메모리) 반환
	}

}
