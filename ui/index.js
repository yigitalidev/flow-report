$(function () {
    function display(bool) {
        if (bool) {
            $("#container").show();
        } else {
            $("#container").hide();
        }
    }

    display(false)

    window.addEventListener('message', function(event) {
        var item = event.data;
        if (item.type === "ui") {
            if (item.status == true) {
                display(true)
            } else {
                display(false)
            }
        }
    })

    $(".closeButton").click(function () {
        $.post(`https://flow-report/close`, JSON.stringify({}));
        
        
        clear()

    
        return
    })

    $(".submit").click(function () {
        var subject = document.getElementById("subject").value;
        var information = document.getElementById("information").value;
    

        if (subject == "" || information == "") {
            $.post(`https://flow-report/emptyValue`, JSON.stringify({}));
        }else{
            values = [subject,information]
            $.post(`https://flow-report/reportPlayer`, JSON.stringify({values}));
            $.post(`https://flow-report/close`, JSON.stringify({}));

        }
        clear()
    
    })

    function clear() {
        document.getElementById("feedactive").style.display = "none";
        document.getElementById("bugactive").style.display = "none";
        document.getElementById("playeractive").style.display = "none";
    }


    $(".feedback").click(function () {
        clear()
        document.getElementById("feedactive").style.display = "flex";

        $.post(`https://flow-report/typeFeedback`, JSON.stringify({}));
    })

    $(".bug").click(function () {
        clear()
        document.getElementById("bugactive").style.display = "flex";
        $.post(`https://flow-report/typeBug`, JSON.stringify({}));
    })

    $(".player").click(function () {
        clear()
        document.getElementById("playeractive").style.display = "flex";
        $.post(`https://flow-report/typePlayer`, JSON.stringify({}));
    })

})
