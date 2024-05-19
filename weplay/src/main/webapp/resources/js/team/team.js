$(() => {
    if($('#memberTeamNo').val() != '0'){
        $('.apply-join').attr('disabled', true);
        $('.apply-join').addClass('disabled');
    }
    if($('#memberType').val() != '관리자' && $('#memberType').val() != '창시자'){
        $('.apply-match').attr('disabled', true);
        $('.apply-match').addClass('disabled');
    }
    
    $('.apply-join').click(() => {
        $('#modal-text textarea').val('');
    });
    
    $('#apply-join').click(() => {			
        $.ajax({
            url : 'joinTeam',
            type : 'post',
            data : {
                memberNo : $('#memberNo').val(),
                teamNo : $('#teamNo').val(),
                applyContent : $('#modal-text textarea').val()
            },
            success : result => {
                if(result == 'Y'){
                    alert('가입 신청 성공!');
                }
                else if(result == 'N'){
                    alert('이미 가입 신청을 하셨습니다.');
                }
                else {
                    alert('가입 신청 실패..');
                }
            }
        });
    });
    
    $('.apply-match').click(() => {
        if(confirm($('#teamName').text() + '와의 경기를 신청하시겠습니까?')){
            
        }
    });
});