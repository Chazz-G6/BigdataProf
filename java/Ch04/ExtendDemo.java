package Ch04;

class HouseKim {
    String lastName = "Kim";
    String firstName;
    void printName() {
        System.out.println(firstName + " " + lastName);
    }
}

class HouseKimChulSoo extends HouseKim{
    public void setFirstName(String name) {
        firstName = name;
    }
}
public class ExtendDemo {
    public static void main(String[] args) {
        HouseKimChulSoo person = new HouseKimChulSoo();
        person.setFirstName("만수");

        person.printName();
        System.out.println(person.lastName);
    }
}
