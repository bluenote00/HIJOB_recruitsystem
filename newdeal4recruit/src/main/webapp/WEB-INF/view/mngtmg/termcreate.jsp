<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
 <meta http-equiv="X-UA-Compatible" content="ie=edge">
 <meta http-equiv="X-UA-Compatible" content="ie=chrome">
 
<title>하이잡</title>
<jsp:include page="/WEB-INF/view/common/common_include.jsp"></jsp:include> 

<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />

<style>

#container ul li.contents {padding:0 20px;background:#fff; width:800px;}
#container ul li.contents .content {padding-top:16px;max-height:80px;margin-bottom:20px; width:800px;}

input::placeholder {color:#b1b1b1e3;;}
input::-webkit-input-placeholder {color:#b1b1b1e3;;}
input:-ms-input-placeholder {color:#b1b1b1e3;;}
 
textarea::placeholder {color:#b1b1b1e3;}
textarea::-webkit-input-placeholder {color:#b1b1b1e3;;}
textarea:-ms-input-placeholder {color:#b1b1b1e3;;}

#wrap_area {
   position: relative;
}

.hr_cut {
   color: rgb(244, 244, 244);
   margin-bottom: 80px;
   height: 0px;
   width: 700px;
}


#adver_recruit_all {
   padding-top: 20px;
   padding-bottom: 20px;
}

#main_blank {
   padding-top: 200px;
   padding-bottom: 200px;
}

#main_blank2 {
   padding-top: 400px;
   padding-bottom: 400px;
}


.adver_recruit_explain {
    padding-top: 50px;
    padding-bottom: 20px;
    padding-left: 30px;
    padding-right: 30px;
    line-height: 28px;
}

.adver_recruit_explain h3 {
    padding-bottom: 3px;
    font-size: 20px;
    color: rgb(0, 0, 0);
    line-height: 25px;
    letter-spacing: -0.5px;
    font-weight: bold;
}

.wirter_tag {
    color: #4d4d4d;
    font-size: 16px;
}

.recruit_head {
    font-weight: 700;
    font-size: 40px;
    padding-bottom: 15px;
    line-height: 1.25;
}

.address_detail {
   padding-top: 15px;
}

.zonecode_input {
   display: flex;
   text-align: justify;
   vertical-align: top;
    width: 100px;
    height: 40px;
    background-color: #E8F0FE;
    border: none;
    border-radius: 8px 8px 8px 8px;
    padding-left: 10px;
    padding-right: 10px;
   line-height: 1.25;
   font-size: 15px;
   font-family: "Noto Sans KR", sans-serif;
}

.recruit_company {
    padding-bottom: 20px;
}

.recruit_calendar, .recruit_skillstack,
.recruit_mainwork, .recruit_qualify, .recruit_preference, .recruit_welfare, .recruit_map {
    padding-bottom: 50px;
}

.recruit_mapapi {
   padding-top: 20px;
}

.recruit_period, .skill_icon, .recruit_detail, .recruit_mapapi, .recruit_introduce_img, .recruit_introduce_detail, .recruit_ul_list {
    padding-left: 20px;
}

.recruit_introduce_img img {
    width: 700px;
    height: 450px;
}

.adver_recruit_introduce {
     padding-left: 30px;
     padding-bottom: 60px;      
       line-height: 28px;
       font-family: "Noto Sans KR", sans-serif;
}

.adver_recruit_introduce h3 {
    padding-bottom: 10px;
    font-size: 20px;
    color: rgb(0, 0, 0);
    line-height: 25px;
    letter-spacing: -0.5px;
    font-weight: bold;
}

.recruit_introduce_detail {
    padding-left: 20px;
    padding-bottom: 10px;
}

.skill_icon {
   display: flex;
    font-family: "Noto Sans KR", sans-serif;
   flex-flow : row nowrap;
}

.skill_icon select {
   margin-right: 20px;
}

.skill_button {
    border-radius: 30px 30px 30px 30px;
    font-size: 15px;
    font-color: #313131;
    border-color: rgb(244, 244, 244);
    background-color: rgb(244, 244, 244);
    border-width: thin;
    padding-left: 13px;
    padding-right: 13px;
    padding-top: 4px;
    padding-bottom: 4px;
    pointer-events: none;
    margin-right: 10px;
    font-family: "Noto Sans KR", sans-serif;
}

.recruit_period, .recruit_ul_list, .recruit_detail, .recruit_mapapi, .recruit_introduce_detail {
    font-size: 16px;
}

.recruit_tag {
   padding-bottom: 10px;
}

.recruit_ul {
    visibility: visible;
    list-style-type: square;
    padding-left: 20px;
    word-break: break-all;
     overflow-wrap: break-word;
}

.recruit_ul_list {
    padding-right: 20px;
}

.adver_recruit_explain i {
       font-size: 19px;
       color: #1751a8;
}

.recruit_ul ul {
   visibility: visible;
   list-style-type: square;
}

.icon-link {
   display: inline-block;
    width: 22px;
    height: 22px;
}

.calendar_input {
   text-align: justify;
   vertical-align: top;
    width: 220px;
    height: 40px;
    background-color: #E8F0FE;
    border: none;
    border-radius: 8px 8px 8px 8px;
    padding-left: 10px;
    padding-right: 10px;
   line-height: 1.25;
   font-size: 15px;
   font-family: "Noto Sans KR", sans-serif;
}

.calendar {
   padding-left: 20px;
}

#calendar_icon {
   position: absolute;
   left: 490px;
   top: 458px;
}

.address_input {
   display: flex;
   text-align: justify;
   vertical-align: top;
    width: 300px;
    height: 40px;
    background-color: #E8F0FE;
    border: none;
    border-radius: 8px 8px 8px 8px;
    padding-left: 10px;
    padding-right: 10px;
   line-height: 1.25;
   font-size: 15px;
   font-family: "Noto Sans KR", sans-serif;
}

.recruit_head_input {
   vertical-align: center;
    width: 700px;
    height: 65px;
    background-color: #E8F0FE;
    border: none;
    border-radius: 8px 8px 8px 8px;
      padding-left: 20px;
      padding-top: 15px;
   line-height: 1.25;
   font-weight: 700;
    font-size: 40px;
    font-family: "Noto Sans KR", sans-serif;
}

.recruit_head_input placeholder {
   font-family: "Noto Sans KR", sans-serif;
   background-color: rgba(204, 204, 204, 0.522);
   
}

.recruit_input {
   vertical-align: top;
    width: 670px;
    height: 290px;
    background-color: #E8F0FE;
    border: none;
    border-radius: 8px 8px 8px 8px;
   padding-left: 15px;
   padding-right: 15px;
   padding-top: 15px;
   line-height: 1.5;
   font-size: 15px;
   font-family: "Noto Sans KR", sans-serif;
}

.recruit_button {
   padding-left: 40px;
   padding-right: 50px;
   display: flex;
   flex-flow: row nowrap;
   justify-content: space-between;
   font-weight: 500;
   font-family: "Noto Sans KR", sans-serif;
}

.recruit_cancel {
   color: rgb( 51, 51, 51);
   background-color: #f3f3f3d5;
   border-radius: 20px 20px 20px 20px;
   border: 1px solid rgb(212, 212, 212);
   font-size: 18px;
   padding-left: 25px;
    padding-right: 25px;
    padding-top: 8px;
    padding-bottom: 8px;
    font-weight: 500;
    font-family: "Noto Sans KR", sans-serif;
}

#recruit_save {
   color: #ffffff;
   background-color: #2e9acc;
   border-radius: 20px 20px 20px 20px;
   border: none;
   font-size: 18px;
   padding-left: 25px;
   padding-right: 25px;
    padding-top: 8px;
    padding-bottom: 8px;
    font-weight: 500;
    font-family: "Noto Sans KR", sans-serif;
}


placeholder {
   font-family: "Noto Sans KR", sans-serif;
   color: #cccccc85;
}

.file_uploadbtn {
   padding-left: 20px;
   padding-bottom: 40px;
}

.file_delete_button {
   padding-left: 10px;
    padding-right: 10px;
    padding-top: 6px;
    padding-bottom: 6px;
    color: #434343;
   background-color: #fff;
   border-radius: 20px 20px 20px 20px;
   border: 1px solid #979797;
   margin-left: 5px;
}

.dtlcombo {
   width: 150px;
   height: 40px;
   border-radius: 10px;
   padding-left: 5px;
   border: 1px solid #C4C4C4;
}

.city_combo {
   display: flex;
    font-family: "Noto Sans KR", sans-serif;
   flex-flow : row nowrap;
   padding-top: 10px;
}

.city_combo select {
   margin-right: 20px;
}

#previewdiv {
    margin-top: 20px;
}

</style>

<script type="text/javascript">

/** 공통 콤보 */

$(function(){
   comcombo("dtlcodeCD","dtlcombo1","all","");
   comcombo("dtlcodeCD","dtlcombo2","all","");
   comcombo("dtlcodeCD","dtlcombo3","all","");
   
   comcombo("addressCD","city1combo","all","");
   
   $('#city1combo').change(function() {   
      comcombo($("#city1combo").val(),"city2combo","all","");
   });
      
   fRegisterButtonClickEventadr();
});
   

/** 버튼 이벤트 등록 */

function fRegisterButtonClickEventadr() {
   $('a[name=btn]').click(function(e) {
      e.preventDefault();

      var btnId = $(this).attr('id');

      switch (btnId) {
         case 'btnSave' :
            fn_saveadr();
            break;
      }
   });
}   
   

   
function fn_saveadr() {  	
	
      if ( ! fn_adverValidate() ) {
         return;
      }
      
      var param = {
            corecruit_no : $("#corecruit_no").val(),
            corecruit_title : $("#corecruit_title").val(),
            session_code: $("#session_code").val(),
            corecruit_strdate : $("#corecruit_strdate").val(),
            corecruit_enddate : $("#corecruit_enddate").val(),
            dtlcombo1 : $("#dtlcombo1").val(),
            dtlcombo2 : $("#dtlcombo2").val(),
            dtlcombo3 : $("#dtlcombo3").val(),
            corecruit_mainjob : $("#corecruit_mainjob").val(),
            corecruit_requirement : $("#corecruit_requirement").val(),
            corecruit_preference : $("#corecruit_preference").val(),
            corecruit_merit : $("#corecruit_merit").val(),
            city1_no : $("#city1combo").val(),
            city2_no : $("#city2combo").val(),
            corecruit_address1 : $("#corecruit_address1").val(),
            corecruit_address2 : $("#corecruit_address2").val(),
            corecruit_zipcode : $("#corecruit_zipcode").val(),
            corecruit_introduce : $("#corecruit_introduce").val()
      }
    
      var frm = document.getElementById("myForm");
      frm.enctype = 'multipart/form-data';
      var fileData = new FormData(frm);
      
		var savecallback = function(reval) {
			console.log( JSON.stringify(reval) );
			
			if(reval.returncval > 0) {
				alert("저장 되었습니다.");
				location.href="/recerc/employee.do";
			}  else {
				alert("오류가 발생 되었습니다.");				
			}
		}
      
		callAjaxFileUploadSetFormData("/myprmg/adversave.do", "post", "json", true, fileData, savecallback);
      
   }
   
   function fn_adverValidate() {

      var chk = checkNotEmpty(
            [
                  [ "corecruit_title", "제목을 입력해 주세요." ]
               ,   [ "dtlcombo", "필요한 기술을 입력해 주세요" ]
               ,   [ "corecruit_mainjob", "내용을 입력해 주세요" ]
               ,   [ "city1_no", "시를 입력해 주세요" ]
               ,   [ "city2_no", "구 입력해 주세요" ]
               ,   [ "corecruit_address1", "근무지역을 입력해주세요" ]
            ]
      );

      if (!chk) {
         return;
      }

      return true;
   }


   function preview(event) {
      var image = event.target;
      
       if(image.files[0]){

           var selfile = image.files[0].name;
            var selfilearr = selfile.split(".");
            var inserthtml = "";
            var lastindex = selfilearr.length - 1;
            
            
            if(selfilearr[lastindex].toLowerCase() == "jpg" || selfilearr[lastindex].toLowerCase() == "gif" || selfilearr[lastindex].toLowerCase() == "jpge" || selfilearr[lastindex].toLowerCase() == "png") {
               inserthtml = "<img src='" + window.URL.createObjectURL(image.files[0]) + "' style='width:100px; height:100px' />";
            } else {
               inserthtml = selfile;
            }

           $("#previewdiv").empty().append(inserthtml);
      }

   }
   
   
</script>


</head>
<body>
<form id="myForm" action=""  method="">

   <input type="hidden" id="currentPage" value="1" />
   <input type="hidden" id="selectedInfNo" value="" />
   <input type="hidden" id="action"  name="action"  />
   <input type="hidden" id="corecruit_no"  name="corecruit_no"  />
   
      
      
         <!-- 모달 배경 -->
      
      <div id="mask"></div>

   <section id="wrap_area">

         <h2 class="hidden">컨텐츠 영역</h2>
            <div id="container">
                  <ul>
                     <li class="lnb">
               
               <!-- lnb 영역 --> 
               <jsp:include page="/WEB-INF/view/common/lnbMenu.jsp"></jsp:include>
                  </li>

            <li class="contents">
               <!-- contents -->
               <h3 class="hidden">contents 영역</h3> <!-- content -->
                  
               <div class="content">
                       
                  <p class="Location">
                     <a href="../dashboard/dashboard.do" class="btn_set home">메인으로</a> 
                     <span class="btn_nav bold">메인</span>
                     <a href="../dashboard/dashboard.do" class="btn_set refresh">새로고침</a>
                  </p>
               </div>
               
               
         <section class = "adver_recruit_explain">
         
         <c:set value="${writerinfo}" var="writerinfo" />
         
         
            <div class="recruit_head">
               <div class="recruit_tag">
                         <textarea type="text" id="corecruit_title" name="corecruit_title" class="recruit_head_input" placeholder="제목을 입력해주세요"></textarea>
                   </div>
                </div>
                
                   <hr class="hr_cut"></hr>
                

                <div class="recruit_calendar">
                    <div class="recruit_tag">
                        <h3>행사기간</h3>
                    </div>
   
                   
                    <div class="calendar">
                       
                       <input type="text" name="daterange" class="calendar_input"  placeholder="모집 기간을 입력해주세요" value="" /> <i class="fa-regular fa-calendar" id="calendar_icon"></i>
                             <input type="hidden" id="corecruit_strdate" name="corecruit_strdate" class="corecruit_strdate" value="" />
                             <input type="hidden" id="corecruit_enddate" name="corecruit_enddate" class="corecruit_enddate" value="" />

                  <script type="text/javascript">
                  $(function () {
                        $('input[name="daterange"]').daterangepicker(
                          {
                            locale: {
                              format: "YYYY-MM-DD",
                              separator: " ~ ",
                              applyLabel: "확인",
                              cancelLabel: "취소",
                              fromLabel: "From",
                              toLabel: "To",
                              customRangeLabel: "Custom",
                              weekLabel: "W",
                              daysOfWeek: ["일", "월", "화", "수", "목", "금", "토"],
                              monthNames: [
                                "1월",
                                "2월",
                                "3월",
                                "4월",
                                "5월",
                                "6월",
                                "7월",
                                "8월",
                                "9월",
                                "10월",
                                "11월",
                                "12월",
                              ],
                            },
                            corecruit_strdate: $('input[name="corecruit_strdate"]').val(),
                            corecruit_enddate: $('input[name="corecruit_enddate"]').val(),
                            drops: "auto",
                          },
                          function (start, end, label) {
                            $('input[name="corecruit_strdate"]').val(start.format("YYYY-MM-DD"));
                            $('input[name="corecruit_enddate"]').val(end.format("YYYY-MM-DD"));
                            console.log(
                              "A new date selection was made: " +
                                start.format("YYYY-MM-DD") +
                                " to " +
                                end.format("YYYY-MM-DD")
                            );
                          }
                        );
                      });
                  
                  </script>
                    
                </div>   
                </div>


                <div class="recruit_map">
                    <div class="recruit_tag">
                        <h3>행사지역</h3>
                    </div>
                    
                    <div class="recruit_detail">  
                       <div class="recruit_address">
                             <div class="city_combo">
                                  <select id="city1combo" name="city1_no" class="dtlcombo"></select>
                                <select id="city2combo" name="city2_no" class="dtlcombo"></select>
                          </div>
                       
                       
                          <h4 class="address_detail">주소</h4>
                           <input type="text" id="corecruit_address1" name="corecruit_address1" class="address_input" placeholder="주소를 입력해주세요" readonly />
                        </div>
                        
                        <div class="recruit_address_detail">
                           <h4 class="address_detail">상세주소</h4>
                           <input type="text" id="corecruit_address2" name="corecruit_address2" class="address_input" placeholder="상세 주소를 입력해주세요"  />
                  </div>
                  
                  <div class="recruit_address_zonecode">
                     <h4 class="address_detail">우편번호</h4>
                      <input type="text" id="corecruit_zipcode" name="corecruit_zipcode" class="zonecode_input"  />
                  </div>
                  
                  <script type="text/javascript">
                  window.onload = function(){
                     document.getElementById("corecruit_address1").addEventListener("click", function(){ //주소입력칸을 클릭하면
       
                     //카카오 지도 발생
                    new daum.Postcode({
                                    oncomplete: function(data) { //선택시 입력값 세팅
                                     document.getElementById("corecruit_address1").value = data.address; // 주소 넣기
                                     document.querySelector("input[name=corecruit_address2]").focus(); //상세입력 포커싱
                                     document.getElementById("corecruit_zipcode").value = data.zonecode; // 주소 넣기
                                       }
                             }).open();
                         });
                  }
                  
                  </script>
                    
                    </div>   
                </div>
                
            
         </section>
         
         
         <section class="end_button">
         
         <div class="recruit_button">
            <a href="/recerc/employee.do"><span class="recruit_cancel">취 소</span></a>
            <a href="" id="btnSave" name="btn"><span id="recruit_save">저 장</span></a>
         </div>
         
         </section>

           

      <!-- 공백용 -->
        
        <section class="main_blank">
           <div class="main_blank">
              <p>&nbsp;</p>
              <p>&nbsp;</p>
              <p>&nbsp;</p>
              <p>&nbsp;</p>
           </div>
        </section>
        
         <!-- 공백용 끝 -->

        </li>   

              </section> 
      </form>



   </body>
</html>