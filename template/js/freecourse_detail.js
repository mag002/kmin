$(document).ready(function(){
    
    var star = '<span class="fa fa-star checked"></span>'
    var halfstar='<span class="fa fa-star-half checked"></span>';
   
    switch ($(".point").text()) {
        case "0":
            $(".rate-word").append("Không hay")
            break;
        case "0.5":
            $(".star-sum").append(halfstar);
            $(".rate-word").append("Không hay")
            break;
        case "1":
            $(".star-sum").append(star);
            $(".rate-word").append("Không hay")
            break;
        case "1.5":
            $(".star-sum").append(star+halfstar);
            $(".rate-word").append("Trung Bình")
            break;
        case "2":
            $(".star-sum").append(star+star);
            $(".rate-word").append("Trung Bình")
            break;
        case "2.5":
            $(".star-sum").append(star+star+halfstar);
            $(".rate-word").append("Khá Hay")

            break;
        case "3":
            $(".star-sum").append(star+star+star);
            $(".rate-word").append("Khá Hay")
            break;
        case "3.5":
            $(".star-sum").append(star+star+star+halfstar);
            $(".rate-word").append("Hay")
            break;
        case "4":
            $(".star-sum").append(star+star+star+star);
            $(".rate-word").append("Hay")
            break;
        case "4.5":
            $(".star-sum").append(star+star+star+star+halfstar);
            $(".rate-word").append("Tuyệt Vời")
            break;
        case "5":
            $(".star-sum").append(star+star+star+star+star);
            $(".rate-word").append("Tuyệt Vời")
            break;
    };
});