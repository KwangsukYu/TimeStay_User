package TimeStay.TimeStay_User.service.impl;

import TimeStay.TimeStay_User.dao.UserDAO;
import TimeStay.TimeStay_User.dao.UserRepository;
import TimeStay.TimeStay_User.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserRepository UserRepository;

    @Override
    public Optional<UserDAO> getUser(long id) {
        Optional<UserDAO> resp = UserRepository.findById(id);
        return resp;
    }
}
