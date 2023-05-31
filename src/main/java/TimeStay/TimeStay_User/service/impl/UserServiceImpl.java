package TimeStay.TimeStay_User.service.impl;

import TimeStay.TimeStay_User.dao.UserDAO;
import TimeStay.TimeStay_User.dao.UserRepository;
import TimeStay.TimeStay_User.service.UserService;
import TimeStay.TimeStay_User.vo.LoginVO;
import lombok.extern.java.Log;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserRepository UserRepository;

//    @Override
//    public Optional<UserDAO> getUser(long id) {
//        Optional<UserDAO> resp = UserRepository.findById(id);
//        return resp;
//    }

    @Override
    public boolean login(LoginVO LV) {
        UserDAO findUser = UserRepository.findByUmail(LV.getUmail());
        if(findUser.getUpwd().equals(LV.getUpwd())) {
            return true;
        };
        return false;
    }

    @Override
    public UserDAO getUSer(String UMAIL) {
        UserDAO user = UserRepository.findByUmail(UMAIL);
        return user;
    }
}
