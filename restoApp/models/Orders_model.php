<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Orders_model extends Resto_Model {
    protected
        $datatable_param = NULL,
        $table = 'orders',
        $orderable_field = [],
        $fillable_field = ['table_id','customer_name','total_price','is_deleted','is_active','created_at'],
        $searchable_field = ['table_id','customer_name','total_price','is_deleted','is_active','created_at'];

    function get_byid($id)
    {
        return $this->db->where('order_id', ((int) $id))->get($this->table)->row();
    }

    function del($id)
    {
        return $this->db->delete($this->table, ['order_id' => ((int) $id)]);
    }

    function upd($data, $order_id)
    {
        $this->db->where('order_id', $order_id);
        return $this->db->update($this->table, $this->_sanity_field($data));
    }

    function add($data)
    {
        return $this->db->insert($this->table, $this->_sanity_field($data));
    }

    function upt_total_price($order_id)
    {
        $sql = "UPDATE orders a
            LEFT JOIN (
            	SELECT order_id, SUM(price) AS total_price FROM `orders_cart` GROUP BY order_id
            ) b ON a.order_id = b.order_id
            SET a.total_price = b.total_price
            WHERE a.order_id = ?";
        return $this->db->query($sql, [$order_id]);
    }
}
