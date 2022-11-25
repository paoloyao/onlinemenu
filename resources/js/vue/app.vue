
<template>
<div class="wrapper">
    <nav class="navbar navbar-dark bg-dark border mb-3">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">Online Menu Ordering</a>
            <div class="d-flex">
                <b-button v-b-modal.showModal class="btn btn-outline-secondary orders">
                    View Orders
                </b-button>
                <div>
                    <b-button v-b-modal.cartModal class="cartButton">
                        <font-awesome-icon icon="shopping-cart" class="mycart" />
                        <span class="badge badge-pill badge-primary ml-1">{{countItems}}</span>
                    </b-button>
                </div>
            </div>
        </div>
    </nav>

    <div class="alert alert-success showAddCart fade show" role="alert" v-if="showAddCart">
        Product Added to Cart!
    </div>

    <div class="alert alert-success showAddCart fade show" role="alert" v-if="showOrderSuccess">
        Successfully Placed Order!
    </div>

    <div v-for="(category, index) in categories" :key="index" class="container" style="min-height: 17rem;">
        <h2 class="border_catg">{{category[0]}}</h2>
        <div class="position-absolute">
            <div class="row g-1 d-flex">
                <div v-for="(item, index) in items" :key="index" class="flex-row">
                    <div v-if="item.category == category[1]"  class="card p-3 m-2">
                        <div class="text-center"> <img src="https://www.gepaghana.org/cms/wp-content/uploads/2017/04/banana.jpg" width="120"> </div>
                        <div class="product-details"> <span class="font-weight-bold d-block">P{{item.price}}</span> <span>{{item.name}}</span>
                            <div class="buttons d-flex flex-row">
                                <div class="cart"><font-awesome-icon icon="shopping-cart" /></div> <button class="btn btn-success" v-on:click="addCart(item.id)">Add to cart </button>
                            </div>
                            <div class="weight"> <small>Plus Tax of P{{item.tax}}</small> </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <b-modal id="showModal" title="Your Orders" hide-footer>
        <table id="cart" class="table table-hover table-condensed">
            <thead>
                <tr>
                    <th style="width:50%">Product</th>
                    <th style="width:10%">Price</th>
                    <th style="width:8%;" class="text-center">Tax</th>
                    <th style="width:8%">Quantity</th>
                </tr>
            </thead>
            <tbody>
                <tr v-for="(show, index) in showModalData.data" :key="index">
                    <div v-if="show" style="display: contents;">
                        <td data-th="Name">
                            <div class="row">
                                <div class="col-sm-10">
                                    <h4 class="nomargin">{{show.name}}</h4>
                                </div>
                            </div>
                        </td>
                        <td data-th="Price">{{show.price}}</td>
                        <td data-th="Tax" class="text-center">{{show.tax}}</td>
                        <td data-th="Quantity" class="text-center">{{show.quantity}}</td>
                    </div>
                </tr>
            </tbody>
            <tfoot>
                <tr>
                    <td data-th="Price"></td>
                    <td data-th="Price"></td>
                    <td data-th="Price"></td>
                    <td class="hidden-xs text-center">
                        <strong>TOTAL: {{showModalData.total}}</strong>
                    </td>
                </tr>
            </tfoot>
        </table>
    </b-modal>

    <b-modal id="cartModal" title="Your Shopping Cart" hide-footer>
        <table id="cart" class="table table-hover table-condensed">
            <thead>
                <tr>
                    <th style="width:50%">Product</th>
                    <th style="width:10%">Price</th>
                    <th style="width:8%;" class="text-center">Tax</th>
                    <th style="width:8%">Quantity</th>
                    <th style="width:22%" class="text-center">Subtotal</th>
                    <th style="width:10%"></th>
                </tr>
            </thead>
            <tbody>
                <tr v-for="(cart, index) in cartItems" :key="index">
                    <div v-if="cart" style="display: contents;">
                        <td data-th="Name">
                            <div class="row">
                                <div class="col-sm-10">
                                    <h4 class="nomargin">{{cart.name}}</h4>
                                </div>
                            </div>
                        </td>
                        <td data-th="Price">{{cart.price}}</td>
                        <td data-th="Tax" class="text-center">{{cart.tax}}</td>
                        <td data-th="Quantity" class="text-center">{{cart.quantity}}</td>
                        <td data-th="Subtotal" class="text-center">{{cart.quantity*(cart.price+cart.tax)}}</td>
                        <td class="actions" data-th="">
                            <button class="btn btn-danger btn-sm" @click="removeItem(index)"><font-awesome-icon icon="trash" /></button>							
                        </td>
                    </div>
                </tr>
            </tbody>
            <tfoot>
                <tr>
                    <td colspan="2" class="hidden-xs">
                        <input type="text" v-model="coupon" class="coupon">
                        <button class="btn btn-warning" @click="claimCoupon()" :disabled="couponSuccess">Claim Cupon</button>
                        <span v-if="errorCoupon" style="color:red;">Invalid Coupon!</span>
                    </td>
                    <td colspan="2" class="hidden-xs"></td>
                    {{computeTotal()}}
                    <td class="hidden-xs text-center">
                        <strong v-if="!couponSuccess">Total: {{total}}</strong>
                        <span v-else><strong>Total: {{total}}(-10%) {{newTotal = total-(total*0.1)}}</strong></span></td>
                    <td><a href="#" class="btn btn-success btn-block" @click="checkout">Checkout <i class="fa fa-angle-right"></i></a></td>
                </tr>
            </tfoot>
            <b-button class="mt-3" block @click="$bvModal.hide('cartModal')"  id="closeModal" hidden>Close Me</b-button>
        </table>
    </b-modal>
   
</div>
</template>

<script>
import addItemForm from "./addItemForm"
import listView from "./listView"
export default {
    components: {
        addItemForm,
        listView
    },
    
    data () {
            return {
            url: 'https://i.imgur.com/w2rCsEw.jpg',
            items: [],
            categories: [
                ["Burgers", 1], 
                ["Beverages", 2], 
                ["Combo Meals", 3]],
            addToCart: [],
            countItems: 0,
            showAddCart: false,
            cartItems: [],
            cartElements: [],
            total: 0,
            coupon: "",
            errorCoupon: false,
            couponSuccess: false,
            newTotal: 0,
            showModalData: [],
            showOrderSuccess: false
        }
    },

    methods: {
        getItems() {
            axios.get('items')
            .then(  response => {
                this.items = response.data
            })
            .catch(error => {
                console.log(error)
            })
        },

        addCart(id){
            this.addToCart.push(this.items[id])
            this.countItems += 1
            this.showAddCart = true
            setTimeout(() => this.showAddCart = false, 2000);
    
            if(this.cartItems[id]){
                this.cartItems[id]["quantity"] = this.cartItems[id]["quantity"]+1
            }else{
                this.cartItems[id] = {}
                this.cartItems[id] = {'name': this.items[id].name,
                                      'price': this.items[id].price,
                                      'tax': this.items[id].tax,
                                      'quantity': 1,
                                      'id': id}
            }
            // this.cartItems.forEach(element => this.cartElements.push(element));

        },

        computeTotal(){
            var compute = 0
            this.cartItems.forEach(element => compute = compute+(element.quantity*(element.price+element.tax)));
            this.total = compute
        },

        removeItem(index) { 
            var placeholder = []
            if(this.cartItems[index]['quantity'] == 1){     
                delete this.cartItems[index]
                console.log(this.cartItems)
            } else {
                this.cartItems[index]['quantity'] -= 1
            }
            this.newTotal = this.total
            placeholder = this.cartItems
            this.cartItems =[]
            this.cartItems = placeholder
            this.countItems -= 1
            
        },

        checkout(){
            var placeholder = []
            this.cartItems.forEach( element =>{
                    placeholder.push(element)
                }
            )

            if(this.newTotal){
                this.total = Math.round(this.newTotal)
            }

            axios.post('item/store', {
                    data: placeholder,
                    total: this.total
                })
                .then((response) => {
                    this.couponSuccess = false
                    this.coupon = ''
                    this.countItems = 0
                    this.cartItems = []
                    document.getElementById("closeModal").click()
                    this.showOrderSuccess = true 
                    setTimeout(() => this.showOrderSuccess = false, 4000);
                    this.showModalData = response.data
                    console.log(response.data);
                })
                .catch(function (error) {
                    console.log(error);
                });
            },

        claimCoupon(){
            this.errorCoupon = false
            if(this.coupon){
                axios.get('items/coupon/'+this.coupon)
                .then(  response => {
                    if(response.data == "true"){
                        this.total = this.total-(this.total*0.1)
                        this.newTotal = this.total
                        this.couponSuccess = true
                    }else {
                        this.errorCoupon = true
                        setTimeout(() => this.errorCoupon = false, 5000);
                    }
                })
                .catch(error => {
                    console.log(error)
                })
            }
        }

    },

    created() {
        this.getItems();
    },
}

</script>

<style>
.menuContainer {
    width: 350px;
    margin: auto;
}

.heading {
    background: #e6e6e6;
    padding: 10px;
}

#title {
    text-align: center;
}

body {
    background: #eee
}

.wrapper {
    margin-top: 30px
}

.card {
    border: 1px solid rgba(0, 0, 0, 0.1);
    cursor: pointer
}

.weight {
    margin-top: -65px;
    transition: all 0.5s
}

.weight small {
    color: #e2dede
}

.buttons {
    padding: 10px;
    background-color: #d6d4d44f;
    border-radius: 4px;
    position: relative;
    margin-top: 7px;
    opacity: 0;
    transition: all 0.8s
}

.cart-button {
    height: 48px
}

.cart-button:focus {
    box-shadow: none
}

.cart, .add {
    position: relative;
    height: 48px !important;
    width: 50px;
    margin-right: 8px;
    display: flex;
    justify-content: center;
    align-items: center;
    background-color: #fff;
    padding: 11px;
    border-radius: 5px;
    font-size: 14px;
    transition: 1s ease-in-out;
    overflow: hidden
}

.card:hover .buttons {
    opacity: 1
}

.card:hover .weight {
    margin-top: 10px
}

.card:hover {
    transform: scale(1.04);
    z-index: 1;
    overflow: hidden
}

.border {
    border-bottom: 3px solid rgb(129, 128, 128)!important;
}

.mycart {
    min-width: 40px;
    min-height: 30px;
    padding: 5px;
    color: #000000d1;
    background-color: white;
    border-radius: 8px;
}

.border_catg {
    border-bottom: 1px solid #9793932b;
}

.showAddCart {
    display: flex;
    float: right;
    max-width: 20rem!important;
}

.cartButton{
    border-color: #6c757d;
    background-color: #343a40;
}

.cardButton:hover{
    border-color: #81878b;
    background-color: #313335;
}
	
.table>tbody>tr>td, .table>tfoot>tr>td{
    vertical-align: middle;
}

.modal-dialog {
    min-width: 50rem;
}

.orders:hover {
    color: #ccccd8!important;
    border-bottom: 1px solid #cabababf;
}

.orders {
    margin-right: 10px;
    color: #efefef!important;
}

.coupon{
    border: 1px solid #0000007a;
    border-radius: 5px;
    margin-right: 5px;
}
</style>