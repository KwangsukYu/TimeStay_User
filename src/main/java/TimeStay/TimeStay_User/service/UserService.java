package TimeStay.TimeStay_User.service;

import TimeStay.TimeStay_User.dao.UserDAO;
import TimeStay.TimeStay_User.vo.LoginVO;

import java.util.Optional;

public interface UserService {

//    Optional<UserDAO> getUser(long id);

    public boolean login(LoginVO LV);
    public UserDAO getUSer(String UMAIL);
}
