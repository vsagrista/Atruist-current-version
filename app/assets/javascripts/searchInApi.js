var Search = function(city,talent){
    this.city = city;
    this.talent = talent;
}
var newSeach = new Search('','');

function capitalizeFirstLetter(string) {
    return string.charAt(0).toUpperCase() + string.slice(1);
}


function createArrayWithTalentsInCity(response){
    $('#datas').empty();
    $('#all-skills').empty();
    var talentsFound = [];
    for(var i = 0; i < response.length; i++){
        if(talentsFound.indexOf(response[i].name) == -1){
            var obj = {};
            obj[i.toString()] = capitalizeFirstLetter(response[i].name);
            talentsFound.push(response[i].name);
        }
    }
    populateSelectOptionsAndTags(talentsFound.sort());
}

function processResponse(response,option){
    if(option == 1){
        createArrayWithTalentsInCity(response);
    }
    else {
        populateTopSkillForTag(response);
    }
}

function populateSelectOptionsAndTags(selected){
    $('#datas').append('<option disabled selected> -- select an option -- </option>');
    for (var i=0;i<selected.length;i++){
       $('<option/>').val(selected[i]).html(selected[i]).appendTo('#datas');
       $('<p/>').val(selected[i]).html(selected[i]).appendTo('#all-skills');
    }
}

function populateTopSkillForTag(response){
    $('.top-rated-p').remove();
    for (var i=0;i<response.length;i++){
        if (response[i][0]['user_id'] != currentUserId){
            $("<p class='top-rated-p'>User: " +
                response[i][0]['user_name'] +
                " talent: " +
                response[i][0].found['name']+
                " rating: " +
                response[i][0].found['rating'] +
                "</p>" +
                "<a class='top-rated-p' href='/users/"+
                response[i][0]['user_id'] +
                "/talents/" +
                response[i][0].found['id'] +
                "'>Contact</a>").appendTo('#top-rated-skills');
        }
    }
    if(!$('.top-rated-p').length){
        $("<p class='top-rated-p'>You are the only one with that talent in the city!!!</p>").appendTo('#top-rated-skills');
    }
}

function ajaxCall(url,option){
    $.ajax({url: url,
    success:
    function (data) {
        processResponse(data, option)}
    });
}

$(document).ready(function(){
    $('#tags').autocomplete({
      source: cities,
      select: function(event, ui) {
            if (ui.item) {
                $('.top-rated-p').remove();
                newSeach.city = '';
                newSeach.city = ui.item.value;
                $('#tags').val(newSeach.city);
                $('#skill-label').empty();
                $('#skill-label').append('All talents in '+ (newSeach.city));
                $('#talent-not-picked').empty();
                $('#talent-not-picked').append('Choose a talent to see how it does in '+ (newSeach.city))
                var url = "/api/v1/"+newSeach.city+"/talents";
                ajaxCall(url,1);
            }
        }
    });
})

$(document).ready(function(){
    $('select').on('change', function () {
       var talent = this.value;
       var url = "/api/v1/cities/"+newSeach.city+"/talents/"+talent;
        ajaxCall(url,2);
    });
})