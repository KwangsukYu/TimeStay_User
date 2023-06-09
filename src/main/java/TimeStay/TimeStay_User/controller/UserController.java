package TimeStay.TimeStay_User.controller;

import TimeStay.TimeStay_User.Config.WebConfigSecurity;
import TimeStay.TimeStay_User.dao.UserDAO;
import TimeStay.TimeStay_User.dao.UserRepository;
import TimeStay.TimeStay_User.service.UserService;
import TimeStay.TimeStay_User.vo.LoginVO;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Optional;

//@RestController
@Controller
@RequestMapping("/user")
@RequiredArgsConstructor
public class UserController {

    WebConfigSecurity webConfigSecurity = new WebConfigSecurity();

    private final UserService UserService;
//    @GetMapping("/{id}")
//    public Optional<UserDAO> getUSer(@PathVariable long id) {
//        return UserService.getUser(id);
//    }

    @GetMapping("/test")
    public String UserHome(Model mo) {
        return "index";
    }

    @GetMapping("/login")
    public String UserLogin() {
        return "login";
    }

    @GetMapping("/nav")
    public String UserNav() {
        return "navigation";
    }

    @GetMapping("/signup")
    public String signup() {
        return "signup1";
    }

    @GetMapping("/signup_info")
    public String signupInfo() {
        return "signup2";
    }

    @PostMapping("/auth")
    public String UserAuth(HttpServletRequest req, RedirectAttributes re, HttpSession session) {
        LoginVO LV = new LoginVO();
        LV.setUmail(req.getParameter("UMAIL"));
        LV.setUpwd(req.getParameter("UPWD"));
        System.out.println(UserService.login(LV));
        if(!UserService.login(LV)) {
            // re.addAttribute("loginFail", true);
            re.addFlashAttribute("loginFail", true);
            return "redirect:/user/login";
        }
        session.setAttribute("UMAIL", req.getParameter("UMAIL"));
        return "redirect:/user/mypage";
    }

    @PostMapping("/logout")
    public String logout(HttpServletRequest req) {
        // getSession 세션이 있으면 세션을 반환, true = 없을시 새 세션 생성, false = 없을시 null
        HttpSession session = req.getSession(false);
        if(session != null) {
            session.invalidate();
        }
        return "redirect:/user/test";
    }

    @PostMapping("/idCheck")
    @ResponseBody
    public boolean idCheck(@RequestBody HashMap<String, Object> map) {
        if (UserService.getUSer((String)map.get("UMAIL")) != null) {
            return false;
        }
        return true;
    }

    @GetMapping("/mypage")
    public String mypage(HttpServletRequest req, Model model) {
        HttpSession session = req.getSession(false);
        // 형변환 해주기
        String name = (String) session.getAttribute("UMAIL");
        UserDAO user = UserService.getUSer(name);
        if(session == null) {
            return "redirect:/user/login";
        }
        model.addAttribute("umail", user.getUmail());
        return "mypageManage";
    }


    @PostMapping("/signupConfirm")
    public String signupConfirm(HttpServletRequest req) {
        UserDAO user = new UserDAO();
        user.setUmail(req.getParameter("Mid"));
        String pwd = webConfigSecurity.getPasswordEncoder().encode(req.getParameter("Mpwd"));
        user.setUpwd(pwd);
        user.setUname(req.getParameter("Mname"));
        user.setUphone(req.getParameter("Mphone"));
        String addr = req.getParameter("Madd") + "?/" + req.getParameter("Madd2") + "?/" + req.getParameter("Madd3");
        user.setUADDR(addr);
        user.setUrole(1);
        user.setUtype("Normal");
        user.setUpoint(1);
        UserService.createUser(user);
        return "redirect:/user/login";
    }

    @DeleteMapping("/withdraw/{id}")
    public @ResponseBody Boolean withdraw(@PathVariable String id) {
        UserService.deleteUser(id);
        System.out.println("뭐야 대체");
        return true;
    }

    @GetMapping("/tt")
    public String tt() {
        return "redirect:/user/login";
    }


}