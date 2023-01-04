package cf.eisp.exam_1.controller;

import cf.eisp.exam_1.model.ExamPaper;
import cf.eisp.exam_1.repository.TestRepository;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
@AllArgsConstructor
public class IndexController {
    TestRepository testRepository;
    @GetMapping("/")
    public String index(Model model) {
        int randomInt = (int) (Math.random() * 16) + 17;
        ExamPaper examPaper = testRepository.findByRandomInt(randomInt);
        model.addAttribute("examPaper", examPaper);
        return "main";
    }
}
