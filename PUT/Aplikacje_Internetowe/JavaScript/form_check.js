function isEmpty(data){
    return data.length === 0
}

function validate(form){
    var imie = form.elements["f_imie"].value;
    
    if(isEmpty(imie)){
        alert("Podaj imie!")
        return false
    }
    
    return true
}