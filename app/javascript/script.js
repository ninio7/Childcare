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
// $(document).on('turbolinks:load', function() {
//   $(function() {
//     // .tabがクリックされたときを指定
//     $('.tab').click(function(){
//       // 今ある.tab-activeを削除
//       $('.tab-active').removeClass('tab-active');
//       // クリックされた.tabに.tab-activeを追加
//       $(this).addClass('tab-active');
//       // 今ある.box-showを削除
//       $('.box-show').removeClass('box-show');
//       // indexに.tabのindex番号を代入
//       const index = $(this).index();
//       // .tabboxとindexの番号が同じ要素に.box-showを追加
//       $('.tabbox').eq(index).addClass('box-show');
//     // });
//   });
// });

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