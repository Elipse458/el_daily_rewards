var timeout = new Date().getTime() + 86399000;
$(function() {
    $("#main").hide();
    $("#header").html(Config.header);
    $("button").html(Config.buttomn);
    $('#countdown').countdown(timeout, { elapse: true }).on('update.countdown', function(event) {
        if (event.elapsed) {
            $(this).text(Config.countdown_done);
            $("#submitbtn").attr("disabled", false);
        } else {
            $(this).text(Config.remaining + (event.strftime('%D') != "00" ? event.strftime(' %D:%H:%M:%S') : event.strftime(' %H:%M:%S')));
            $("#submitbtn").attr("disabled", true);
        }
    });
    $('#countdown').countdown(0);
    var hue = 0;
    setInterval(function() {
        $(".rainbow").css({ "borderColor": "hsl(" + hue + ",50%,50%)" })
        hue = hue++ <= 360 ? hue : 0;
    }, 50);

    window.addEventListener('message', function(event) {
        if (event.data.type == "toggleshow") {
            toggleshow(event.data.enable);
            if (event.data.enable && event.data.timeout != null) {
                timeout = event.data.timeout;
                $('#countdown').countdown(event.data.timeout, { elapse: true });
            }
        }
        if (event.data.type == "settimeout") {
            $('#countdown').countdown(event.data.timeout);
        }
    });

    $("#freeform").submit(function(e) {
        e.preventDefault();
        $.post('http://el_daily_rewards/collect', JSON.stringify({ "t": new Date().getTime() }));
    });

    document.onkeyup = function(data) {
        if (data.which == 27) {
            $.post('http://el_daily_rewards/hidemenu', JSON.stringify({}));
        }
    };
});

function toggleshow(show) {
    if (!show) {
        $("#main").delay(100).animate({ height: 0 }, 700, "swing", function() { $("#main").hide(); });
    } else {
        $("#main").show();
        $("#main").delay(100).animate({ height: 210 }, 700);
    }
}