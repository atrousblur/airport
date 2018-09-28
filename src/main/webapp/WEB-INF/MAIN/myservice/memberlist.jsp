<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="content">
		<div class="container-fluid">
			<div class="row">
				<form class="/airport/member/search.do">
					<select name="tag">
						<option value="all">전체</option>
						<option value="id">아이디</option>
						<option value="title">이름</option>
					</select>
					<div class="input-group no-border">
						<input type="text" value="" class="form-control"
							placeholder="Search...">
						<button type="submit"
							class="btn btn-white btn-round btn-just-icon">
							<i class="material-icons">search</i>
							<div class="ripple-container"></div>
						</button>
					</div>
				</form>
				<div class="col-md-12">
					<div class="card">
						<div class="card-header card-header-info">
							<h4 class="card-title ">사원조회</h4>
							<p class="card-category">
								<!-- 검색명 -->
							</p>
						</div>
						<div class="card-body">
							<div class="table-responsive">
								<table class="table">
									<thead class=" text-primary">
										<tr>
											<th>아이디</th>
											<th>이름</th>
											<th>전화번호</th>
											<th>이메일</th>
											<th>이메일 알림</th>
											<th>문자 알림</th>
											<th>상태</th>
										</tr>
									</thead>
									<tbody>
									<c:forEach var="member" items="${memberlist}">
										<tr>
											<td>${member.id }</td>
											<td>${member.name }</td>
											<td>${emp.phone  }</td>
											<td>${emp.email }</td>
											<td>${emp.email_alarm }</td>
											<td>${emp.sms_alarm }</td>
											<td>${emp.state }</td>
										</tr>
									</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>