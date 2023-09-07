(function() {

  'use strict'

  const observer = new MutationObserver(mutations => {
    if (document.querySelector('div#app header nav a span img')) {
      const image = document.querySelector('div#app header nav a span img');
      image.src='/yunohost/admin/logo.png';
    }
  });
  
  observer.observe(document.body, {
    childList: true,
    subtree: true
  });

})();
