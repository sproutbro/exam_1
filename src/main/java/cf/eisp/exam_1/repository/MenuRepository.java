package cf.eisp.exam_1.repository;

import cf.eisp.exam_1.model.ExamCategoryDetail;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface MenuRepository {

    List<ExamCategoryDetail> findAll();
}
