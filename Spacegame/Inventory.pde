import java.util.Map;
public class Inventory {
  
  HashMap<ItemType, Integer> items;
  
  public Inventory() {
    items = new HashMap<>();
  }

  Map<ItemType, Integer> getItems() {
    return items;
  }
  
  int getItemCount(ItemType itemType) {
    if (items.containsKey(itemType)) {
      return items.get(itemType);
    }
    return 0;
  }
  
  void addItem(ItemType itemType, int itemCount) {
    if (items.containsKey(itemType)) {
      items.put(itemType, items.get(itemType) + itemCount);
    } else {
      items.put(itemType, itemCount);
    }
  }
  void removeItem(ItemType itemType, int itemCount) {
    if (items.containsKey(itemType)) {
      if (items.get(itemType) <= itemCount) {
        items.remove(itemType);
      } else {
        items.put(itemType, items.get(itemType) - itemCount);
      }
    }
  }
  
}
