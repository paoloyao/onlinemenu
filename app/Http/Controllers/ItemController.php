<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Item;
use App\Models\Coupon;
use App\Models\Order;
use App\Models\OrderList;

class ItemController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        // return Item::orderBy('created_at', 'DESC')->get();
        $old_array = Item::orderBy('created_at', 'DESC')->get();

        $new_array = array();
        foreach($old_array as $key => $value){
            $new_array[$value->id] = $value;
        }

        return $new_array;
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */

    public function create()
    {
        
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $newItem = new Order;
        //id placeholder for user
        $newItem->customer_id = "1";
        $newItem->total = $request->total;
        //placeholder for order status
        $newItem->status = "Processing";
        $newItem->save();

        foreach ($request->data as $key => $value){
            $newOrder = new OrderList;
            //id placeholder for user
            $newOrder->customer_id = "1";
            $newOrder->order_id = $newItem->id;
            $newOrder->quantity = $value["quantity"];
            $newOrder->category = $value["id"];
            $newOrder->save();

        }

        return $request;


        return $newItem;
    }

    public function coupon($id)
    {
        
        $post = Coupon::where('code', $id)->get();
        return count($post) ? json_encode("true"): json_encode("false");
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        // $existingItem = Item::find($id);
        // if( $existingItem ) {
        //     $existingItem->completed = $request->item['completed'] ? true : false;
        //     $existingItem->completed_at = $request->item['completed'] ? Carbon::now() : null;
        // }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
