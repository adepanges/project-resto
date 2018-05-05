<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Cart extends Resto_Controller {

    function __construct()
    {
        parent::__construct();
        if($this->role_active['role_id'] != 4)
        {
            redirect();
        }
    }

	public function index($order_id)
	{
        $this->_restrict_access('web');
        $this->load->model(['orders_model','orders_cart_model']);

        $orders = $this->orders_model->get_byid((int) $order_id);
        if(empty($orders)) redirect('orders');

        $this->_set_data([
            'title' => 'Cart',
            'orders' => $orders,
            'cart' => $this->orders_cart_model->get_by_orderid($order_id)->result()
        ]);
        $this->blade->view('inc/orders/cart', $this->data);
	}

    public function save()
    {
        $this->_restrict_access('rest');
        $cart_id = (int) $this->input->post('cart_id');

        $data = [
            'order_id' => (int) $this->input->post('order_id'),
            'product_id' => (int) $this->input->post('product_id'),
            'product_name' => $this->input->post('name'),
            'unit_price' => (int) $this->input->post('unit_price'),
            'qty' => (int) $this->input->post('qty'),
        ];

        $data['price'] = $data['unit_price'] * $data['qty'];

        $this->load->model(['orders_cart_model','orders_model']);
        if(!$cart_id) $res = $this->orders_cart_model->add($data);
        else $res = $this->orders_cart_model->upd($data);

        $this->orders_model->upt_total_price($data['order_id']);

        if($res)
        {
            $this->_response_json([
                'status' => 1,
                'message' => 'Berhasil menyimpan data'
            ]);
        }
        else
        {
            $this->_response_json([
                'status' => 0,
                'message' => 'Gagal menyimpan data'
            ]);
        }
    }

    public function del($cart_id)
    {
        $this->_restrict_access('rest');
        $this->load->model(['orders_cart_model','orders_model']);
        $cart = $this->orders_cart_model->get_byid($cart_id);

        if(!empty($cart))
        {
            $res = $this->orders_cart_model->del((int) $cart_id);
            $this->orders_model->upt_total_price($cart->order_id);
        }
        else $res = FALSE;

        if($res)
        {
            $this->_response_json([
                'status' => 1,
                'message' => 'Berhasil menghapus data'
            ]);
        }
        else
        {
            $this->_response_json([
                'status' => 0,
                'message' => 'Gagal menghapus data',
                'data' => $cart
            ]);
        }
    }
}
