<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%--
	
	
	
			<로그인하기>
			1. post방식으로 2. 값을 넘김 request
			3. response로 화면이동
			4. 로그아웃전까지 id갖고있어야 => session!
			5. 내가 최근에 본 항목 출력해줌 해당 컴퓨터 안에 기록됨 => cookie!
			
	
	
	
	9개의 내장객체(기본객체)
	
	JSP에서 제공하는 객체
	
	컴파일되면 TRY CATCH 안에 우리의 코드가 들어가게 되고,
	
	
	HttpServletRequest request 
	HttpServletResponse response
	
	============================
	
	PageContext pageContext;
    HttpSession session = null;
    ServletContext application;
    ServletConfig config;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

	
	1.request 객체(메소드 제공) => 사용자가 보내준 값을 뭉쳐서 받아옴
	
		1) 사용자 요청 정보
			
			get방식 => 값이 보이고...
			post방식=> 데이터 많거나 보안 필요한 경우 => 값을 감추고 id,password
			
			
			*** 매개변수 전송!
			=getParameter() => 단일 값    =================> list.jsp?page=1&no=10
									 getParameter("page")
									 getParameter("no") => 리턴형은 항상 String으로! (Integer.parserInt())
			***						 
			=getParameterValues() => 다중 값 ==============> list.jsp?no=1&no=2&no=3
									 getParameterValues("no")  => String[] getParameterValues로 받는다!
									 => checkbox, select(multi)
			***						 
			=setCharacterEncoding() => 한글 변환(디코딩역할 - 한글로 다시 변환해주는 )
								    =>setCharacterEncoding("UTF-8")
			https://www.google.com/search?ei=TdlmXovYA-HdmAWC75foBA&q=%EC%9E%90%EB%B0%94&oq=%EC%9E%90%EB%B0%94&gs_l=psy-ab.3..0l2j0i67j0i131j0l6.1272619.1274162..1274431...3.1..1.213.1573.1j8j1......0....1..gws-wiz.....0..0i71j0i10.F7ibNTZz6Q8&ved=0ahUKEwjLsoDKzY7oAhXhLqYKHYL3BU0Q4dUDCAs&uact=5					
			?뒤에 몸두 변수들..
			
			브라우저는 c언어로 만들어졌기때문에 1byte씩 읽는다. c는 아스키코드, 자바는 유닛코드 => 따라서 한글은 인코딩- 1byte로 받음, 디코딩- 2byte로 변환 필요!!
			%EC%9E%90%EB%B0%94 => 자바(웹에 자바 검색 결과)
										
		2) 사용자 브라우저 정보 
		
			***
			=getRmoterAddr()   ==> 사용자의 ip출력(모바일 사용자는 어떻게 추적?)
								   log파일 만들때, ip분석!
								       같은 ip에서 조회수 증가 못하게 할때!
			
			=getContentType()  ==> text/html, text/xml
			=getProtocol()     ==> 사용자의 port번호, 사용자가 이용한 프로토콜  ==> http, https(보안을 사용할때), ws(web socket)
			=getMethod()	   ==> GET/POST방식 => 사용자가 보낸 방식을 확인 할 수 있다.
			***
			=getRequestURI()
			***
			=getContextPath()
			
			
			http://localhost/JSPBasicProject2/object/request.jsp
			=====================================================> 전체: URL => getRequestURL()
							/JSPBasicProject2/object/request.jsp
			                =====================================> 슬래시부터~ => URI 폴더네임부터 파일 네임까지
			                /JSPBasicProject2
							=================> getContextPath() => 디폴트 폴더 
			
			
			http://localhost:80(http는 80!)
		3) 서버 정보
		   
		   =getServerName() => localhost=> uri뺀 나머지
		   =getServerPort() => 80
		   
		4) 데이터 추가 정보
			
			***
		   =setAttribute() =>데이터를 추가할때 => mno넘길때(요청값),
		   	***
		   =getAttribute() =>추가된 데이터 가져올때 => 넘긴값에 대한 정보 가져올때,
			
			
			request.setAttribute("vo", vo) 
									   ==>vo가 넘어간다! => 세션(30분 저장-메모리소비多)에도 저장 가능하고 request(메모리저장x )에도 저장 가능하다.
													     예약, 장바구니, 등등 					한번쓰고 버림! 내용보기
		
														     
	  		[ request ]
	  		[ response ]
	  		[ session ]								

		
			request 는 input으로 해야 값이 넘어간다!
			<input type=text name=name size=15> => getParameter로 값을 받아오기때문에 반드시 name을 줘야함!!
			name으로 모든지 값이 넘어감!

			action="request_ok.jsp" 얘가 값을 받아서 처리
			jsp, asp 등등만 값을 받아서 처리가능한 파일들이다.

 --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- 
	JavaScript CORE!!!

	1) 데이터형
		var : 자동 지정 변수
		 	var a=1 => a(int)
		 	var a=10.5 => a(double)
		 	var a='admin' =>String
		 	var a="admin" => String
		 	var a=[] ==> Array 배열   ==> [10, 10.5,"", {}]
		 	var a={} ==> Object 객체
		 	
		 	**단점 : 사용점위가 명확하지 않다. ===> 새로운 버전에  let, const 제공됨(상수형 변수(final개념)-범위를 명확하게 해줌)
		 	
		 	ES 5 version
		 	var a=10;
		 	a=20;
		 	
		 	ES 6 version
		 	const a=10;
		 	a=20; (x)
		 	
	2) 연산자
		산술연산자(+,-,/,*)
		비교연산자(==, !=, >, <, <=, >=)
			**equals()없다 ==> 문자열의 경우도 == 사용!
		논리연산자(&& , ||)
		대입연산자(=, +=, -=)			
	
	3) 제어문
		if, if else, 다중if , for, foreach, forin? do~while, while, switch 
		
	4) 함수
		제공하는 함수
		사용자정의 함수
			function func_name() => 매개변수 작성시 => 데이터형 명시x just 변수명만!!
			{
			
			}
			var func=funtion()
			{
			
			}
			********************** 람다식이 major
			var func=()=>{
			
			}
			***********************
			
	5) 객체구조
			1st: window: 브라우저 ==> open(팝업창 띄울때)
			
			2nd: document: 출력화면
			3rd: form : 입력창
			4th: location :화면이동
			5th: history :이전페이지
					1).back() 뒤로가기
					2).forward() 원래가기==> go()
		
	6) 사용자 정의 함수


 -->

<!-- <script type="text/javascript"> <!-- 유효성 검사: 이름과 content는 반드시 입력하도록, 안했을 경우 js로 액션처리해준다. 
function send() {
	
	var name=window.document.frm.name.value;
	if(name.trim()=="")
		{
			alert("이름을 입력하세요^^");
			document.frm.name.focus();
			return;
		}
		
	var content=window.document.frm.content.value;
	if(content.trim()=="")
		{
			alert("소개를 입력하세요^^");
			document.frm.content.focus();
			return;
		
		}
		
	document.frm.submit();
	
	
}

</script>  
 -->



<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">

$(function(){
	$('#btn').click(function(){ //id btn을 클릭했다면 ~
		
		var name=$('#name').val();  // id가 name인 것의 value를 가져오기.val()
		if(name.trim()=="")
		{
			alert("이름을 입력하세요^^");
			$('#name').focus();
			return;
		}
	
	
	var content=$('#content').val();
	if(content.trim()=="")
	{
		alert("소개를 입력하세요^^");
		$('#content').focus();
		return;
	}

	$('#frm').submit();
	
	});
});


</script>
</head>
<body>
	<!-- 데이터 전송 방법 : request  -->
	<center>
	   <h1>개인정보</h1>
		<form method=post action="request_ok.jsp" name=frm id=frm>
		  <table border=1 width=450>
			<tr>
				<th width=20%>이름</th>
				<td width=80%><input type=text name=name size=15 id=name></td>
			</tr>
			<tr>
				<th width=20%>성별</th>
				<td width=80%>
				<input type=radio name=sex value="남자" checked>남자
				<input type=radio name=sex value="여자" >여자
				</td>
			</tr>
			<tr>
				<th width=20%>전화</th>
				<td width=80%>
				<select name=tel1>
				<option>02</option>
				<option>031</option>
				<option>032</option>
				<option>041</option>
				<option>051</option>
				<option>010</option>
				</select>
				</td>
			</tr>
			
			<tr>
				<th width=20%>취미</th>
				<td width=80%>
					<input type="checkbox" name=hobby value=운동>운동
					<input type="checkbox" name=hobby value=낚시>낚시
					<input type="checkbox" name=hobby value=게임>게임
					<input type="checkbox" name=hobby value=독서>독서
					<input type="checkbox" name=hobby value=등산>등산
				</td>
			</tr>
			<tr>
				<th width=20%>소개</th>
				<td width=80%>
				<textarea rows="5" cols="35" name=content id=content></textarea>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
				<input type=button value=전송 id="btn">
				</td>
			</tr>	
		</table>
	   </form>
	</center>
</body>
</html>