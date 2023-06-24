package TimeStay.TimeStay_User.service.impl;

import TimeStay.TimeStay_User.Config.WebConfigSecurity;
import TimeStay.TimeStay_User.dao.UserDAO;
import TimeStay.TimeStay_User.dao.UserRepository;
import TimeStay.TimeStay_User.service.UserService;
import TimeStay.TimeStay_User.vo.LoginVO;
import lombok.extern.java.Log;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;
import java.util.Optional;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserRepository UserRepository;
    WebConfigSecurity webConfigSecurity = new WebConfigSecurity();


//    @Override
//    public Optional<UserDAO> getUser(long id) {
//        Optional<UserDAO> resp = UserRepository.findById(id);
//        return resp;
//    }

    @Override
    public boolean login(LoginVO LV) {
        UserDAO findUser = UserRepository.findByUmail(LV.getUmail());
        if(webConfigSecurity.getPasswordEncoder().matches(LV.getUpwd(), findUser.getUpwd())) {
            return true;
        };
        return false;
    }

    @Override
    public UserDAO getUSer(String UMAIL) {
        UserDAO user = UserRepository.findByUmail(UMAIL);
        return user;
    }

    @Override
    public void createUser(UserDAO user) {
        UserRepository.save(user);
    }

    @Override
    @Transactional
    public void deleteUser(String umail) {
        UserRepository.deleteByUmail(umail);
    }
}
