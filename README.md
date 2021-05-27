#### 202010527(목) 작업예정.
- 3장 객체와 클래스 부터 시작
- abstract클래스(추상클래스): 
- final클래스: 부모가 될 수 없는 클래스(상속해서 재사용이 불가능한 클래스임)
- 접근제어자: public(패키지위치에 상관없이 접근-제일많이 사용),
- public 클래스안에서 멤버변수는 private을 제일많이 사용.(private보안성갖춤)
- public 클래스안에서 멤버메서드는 public을 많이 사용.(외부 다른 클래스의 메서드를실행가능) 대신, 변수가 private이기 때문에, 직접 수정않됨, 실행만 됩니다.
- 인스턴스(클라우드주로사용)=오브젝트(자바)=객체=실행중인클래스
- 클래스 자료형(int, long, String처럼)는 멤버변수, 멤버메서드, 서브클래스 등등 포함할 수 있습니다.=C언어 구조체 자료형

#### 202010526(수)
- 붕어빵: 붕어빵틀(클래스) -> 붕어빵이 구어져서 나오면 오브젝트(객체)
- OOP: 자바를 객체지향(클래스를 실행가능하게 하는) 프로그래밍
- 객체 = 오브젝트 = 인스턴스 = 실행가능한 클래스 
- 객체(Object) 와 클래스? 클래스형 자료를 실행 가능하게 만든 것을 오브젝트(객체)라고함.
- 추상화(Abstract): 오프라인 업무 -> 대표 업무만 뽑아낸 클래스 = 추상클래스
- 클래스는 멤버변수 + 멤버메서드(실행) + 서브클래스
- 변하지 않는 변수=상수=변수명을 대문자(원주율)PI=3.141569...
- 보통 상수변수는 클래스의 제일 상단 위치합니다.
- 기본형(정수자료형-소문자시작): byte<short<int<long, 10L(롱타입변수)
- 기본형(실수자료형-소수점,소문자시작): float<double , 12.34f(실수형숫자)
- 기본형(문자형-'a'단따옴표 값을 입력해야 에러가 나지 않음): char, 1개 문자만 입력.
- 문자형에서 유니코드 \u숫자 입니다.
- 기본형(불린형-참,거짓): boolean, (0|1)
- 참조형(대문자로 시작): 참조형 변수의 대표적인 변수 클래스 입니다.
- 클래스 변수(저장된상태) -> 실행가능하게 되었을때, 인스턴스 변수(메모리로드된상태)
- 인스턴스라는 말보다는 오브젝트라는 말을 더 많이 사용합니다.
- String(문자열 클래스변수): 대문자로 시작.
- 상수변수를 명시적 만들때: final int MAX = 100;
- for-each 반복문전까지 실습

#### 202010525(화)
- 스프링MVC프로젝트: ModelViewController? 약자 MVC구조(웹프로그램구조)
- src/test/java폴더 만들었습니다.: 테스트작업은 이 폴더에서 하라는 약속.
- src/main/java폴더가 진짜 프로그램작업을 하는 폴더.
- javac HelloWorld.java -encoding UTF-8 (한글 내용도 컴파일됨)
- 위 java컴파일러로 실행한 결과 -> HelloWorld.class 실행파일이 생성됨.
- 주), 클래스파일은 실행 패키지의 루트(최상위)에서 실행해야 함.
- kr.or.test패키지 root폴더 src/test/java폴더에 실행을 해야함.
- java kr.or.test.HelloWorld 클래스를 실행하게 됨
- 이클립스 나오기 전, 25년전 javac 컴파일에서 class프로그램을 만들었습니다.
- 지금은 터미널에서 javac 사용하지 않고, 이클립스에서 바로 실행합니다.
- javac? 자바앱 컴파일러 -> 클래스 실행파일을 만듬.class(바이트코드) (자바환경JVM실행)
- 메이븐?Maven : 웹프로그램 컴파일러 -> 웹프로그램(앱) 실행파일을 만듬.war(톰캣에서 실행)
- 메이븐이 컴파일할때, 자바소스만 컴파일하는 것이 아니고, 외부 라이브러리도 가져와서 바인딩(묶어줌)하게 됨 = 패키징 이라고 합니다. = .war(와르)파일로 패키징됨.
- 메이븐이 관리하는 외부 라이브러리파일(lib) 목록을 저장하는 파일 pom.xml 입니다.
- pom.xml에서 자바버전을 1.6 -> 1.8 변경 후 메이븐을 업데이트 합니다.
- 외부 라이브러리 파일을 참조하는 방식을 영어로 = dependency디펜던시
- jar파일? JavaARchive = jar 자바클래스를 패키징한 파일입니다.