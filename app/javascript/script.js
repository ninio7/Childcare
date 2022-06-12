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


// function activeTab(tabid){
// /*global $*/
//   $('.nav-tabs a[href="#' + tabid + '"]').tab( 'show' );
// }
// function enableTab( tabid ){
//   $('.nav-tabs a[href="#' + tabid + '"]').attr( 'data-toggle', 'tab' );
// }
// function disableTab( tabid ){
//   $('.nav-tabs a[href="#' + tabid + '"]').removeAttr( 'data-toggle' );
// }

// function selectX(){
//   //. A を選択して A のみを有効にする
//   activeTab( 'tab-a' );
//   enableTab( 'tab-a' );
//   disableTab( 'tab-b' );
// }
// function selectY(){
//   //. B を選択して B, C のみを有効にする
//   activeTab( 'tab-b' );
//   disableTab( 'tab-a' );
//   enableTab( 'tab-b' );
// }