public class BitOperatorDemo {
    public static void main(String[] aStrings) {
        System.out.printf("%x\n", 0b0101 & 0b0011);
        System.out.printf("%x\n", 0b0101 | 0b0011);
        System.out.printf("%x\n", 0b0101 ^ 0b0011);
        System.out.printf("%x\n", (byte) ~0b00000001);
        System.out.printf("%x\n", 0b0101 >> 2);
        System.out.printf("%x\n", 0b0101 << 2);

        int i1 = -10;
        int i2 = i1 >> 1;
        int i3 = i1 >>> 1;
        System.out.printf("%x -> %d\n", i1, i1);
        System.out.printf("%x -> %d\n", i2, i2);
        System.out.printf("%x -> %d\n", i3, i3);
    }
}
