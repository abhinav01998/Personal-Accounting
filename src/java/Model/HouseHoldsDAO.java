
package Model;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

public class HouseHoldsDAO {
public boolean insert(String uname,String name,String date,String paytype,String mop,String amount,String place){
    HouseHolds hh = new HouseHolds();
    hh.setUname(uname);
    hh.setName(name);
    hh.setDate(date);
    hh.setPaytype(paytype);
    hh.setMop(mop);
    hh.setAmount(amount);
    hh.setPlace(place);
  Configuration cf = null;
       SessionFactory sf = null;
       Session session = null;
       try{
        cf= new Configuration();
        cf.configure();
        sf = cf.buildSessionFactory();
        session = sf.openSession();
        Transaction tr = session.beginTransaction();
        session.save(hh);
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

