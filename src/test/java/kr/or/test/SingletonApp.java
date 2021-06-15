package kr.or.test;

import java.util.Calendar;

/**
 * 싱글톤에 대한 설명: 1개의 클래스가 1개 객체(인스턴스)로만 생성해서 사용하겠다고 명시
 * 즉, 객체를 2번 생성할 필요가 없는 로직일때 사용
 * 대표적인 싱클톤객체는 Calendar클래스, DB접속클래스등이 있습니다.
 * @author User
 *
 */
class Singleton{ //테스트용으로 만든 싱클톤 클래스
	private static Singleton instance = new Singleton(); // 정적필드 인스턴스 생성 
	private Singleton(){} // private 생성자
	public static Singleton getInstance(){ // getInstance 메서드 정의
		return instance; // instance 객체 리턴
	}
}
public class SingletonApp {
	public static void main(String[] args) {
		//Calendar calendar = new Calendar();//이렇게 생성하지 못합니다.
		Calendar calendar = Calendar.getInstance();//대표적이 싱클톤 객체 사용방법
		Singleton st1 = Singleton.getInstance(); // 싱글톤 인스턴스 생성 매서드호출
		Singleton st2 = Singleton.getInstance();
        //Singleton st3 = new Singleton(); 
        //위s1과s2객체는 동일객체 원래는 new 키워드로 만드는 객체는 별개 수식으로 표현하면=> s1==s2!==s3
        //new키워드로 생성할 수 없는 클래스생성 방식을 
        //한마디로 말하면, 1개의 클래스가 1개의 객체로만 사용하겠다는 것을 명시적으로 만드는 클래스
		if(st1 == st2){//
			System.out.println("동일 객체");
		}else{
			System.out.println("다른 객체");
		}
	}
}
