<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div>
    <h1>Paper</h1>
    <div id="paper"></div>
    <button onclick="문제보기(문제번호)">다음문제</button>
    <button onclick="랜덤문제()">랜덤문제</button>
    <button onclick="제출()">제출</button>
</div>
<script>
let 답;
let 문제번호 = 1;
function 랜덤문제() {
    문제번호 = Math.floor(Math.random() * 58);
    문제보기(문제번호)
}

function 문제보기(number) {
    if($('input[name=example]:checked').val() || $("#paper").text() == "") {
        $("#paper").text("");
        let 보기 = [];
        $.post("/exam1", function(data) {
            $("<p>").text(data[number].examPaperQuestion).appendTo("#paper")

            답 = data[number].examPaperExample1;
            보기.push(data[number].examPaperExample1);
            보기.push(data[number].examPaperExample2);
            보기.push(data[number].examPaperExample3);
            보기.push(data[number].examPaperExample4);

            보기.sort(() => Math.random() - 0.5);

            보기.forEach((v,i) => {
                보기출력(v, i)
            })
        })
    } else {
        alert("풀구가라");
    }
}

function 보기출력(v, i) {
    i++;
    $("<input>").attr({type: "radio", value: v, id: "example" + i, name: "example"}).appendTo("#paper")
    $("<label>").attr({for: "example" + i}).text(i + ". " + v).appendTo("#paper")
    $("<br>").appendTo("#paper")
}

function 제출() {
    let val = $('input[name=example]:checked').val();
    if(val){
        if(val == 답) {
            $("<p>").text("정답").appendTo("#paper")
        } else {
            $("<p>").text("오답 정답은 (" + 답 + ")").appendTo("#paper")
        }
        문제번호++;
    } else {
        alert("찍어라")
    }
}
</script>