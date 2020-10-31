// var span = '&nbsp;<span style="color: red;font-size: 0.8em;" id="idError"></span>'

function isValidate(obj) {
    if (obj.id.value == '') {
        console.log('%O', document.forms[0].id);
        // alert('아이디를 입력하세요');
        document.getElementById('idError').innerHTML =
            '아이디를 입력하세요';
        obj.id.focus();
        return false;
    }
    if (frmObj.pwd.value.length == 0) {
        alert('비밀번호를 입력하세요');
        frmObj.pwd.focus();
        return false;
    }
    if (frmObj.pwd2.value == '') {
        alert('비밀번호를 입력하세요');
        frmObj.pwd2.focus();
        return false;
    } else {
        if (frmObj.pwd.value != frmObj.pwd2.value) {
            alert('비밀번호가 일치하지 않아요');
            frmObj.pwd2.focus();
            return false;
        }
    }
    var isGender = false;
    //일반 for문
    // for(var i=0;i<obj.gender.length;i++){
    //     if(obj.gender[i].checked){
    //         isGender=true;
    //         break;
    //     }
    // }
    // forEach
    obj.gender.forEach(function (element) {
        if (element.checked) {
            isGender = true;
        }
    });

    if (!isGender) {
        alert('성별을 선택하세요');
        obj.gender[0].focus();
        return false;
    }

    var count = 0;
    //체크 안된 체크 박스 중 처음
    var notChecked = [];
    for (var i = 0; i < obj.inter.length; i++) {
        if (obj.inter[i].checked) {
            count++;
        } else notChecked.push(i);
    }

    if (count < 3) {
        alert('3개이상 체크하시오.' + count + '개 체크됨.');
        obj.inter[notChecked[0]].focus();
        return false;
    }
    if (obj.grade.selectedIndex == 0) {
        alert('학력을 선택하세요');
        obj.grade.focus();
        return false;
    }
    if (obj.file.value == '') {
        alert('파일을 첨부하세요');
        obj.file.focus();
        return false;
    }
    if (obj.self.value == '') {
        alert('자기 소개를 첨부하세요');
        obj.self.focus();
        return false;
    }

    return true;
}
function fnNoSubmitButton(obj) {
    console.log(obj);
    if (obj == undefined) obj = document.forms[0];
    if (isValidate(obj)) obj.submit();
}
function isExistId() {
    document.getElementById('idError').innerHTML = ' ';
}
