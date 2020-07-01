$(document).on('turbolinks:load', ()=> {
  // -----↓商品出品ページ、画像投稿フォーム↓-----
  $(function(){
    function buildHTML(count) {
      var html = `<div class="preview-box" id="preview-box__${count}">
      <div class="upper-box">
      <img src="" alt="preview">
      </div>
      <div class="lower-box">
      <div class="update-box">
      <label class="edit_btn">編集</label>
      </div>
      <div class="delete-box" id="delete_btn_${count}">
      <span>削除</span>
      </div>
      </div>
      </div>`;
      return html;
    }
    
    if (window.location.href.match(/\/items\/\d+\/edit/)){
      var prevContent = $('.label-content').prev();
      labelWidth = (620 - $(prevContent).css('width').replace(/[^0-9]/g, ''));
      $('.label-content').css('width', labelWidth);
      $('.preview-box').each(function(index, box){
        $(box).attr('id', `preview-box__${index}`);
      })
      $('.delete-box').each(function(index, box){
        $(box).attr('id', `delete_btn_${index}`);
      })
      var count = $('.preview-box').length;
      if (count == 5) {
        $('.label-content').hide();
      }
    }
    
    function setLabel() {
      var prevContent = $('.label-content').prev();
      labelWidth = (620 - $(prevContent).css('width').replace(/[^0-9]/g, ''));
      $('.label-content').css('width', labelWidth);
    }
    
    $(document).on('change', '.hidden-field', function() {
      setLabel();
      var id = $(this).attr('id').replace(/[^0-9]/g, '');
      $('.label-box').attr({id: `label-box--${id}`,for: `item_images_attributes_${id}_image`});
      var file = this.files[0];
      var reader = new FileReader();
      reader.readAsDataURL(file);
      reader.onload = function() {
        var image = this.result;
        if ($(`#preview-box__${id}`).length == 0) {
          var count = $('.preview-box').length;
          var html = buildHTML(id);
          var prevContent = $('.label-content').prev();
          $(prevContent).append(html);
        }
        $(`#preview-box__${id} img`).attr('src', `${image}`);
        var count = $('.preview-box').length;
        if (count == 5) { 
          $('.label-content').hide();
        }
        if ($(`#item_images_attributes_${id}__destroy`)){
          $(`#item_images_attributes_${id}__destroy`).prop('checked',false);
        } 
        setLabel();
        if(count < 5){
          $('.label-box').attr({id: `label-box--${count}`,for: `item_images_attributes_${count}_image`});
        }
      }
    });
    
    $(document).on('click', '.delete-box', function() {
      var count = $('.preview-box').length;
      setLabel(count);
      var id = $(this).attr('id').replace(/[^0-9]/g, '');
      $(`#preview-box__${id}`).remove();
      if ($(`#item_images_attributes_${id}__destroy`).length == 0) {
        $(`#item_images_attributes_${id}_image`).val("");
        var count = $('.preview-box').length;
        if (count == 4) {
          $('.label-content').show();
        }
        setLabel(count);
        if(id < 5){
          $('.label-box').attr({id: `label-box--${id}`,for: `item_images_attributes_${id}_image`});
        }
      } else {
        $(`#item_images_attributes_${id}__destroy`).prop('checked',true);
        if (count == 4) {
          $('.label-content').show();
        }
        setLabel();
        if(id < 5){
          $('.label-box').attr({id: `label-box--${id}`,for: `item_images_attributes_${id}_image`});
        }
      }
    });
  });
  // -----↑商品出品ページ、画像投稿フォーム↑-----
  
  
  // -----↓フォーム未入力のアラート↓-----
  // 画像
  $(function() {
    $('#image-alert').on('blur', function() {
      let image = $(this).val();
      if(image == 0){
        $('#image-alert').css('border-color','red');
        $('.no-item-image').text('画像がありません');
      }else {
        $('#image-alert').css('border-color', '');
        $('.no-item-image').text('');
      };
    });
    $('#image-alert').on('change', function() {
      let image = $(this).val();
      if(image == 0){
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
  // -----↓フォーム未入力のアラート↑-----