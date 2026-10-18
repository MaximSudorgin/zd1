import java.util.Random;

public class Main {
    public static void main(String[] args) {
        int n = 1000;
        int[] nums = new int[n];
        Random r = new Random();
        for (int i = 0; i < n; i++) {
            nums[i] = r.nextInt(10000 + 1);
        }

        int ans = Integer.MAX_VALUE;
        for (int j = 1; j < n; j++) {
            for (int i = 0; i < j; i++) {
                int mult = nums[i] * nums[j];
                if (mult % 21 == 0) {
                    ans = Math.min(ans, mult);
                }
            }
        }

        if (ans == Integer.MAX_VALUE) {
            System.out.println("R не найдено, вывод: -1");
        } else {
            System.out.println("Ответ R = " + ans);
        }
    }
}
