function field_focus(field, uname)
{
    if(field.value === uname)
    {
        field.value = '';
    }
}

function field_blur(field, uname)
{
    if(field.value === '')
    {
        field.value = uname;
    }
}

//Fade in dashboard box
$(document).ready(function(){
    $('.container').hide().fadeIn(1000);
});

//Stop click event
$('a').click(function(event){
    event.preventDefault();
});