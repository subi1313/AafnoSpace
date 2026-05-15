import java.util.List;

import com.AafnoSpace.model.CartModel;

public class CheckoutService {

    private CartService cartService = new CartService();

    public List<CartModel> getCheckoutItems(int userId, List<Integer> ids) {
        return cartService.getSelectedCartItems(userId, ids);
    }

    public double calculateSubtotal(List<CartModel> items) {
        double subtotal = 0;

        for (CartModel item : items) {
            subtotal += item.getPrice() * item.getQuantity();
        }

        return subtotal;
    }

    public double calculateTotal(double subtotal) {
        double delivery = 100;
        return subtotal + delivery;
    }
}