<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="../css/myPage.css">
</head>

<body>
    
    <div class="myPageContent">
        <div class="myPageContentUpperWrapper">
            <div class="myPageContentUpper">
                
                <div class="myPageProfileInfo">
                    <div class="myPageProfileImageWrapper">
                            <div class="myPageProfileImageBox">
                                <div class="myPageProfileImage">박</div>
                            </div>
                    </div>

                    <div class="myPageProfileEntities">
                        <div class="myPageProfileButtons">
                            <div class="myPageProfileName">
                                NAME
                            </div>
                            <a href="#">
                            <div class="myPageProfileButton">
                                <img class="myPageProfileButtonImage" src="https://img.icons8.com/external-kmg-design-basic-outline-kmg-design/32/000000/external-setting-business-management-kmg-design-basic-outline-kmg-design.png"/>
                            </div>
                            </a>
                        </div>
                        <div class="myPageProfileDate">
                            가입일
                        </div>
                    </div>
                </div>
                <nav class="myPageContentContainer">
                    <div class="myPageContentMenu">
                        <a class='on' onclick="acyncMovePage('myPageProfile.jsp')" style="cursor:pointer;" class="clicked"><span class="myPageMenuBtn">프로필</span></a>
                        <a onclick="acyncMovePage('myPageMyProject.jsp')" style="cursor:pointer;"><span class="myPageMenuBtn">올린 프로젝트</span></a>
                        <a onclick="acyncMovePage('myPageSupportProject.jsp')" style="cursor:pointer;"><span class="myPageMenuBtn">후원한 프로젝트</span></a>
                        <a onclick="acyncMovePage('myPageInterestProject.jsp')" style="cursor:pointer;"><span class="myPageMenuBtn">관심 프로젝트</span></a>
                        <span></span>
                    </div>
                </nav>
                
            </div>
        </div>

        <div class="myPageContentLowerWrapper">
            <div id="myPageContentLower" class="myPageContentLower">
                <link rel="import" href="myPageProfile.jsp">
            </div>
        </div>

    </div>

    <script defer src="../js/myPage.js"></script>
</body>
</html>