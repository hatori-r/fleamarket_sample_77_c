$(document).on('turbolinks:load', ()=> {
  // 画像用のinputを生成する関数
  const buildFileField = (num)=> {
    const html = `<div data-index="${num}" class="js-file_group">
                    <input class="js-file" type="file"
                    name="item[images_attributes][${num}][image]"
                    id="item_images_attributes_${num}_image"><br>
                    <div class="js-remove">削除</div>
                  </div>`;
    return html;
  }
  // プレビュー用のimgタグを生成する関数
  const buildImg = (index, url)=> {
    const html = `<img data-index="${index}" src="${url}" width="100px" height="100px">`;
    return html;
  }

  // file_fieldのnameに動的なindexをつける為の配列
  let fileIndex = [1,2,3,4,5,6,7,8,9,10];
  // 既に使われているindexを除外
  lastIndex = $('.js-file_group:last').data('index');
  fileIndex.splice(0, lastIndex);

  $('.hidden-destroy').hide();

  $('#image-box').on('change', '.js-file', function(e) {
    const targetIndex = $(this).parent().data('index');
    // ファイルのブラウザ上でのURLを取得する
    const file = e.target.files[0];
    const blobUrl = window.URL.createObjectURL(file);

    // 該当indexを持つimgがあれば取得して変数imgに入れる(画像変更の処理)
    if (img = $(`img[data-index="${targetIndex}"]`)[0]) {
      img.setAttribute('image', blobUrl);
    } else {  // 新規画像追加の処理
      $('#previews').append(buildImg(targetIndex, blobUrl));
      // fileIndexの先頭の数字を使ってinputを作る
      $('#image-box').append(buildFileField(fileIndex[0]));
      fileIndex.shift();
      // 末尾の数に1足した数を追加する
      fileIndex.push(fileIndex[fileIndex.length - 1] + 1);
    }
  });

  $('#image-box').on('click', '.js-remove', function() {
    const targetIndex = $(this).parent().data('index');
    // 該当indexを振られているチェックボックスを取得する
    const hiddenCheck = $(`input[data-index="${targetIndex}"].hidden-destroy`);
    // もしチェックボックスが存在すればチェックを入れる
    if (hiddenCheck) hiddenCheck.prop('checked', true);
    
    $(this).parent().remove();
    $(`img[data-index="${targetIndex}"]`).remove();
    
    // 画像入力欄が0個にならないようにしておく
    if ($('.js-file').length == 0) $('#image-box').append(buildFileField(fileIndex[0]));
  });



  // -----↓フォーム未入力のアラート↓-----
  // 画像
  $(function() {
    $('#image-alert').on('blur', function() {
      console.log("hello")
      let name = $(this).val();
      if(name == 0){
        $('#image-alert').css('border-color','red');
        $('.no-item-image').text('画像がありません');
      }else {
        $('#image-alert').css('border-color', '');
        $('.no-item-image').text('');
      };
    });
    $('#image-alert').on('change', function() {
      console.log("change")
      let name = $(this).val();
      if(name == 0){
        $('#image-alert').css('border-color', 'red');
        $('.no-item-image').text('画像がありません');
      }else {
        $('#image-alert').css('border-color', '');
        $('.no-item-image').text('');
      };
    });
  });

  // 商品名
  $(function() {
    $('#name-alert').on('blur', function() {
      let name = $(this).val();
      if(name == 0){
        $('#name-alert').css('border-color','red');
        $('.no-item-name').text('入力してください');
      }else {
        $('#name-alert').css('border-color', '');
        $('.no-item-name').text('');
      };
    });
    $('#name-alert').on('change', function() {
      let name = $(this).val();
      if(name == 0){
        $('#name-alert').css('border-color', 'red');
        $('.no-item-name').text('入力してください');
      }else {
        $('#name-alert').css('border-color', '');
        $('.no-item-name').text('');
      };
    });
  });

  // 商品の説明
    $('#introduce-alert').on('blur', function() {
      let introduce = $(this).val();
      if(introduce == 0){
        $('#introduce-alert').css('border-color','red');
        $('.no-item-explanation').text('入力してください');
      }else {
        $('#introduce-alert').css('border-color', '');
        $('.no-item-explanation').text('');
      };
    });
    $('#introduce-alert').on('change', function() {
      let introduce = $(this).val();
      if(introduce == 0){
        $('#introduce-alert').css('border-color', 'red');
        $('.no-item-explanation').text('入力してください');
      }else {
        $('#introduce-alert').css('border-color', '');
        $('.no-item-explanation').text('');
      };
    });

    // カテゴリー
    $('#category-alert').on('blur', function() {
      let category = $(this).val();
      if(category == 0){
        $('#category-alert').css('border-color','red');
        $('.no-item-category').text('選択してください');
      }else {
        $('#category-alert').css('border-color', '');
        $('.no-item-category').text('');
      };
    });
    $('#category-alert').on('change', function() {
      let category = $(this).val();
      if(category == 0){
        $('#category-alert').css('border-color', 'red');
        $('.no-item-category').text('選択してください');
      }else {
        $('#category-alert').css('border-color', '');
        $('.no-item-category').text('');
      };
    });

    // 商品の状態
    $('#status-alert').on('blur', function() {
      let status = $(this).val();
      if(status == 0){
        $('#status-alert').css('border-color','red');
        $('.no-item-status').text('選択してください');
      }else {
        $('#status-alert').css('border-color', '');
        $('.no-item-status').text('');
      };
    });
    $('#status-alert').on('change', function() {
      let status = $(this).val();
      if(status == 0){
        $('#status-alert').css('border-color', 'red');
        $('.no-item-status').text('選択してください');
      }else {
        $('#status-alert').css('border-color', '');
        $('.no-item-status').text('');
      };
    });

    // 送料負担
    $('#fee-alert').on('blur', function() {
      let fee = $(this).val();
      if(fee == 0){
        $('#fee-alert').css('border-color','red');
        $('.no-item-fee').text('選択してください');
      }else {
        $('#fee-alert').css('border-color', '');
        $('.no-item-fee').text('');
      };
    });
    $('#fee-alert').on('change', function() {
      let fee = $(this).val();
      if(fee == 0){
        $('#fee-alert').css('border-color', 'red');
        $('.no-item-fee').text('選択してください');
      }else {
        $('#fee-alert').css('border-color', '');
        $('.no-item-fee').text('');
      };
    });

    // 発送元
    $('#area-alert').on('blur', function() {
      let area = $(this).val();
      if(area == 0){
        $('#area-alert').css('border-color','red');
        $('.no-item-area').text('選択してください');
      }else {
        $('#area-alert').css('border-color', '');
        $('.no-item-area').text('');
      };
    });
    $('#area-alert').on('change', function() {
      let area = $(this).val();
      if(area == 0){
        $('#area-alert').css('border-color', 'red');
        $('.no-item-area').text('選択してください');
      }else {
        $('#area-alert').css('border-color', '');
        $('.no-item-area').text('');
      };
    });

    // 発送までの日にち
    $('#day-alert').on('blur', function() {
      let day = $(this).val();
      if(day == 0){
        $('#day-alert').css('border-color','red');
        $('.no-item-day').text('選択してください');
      }else {
        $('#day-alert').css('border-color', '');
        $('.no-item-day').text('');
      };
    });
    $('#day-alert').on('change', function() {
      let day = $(this).val();
      if(day == 0){
        $('#day-alert').css('border-color', 'red');
        $('.no-item-day').text('選択してください');
      }else {
        $('#day-alert').css('border-color', '');
        $('.no-item-day').text('');
      };
    });
    
    // 価格
  $('#price-alert').on('blur', function() {
    let price = $(this).val();
    if(price == 0){
      $('#price-alert').css('border-color','red');
      $('.no-item-price').text('入力してください');
    }else {
      $('#price-alert').css('border-color', '');
      $('.no-item-price').text('');
    };
  });
  $('#price-alert').on('change', function() {
    let price = $(this).val();
    if(price == 0){
      $('#price-alert').css('border-color', 'red');
      $('.no-item-price').text('入力してください');
    }else {
      $('#price-alert').css('border-color', '');
      $('.no-item-price').text('');
    };
  });
});