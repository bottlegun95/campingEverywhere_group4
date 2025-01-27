<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>상품 등록</title>

<style type="text/css">
.prodcut_inf {
	border: 1px solid #bbb;
	padding: 5px;
	height: 386px;
	width: 100%;
	margin: 40px 0;
}

.prodcut_inf input:nth-child(1) {
	float: left;
	width: 39%;
	display: inline-block;
	height: 353px;
}

.prodcut_inf input, .prodcut_inf select {
	margin: 7px 0;
	float: right;
	width: 60%;
	float: right;
	border: 1px solid #bbb;
	height: 38px;
}

.menu_btn input {
	border: 1px solid #8aa1a1;
	background-color: #8aa1a1 !important;
	color: white !important;
	border: #8aa1a1 !important;
}

.product_detail {
	border: 1px solid #8aa1a1;
	width: 100%;
	height: 600px;
	cursor: text;
	overflow: scroll;
	resize: none;
}
</style>
<script type="text/javascript" src="smarteditor2/js/HuskyEZCreator.js"
	charset="utf-8"></script>
</head>
<body>
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	<div style="margin: 50px auto">
		<div class="w3-margin-top w3-main" style="margin: auto; width: 60%;">
			<form action="productInsert.do" method="post" enctype="multipart/form-data" id="frm">
				<div class="w3-center w3-text-white w3-round">
					<h3 style="color: black; text-align: center;">상품 등록</h3>
				</div>
				<div class="w3-margin-bottom w3-border prodcut_inf">
					<input type="file" name="pfile" class="w3-input w3-border w3-white">
					<input type="text" name="productId"
						class="w3-input w3-border w3-white" autofocus placeholder="상품코드">
					<input type="text" name="productName"
						class="w3-input w3-border w3-white" placeholder="상품명"> <input
						type="text" name="productPrice"
						class="w3-input w3-border w3-white" placeholder="상품가격"> <input
						type="text" name="productBrand"
						class="w3-input w3-border w3-white" placeholder="상품브랜드"> <select
						id="productKategorie" name="productKategorie">
						<option value="텐트/타프">텐트/타프</option>
						<option value="의자/테이블/퍼니처류">의자/테이블/퍼니처류</option>
						<option value="소품/액세서리">소품/액세서리</option>
						<option value="코펠/쿨러/식기류">코펠/쿨러/식기류</option>
					</select> <input type="date" name="productDate"
						class="w3-input w3-border w3-white" placeholder="입고일"> <input
						type="number" name="productQuantity"
						class="w3-input w3-border w3-white" placeholder="수량" min="0">
				</div>
				<div>
					<textarea rows="20" class="form-control" name="productDetail"
						id="productDetail"></textarea>
				</div>
				<div align="center" class="menu_btn">
					<input type="reset" value="취소"
						class="w3-button w3-white w3-round-small"> &nbsp;<input
						type="button" value="목록보기"
						class="w3-button w3-white w3-round-small"
						onclick="location.href='productList.do'"> &nbsp;<input
						type="button" value="등록" class="w3-button w3-white w3-round-small"
						onclick="submitPost()">
				</div>
			</form>
		</div>
	</div>
	<script type="text/javascript">
	let oEditors = [];
	
	$(document).ready(function () {
		<!-- SmartEditor2 텍스트편집기 -->
		function smartEditorIFrame() {
			
			nhn.husky.EZCreator.createInIFrame({
				oAppRef : oEditors,
				elPlaceHolder : "productDetail",
				sSkinURI : "smarteditor2/SmartEditor2Skin.html",
				fCreator : "createSEditor2"
			});
	      }
		smartEditorIFrame();
	});
	
	/* 버튼 클릭 이벤트 */
	submitPost = function() {
	    oEditors.getById["productDetail"].exec("UPDATE_CONTENTS_FIELD", []);
	    let content = document.getElementById("productDetail").value;
	    let frm = document.getElementById("frm");
	    
	    //if(content == '') {
	    if(content == '<p>&nbsp;</p>') { //비어있어도 기본 P태그가 붙더라.
	        alert("내용을 입력해주세요.");
	        oEditors.getById["productDetail"].exec("FOCUS");
	        return
	    } else {
	  		frm.submit();
	    }
	}
	</script>
</body>
</html>
