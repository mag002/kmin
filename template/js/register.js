$(document).ready(function(){
  
   
    $("#teamcheck").click(function() {
        $("#team-selection").toggleClass("d-none");
        $("#team-code").toggleClass("d-none");
        
    });
})
$( "#leader-ornot" ).change(function() {
    if($( "select#leader-ornot option:checked" ).val()=="nhomtruong")
    {
        $("#idleader").prop('disabled', true);
        $("#idleader").prop('value','I8sx782Ra')
        $("#label-idleader").html("Hãy gửi mã này đến các thành viên");
    };
    if($( "select#leader-ornot option:checked" ).val()=="thanhvien")
    {
        $("#idleader").prop('disabled', false);
        $("#idleader").prop('value','')
        $("#label-idleader").html("Nhập mã của nhóm trưởng");
    }
});
  
