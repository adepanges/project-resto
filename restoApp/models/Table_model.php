<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Table_model extends Resto_Model {
    protected
        $datatable_param = NULL,
        $table = 'table',
        $orderable_field = ['code','name'],
        $fillable_field = ['code','name','status'],
        $searchable_field = ['code','name'];

    function get_datatable($params = [])
    {
        $sql = "SELECT * FROM `{$this->table}`";

        $sql_user = $this->_combine_datatable_param($sql);
        $sql_count = $this->_combine_datatable_param($sql, TRUE);

        return [
            'row' => $this->db->query($sql_user)->result(),
            'total' => $this->db->query($sql_count)->row()->count
        ];
    }

    function get_byid($id)
    {
        return $this->db->where('table_id', ((int) $id))->get($this->table)->row();
    }

    function del($id)
    {
        return $this->db->delete($this->table, ['table_id' => ((int) $id)]);
    }

    function upd($data, $table_id)
    {
        $this->db->where('table_id', $table_id);
        return $this->db->update($this->table, $this->_sanity_field($data));
    }

    function add($data)
    {
        return $this->db->insert($this->table, $this->_sanity_field($data));
    }
}
