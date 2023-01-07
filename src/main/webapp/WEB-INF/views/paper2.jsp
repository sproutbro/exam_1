<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div>
    <h1>Paper</h1>
    <div id="paper">
    </div>
    <button onclick="question(startNumber)" id="question-btn">순서대로 풀기</button>
    <button onclick="randomQuestion()" id="random-question-btn">랜덤문제 풀기</button>
</div>
<script>
let paper;
let startNumber = 0;
let ask;
let sample=[];
let path = window.location.pathname;
let customPath = path.split('/');

findByExamCategoryDetailId(customPath[2])

function answer() {
    let val = $('input[name=example]:checked').val();
    if(val == ask) {
        $("<p>").text("정답").appendTo("#paper")
    } else {
        $("<p>").text("오답 정답은 (" + ask + ")").appendTo("#paper")
    }
    startNumber++;
    $("<button>").text("다음").attr({onClick: "question(startNumber)"}).appendTo("#paper")
    $("#answer-btn").remove()
}

function findByExamCategoryDetailId(examCategoryName) {
    $.post("/paper/" + examCategoryName, async function(data) {
        paper = await data;
    })
}

function question(startNumber) {
    $("#paper").text("");
    sample = [];
    $("#question-btn").remove()
    $("#random-question-btn").remove()

    let str = paper[startNumber].examPaperQuestion;
    let substring = str.substring(str.length -3, str.length);
    if(substring == "jpg") {
        $("<img>").attr({src: "/img/" + paper[startNumber].examPaperQuestion, width: "100%"}).appendTo("#paper")
    } else {
        $("<p>").html(paper[startNumber].examPaperQuestion).appendTo("#paper")
    }

    ask = paper[startNumber].examPaperExample1;
    sample.push(paper[startNumber].examPaperExample1);
    sample.push(paper[startNumber].examPaperExample2);
    sample.push(paper[startNumber].examPaperExample3);
    sample.push(paper[startNumber].examPaperExample4);

    sample.sort(() => Math.random() - 0.5);

    sample.forEach((v,i) => {
        createSample(v, i)
    })
    $("<button>").text("제출").attr({onClick: "answer()", id: "answer-btn"}).appendTo("#paper")
}

function randomQuestion() {
    paper.sort(() => Math.random() - 0.5);
    question(startNumber);
}

function createSample(v, i) {
    i++;
    $("<input>").attr({type: "radio", value: v, id: "example" + i, name: "example"}).appendTo("#paper")
    $("<label>").attr({for: "example" + i}).text(i + ". " + v).appendTo("#paper")
    $("<br>").appendTo("#paper")
}
</script>