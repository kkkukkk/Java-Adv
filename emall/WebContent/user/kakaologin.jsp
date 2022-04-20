<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <title>Kakao JavaScript SDK</title>
    <script src="YOUR_SDK_FILE_PATH"></script>
    <script>
        // SDK를 초기화 합니다. 사용할 앱의 JavaScript 키를 설정해 주세요.
        Kakao.init('JAVASCRIPT_KEY');

        // SDK 초기화 여부를 판단합니다.
        console.log(Kakao.isInitialized());
    </script>
</head>
<body>

<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>

<a id="custom-login-btn" href="javascript:loginWithKakao()">
  <img
    src="//k.kakaocdn.net/14/dn/btroDszwNrM/I6efHub1SN5KCJqLm1Ovx1/o.jpg"
    width="222"
    alt="카카오 로그인 버튼"
  />
</a>
<p id="token-result"></p>
<script type="text/javascript">
  function loginWithKakao() {
    Kakao.Auth.authorize({
      redirectUri: 'http://localhost:8080/welcome.jsp'
    })
  }
  // 아래는 데모를 위한 UI 코드입니다.
  displayToken()
  function displayToken() {
    const token = getCookie('da0595faf5ea2f010fbd97bfd932b9cb')
    if(token) {
      Kakao.Auth.setAccessToken(token)
      Kakao.Auth.getStatusInfo(({ status }) => {
        if(status === 'connected') {
          document.getElementById('token-result').innerText = 'login success. token: ' + Kakao.Auth.getAccessToken()
        } else {
          Kakao.Auth.setAccessToken(null)
        }
      })
    }
  }
  function getCookie(name) {
    const value = "; " + document.cookie;
    const parts = value.split("; " + name + "=");
    if (parts.length === 2) return parts.pop().split(";").shift();
  }
</script>




</body>
</html>