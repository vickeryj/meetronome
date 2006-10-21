// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

function number_str (n) {
  var x = n.toString ();
  var l = x.length;
  var res = x.substr(0, l-2) + "." + x.substr(l-2,l);
  return res;
}

//increment the total by "rate" times per minute
function inc_totals_at_rate(rate) {
  //incrementing by more than 8 times per second eats cpu,
  //instead, we will increase by more than 1 penny, no more than
  //8 times per second
  var inc_by = 1;
  while (480 < rate) {
    rate /= 2;
    inc_by *= 2;
  }
  inc_totals_by_x_at_rate(inc_by,rate);
}

function inc_totals_by_x_at_rate(x,rate)  {
  curamount += x;
  if (startamount != $("startcost").firstChild.nodeValue)
  {
    startamount = parseInt($("startcost").firstChild.nodeValue);
    curamount = startamount;
  }
  // redisplay the raw total 
  //the $() function is from prototype its awesome
  $("raw").firstChild.nodeValue = 
  "$" + number_str(curamount);

  // run this function again 
  setTimeout('inc_totals_by_x_at_rate('+x+','+rate+');', 60000/rate);
}
