package TimeStay.TimeStay_User.service;

import TimeStay.TimeStay_User.dao.UserDAO;
import java.util.Optional;

public interface UserService {

    Optional<UserDAO> getUser(long id);
}
