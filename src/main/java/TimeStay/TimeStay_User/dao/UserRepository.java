package TimeStay.TimeStay_User.dao;

import TimeStay.TimeStay_User.vo.LoginVO;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface UserRepository extends JpaRepository<UserDAO, Long> {
    UserDAO findByUmail(String umail);
}
