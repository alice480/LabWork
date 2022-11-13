function BuildingTree(elem) {
    var ul = document.createElement('ul');
    var node_child = elem.firstElementChild;
    while (node_child) {
        var li = document.createElement('li');
        li.innerHTML = node_child.tagName;
        console.log('Тег:', node_child.tagName);
        li.style.fontFamily = "monospace"
        li.style.color = "purple";
        var list = BuildingTree(node_child);
        li.appendChild(list);
        ul.appendChild(li);
        node_child = node_child.nextElementSibling;
    }
    document.getElementById('tree_output').appendChild(ul);
    return ul;
}

BuildingTree(document.documentElement);
