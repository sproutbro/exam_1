package cf.eisp.exam_1.repository;

import cf.eisp.exam_1.model.ExamPaper;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface PaperRepository {
    List<ExamPaper> findById(Integer paperId);

    List<ExamPaper> findByExamCategoryDetailId(Integer examCategoryDetailId);
}
