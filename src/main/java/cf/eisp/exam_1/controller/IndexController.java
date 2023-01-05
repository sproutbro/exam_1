package cf.eisp.exam_1.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class IndexController {

    @GetMapping("/")
    public String index(Model model) {
        model.addAttribute("title", "메인페이지");
        return "main";
    }

    @GetMapping("/exam1")
    public String exam1(Model model) {
        model.addAttribute("title", "정보처리기능사20111009");
        return "paper";
    }
}
