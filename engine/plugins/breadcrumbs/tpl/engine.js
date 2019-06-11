//
// Basic JS functions for BixBite CMS core
$(function() {

    $('.scrollTop').on('click', function(){
        return $('html, body').animate({ scrollTop: 0 }, 888);
    });

    // for bootstrap element
    $('input[type=checkbox]').each(function() {
        if ( $(this).prop('checked') == true ) {
            $(this).parent().addClass('active');
        } else {
            $(this).parent().removeClass('active');
        }
    });

    // Select/unselect all
    $('table .select-all').on('click', function() {
        $(this).parents('table').find('input:checkbox:not([disabled])').prop('checked', $(this).prop('checked'));
    });

    // Process spoilers
    $('.sp-head').on('click', function() {
        if ($(this).hasClass("expanded")) {
            $(this).removeClass("expanded");
            $(this).next('.sp-body').slideUp("fast");
        } else {
            $(this).addClass("expanded");
            $(this).next('.sp-body').slideDown("fast");
        }

    });

    // Reload captcha
    $('#img_captcha').on('click', function() {
        reload_captcha();
    });

});

// Reload captcha
function reload_captcha() {
    $('#img_captcha').attr('src', $('#img_captcha').attr('src').replace(/(rand=)[0\.?\d*]+/, '$1' + Math.random()));
}

/* cookie style core */
function setCookie(name, value, days) {
    if (days) {
        var date = new Date();
        date.setTime(date.getTime()+(days*24*60*60*1000));
        var expires = "; expires="+date.toGMTString();
    }
    else var expires = "";
    document.cookie = name+"="+value+expires+"; path=/";
}

function deleteCookie(name) {
    setCookie(name,"",-1);
}

function getCookie(name) {
    var nameEQ = name + "=";
    var ca = document.cookie.split(';');
    for(var i=0;i < ca.length;i++) {
        var c = ca[i];
        while (c.charAt(0)==' ') c = c.substring(1,c.length);
        if (c.indexOf(nameEQ) == 0) return c.substring(nameEQ.length,c.length);
    }
    return null;
}

// ngShowLoading
function ngShowLoading() {
    var setX = ( $(window).width() - $("#loading-layer").width() ) / 2;
    var setY = ( $(window).height() - $("#loading-layer").height() ) / 2;

    $("#loading-layer").css( {
        left : setX + "px",
        top : setY + "px",
        position : 'fixed',
        zIndex : '99'
    });

    $("#loading-layer").fadeIn(0);
}

// ngHideLoading
function ngHideLoading() {
    $("#loading-layer").fadeOut('slow');
}

// confirmIt
function confirmIt(url, text){
    if (confirm(text)) document.location=url;
    return false;
}

// Request JSON - new style ajax
$.reqJSON = function(url, method, params, callback, notPreload) {
    $.ajax({
        type: 'POST',
        url: url,
        cache: false,
        dataType: 'json',
        data: {
            json: 1,
            rndval: new Date().getTime(),
            methodName: method,
            reqReferer: window.location.href,
            params: JSON.stringify(params),
        },
        beforeSend: function(jqXHR) {
            if (!notPreload) {
                ngShowLoading();
            }
            jqXHR.overrideMimeType("application/json; charset=UTF-8");
            // Repeat send header ajax
            jqXHR.setRequestHeader("X-Requested-With", "XMLHttpRequest");
        },
    })
    .done(function(data, textStatus, jqXHR) {
        if (typeof(data) == 'object') {
            // this schema {"status": 1, "errorCode": 0, "errorText": ""}
            // if data.length > 3 => callback this
            if (data.status || Object.keys(data).length > 3) {
                callback.call(null, data);
            } else {
                $.notify({message:data.errorText},{type: 'danger'});
                //$.notify({message:'Error ['+data.errorCode+']: '+data.errorText},{type: 'danger'});
            }
        } else {
            data = $.parseJSON(data);
            if (typeof(data) == 'object') {
                callback.call(null, data);
            } else {
                $.notify({message: '<i><b>Bad reply from server</b></i>'},{type: 'danger'});
            }
        }
    })
    .always(function(jqXHR, textStatus, errorThrown) {
        ngHideLoading();
    })
    .catch(function(jqXHR, textStatus, exception) {
        if (jqXHR.status === 0) {
            $.notify({message: 'Not connect.n Verify Network.'},{type: 'danger'});
        } else if (jqXHR.status == 404) {
            $.notify({message: 'Requested page not found. [404]'},{type: 'danger'});
        } else if (jqXHR.status == 500) {
            $.notify({message: 'Internal Server Error [500].'},{type: 'danger'});
        } else if (exception === 'parsererror') {
            $.notify({message: 'Requested JSON parse failed.'},{type: 'danger'});
        } else if (exception === 'timeout') {
            $.notify({message: 'Time out error.'},{type: 'danger'});
        } else if (exception === 'abort') {
            $.notify({message: 'Ajax request aborted.'},{type: 'danger'});
        } else {
            $.notify({message: 'Uncaught Error.n ' + jqXHR.status + ': ' + jqXHR.statusText},{type: 'danger'});
        }
    });
}

// insertext
function insertext(open, close, field) {
    msgfield = document.getElementById((field != '') ? field : 'content');

    // IE support
    if (document.selection && document.selection.createRange){
        msgfield.focus();
        sel = document.selection.createRange();
        sel.text = open + sel.text + close;
        msgfield.focus();
    }
    // Moz support
    else if (msgfield.selectionStart || msgfield.selectionStart == "0"){
        var startPos = msgfield.selectionStart;
        var endPos = msgfield.selectionEnd;

        msgfield.value = msgfield.value.substring(0, startPos) + open + msgfield.value.substring(startPos, endPos) + close + msgfield.value.substring(endPos, msgfield.value.length);
        msgfield.selectionStart = msgfield.selectionEnd = endPos + open.length + close.length;
        msgfield.focus();
    }
    // Fallback support for other browsers
    else {
        msgfield.value += open + close;
        msgfield.focus();
    }
    $('html, body').animate({ scrollTop: $(msgfield).offset().top-200 }, 888);
    return;
}

// insertimage
function insertimage(open) {
    insertext(open, ' ');
}
/* Quote user */
var q_txt = '';

function copy_quote(q_name) {

    if (window.getSelection) {
        q_txt = window.getSelection();
    } else if (document.getSelection) {
        q_txt = document.getSelection();
    } else if (document.selection) {
        q_txt = document.selection.createRange().text;
    }

    if (q_txt == '') {
        q_txt = '[b]'+q_name+'[/b],';
    } else {
        q_txt = '[quote='+q_name+']'+q_txt+'[/quote]';
    }

}

function quote(q_name) {
    insertext(q_txt, ' ', 'content');
}

// emailCheck
function emailCheck(emailStr) {
    var emailPat = /^(.+)@(.+)$/,
        specialChars = "\\(\\)<>@,;:\\\\\\\"\\.\\[\\]",
        validChars = "\[^\\s" + specialChars + "\]",
        quotedUser = "(\"[^\"]*\")",
        ipDomainPat = /^\[(\d{1,3})\.(\d{1,3})\.(\d{1,3})\.(\d{1,3})\]$/,
        atom = validChars + '+',
        word = "(" + atom + "|" + quotedUser + ")",
        userPat = new RegExp("^" + word + "(\\." + word + ")*$"),
        domainPat = new RegExp("^" + atom + "(\\." + atom +")*$");

    var matchArray = emailStr.match(emailPat);
    if (matchArray == null) return false;

    var user = matchArray[1],
        domain = matchArray[2];
    if (user.match(userPat) == null) return false;

    var IPArray = domain.match(ipDomainPat);
    if (IPArray != null) {
        for (var i=1;i<=4;i++) {
            if (IPArray[i]>255) return false;
        }
        return true;
    }

    var domainArray = domain.match(domainPat);
    if (domainArray == null) return false;

    var atomPat = new RegExp(atom,"g"),
        domArr = domain.match(atomPat),
        len = domArr.length;
    if (domArr[domArr.length-1].length<2 || domArr[domArr.length-1].length>3) return false;

    if (len<2) return false;

    return true;

}

// formatSize
function formatSize($file_size){
    if ($file_size >= 1073741824) {
        $file_size = Math.round( $file_size / 1073741824 * 100 ) / 100 + " Gb";
    } else if ($file_size >= 1048576) {
        $file_size = Math.round( $file_size / 1048576 * 100 ) / 100 + " Mb";
    } else if ($file_size >= 1024) {
        $file_size = Math.round( $file_size / 1024 * 100 ) / 100 + " Kb";
    } else {
        $file_size = $file_size + " b";
    }
    return $file_size;
}

// calculateMaxLen
function calculateMaxLen(oId, tId, maxLen) {
    var delta = maxLen - oId.val().length;

    if (tId) {
        tId.html(delta);
        tId.css('color', ((delta > 0) ? 'black' : 'red'));
    }
}

// Simple timer
function timerShow(id) {
    var timer = 0,hour = 0,minute = 0,second = 0;
    window.setInterval(function(){
        ++timer;
        hour   = Math.floor(timer / 3600);
        minute = Math.floor((timer - hour * 3600) / 60);
        second = timer - hour * 3600 - minute * 60;
        if (hour < 10) hour = '0' + hour;
        if (minute < 10) minute = '0' + minute;
        if (second < 10) second = '0' + second;
        $('#'+id).html(hour + ':' + minute + ':' + second);
        }, 1000);
}

// printElem
function printElem(data) {
    
    var printing_css='<style>* {color:#888;} input{display:none;} a {text-decoration:none;}</style>';
    var html_to_print=printing_css + data;
    var iframe=$('<iframe id="print_frame">');
    $('body').append(iframe);
    var doc = $('#print_frame')[0].contentDocument || $('#print_frame')[0].contentWindow.document;
    var win = $('#print_frame')[0].contentWindow || $('#print_frame')[0];
    doc.getElementsByTagName('body')[0].innerHTML=html_to_print;
    win.print();
    $('iframe').remove();

    return true;
}

/* Main function to show Modal Bootsrtap */
function showModal(textOrID, header, footer, size) {
    var withID = document.getElementById(textOrID);
    if (withID && !header && !footer) { // Show modal with ID
        $(withID).modal('show');
        return;
    }
    var modalContent = '';
    if (header) {
        if (textOrID) {
            modalContent = '<div class="modal-header">\
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">\
                                    <span aria-hidden="true">&times;</span>\
                                </button>\
                                <h5 class="modal-title">' + header + '</h5>\
                            </div>';
        } else {
            modalContent = '<div class="modal-header">\
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">\
                                    <span aria-hidden="true">&times;</span>\
                                </button>\
                                <h5 class="modal-title">Info</h5>\
                            </div>';
        }
    } else {
        modalContent = '<div class="modal-header">\
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">\
                                <span aria-hidden="true">&times;</span>\
                            </button>\
                            <h5 class="modal-title">Error</h5>\
                        </div>';
    }
    if (textOrID)
        modalContent += '<div class="modal-body">' + textOrID + '</div>';
    else
        modalContent += '<div class="modal-body">Unable to load content . . .</div>';
    
    if (footer) {
        modalContent += '<div class="modal-footer">' + footer + '</div>';
    } else {
        modalContent += '<div class="modal-footer">\
                            <button type="button" class="btn btn-default btn-secondary" data-dismiss="modal">\
                            Close\
                            </button>\
                        </div>';
    }
    if (size == 'modal-lg')
        $('#modal-dialog .modal-dialog').addClass('modal-lg');
    else
        $('#modal-dialog .modal-dialog').removeClass('modal-lg');

    $('#modal-dialog .modal-content').html(modalContent); // #modal-dialog isset in html document'Р Вµ
    $('#modal-dialog').modal('show');

    return;
}

// validateFile
function validateFile(fileInput,multiple,fileMaxSize) {
    var htext = '';
    var hsize = '';
    var btnFileInput = $(fileInput).closest('.btn-fileinput');
    
    if (!fileInput.value) {
        btnFileInput.attr('style', '');
        btnFileInput.addClass('btn');
        btnFileInput.children('span').eq(0).html('<i class="fa fa-plus"></i> Add files ...');
        btnFileInput.children('span').attr('style', '');
        return false;
    }
    
    if (multiple) {
        for (var i=0;i<fileInput.files.length;i++) {
            if (fileMaxSize) {
                htext += '<tr><td style="overflow:hidden;text-overflow:ellipsis;max-width: 400px;">' + fileInput.files[i].name+'</td><td nowrap><div id="progressbar" class="progress-bar progress-bar-success" aria-valuemin="0" aria-valuemax="100" style="width: 0%;"></div><b class="pull-right' + (fileInput.files[i].size>fileMaxSize?' text-danger':'') + '">'+formatSize(fileInput.files[i].size)+'</b></td></tr>';
            } else {
                htext += '<tr><td style="overflow:hidden;text-overflow:ellipsis;max-width: 400px;">' + fileInput.files[i].name+'</td><td nowrap><div id="progressbar" class="progress-bar progress-bar-success" aria-valuemin="0" aria-valuemax="100" style="width: 0%;"></div><b class="pull-right">'+formatSize(fileInput.files[i].size)+'</td></tr>';
            }
            hsize = Number(fileInput.files[i].size) + Number(hsize);
        }
        
        btnFileInput.removeClass('btn');
        btnFileInput.children('span').eq(0).html('<table\
            class="table-condensed" style="width: 100%;">\
            ' + htext + '<tr><td colspan="2" class="text-right">' + formatSize(hsize) + '</td></tr></table>');
        btnFileInput.children('span').eq(0).css({'width': '100%', 'display': 'block'/*, 'white-space': 'nowrap'*/});
        btnFileInput.css({'width': '100%', 'display': 'block'});
    } else {
        for (var i=0;i< fileInput.files.length;i++) {
            htext += fileInput.files[i].name+' ('+formatSize(fileInput.files[i].size)+')<br />';
            hsize = Number(fileInput.files[i].size) + Number(hsize);
        }
        
        btnFileInput.children('span').eq(0).html(htext);
    }
    
    return true;
}


/* ************ */
/* DINAMIC TIME */
/* ************ */
UsAgentLang = (navigator.language || navigator.systemLanguage || navigator.userLanguage).substr(0, 2).toLowerCase();

Lang = {}
// Р вЂ™РЎвЂ№Р В±Р С‘РЎР‚Р В°Р ВµР С� Р Р…РЎС“Р В¶Р Р…РЎС“РЎР‹ Р В»Р С•Р С”Р В°Р В»Р С‘Р В·Р В°РЎвЂ Р С‘РЎР‹.
switch (UsAgentLang) {
    case 'ru' :
        Lang.Now = 'РЎвЂљР С•Р В»РЎРЉР С”Р С• РЎвЂЎРЎвЂљР С•';
        Lang.Ago = 'Р Р…Р В°Р В·Р В°Р Т‘';
        Lang.After = 'РЎвЂЎР ВµРЎР‚Р ВµР В·';
        Lang.NameMonths = ['Р Р‡Р Р…Р Р†Р В°РЎР‚РЎРЏ', 'Р В¤Р ВµР Р†РЎР‚Р В°Р В»РЎРЏ', 'Р СљР В°РЎР‚РЎвЂљР В°', 'Р С’Р С—РЎР‚Р ВµР В»РЎРЏ', 'Р СљР В°РЎРЏ', 'Р пїЅРЎР‹Р Р…РЎРЏ', 'Р пїЅРЎР‹Р В»РЎРЏ', 'Р С’Р Р†Р С–РЎС“РЎРѓРЎвЂљa', 'Р РЋР ВµР Р…РЎвЂљРЎРЏР В±РЎР‚РЎРЏ', 'Р С›Р С”РЎвЂљРЎРЏР В±РЎР‚РЎРЏ', 'Р СњР С•РЎРЏР В±РЎР‚РЎРЏ', 'Р вЂќР ВµР С”Р В°Р В±РЎР‚РЎРЏ'];
        Lang.NameMonthsMin = ['Р Р‡Р Р…Р Р†', 'Р В¤Р ВµР Р†', 'Р СљР В°РЎР‚', 'Р С’Р С—РЎР‚', 'Р СљР В°Р в„–', 'Р пїЅРЎР‹Р Р…', 'Р пїЅРЎР‹Р В»', 'Р С’Р Р†Р С–', 'Р РЋР ВµР Р…', 'Р С›Р С”РЎвЂљ', 'Р СњР С•РЎРЏ', 'Р вЂќР ВµР С”'];
        Lang.NameWeekdays = ['Р вЂ™Р С•РЎРѓР С”РЎР‚Р ВµРЎРѓР ВµР Р…РЎРЉР Вµ', 'Р СџР С•Р Р…Р ВµР Т‘Р ВµР В»РЎРЉР Р…Р С‘Р С”', 'Р вЂ™РЎвЂљР С•РЎР‚Р Р…Р С‘Р С”', 'Р РЋРЎР‚Р ВµР Т‘Р В°', 'Р В§Р ВµРЎвЂљР Р†Р ВµРЎР‚Р С–', 'Р СџРЎРЏРЎвЂљР Р…Р С‘РЎвЂ Р В°', 'Р РЋРЎС“Р В±Р В±Р С•РЎвЂљР В°'];
        Lang.NameWeekdaysMin = ['Р вЂ™РЎРѓ', 'Р СџР Р…', 'Р вЂ™РЎвЂљ', 'Р РЋРЎР‚', 'Р В§РЎвЂљ', 'Р СџРЎвЂљ', 'Р РЋР В±'];
        Lang.DimensionTime = {
                'n' : ['Р С�Р ВµРЎРѓРЎРЏРЎвЂ Р ВµР Р†', 'Р С�Р ВµРЎРѓРЎРЏРЎвЂ ', 'Р С�Р ВµРЎРѓРЎРЏРЎвЂ Р В°', 'Р С�Р ВµРЎРѓРЎРЏРЎвЂ '],
                'j' : ['Р Т‘Р Р…Р ВµР в„–', 'Р Т‘Р ВµР Р…РЎРЉ', 'Р Т‘Р Р…РЎРЏ'],
                'G' : ['РЎвЂЎР В°РЎРѓР С•Р Р†', 'РЎвЂЎР В°РЎРѓ', 'РЎвЂЎР В°РЎРѓР В°'],
                'i' : ['Р С�Р С‘Р Р…РЎС“РЎвЂљ', 'Р С�Р С‘Р Р…РЎС“РЎвЂљРЎС“', 'Р С�Р С‘Р Р…РЎС“РЎвЂљРЎвЂ№'],
                's' : ['РЎРѓР ВµР С”РЎС“Р Р…Р Т‘', 'РЎРѓР ВµР С”РЎС“Р Р…Р Т‘РЎС“', 'РЎРѓР ВµР С”РЎС“Р Р…Р Т‘РЎвЂ№']
        }
        break;
    default:
        Lang.Now = 'now';
        Lang.Ago = 'ago';
        Lang.After = 'after';
        Lang.NameMonths = ['January', 'February', 'Marth', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'];
        Lang.NameMonthsMin = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
        Lang.NameWeekdays = ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'];
        Lang.NameWeekdaysMin = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
        Lang.DimensionTime = {
                'n' : ['months', 'month', 'months'],
                'j' : ['days', 'day', 'days'],
                'G' : ['hours', 'h', 'hours'],
                'i' : ['minutes', 'minute', 'minutes'],
                's' : ['seconds', 'second', 'seconds']
        }
        break;
}

// Р вЂ™РЎвЂ№Р Р†Р С•Р Т‘Р С‘РЎвЂљ РЎРЊР В»Р ВµР С�Р ВµР Р…РЎвЂљ Р Т‘Р В°РЎвЂљРЎвЂ№ РЎРѓ Р Р…РЎС“Р В¶Р Р…Р С•Р в„– РЎР‚Р В°Р В·Р С�Р ВµРЎР‚Р Р…Р С•РЎРѓРЎвЂљРЎРЉРЎР‹, Р С‘ Р Р† Р Р…РЎС“Р В¶Р Р…Р С•Р С� РЎРѓР С”Р В»Р С•Р Р…Р ВµР Р…Р С‘Р С‘
function NiceDate(chislo, type) {
    var n;
    // Р Р€Р В·Р Р…Р В°Р ВµР С� Р Р…РЎС“Р В¶Р Р…Р С•Р Вµ РЎРѓР С”Р В»Р С•Р Р…Р ВµР Р…Р С‘Р Вµ Р Т‘Р В»РЎРЏ Р Р†РЎР‚Р ВµР С�Р ВµР Р…Р Р…Р С•Р в„– Р ВµР Т‘Р С‘Р Р…Р С‘РЎвЂ РЎвЂ№
    if (chislo >= 5 && chislo <= 20)
        n = 0;
    else if (chislo == 1 || chislo % 10 == 1)
        n = 1;
    else if ((chislo <= 4 && chislo >= 1) || (chislo % 10 <= 4 && chislo % 10 >= 1))
        n = 2;
    else
        n = 0;
        

    return chislo + ' ' + Lang.DimensionTime[type][n];

}

// Р вЂ™РЎвЂ№Р Р†Р С•Р Т‘Р С‘РЎвЂљ Р Т‘Р Р†РЎС“Р В·Р Р…Р В°РЎвЂЎР Р…Р С•Р Вµ РЎвЂЎР С‘РЎРѓР В»Р С• РЎРѓ Р Р†Р ВµР Т‘РЎС“РЎвЂ°Р С‘Р С� Р Р…РЎС“Р В»Р ВµР С�
function ZeroPlus(x) {
    if (x < 10)
        x = '0' + x;
    return x;
}
// Р СџР ВµРЎР‚Р ВµР Р†Р С•Р Т‘Р С‘РЎвЂљ Р Р† 12 РЎвЂЎР В°РЎРѓР С•Р Р†Р С•Р в„– РЎвЂћР С•РЎР‚Р С�Р В°РЎвЂљ
function ToAM(x) {
    if (x > 12) 
        x -= 12;
    return x;
}

// Р С’Р Р…Р В°Р В»Р С•Р С– РЎвЂћРЎС“Р Р…Р С”РЎвЂ Р С‘Р С‘ date() Р С‘Р В· PHP
function ParseDateFormat(format, Time) {
    var DateInFormat = '';
    if (format.length === 0)
        return;
    for (var i = 0; i < format.length; i++) {
        switch (format[i]) {
            // Р В§Р В°РЎРѓРЎвЂ№
            // 12 РЎвЂЎР В°РЎРѓР С•Р Р†Р С•Р в„–
            case 'g' : DateInFormat += ToAM(Time.getUTCHours()); break; // Р В±Р ВµР В· Р Р†Р ВµР Т‘РЎС“РЎвЂ°Р ВµР С–Р С• Р Р…РЎС“Р В»РЎРЏ
            case 'h' : DateInFormat += ZeroPlus(ToAM(Time.getUTCHours())); break; // C Р Р†Р ВµР Т‘РЎС“РЎвЂ°Р С‘Р С� Р Р…РЎС“Р В»Р ВµР С�
            // 24 РЎвЂЎР В°РЎРѓР С•Р Р†Р С•Р в„–
            case 'G' : DateInFormat += Time.getUTCHours(); break; // Р В±Р ВµР В· Р Р†Р ВµР Т‘РЎС“РЎвЂ°Р ВµР С–Р С• Р Р…РЎС“Р В»РЎРЏ
            case 'H' : DateInFormat += ZeroPlus(Time.getUTCHours()); break; // РЎРѓ Р Р†Р ВµР Т‘РЎС“РЎвЂ°Р С‘Р С� Р Р…РЎС“Р В»РЎвЂ�Р С�
            // Р вЂњР С•Р Т‘РЎвЂ№
            case 'Y' : DateInFormat += Time.getUTCFullYear(); break; // Р В§Р ВµРЎвЂљРЎвЂ№РЎР‚Р Вµ РЎвЂ Р С‘РЎвЂћРЎР‚РЎвЂ№
            case 'y' : DateInFormat += String(Time.getUTCFullYear()).substr(2); break; // Р вЂќР Р†Р Вµ РЎвЂ Р С‘РЎвЂћРЎР‚РЎвЂ№
            // Р СљР ВµРЎРѓРЎРЏРЎвЂ РЎвЂ№
            case 'm' : DateInFormat += ZeroPlus(Time.getUTCMonth() + 1); break; //Р СџР С•РЎР‚РЎРЏР Т‘Р С”Р С•Р Р†РЎвЂ№Р в„– Р Р…Р С•Р С�Р ВµРЎР‚ Р С�Р ВµРЎРѓРЎРЏРЎвЂ Р В° РЎРѓ Р Р†Р ВµР Т‘РЎС“РЎвЂ°Р С‘Р С� Р Р…РЎС“Р В»РЎвЂ�Р С�
            case 'n' : DateInFormat += Time.getUTCMonth() + 1; break; // Р СџР С•РЎР‚РЎРЏР Т‘Р С”Р С•Р Р†РЎвЂ№Р в„– Р Р…Р С•Р С�Р ВµРЎР‚ Р С�Р ВµРЎРѓРЎРЏРЎвЂ Р В° Р В±Р ВµР В· Р Р†Р ВµР Т‘РЎС“РЎвЂ°Р ВµР С–Р С• Р Р…РЎС“Р В»РЎРЏ
            case 'F' : DateInFormat += Lang.NameMonths[Time.getUTCMonth()]; break; // Р СџР С•Р В»Р Р…Р С•Р Вµ Р Р…Р В°Р С‘Р С�Р ВµР Р…Р С•Р Р†Р В°Р Р…Р С‘Р Вµ Р С�Р ВµРЎРѓРЎРЏРЎвЂ Р В°
            case 'M' : DateInFormat += Lang.NameMonthsMin[Time.getUTCMonth()]; break; // Р РЋР С•Р С”РЎР‚Р В°РЎвЂ°Р ВµР Р…Р Р…Р С•Р Вµ Р Р…Р В°Р С‘Р С�Р ВµР Р…Р С•Р Р†Р В°Р Р…Р С‘Р Вµ Р С�Р ВµРЎРѓРЎРЏРЎвЂ Р В°
            // Р вЂќР Р…Р С‘
            case 'd' : DateInFormat += ZeroPlus(Time.getUTCDate()); break;// Р вЂќР ВµР Р…РЎРЉ Р С�Р ВµРЎРѓРЎРЏРЎвЂ Р В°
            case 'j' : DateInFormat += Time.getUTCDate(); break; // Р вЂќР ВµР Р…РЎРЉ Р С�Р ВµРЎРѓРЎРЏРЎвЂ Р В° Р В±Р ВµР В· Р Р†.Р Р….
            // Р вЂќР Р…Р С‘ Р Р…Р ВµР Т‘Р ВµР В»Р С‘
            case 'N' : DateInFormat += Time.getUTCDay() + 1; break; // Р СџР С•РЎР‚РЎРЏР Т‘Р С”Р С•Р Р†РЎвЂ№Р в„– Р Р…Р С•Р С�Р ВµРЎР‚ Р Т‘Р Р…РЎРЏ Р Р…Р ВµР Т‘Р ВµР В»Р С‘
            case 'D' : DateInFormat += Lang.NameWeekdaysMin[Time.getUTCDay()]; break; // Р СћР ВµР С”РЎРѓРЎвЂљР С•Р Р†Р С•Р Вµ, РЎРѓР С•Р С”РЎР‚Р В°РЎвЂ°Р ВµР Р…Р Р…Р С•Р Вµ, Р С—РЎР‚Р ВµР Т‘РЎРѓРЎвЂљР В°Р Р†Р В»Р ВµР Р…Р С‘Р Вµ Р Т‘Р Р…РЎРЏ Р Р…Р ВµР Т‘Р ВµР В»Р С‘
            case 'L' : DateInFormat += Lang.NameWeekdays[Time.getUTCDay()]; break; // Р СџР С•Р В»Р Р…Р С•Р Вµ Р Р…Р В°Р С‘Р С�Р ВµР Р…Р С•Р Р†Р В°Р Р…Р С‘Р Вµ Р Т‘Р Р…РЎРЏ Р Р…Р ВµР Т‘Р ВµР В»Р С‘
            // Р СљР С‘Р Р…РЎС“РЎвЂљРЎвЂ№
            case 'i' : DateInFormat += ZeroPlus(Time.getUTCMinutes()); break; // РЎРѓ Р Р†Р ВµР Т‘РЎС“РЎвЂ°Р С‘Р С� Р Р…РЎС“Р В»РЎвЂ�Р С�
            // Р РЋР ВµР С”РЎС“Р Р…Р Т‘РЎвЂ№
            case 's' : DateInFormat += ZeroPlus(Time.getUTCSeconds()); break; // РЎРѓ Р Р†Р ВµР Т‘РЎС“РЎвЂ°Р С‘Р С� Р Р…РЎС“Р В»РЎвЂ�Р С�
            
            default : DateInFormat += format[i]; break;
        }
    }
    
    return DateInFormat;
}

// Р вЂ™РЎвЂ№Р Р†Р С•Р Т‘Р С‘РЎвЂљ Р С•РЎвЂљР Р…Р С•РЎРѓР С‘РЎвЂљР ВµР В»РЎРЉР Р…Р С•Р Вµ Р Р†РЎР‚Р ВµР С�РЎРЏ. Р С’ РЎвЂљР В°Р С” Р В¶Р Вµ Р ВµРЎРѓР В»Р С‘ check = true РЎвЂљР С• Р С—РЎР‚Р С•РЎРѓРЎвЂљР С• Р Т‘Р ВµР В»Р В°Р ВµРЎвЂљ Р С—РЎР‚Р С•Р Р†Р ВµРЎР‚Р С”РЎС“, Р С•РЎвЂљР Р…Р С•РЎРѓР С‘РЎвЂљР ВµР В»РЎРЉР Р…РЎС“РЎР‹ Р В»Р С‘ Р Т‘Р В°РЎвЂљРЎС“ Р Р†РЎвЂ№Р Р†Р С•Р Т‘Р С‘РЎвЂљРЎРЉ
function OffsetDate(Time, Now, check) {
    
    if (check) {
        if (((new Date(Now - Time)) < (new Date(1970, 1))) || Time > Now)
            return true;
        else
            return false;
    }

    if (Time > Now)
        var OffsetTime = new Date(Time - Now);
    else
        var OffsetTime = new Date(Now - Time);
    
    var s = OffsetTime.getUTCSeconds(), // Р РЋР ВµР С”РЎС“Р Р…Р Т‘РЎвЂ№
         i = OffsetTime.getUTCMinutes(), // Р СљР С‘Р Р…РЎС“РЎвЂљРЎвЂ№
         G = OffsetTime.getUTCHours(), // Р В§Р В°РЎРѓРЎвЂ№
         j = OffsetTime.getUTCDate()-1, // Р вЂќР Р…Р С‘
         n = OffsetTime.getUTCMonth(), // Р СљР ВµРЎРѓРЎРЏРЎвЂ 
         output = '';
    
    // Р вЂўРЎРѓР В»Р С‘ Р Р†РЎР‚Р ВµР С�РЎРЏ Р С—Р С•РЎв‚¬Р В»Р С• Р Р…Р В° Р С�Р ВµРЎРѓРЎРЏРЎвЂ РЎвЂ№ РЎвЂљР С• Р Р†РЎвЂ№Р Р†Р С•Р Т‘Р С‘Р С� РЎвЂљР С•Р В»РЎРЉР С”Р С• Р С�Р ВµРЎРѓРЎРЏРЎвЂ РЎвЂ№ Р С‘ Р Т‘Р Р…Р С‘(Р ВµРЎРѓР В»Р С‘ Р Р…Р Вµ Р Р…Р С•Р В»РЎРЉ)
    if (n) {
        output += NiceDate(n, 'n') + ' ';
        if (j) output += NiceDate(j, 'j') + ' ';
    // Р вЂўРЎРѓР В»Р С‘ Р Р†РЎР‚Р ВµР С�РЎРЏ Р С—Р С•РЎв‚¬Р В»Р С• Р Р…Р В° Р Т‘Р Р…Р С‘ РЎвЂљР С• Р Р†РЎвЂ№Р Р†Р С•Р Т‘Р С‘Р С� РЎвЂљР С•Р В»РЎРЉР С”Р С• Р Т‘Р Р…Р С‘
    } else if (j) {
        output += NiceDate(j, 'j') + ' ';
    // Р вЂўРЎРѓР В»Р С‘ Р Р†РЎР‚Р ВµР С�РЎРЏ Р С—Р С•РЎв‚¬Р В»Р С• Р Р…Р В° РЎвЂЎР В°РЎРѓРЎвЂ№ РЎвЂљР С• Р Р†РЎвЂ№Р Р†Р С•Р Т‘Р С‘Р С� РЎвЂљР С•Р В»РЎРЉР С”Р С• РЎвЂЎР В°РЎРѓРЎвЂ№ Р С‘ Р С�Р С‘Р Р…РЎС“РЎвЂљРЎвЂ№(Р ВµРЎРѓР В»Р С‘ Р Р…Р Вµ Р Р…Р С•Р В»РЎРЉ)
    } else if (G) {
        output += NiceDate(G, 'G') + ' ';
    // Р вЂўРЎРѓР В»Р С‘ Р Р†РЎР‚Р ВµР С�РЎРЏ Р С—Р С•РЎв‚¬Р В»Р С• Р Р…Р В° Р С�Р С‘Р Р…РЎС“РЎвЂљРЎвЂ№ РЎвЂљР С• Р Р†РЎвЂ№Р Р†Р С•Р Т‘Р С‘Р С� РЎвЂљР С•Р В»РЎРЉР С”Р С• Р С�Р С‘Р Р…РЎС“РЎвЂљРЎвЂ№ Р С‘ РЎРѓР ВµР С”РЎС“Р Р…Р Т‘РЎвЂ№(Р ВµРЎРѓР В»Р С‘ Р Р…Р Вµ Р Р…Р С•Р В»РЎРЉ)
    } else if (i) {
        output += NiceDate(i, 'i') + ' ';
    // Р вЂўРЎРѓР В»Р С‘ Р Р†РЎР‚Р ВµР С�Р ВµР Р…Р С‘ Р С—РЎР‚Р С•РЎв‚¬Р В»Р С• Р С�Р ВµР Р…Р ВµР Вµ Р С�Р С‘Р Р…РЎС“РЎвЂљРЎвЂ№ РЎвЂљР С• Р Р†РЎвЂ№Р Р†Р С•Р Т‘Р С‘Р С� РЎРѓР ВµР С”РЎС“Р Р…Р Т‘РЎвЂ№
    } else {
        output += Lang.Now;
        return output;
    }

    if (Time > Now)
        return Lang.After + '  ' + output;
    else
        return output + '  ' + Lang.Ago;

}

// Р вЂ™РЎвЂ№Р Р†Р С•Р Т‘Р С‘РЎвЂљ Р Т‘Р В°РЎвЂљРЎС“ Р Р† Р Р…РЎС“Р В¶Р Р…Р С•Р С� РЎвЂћР С•РЎР‚Р С�Р В°РЎвЂљР Вµ
function FormatTime(el) {
    
    var format = el.data('type'),
        stime = Date.parse(el.attr('datetime')),
        Now = new Date(), // Р С›Р В±РЎР‰Р ВµР С”РЎвЂљ РЎвЂљР ВµР С”РЎС“РЎвЂ°Р ВµР в„– Р Т‘Р В°РЎвЂљРЎвЂ№
        Time = new Date(stime), // Р С›Р В±РЎРЉР ВµР С”РЎвЂљ РЎС“Р С”Р В°Р В·Р В°Р Р…Р Р…Р С•Р С–Р С• Р Р†РЎР‚Р ВµР С�Р ВµР Р…Р С‘
        f = OffsetDate(Time, Now, true); // Р СџРЎР‚Р С•Р Р†Р ВµРЎР‚Р С”Р В° Р Р…Р В° РЎвЂљР С‘Р С— Р Р†РЎвЂ№Р Р†Р С•Р Т‘Р С‘Р С�Р С•Р С–Р С• Р Р†РЎР‚Р ВµР С�Р ВµР Р…Р С‘(Р С•РЎвЂљР Р…Р С•РЎРѓР С‘РЎвЂљР ВµР В»РЎРЉР Р…РЎвЂ№Р в„– Р С‘Р В»Р С‘ Р Т‘Р В°РЎвЂљР В°)
        
    // Р вЂ™РЎвЂ№Р Р†Р С•Р Т‘Р С‘Р С� Р С•РЎвЂљР Р…Р С•РЎРѓР С‘РЎвЂљР ВµР В»РЎРЉР Р…Р С•Р Вµ Р Р†РЎР‚Р ВµР С�РЎРЏ
    if (f)
        el.html(OffsetDate(Time, Now, false));
    else {
        // Р вЂ”Р Т‘Р ВµРЎРѓРЎРЉ Р С—РЎР‚Р С•РЎРѓРЎвЂљР С• Р Р†РЎвЂ№Р Р†Р С•Р Т‘Р С‘Р С� Р Р† Р Р…РЎС“Р В¶Р Р…Р С•Р С� РЎвЂћР С•РЎР‚Р С�Р В°РЎвЂљР Вµ...
        // Р вЂўРЎРѓР В»Р С‘ РЎРЊРЎвЂљРЎС“ Р Т‘Р В°РЎвЂљРЎС“(Р Р…Р Вµ Р С•РЎвЂљР Р…Р С•РЎРѓР С‘РЎвЂљР ВµР В»РЎРЉР Р…РЎС“РЎР‹) Р С�РЎвЂ№ РЎС“Р В¶Р Вµ Р С•Р В±РЎР‚Р В°Р В±Р С•РЎвЂљР В°Р В»Р С‘, РЎвЂљР С• Р Р…Р Вµ РЎвЂљРЎР‚Р С•Р С–Р В°Р ВµР С� Р ВµРЎвЂ�.
        if (!el.data('compiled')) {
            el.html(ParseDateFormat(format, Time));
            el.attr('data-compiled', 'true');
        }
    }
}

// Р пїЅРЎвЂ°Р ВµР С� Р Т‘Р В°РЎвЂљРЎвЂ№ Р Р…Р В° РЎРѓРЎвЂљРЎР‚Р В°Р Р…Р С‘РЎвЂ Р Вµ Р С‘ Р С‘Р В·Р С�Р ВµР Р…РЎРЏР ВµР С� Р С‘РЎвЂ¦ Р С—Р С•Р Т‘ Р С”Р В»Р С‘Р ВµР Р…РЎвЂљР В°
function UpdateTime() {
    var BlockTime = $('time');
    $.each(BlockTime, function () {
        if ($(this).attr('data-type'))
            FormatTime($(this));
    });
}

// Р СџР ВµРЎР‚Р Р†Р С•Р Р…Р В°РЎвЂЎР В°Р В»РЎРЉР Р…Р В°РЎРЏ Р С•Р В±РЎР‚Р В°Р В±Р С•РЎвЂљР С”Р В° Р Р†РЎР‚Р ВµР С�Р ВµР Р…Р С‘.
$(function() {UpdateTime();});
// Р вЂќР С‘Р Р…Р В°Р С�Р С‘РЎвЂЎР ВµРЎРѓР С”Р С•Р Вµ Р С•Р В±Р Р…Р С•Р Р†Р В»Р ВµР Р…Р С‘Р Вµ Р Т‘Р В°РЎвЂљ.
setInterval(UpdateTime, 10000);

//Р Т‘Р С•Р В±Р В°Р Р†Р В»Р ВµР Р…Р С‘Р Вµ РЎР‚Р В°Р В·Р С�Р ВµРЎР‚Р В° Р РЃРЎР‚Р С‘РЎвЂћРЎвЂљР В°
function insertfortext(teg,val,field){
        try { var    msgfield = document.getElementById((field=='')?'content':field);
        } catch (err) {
            return false;
        }    
        var open ='['+teg+'="'+val+'"]';
        var close='[/'+teg+']';
    // IE support
    if (document.selection && document.selection.createRange){
        msgfield.focus();
        sel = document.selection.createRange();
        sel.text = open + sel.text + close;
        msgfield.focus();
    }
    // Moz support
    else if (msgfield.selectionStart || msgfield.selectionStart == "0"){
        var startPos = msgfield.selectionStart;
        var endPos = msgfield.selectionEnd;
        msgfield.value = msgfield.value.substring(0, startPos) + open + msgfield.value.substring(startPos, endPos) + close + msgfield.value.substring(endPos, msgfield.value.length);
        msgfield.selectionStart = msgfield.selectionEnd = endPos + open.length + close.length;
        msgfield.focus();
    }
    // Fallback support for other browsers
    else {
        msgfield.value += open + close;
        msgfield.focus();
    }
    return true;
}
