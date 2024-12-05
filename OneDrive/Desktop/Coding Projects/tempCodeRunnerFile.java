public class Main {

    public static void main(String[] args) {
        int[] arr = {0, 0, 0, 0, 1, 1, 0, 0, 0, 7, 7, 7, 1, 1, 0};
        System.out.println(squash(arr));

    }

    public void squash(int[] arr) {
        int writeIndex = 1;

        for (int i = 1; i < arr.length; i++) {
            if (arr[i] != arr[i-1]) {
                arr[writeIndex++] = arr[i]
            }
        }

        while (writeIndex < arr.length) {
            arr[writeIndex++] = -1;
        }
    }
}
