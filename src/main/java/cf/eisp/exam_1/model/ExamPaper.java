package cf.eisp.exam_1.model;

import lombok.Data;

@Data
public class ExamPaper {
    private Integer examCategoryDetailId;
    private Integer examPaperId;
    private String examPaperQuestion;
    private String examPaperExample1;
    private String examPaperExample2;
    private String examPaperExample3;
    private String examPaperExample4;
}
