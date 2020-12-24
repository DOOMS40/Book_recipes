// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

  function funcBefore () {
    $("#information").text ("Страница загружаеться");
  }
  function funcSuccess (data) {
    $("#information").text (data);
  }
  $(document).ready ( function() {
    $("#load").bind("click", function() {
      var admin = "Admin";
      $.ajax ({
        url: "books_path",
        type: "POST",
        data: ({ name: admin,number: 5 }),
        dataType: "html",
        beforeSend: funcBefore,
        success: funcSuccess
      });
    });
      $("#done").bind("click", function () {
        $.ajax ({
          url: "login.html",
          type: "POST",
          data: ({name: $("#name").val()}),
          dataType: "html",
          beforeSend: function() {
            $("#information").text("Страница загружаеться");
          },
          success: function (data) {
            if(data == "fail")
              alert("Имя занято");
            else
              $("#information").text (data);
          }
        });
    });
  });
