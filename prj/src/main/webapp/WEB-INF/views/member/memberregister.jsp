<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>SB Admin 2 - Register</title>

    <!-- Custom fonts for this template-->
    <link href="admin/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="admin/css/sb-admin-2.min.css" rel="stylesheet">

</head>

<body class="bg-gradient-primary">

    <div class="container">

        <div class="card o-hidden border-0 shadow-lg my-5">
            <div class="card-body p-0">
                <!-- Nested Row within Card Body -->
                <div class="row">
                    <div class="col-lg-5 d-none d-lg-block bg-register-image"></div>
                    <div class="col-lg-7">
                        <div class="p-5">
                            <div class="text-center">
                                <h1 class="h4 text-gray-900 mb-4">Create an Account!</h1>
                            </div>
                            <form class="user" id="frm" action="registerMember.do" method="post" onsubmit="return formCheck()">
                                <div class="form-group">
                                        <input type="text" class="form-control form-control-user" id="name" name="name"
                                            placeholder="Name">
                                </div>
                                <div class="form-group">
                                    <input type="email" class="form-control form-control-user" id="id" name="id"
                                        placeholder="Email Address">
                                </div>
                                <div class="form-group">
                                    <input type="tel" class="form-control form-control-user" id="tel" name="tel"
                                        placeholder="Tel">
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                        <input type="password" class="form-control form-control-user"
                                            id="password" name="password" placeholder="Password">
                                    </div>
                                    <div class="col-sm-6">
                                        <input type="password" class="form-control form-control-user"
                                            id="passwordRepeat" name="passwordRepeat" placeholder="Repeat Password">
                                    </div>
                                </div>

                                <input type="submit" class="btn btn-primary btn-user btn-block" value="Register"/>
                                <hr>
                                <a id="kakao-login-btn" href="javascript:loginWithKakao()">
                                    <img src="img/kakao_login.png" width="100" margin = "0 auto"
                                      alt="카카오 로그인 버튼" />
                                  </a>
                                <a href="index.html" class="btn btn-google btn-user btn-block">
                                    <i class="fab fa-google fa-fw"></i> Register with Google
                                </a>
                                <a href="index.html" class="btn btn-facebook btn-user btn-block">
                                    <i class="fab fa-facebook-f fa-fw"></i> Register with Facebook
                                </a>
                            </form>
                            <hr>
                            <div class="text-center">
                                <a class="small" href="forgot-password.html">Forgot Password?</a>
                            </div>
                            <div class="text-center">
                                <a class="small" href="login.html">Already have an account? Login!</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>

    <!-- Bootstrap core JavaScript-->
    <script src="admin/vendor/jquery/jquery.min.js"></script>
    <script src="admin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="admin/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="admin/js/sb-admin-2.min.js"></script>
    
    <script>
        function formCheck() {
            let form = document.getElementById('frm');
            
            if(form.password.value != form.passwordRepeat.value) {
                alert("비밀번호 틀림");
                form.password.value = '';
                form.passwordRepeat.value = '';
                return false;
            }
        }
    </script>
    <script src="https://t1.kakaocdn.net/kakao_js_sdk/2.4.0/kakao.min.js"
        integrity="sha384-mXVrIX2T/Kszp6Z0aEWaA8Nm7J6/ZeWXbL8UpGRjKwWe56Srd/iyNmWMBhcItAjH" crossorigin="anonymous">
    </script>
    <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
    <script>
        window.Kakao.init('9c1eb3ec967ca14a10ddab8621bdddef'); // 사용하려는 앱의 JavaScript 키 입력
    </script>
    <script>
        function loginWithKakao() {
    
    
    // // 예제: 이메일, 성별 정보 가져오기
    // Kakao.API.request({
    //     url: '/v2/user/me',
    //     data: {
    //             property_keys: ['kakao_account.email'],
    //         },
    //     })
    //     .then(function(response) {
    //         console.log(response);
    //     })
    //     .catch(function(error) {
    //         console.log(error);
    //     });
        
    //     Kakao.Auth.authorize({
    //       redirectUri: 'http://127.0.0.1/prj',
    //       prompt: 'select_account',
    //     });
    

    window.Kakao.Auth.login({
            scope: 'profile_nickname, account_email, birthday', //동의항목 페이지에 있는 개인정보 보호 테이블의 활성화된 ID값을 넣습니다.
            success: function(response) {
                console.log(response);
              // 로그인 성공하면 받아오는 데이터
                window.Kakao.API.request({ // 사용자 정보 가져오기 
                    url: '/v2/user/me',
                    success: (res) => {
                        const kakao_account = res.kakao_account;
                        console.log(kakao_account)
                    }
                });
                // window.location.href='/ex/kakao_login.html' //리다이렉트 되는 코드
            },
            fail: function(error) {
                console.log(error);
            }
        });
  }
</script>

</body>

</html>