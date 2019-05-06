
package Model;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class DataBaseData {
 private String name;
 @Id
 private String uname;
 private String pwd;
 private String number;
 private String address;
 private String income;
 private String email;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getUname() {
        return uname;
    }

    public void setUname(String uname) {
        this.uname = uname;
    }

    public String getPwd() {
        return pwd;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
    }

    public String getNumber() {
        return number;
    }

    public void setNumber(String number) {
        this.number = number;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getIncome() {
        return income;
    }

    public void setIncome(String income) {
        this.income = income;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
    
  public boolean equals(DataBaseData d){
        
        
        if(this.uname.equalsIgnoreCase(d.getUname()) && this.pwd.equalsIgnoreCase(d.getPwd()) ){
            return true;
        }
        else{
            return false;
            
        }
    }
 
}
