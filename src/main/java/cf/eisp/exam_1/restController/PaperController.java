package cf.eisp.exam_1.restController;

import cf.eisp.exam_1.model.ExamPaper;
import cf.eisp.exam_1.repository.PaperRepository;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class PaperController {

    private final PaperRepository paperRepository;

    public PaperController(PaperRepository paperRepository) {
        this.paperRepository = paperRepository;
    }
    @PostMapping("/exam1")
    public List<ExamPaper> exam1() {
        Integer paperId = 2;
        return paperRepository.findById(paperId);
    }

    @PostMapping("/paper/{examCategoryDetailId}")
    public List<ExamPaper> exam2(@PathVariable Integer examCategoryDetailId) {
        return paperRepository.findByExamCategoryDetailId(examCategoryDetailId);
    }
}
