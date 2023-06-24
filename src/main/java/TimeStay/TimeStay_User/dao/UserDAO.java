package TimeStay.TimeStay_User.dao;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

@Getter
@Setter
@Entity
@Table(name="TIMESTAY_USER")
@SequenceGenerator(
        name = "USER_SEQ",
        sequenceName = "INCRESE_SEQ",
        initialValue = 1,
        allocationSize = 1
)
public class UserDAO {
    @Id @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "USER_SEQ")
    private long uidx;
    private String umail;
    private String upwd;
    private String uname;
    private String uphone;
    private String UADDR;
    private int urole;
    private int upoint;
    private String utype;

    @Override
    public String toString() {
        return umail + " / " + upwd + " / " + uname + " / " + uphone + " / " + UADDR + " / " + urole + " / " + upoint + " / " + utype;
    }
}
