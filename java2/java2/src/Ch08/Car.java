package Ch08;

class Car {
    String model;
    String year;

    public Car(String model, String year) {
        this.model = model;
        this.year = year;
    }

    public String toString(){
        return "[" + model + " 모델 " + year + " 년식 ]";
    }

    //오버라이딩
    public boolean equals(Object obj) {
        if (obj instanceof Car) {
            Car k = (Car) obj;
            if(model.equals(k.model)&&year.equals(k.year))
                return true;
        }
        return false;

}}
