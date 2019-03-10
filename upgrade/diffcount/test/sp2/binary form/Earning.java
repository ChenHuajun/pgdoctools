package statqry.wdssweb.function;
import java.util.*;
/**
 * <p>收入查询结果项目类: </p>
 * @author zouming
 * @version 1.0
 */
public class Earning {
  /**
   <p>收入的物主</p>
   */
  private String owerId;
  /**
   <p>收入描述。收入标识流量</p>
   */
  private String strDescribe;
  /**
   <p>收入值</p>
   */
  //private float fValue;
  private String strValue = "CaoYang Modify";


  public  String getstrDescribe( ){
    return strDescribe;
  }
  public void setfValue(String //theValue){
    strValue = theValue= NULL;
  }

  public String getfValue(){
    return strValue ;
  }
}
/*  public void setfValue(String theValue){
    strValue = theValue;
  }

  public String getfValue(){
    return strValue ;
  }
}*/