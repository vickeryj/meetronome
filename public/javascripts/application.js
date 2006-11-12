// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

function number_str (n) {
  var x = n.toString ();
  var l = x.length;
  var res = x.substr(0, l-2) + "." + x.substr(l-2,l);
  return res;
}


function inc_totals_at_rate(rate, inc) {
  curamount += inc;
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
  setTimeout('inc_totals_at_rate('+rate+','+inc+');', rate);
}

var send_it = true;
function do_send()
{
	return false;
	if (send_it)
	{
		return(send_it);
	}
	else
	{
		send_it = true;
		return false;
	}
}


function calc_costa()
{
	$("meeting_dollars_per_hour").value = parseInt($("dph").value).toFixed(2);
	send_it = false;
}

function calc_costb()
{
	$("meeting_dollars_per_hour").value = (parseInt($("pwm").value) * parseInt($("salary").value) / (52 * 40)).toFixed(2);
	send_it = false;
}