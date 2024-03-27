import com.hana.app.data.CustDto;
import com.hana.app.exception.DuplicatedException;
import com.hana.app.frame.Service;
import com.hana.app.service.CustService;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Main {
    public static void main(String[] args) {
        // spring.xml 에서 bean 으로 동록된거 가져오기
        // 빈 등록을 BeanDefinition 으로 추상화해서 생성하기 때문 -> xml 로하든 자바로하든 BeanDefinition 이 생성됨
        // AnnotationConfigApplicationContext()
        // bean 설정을 해놓은 파일을 넣어주어야 함 -> 탐색위치를 지정?
        ApplicationContext factory = new ClassPathXmlApplicationContext("spring.xml");
        Service<String, CustDto> service = (Service<String, CustDto>) factory.getBean("custService");
        // interface proxy -> jdk.proxy2.$Proxy12
        // custService로 캐스팅하려는 객체가 CustService 인스턴스가 아니라 프록시 클래스의 인스턴스를 캐스팅하려고 함
//        CustService service = (CustService) factory.getBean("custService");

//        ApplicationContext factory2 = new AnnotationConfigApplicationContext(); // config 파일 설정해야함

        CustDto u = new CustDto("id03", "pwd03", "james");
        try {
            service.add(u);
        } catch (DuplicatedException e) {
            System.out.println(e.getMessage());
        }
    }
}
