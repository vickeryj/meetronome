// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

function number_str (n) {
  var x = n.toString ();
  var l = x.length;
  var res = x.substr(0, l-2) + "." + x.substr(l-2,l);
  return res;
}

function inc_totals_at_rate(rate) {
  curamount +=1;
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
  setTimeout('inc_totals_at_rate('+rate+');', rate);
}
