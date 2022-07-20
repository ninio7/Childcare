(function() {
  'use strict';
  window.addEventListener('turbolinks:load', function() {
    // カスタムブートストラップ検証スタイルを適用するすべてのフォームを取得
    var forms = document.getElementsByClassName('needs-validation');
    // ループして帰順を防ぐ
    var validation = Array.prototype.filter.call(forms, function(form) {
      form.addEventListener('submit', function(event) {
        if (form.checkValidity() === false) {
          event.preventDefault();
          event.stopPropagation();
        }
        form.classList.add('was-validated');
      }, false);
    });
  }, false);
 })();


/*global $*/
$(document).on('turbolinks:load', function() {
  $(function() {
  $('#js-copybtn').on('click', function(){
    //　テキストエリアを選択
    $('#js-copytext').select();
    // コピー
    document.execCommand('copy');
    // アラート文の表示
    $('#js-copyalert').show().delay(2000).fadeOut(400);
  });
　});
});



