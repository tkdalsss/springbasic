var datas = [
    {"id":"id01", "pwd":"pwd01", "name":"james1"},
    {"id":"id02", "pwd":"pwd02", "name":"james2"},
    {"id":"id03", "pwd":"pwd03", "name":"james3"},
    {"id":"id04", "pwd":"pwd04", "name":"james4"},
    {"id":"id05", "pwd":"pwd05", "name":"james5"}
];

// login
let login = {
    init: function(url){
        $('#login_form > button').click(function() {
            // id, pwd 가 공란인지 체크
            let id = $('#id').val();
            let pwd = $('#pwd').val();
            if (id === '' || id == null) {
                alert('ID를 입력하세요');
                $('#id').focus();
                return;
            }
            if (pwd === '' || pwd == null) {
                alert('패스워드를 입력하세요');
                $('#pwd').focus();
                return;
            }
            login.send(url);
        });
    },
    send: function(url){
        $('#login_form').attr({
            'method': 'post',
            'action': url
        });
        // $('#login_form').submit();
    }
};

let reg = {
    init:function(url){
        $('#registerBtn').click(function() {
            let id = $('#id').val();
            let pwd = $('#pwd').val();
            if (id === '' || id == null) {
                alert('ID를 입력하세요');
                $('#id').focus();
                return;
            }
            if (pwd === '' || pwd == null) {
                alert('패스워드를 입력하세요');
                $('#pwd').focus();
                return;
            }
            reg.send(url);
        });
    },
    send:function(url){
        $('#register_form').attr({
            'method': 'post',
            'action': url
        });
    }
}

// html2
let html2 = {
    init:function(){
        $('#btn').click(function(){
            html2.display(datas); // this -> #btn
        });
    },
    display:function(datas){
        let result = '';
        console.log(datas);
        $(datas).each(function(index, data){
            result += '<tr>';
            result += '<td>' + data.id + '</td>';
            result += '<td>' + data.name + '</td>';
            result += '</tr>';
        });
        $('#cust_tb > tbody').html(result);
    }
};