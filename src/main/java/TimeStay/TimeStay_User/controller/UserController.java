package TimeStay.TimeStay_User.controller;

import TimeStay.TimeStay_User.dao.UserDAO;
import TimeStay.TimeStay_User.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Optional;

//@RestController
@Controller
@RequestMapping("/user")
public class UserController {

//    private final UserService UserService;
//    @GetMapping("/{id}")
//    public Optional<UserDAO> getUSer(@PathVariable long id) {
//        return UserService.getUser(id);
//    }

    @GetMapping("/test")
    public String UserHome() {
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
}