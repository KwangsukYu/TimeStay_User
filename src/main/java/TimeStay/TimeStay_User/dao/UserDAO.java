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
    private long uidx;
    private String umail;
    private String upwd;
    private String uname;
    private String uphone;
    private String UADDR;
    private int urole;
    private int upoint;
    private String utype;
}
