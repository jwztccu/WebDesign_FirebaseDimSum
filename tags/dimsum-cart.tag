<dimsum-cart>
<center>
    <!--start of sweet and savoury buttons tag-->
<font face=arial size=5 color="purple">
    <h2>Sweet Votes: { numSweet } | Savoury  Votes: { numSavoury }</h2>
  </font>
    <button onclick={ showSweet }>I &#10084; Sweet </button>
    <button onclick={ showSavoury }>I &#10084; Savoury</button>
    <!--start of sweet and savoury buttons tag-->

    <!--scripts start-->
  <script>
    var that = this;

    console.log('dimsum-cart.tag');

//saying to look at the top of reference table dim_sum_flavors
//find me the child in rootRef (that was dfined in index) and
//look at the top of root ref for dim_sum_flavors

    var sweetRef = rootRef.child('/sweet_votes');
    var savouryRef = rootRef.child('/savoury_votes');
    this.numSweet = 0;
    this.numSavoury = 0;

//start of sweet data vote pushes
    showSweet(event) {
      observable.trigger('sweet');
      var key = sweetRef.push().key;
			console.log(key);
      var msg = {
				dimSumSelection: 'Sweet'
			};

      sweetRef.push(msg);
    }

//start of savoury data vote pushes
    showSavoury(event) {
      observable.trigger('savoury');
      var key = savouryRef.push().key;
			console.log(key);
      var msg = {
				dimSumSelection: 'savoury'
			};

      savouryRef.push(msg);
    }

 //start of vote countes for sweet
    sweetRef.on('value', function(snapshot_of_sweet_votes){
        that.numSweet = snapshot_of_sweet_votes.numChildren();
        that.update();
    });

 //start of vote countes for sweet
savouryRef.on('value', function(snapshot_of_savoury_votes){
     that.numSavoury = snapshot_of_savoury_votes.numChildren();
     that.update();
 });
  </script>
  <!--scripts end-->
<br>

<!--start of riot tags-->
<div>
  <div>
<dimsum-eggtart></dimsum-eggtart>
<dimsum-noodleroll></dimsum-noodleroll>
</div>
</div>
<!--end of riot tags-->
</center>
</dimsum-cart>
