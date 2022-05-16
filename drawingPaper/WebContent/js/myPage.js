// let horizontalUnderLine = document.getElementById("horizontal-underline");
// let horizontalMenus = document.querySelectorAll(".myPageContentMenu a");
// let horizontalMenuss = document.querySelectorAll("eachMenu");
// let fst = document.getElementById('fst');

// function horizontalIndicator(e) {
//     // horizontalUnderLine.style.transition = 0.3 + 's';
//     // horizontalUnderLine.style.left = e.currentTarget.offsetLeft + "px";
//     // horizontalUnderLine.style.width = e.currentTarget.offsetWidth + "px";
//     // horizontalUnderLine.style.top = e.currentTarget.offsetTop + e.currentTarget.offsetHeight + 20 + "px";

//     if (e.target.classList[1] === "clicked"){
//         e.target.classList.remove("clicked");
//     } else{
//         for (let i = 0; i < horizontalMenus.length; i++){
//             horizontalMenus[i].classList.remove("clicked");
//         }
//         e.target.classList.add("clicked");
//     }

// }

// horizontalMenus.forEach((menu) =>
//     menu.addEventListener("click", (e) => horizontalIndicator(e))
// );

// $(document).ready(function(){
//     horizontalUnderLine.style.transition = 0 + 's';
//     horizontalUnderLine.style.left = fst.offsetLeft + "px";
//     horizontalUnderLine.style.width = fst.offsetWidth + "px";
//     horizontalUnderLine.style.top = fst.offsetTop + fst.offsetHeight + 20 + "px";
// });


// 새로고침 없이 div부분에 페이지를 띄워주기 위한 함수
function acyncMovePage(url){
    // ajax option
    let ajaxOption = {
            url : url,
            async : true,
            type : "GET",
            dataType : "html",
            cache : false
    };
    
    $.ajax(ajaxOption).done(function(data){
        $('#myPageContentLower').children().remove();
        $('#myPageContentLower').html(data);
    });
}

$(document).ready(function(){
    $('#myPageContentLower').load("myPageProfile.jsp");

});


// 메뉴에 언더바 슬라이딩 애니메이션
$('nav a').on('click', function(){
    $(this).addClass('on');
    $(this).siblings().removeClass('on');
    $('nav div > span').css({width: this.offsetWidth + 'px'});
    $('nav div > span').css({left: this.offsetLeft + 'px'});
});

// 프로필 수정에서 WebPage 유효성 검사
function checkWebPage(){
    if($("#urlInput").val() == ""){
        alert("URL을 입력해주세요.");
        $("#urlInput").focus();
        return false;
    }
    let urlInput =  $("#urlInput").val();
    const Url = /((\w+)[.])+(asia|biz|cc|cn|com|de|eu|in|info|jobs|jp|kr|mobi|mx|name|net|nz|org|travel|tv|tw|uk|us)(\/(\w*))*$/i;
    let urlRes = Url.test(urlInput);

    let urlCheck = document.getElementById("urlCheck");
    let urlCheckForm = document.getElementById("urlCHeckForm");

    if(!urlRes){
        $('#urlCheck').css({color: 'red'});
        $('#urlCheckForm').css({border: '1px solid red'});
        urlCheck.innerHTML = "올바른 URL을 입력하세요!"
    }else if(urlRes){
        $('#urlCheck').css({color: 'green'});
        $('#urlCheckForm').css({border: '1px solid rgb(230, 230, 230)'});
        urlCheck.innerHTML = "사용 가능한 URL 입니다."
    }

}


// 버튼 별로 동작하는 구문을 다르게 하기 위한 스위치문을 포함한 함수
// 프로필 수정에서 각각 변경버튼을 누를 때마다 div에 다른 폼을 뿌려주고
// 변경 버튼을 취소 버튼으로 변경해줌
function toggleChange(e)
{
    switch(e){
        case 1:
            let i = document.getElementById("profileContentImageContainer");
            let t1 = document.getElementById("profileToggleBtn1");
            console.log("이미지");
            if(t1.value=="n"){
                i.innerHTML='<div class="myPageProfileOuterWrapper"><div class="myPageProfileImageContainer"><div class="myPageProfileImageWrapper"><div class="myPageProfileImageBox"><div class="myPageProfileImage" id="profileContentImage">박</div></div></div></div><div class="changeProfileImageWrapper"><div class="changeProfileImage"><span color="gray10" type="line"><input type="file" name="changeProfileImage" accept=".jpg,.jpeg,.png,.gif"><label for="changeProfileImage">파일 업로드</label></span></div><div class="profileImageExplaination">250 x 250 픽셀에 최적화되어 있으며, 10Mb 이하의 JPG, GIF, PNG 파일을 지원합니다.</div></div></div><div class="changeProfileSaveButton"><button><span class="changeProfileSaveButtonName">저장</span></button></div>';
                t1.value="y";
                t1.innerHTML="취소";
            }else{
                i.innerHTML='<div id="profileContentImageContainer"><div id="profileContentImage" class="profileSmallImageWrapper"><div class="myPageProfileImageWrapper"><div class="myPageProfileImageBox"><div class="myPageProfileImage">박</div></div></div></div></div>';
                t1.value="n";
                t1.innerHTML="변경";
            }
            break;
        case 2:
            let n = document.getElementById("profileContentName");
            let t2 = document.getElementById("profileToggleBtn2");
            console.log("이름");
            if(t2.value=="n"){
                n.innerHTML='<div class="changeProfileForm"><div class="changeProfileInfo"><input type="text" value="이름"></div><div class="changeProfileSaveButton"><button><span class="changeProfileSaveButtonName">저장</span></button></div></div>';
                t2.value="y";
                t2.innerHTML="취소";
            }else{
                n.innerHTML='<div class="profileContent" id="profileContentName">이름입니다</div>';
                t2.value="n";
                t2.innerHTML="변경";
            } 
            break;
        case 3:
            let u = document.getElementById("profileContentUrl");
            let t3 = document.getElementById("profileToggleBtn3");
            console.log("URL");
            if(t3.value=="n"){
                u.innerHTML='<div class="changeProfileForm"><div class="changeProfileInfo"><input type="text" value="URL"></div><div class="changeUrlExplain">사용자 이름은 회원님의 프로필 주소로 활용됩니다. 예 ) tumblbug.com/u/사용자이름</div><div class="changeProfileSaveButton"><button><span class="changeProfileSaveButtonName">저장</span></button></div></div>';
                t3.value="y";
                t3.innerHTML="취소";
            }else{
                u.innerHTML='<div class="profileContent" id="profileContentUrl">http://www.tumblbug.com/u/<strong>satjtammvyhtxpqs</strong></div>';
                t3.value="n";
                t3.innerHTML="변경";
            }
            break;
        case 4:
            let d = document.getElementById("profileContentIntro");
            let t4 = document.getElementById("profileToggleBtn4");
            console.log("소개");
            if(t4.value=="n"){
                d.innerHTML='<div class="changeProfileForm"><div class="changeProfileInfo" id="profileIntroChange"><textarea id="profileIntroChange1" placeholder="자기소개를 입력해주세요" onfocus="this.placeholder=\'\'" onblur="this.placeholder=\'자기소개를 입력해주세요\'"></textarea></div><div class="changeProfileSaveButton"><button><span class="changeProfileSaveButtonName">저장</span></button></div></div>';
                t4.value="y";
                t4.innerHTML="취소";
            }else{
                d.innerHTML='<div class="profileContent" id="profileContentIntro">등록된 소개가 없습니다.</div>';
                t4.value="n";
                t4.innerHTML="변경";
            }
            break;
        case 5:
            let uu = document.getElementById("profileContentWebPage");
            let t5 = document.getElementById("profileToggleBtn5");
            console.log("웹페이지");
            if(t5.value=="n"){
                uu.innerHTML='<div class="changeProfileForm"><div class="changeProfileUrl"><div id="urlCheckForm" class="changeProfileInfo"><input type="text" id="urlInput" value="웹페이지"></div><button class="changeProfileUrlButton" color="gray10" onclick="checkWebPage()">URL 추가</button></div><span id="urlCheck"></span><div class="changeProfileSaveButton"><button><span class="changeProfileSaveButtonName">저장</span></button></div></div>';
                t5.value="y";
                t5.innerHTML="취소";
            }else{
                uu.innerHTML='<div class="profileContent" id="profileContentWebPage">등록된 웹페이지가 없습니다.</div>';
                t5.value="n";
                t5.innerHTML="변경";
            }
            break;
        case 6:
            let o = document.getElementById("profileContentProjectOpen");
            let t6 = document.getElementById("profileToggleBtn6");
            console.log("공개/비공개");
            if(t6.value=="n"){
                if(!$('#profileProjectOpenButton').attr('checked')){
                    o.innerHTML='<div class="profileProjectOpenCheckForm"><input type="checkbox" id="profileProjectOpenButton" class="profileProjectOpenButton" style="cursor:pointer;"><label class="openCheckButtonLabel">등록한 프로젝트를 공개합니다.</label></div><div class="changeProfileSaveButton"><button onclick="openCheckSave()"><span class="changeProfileSaveButtonName">저장</span></button></div></div>';
                }else{
                    o.innerHTML='<div class="profileProjectOpenCheckForm"><input type="checkbox" id="profileProjectOpenButton" class="profileProjectOpenButton" style="cursor:pointer;" checked><label class="openCheckButtonLabel">등록한 프로젝트를 공개합니다.</label></div><div class="changeProfileSaveButton"><button onclick="openCheckSave()"><span class="changeProfileSaveButtonName">저장</span></button></div></div>';
                }
                t6.value="y";
                t6.innerHTML="취소";
            }else{
                if(!$('#profileProjectOpenButton').prop('checked')){
                    o.innerHTML='<label class="openCheckButtonLabel">등록한 프로젝트를 공개하지 않습니다.</label>';
                }else{
                    o.innerHTML='<input type="checkbox" id="profileProjectOpenButton" class="profileProjectOpenButton" checked disabled><label class="openCheckButtonLabel">등록한 프로젝트를 공개합니다.</label>';
                }
                t6.value="n";
                t6.innerHTML="변경";
            }
            break;
    }

}

// 프로젝트 공개/비공개 체크 시
// 저장 버튼에 체크박스 체크 여부를 확인하는 함수
function openCheckSave(){

    let o = document.getElementById("profileContentProjectOpen");
    let t6 = document.getElementById("profileToggleBtn6");

    if(!$('#profileProjectOpenButton').prop('checked')){
        o.innerHTML='<label class="openCheckButtonLabel">등록한 프로젝트를 공개하지 않습니다.</label>';
    }else{
        o.innerHTML='<input type="checkbox" id="profileProjectOpenButton" class="profileProjectOpenButton" checked disabled><label class="openCheckButtonLabel">등록한 프로젝트를 공개합니다.</label>';
    }
    t6.value="n";
    t6.innerHTML="변경";
}

