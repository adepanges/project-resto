<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class App extends Resto_Controller {

    function __construct()
    {
        parent::__construct();
        $this->_restrict_access('web');
    }

	public function index()
	{
        switch ($this->role_active['role_id']) {
            case 1:
                redirect('user');
                break;

            default:
                redirect('orders');
                break;
        }
	}
}
