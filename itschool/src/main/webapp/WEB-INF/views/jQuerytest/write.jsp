<%@ page language="java" contentType="text/html;charset=euc-kr"%>
<%request.setCharacterEncoding("euc-kr");%>
<HTML>
<HEAD>
<TITLE> 게시판 </TITLE>

<SCRIPT language="JavaScript">
function Check() {
if (Write.title.value.length < 1) {//title 값 검사. 1보다 작을 경우, 값이 없으므로 alert() 실행
	alert("글제목을 입력하세요.");
	Write.write_title.focus(); //java script 내장함수. 커서의 위치 설정 역할
	return false; //폼 값을 서버로 전송하지 않음
    }
if (Write.contents.value.length < 1) {
	alert("글내용을 입력하세요.");
	Write.content.focus(); 
	return false;
    }
Write.submit(); //위의 모든 조건에 해당되지 않을 때 입력받은 값을 서버로 전송
}
function list() {
location.href = "listboard.jsp"; //listboard.jsp 로 이동
}
</SCRIPT>
</HEAD>
<BODY>
<%
String userID = (String) session.getAttribute("user");
%>
<center><font size='3'><b> 게시판 글쓰기 </b></font>                   
<TABLE border='0' width='600' cellpadding='0' cellspacing='0'>
	<TR>
		<TD><hr size='1' noshade>
		</TD>
 	</TR>
</TABLE>
<FORM Name='Write' Action='write_input.jsp' Method='post' OnSubmit='return Check()'>
<TABLE border='0' width='600' cellpadding='2' cellspacing='2'>
	<TR>
		<TD width='150' bgcolor='cccccc'>
			<font size='2'><center><b>제목</b></center></font>
		</TD>
		<TD>
			<font size='2'>
			<input type="text" size='70' maxlength='50' name=title ></font>
		</TD>
	</TR>
	<TR>
		<TD width='150' bgcolor='cccccc'>
			<font size='2'><center><b>내용</b></center></font>
		</TD>
			<TD>
       		<font size='2'><textarea wrap='hard' cols='70' rows='15'  name='contents' ></textarea></font>
      		</TD>
	</TR>
	<TR>
      		<TD colspan='2'><hr size='1' noshade></TD>
	</TR>

	<TR>
		<TD align='center' colspan='2' width='100%'>
		<TABLE>
			<TR>
				<TD width='100' align='center'><input Type = 'Reset' Value = '다시 작성'></TD>
				<TD width='200' align='center'><input Type = 'Submit' Value = '등록'></TD>
				<TD width='200' align='center'><input Type = 'Button' Value = '목록' onClick='list();'></TD>
			</TR>
		</TABLE>
		</TD>
	</TR>
  </TABLE>
</FORM>
</BODY>
</HTML>