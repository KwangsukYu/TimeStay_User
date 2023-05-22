package TimeStay.TimeStay_User.dao;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

@Getter
@Setter
@Entity
@Table(name="TIMESTAY_USER")
public class UserDAO {
    @Id @GeneratedValue
    private long UIDX;
    private String UMAIL;
    private String UPWD;
    private String UNAME;
    private String UPHONE;
    private String UADDR;
    private int UROLE;
    private int UPOINT;
    private String UTYPE;
}
