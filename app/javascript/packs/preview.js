const { $ } = require("@rails/ujs");

if (document.URL.match( /new/) || document.URL.match( /edit/ )) {
 document.addEventListener('DOMContentLoaded', function(){
		const ItemImage = document.getElementById('image-list');

		    // 選択した画像を表示する関数
    const createImageHTML = (blob) => {
       // 画像を表示するためのdiv要素を生成
			const imageElement = document.createElement('div')
			let imageElementNum = document.querySelectorAll('image-element').length

      // 表示する画像を生成
			const blobImage = document.createElement('img')
			blobImage.setAttribute('class', "item-element")
			blobImage.setAttribute('src', blob)
			
			// ファイル選択ボタンを生成
			const inputHTML = document.createElement('input')
			inputHTML.setAttribute('id', `item-image_${imageElementNum}`)
			inputHTML.setAttribute('name', 'item[images][]')
			inputHTML.setAttribute('type', 'file')

      // 生成したHTMLの要素をブラウザに表示させる
			imageElement.appendChild(blobImage)
			imageElement.appendChild(inputHTML)
			ItemImage.appendChild(imageElement)
			
			inputHTML.addEventListener('change', (e) => {
				file = e.target.files[0];
				blob = window.URL.createObjectURL(file);

				createImageHTML(blob)
			})
    }
		
	 document.getElementById('item-image').addEventListener('change', function(e){
		// const imageContent = document.querySelector('img');
		// if (imageContent){
		// 	imageContent.remove();
		// }
		let file = e.target.files[0]
		let blob = window.URL.createObjectURL(file);
		createImageHTML(blob)

	// 	document.readyState(function(){
	// 		$('.bxslider').bxSlider({
	// 			auto: true,
	// 			speed: 1000,
	// 			moveSlides: 1,
	// 			maxSliders: 3,
	// 			slideWidth: 250,
	// 			randomStart: true,
	// 			autoHover: true
	// 		})
	// 	});
	 });
 });
}
