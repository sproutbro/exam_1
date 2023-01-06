package cf.eisp.exam_1.controller;

import cf.eisp.exam_1.model.ExamCategoryDetail;
import cf.eisp.exam_1.repository.MenuRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import java.util.List;

@Controller
public class IndexController {

    private final MenuRepository menuRepository;

    public IndexController(MenuRepository menuRepository) {
        this.menuRepository = menuRepository;
    }

    @GetMapping("/")
    public String index(Model model) {
        List<ExamCategoryDetail> menus = menuRepository.findAll();
        model.addAttribute("menus", menus);
        model.addAttribute("title", "메인페이지");
        return "main";
    }

    @GetMapping("/exam2/{examCategoryDetailId}")
    public String exam2(@PathVariable String examCategoryDetailId, Model model) {
        List<ExamCategoryDetail> menus = menuRepository.findAll();
        model.addAttribute("menus", menus);
        return "paper2";
    }
}
