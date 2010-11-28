var curVal = 0
 var memory = 0
 var lastOp = ""
 var timer = 0

 function disabled(op) {
     if (op == "." && display.text.toString().search(/\./) != -1) {
         return true
     } else if (op == "+" &&  display.text.toString().search(/-/) != -1) {
         return true
     } else {
         return false
     }
 }

 function doOperation(op) {
     if (disabled(op)) {
         return
     }

     if (op.toString().length==1 && ((op >= "0" && op <= "9") || op=="*" || op=="#") ) {
         if (display.text.toString().length >= 14)
             return; // No arbitrary length numbers
         if (lastOp.toString().length == 1 && ((lastOp >= "0" && lastOp <= "9")  || op=="*" || op=="#") ) {
             display.text = display.text + op.toString()
         } else {
             display.text = op
         }
         lastOp = op
         return
     }
     lastOp = op
     curVal = 0
     display.currentOperation.text = ""

     if (op == "+") {
         OfonoContext.MOCall(display.text.valueOf().toString());
         display.text = "Calling"+display.text.valueOf().toString()
     } else if (op == leftArrow) {
         display.text = display.text.toString().slice(0, -1)
         if (display.text.length == 0) {
             display.text = "0"
         }
     } else if (op == "C") {
         display.text = "0"
     } else if (op == "AC") {
         curVal = 0
         memory = 0
         lastOp = ""
         display.text ="0"
     }
 }
