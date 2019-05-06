
package Model;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

public class DataBaseDataDAO {
     public boolean check(DataBaseData d)
    {
          
     DataBaseData  db = null;
    Configuration cf = new Configuration();
    cf.configure();
    SessionFactory sf = cf.buildSessionFactory();
    Session session = sf.openSession();
    Transaction tr = session.beginTransaction();
     db= (DataBaseData )session.get(DataBaseData .class,d.getUname());
     tr.commit();
     session.close();
     sf.close();
     if(db == null){
         return false;
     }
     else{
         return d.equals(db);
     }
                    
  
    }
    
public boolean insert(String name,String uname,String pwd,String number,String address,String income,String email){
         DataBaseData d = new DataBaseData();
        d.setName(name);
        d.setUname(uname);
        d.setPwd(pwd);
        d.setNumber(number);
        d.setAddress(address);
        d.setIncome(income);
        d.setEmail(email);
        
    
        
        Configuration cf= null;
        SessionFactory sf= null;
        Session session = null;
        try{
        cf= new Configuration();
        cf.configure();
        sf = cf.buildSessionFactory();
        session = sf.openSession();
        Transaction tr = session.beginTransaction();
        session.save(d);
        tr.commit();
    }
        catch(Exception e){
            System.out.println(e);
            return false;
        }
        finally{
            session.close();
            sf.close();
            return true;
        }
}
    
}
