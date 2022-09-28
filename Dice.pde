import java.util.Map;
import java.util.List;

final List<Die> dice = new ArrayList();

void setup() {
  noLoop();
  size(500, 500);
  for (int j = (height / 3 - Die.length) / 2 + 90; j < height; j += height / 4) {
    for (int i = (width / 3 - Die.length) / 2; i < width; i += width / 3) {
      Die die = new Die(i, j);
      die.roll();
      dice.add(die);
    }
  }
}

void draw() {
  background(209);
  int sum = 0;
  
  for (int i = 0; i < dice.size(); i++) {
    dice.get(i).show();
    sum += dice.get(i).getNum();
  }
  
  text(sum, width / 2, 50);
}

void mousePressed() {
  redraw();
  
  for (int i = 0; i < dice.size(); i++) {
    dice.get(i).roll();
  }
}

class Die {
  public static final int length = 90;
  
  private final int[][] one = new int[][]{{length / 2, length / 2}};
  private final int[][] two = new int[][]{{length / 4, 3 * length / 4}, {3 * length / 4, length / 4}};
  private final int[][] three = new int[][]{{length / 4, 3 * length / 4}, {3 * length / 4, length / 4}, {length / 2, length / 2}};
  private final int[][] four = new int[][]{{length / 4, 3 * length / 4}, {3 * length / 4, length / 4}, {length / 4, length / 4}, {3 * length / 4, 3 * length / 4}};
  private final int[][] five = new int[][]{{length / 4, 3 * length / 4}, {3 * length / 4, length / 4}, {length / 4, length / 4}, {3 * length / 4, 3 * length / 4}, {length / 2, length / 2}};
  private final int[][] six = new int[][]{{length / 4, 3 * length / 4}, {3 * length / 4, length / 4}, {length / 4, length / 4}, {3 * length / 4, 3 * length / 4}, {length / 4, length / 2}, {3 * length / 4, length / 2}};
  private final int dotSize = length / 5;
  
  private final Map<Integer, int[][]> nums = new HashMap();
  
  
  private final int x;
  private final int y;
  
  private int num;
  
  public Die(int x, int y) {
    this.x = x;
    this.y = y;
    
    nums.put(1, one);
    nums.put(2, two);
    nums.put(3, three);
    nums.put(4, four);
    nums.put(5, five);
    nums.put(6, six);
  }
  
  public void roll() {
    num = (int) (Math.random() * 6 + 1);
  }
  
  public void show() {
    fill(255);
    rect(x, y, length, length);
    
    fill(0);
    for (int i = 0; i < nums.get(num).length; i++) {
      ellipse(x + nums.get(num)[i][0], y + nums.get(num)[i][1], dotSize, dotSize);
    }
  }
  
  public int getNum() {
    return num;
  }
}
