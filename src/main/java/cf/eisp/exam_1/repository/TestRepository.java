package cf.eisp.exam_1.repository;

import cf.eisp.exam_1.model.ExamPaper;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface TestRepository {
    ExamPaper findByRandomInt(Integer randomInt);
}
