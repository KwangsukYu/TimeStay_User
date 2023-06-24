package TimeStay.TimeStay_User.service;

import TimeStay.TimeStay_User.dao.UserDAO;
import TimeStay.TimeStay_User.vo.LoginVO;

import java.util.Optional;

public interface UserService {

//    Optional<UserDAO> getUser(long id);

    boolean login(LoginVO LV);
    UserDAO getUSer(String UMAIL);

    void createUser(UserDAO user);

    void deleteUser(String UMAIL);
}
