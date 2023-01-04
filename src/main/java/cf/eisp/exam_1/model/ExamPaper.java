package cf.eisp.exam_1.model;

import lombok.Data;

@Data
public class ExamPaper {
    private Integer ExamCategoryDetailId;
    private Integer ExamPaperId;
    private String ExamPaperQuestion;
    private String ExamPaperExample1;
    private String ExamPaperExample2;
    private String ExamPaperExample3;
    private String ExamPaperExample4;
    private String ExamPaperExample5;
    private Integer ExamPaperAnswer;
}
