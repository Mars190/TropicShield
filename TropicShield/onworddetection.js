$(document).ready(function(){
    window.addEventListener('message', (event) => {
      if (event.data.type === 'screenshotcheck') {
        Tesseract.recognize(
          event.data.screenshoturl,
          'eng',
        ).then(({ data: { text } }) => {
            return $.post('http://TropicShield/check', JSON.stringify({text}));
        });
      }
    });
});