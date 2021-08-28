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

function downloadCSV(csv, filename) {
    var csvFile;
    var downloadLink;

    // CSV file
    csvFile = new Blob([csv], {type: "text/csv"});

    // Download link
    downloadLink = document.createElement("a");

    // File name
    downloadLink.download = filename;

    // Create a link to the file
    downloadLink.href = window.URL.createObjectURL(csvFile);
    const universalBOM = "\uFEFF"; 
    downloadLink.setAttribute('href', 'data:text/csv;charset=utf-8,' + encodeURIComponent(universalBOM + csv));

    // Hide download link
    downloadLink.style.display = "none";
    

    // Add the link to DOM
    document.body.appendChild(downloadLink);

    // Click download link
    downloadLink.click();
}

function exportTableToCSV(filename) {
    var csv = [];
    var rows = document.querySelectorAll("table tr");
    
    for (var i = 0; i < rows.length; i++) {
        var row = [], cols = rows[i].querySelectorAll("td, th");
        
        for (var j = 0; j < cols.length; j++) 
            row.push(cols[j].innerText);
        
        csv.push(row.join(","));        
    }

    // Download CSV file
    downloadCSV(csv.join("\n"), filename);
}