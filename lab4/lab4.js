var table = document.getElementsByClassName('table')[0]
table.onmouseover = cell_coloring;
table.onmouseout = remove_coloring;
table.onmousedown = add_goods_to_cart;
var summa = 0

function checking(element) {
    return (element.tagName != 'BODY' && element.tagName != 'HTML' &&
        element.innerText != 'Наименование' && element.innerText != 'Цена')
}

function cell_coloring(event) {
    if (checking(event.target)) {
        event.target.style.backgroundColor = "red"
    }
    if (checking(event.relatedTarget)) {
        event.relatedTarget.style.backgroundColor = "#c4bbbb"
    }
}

function remove_coloring(event) {
    if (event.relatedTarget.tagName != 'DIV' && 
        event.target.innerText != 'Наименование' && event.target.innerText != 'Цена') {
        event.target.style.backgroundColor = "#c4bbbb"
    }
}

function find_all_string(element){
    tds = document.getElementsByClassName('td')
    i = 0
    while (tds[i] != element && i < tds.length - 1) { i += 1 }
    if (i > 1) {
        if (i % 2)
            return [tds[i - 1].innerText, tds[i].innerText]
        else
            return [tds[i].innerText, tds[i + 1].innerText]
    }
    return 0
}

function add_goods_to_cart(event) {
    text = find_all_string(event.target)
    if (text) {
        var tr = document.createElement('div')
        tr.className = "tr"
        var td1 = document.createElement('div')
        td1.className = "td"
        var td2 = document.createElement('div')
        td2.className = "td"
        td1.innerText = text[0]
        td2.innerText = text[1]
        tr.appendChild(td1)
        tr.appendChild(td2)
        var div = document.getElementsByClassName('table')[2]
        div.appendChild(tr)
    }
}

function ButtonAddPressed() {
    var tr = document.createElement('div')
    tr.className = "tr"
    var td1 = document.createElement('div')
    td1.className = "td"
    var td2 = document.createElement('div')
    td2.className = "td"
    td1.innerText = document.getElementsByClassName('input')[0].value
    td2.innerText = document.getElementsByClassName('input')[1].value
    tr.appendChild(td1)
    tr.appendChild(td2)
    var div = document.getElementsByClassName('table')[0]
    div.appendChild(tr)
}

function ButtonCalculatingPressed() {
    var table = document.getElementsByClassName('table')[2]
    children = table.childNodes
    for (var i = 0; i < children.length; i += 1) {
        for (var j = 0; j < children[i].childNodes.length; j++) {
            if (children[i].childNodes[j].innerText && !(isNaN(children[i].childNodes[j].innerText)))
                summa += Number(children[i].childNodes[j].innerText)
        }
    }
    var div = document.getElementById('total')
    div.innerText += summa
}

