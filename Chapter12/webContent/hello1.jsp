<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="EUC-KR"%>

<!-- ���� �ۼ� -->
<%!
	String name = "��ο�";
	public String getName(){
		return name;
	}
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>���� ���� - ��ο�</title>
	</head>
	<body>
				<!-- ǥ���� -->
		<h1>�ȳ��ϼ���. <%= name %>��!</h1>
	</body>
</html>