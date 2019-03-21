// イベントリスナーでDOMがロードされたあとに実行する
addEventListener('DOMContentLoaded', function() {
  // ナビゲーションのエレメントを取得
  var gnav = document.getElementById("gnav");

  var path = location.pathname;

  // gnavは実はイテレータではないのでそのままではforEach使えない
  // Array.from()で配列にしてから繰り返す
  Array.from(gnav.children).forEach(function(tag) {
    if (tag.getAttribute("href") === path) {
      tag.classList.add("current");
    }
  });
});