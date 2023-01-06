<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div>
    <h1>Paper</h1>
    <div id="paper"></div>
    <button onclick="순서문제(startNumber)" id="순서문제버튼">순서대로 풀기</button>
    <button onclick="랜덤문제()" id="랜덤문제버튼">랜덤문제 풀기</button>
</div>
<script>
let paper;
let startNumber = 0;
let 답;
let 보기=[];
let path = window.location.pathname;
let customPath = path.split('/');

findByExamCategoryDetailId(customPath[2])

function 제출() {
    let val = $('input[name=example]:checked').val();
    if(val == 답) {
        $("<p>").text("정답").appendTo("#paper")
    } else {
        $("<p>").text("오답 정답은 (" + 답 + ")").appendTo("#paper")
    }
    startNumber++;
    $("<button>").text("다음").attr({onClick: "순서문제(startNumber)"}).appendTo("#paper")
    $("#제출버튼").remove()
}

function findByExamCategoryDetailId(examCategoryName) {
    $.post("/paper/" + examCategoryName, async function(data) {
        paper = await data;
    })
}

function 순서문제(startNumber) {
    $("#paper").text("");
    let 보기 = [];
    $("#순서문제버튼").remove()
    $("#랜덤문제버튼").remove()

    $("<p>").text(paper[startNumber].examPaperQuestion).appendTo("#paper")

    답 = paper[startNumber].examPaperExample1;
    보기.push(paper[startNumber].examPaperExample1);
    보기.push(paper[startNumber].examPaperExample2);
    보기.push(paper[startNumber].examPaperExample3);
    보기.push(paper[startNumber].examPaperExample4);

    보기.sort(() => Math.random() - 0.5);

    보기.forEach((v,i) => {
        보기출력(v, i)
    })
    $("<button>").text("제출").attr({onClick: "제출()", id: "제출버튼"}).appendTo("#paper")
}

function 랜덤문제() {
    paper.sort(() => Math.random() - 0.5);
    순서문제(startNumber);
}

function 보기출력(v, i) {
    i++;
    $("<input>").attr({type: "radio", value: v, id: "example" + i, name: "example"}).appendTo("#paper")
    $("<label>").attr({for: "example" + i}).text(i + ". " + v).appendTo("#paper")
    $("<br>").appendTo("#paper")
}
</script>