/*=============== CHANGE BACKGROUND HEADER ===============*/
function scrollHeader() {
    const header = document.getElementById('header');
    //When the scroll is greater than 50 viewport height,
    if (this.scrollY >= 50) header.classList.add('scroll-header');
  }
  window.addEventListener('scroll',scrollHeader);
  

  
  
  /*=============== SCROLL SECTIONS ACTIVE LINK ===============*/
  const sections = document.querySelectorAll('section[id]');
  
  function scrollActive() {
    const scrollY = window.pageYOffset
  
    sections.forEach(current => {
      const sectionHeight = current.offsetHeight,
        sectionTop = current.offsetTop - 58,
        sectionId = current.getAttribute('id')
  
      if (scrollY > sectionTop && scrollY <= sectionTop + sectionHeight) {
        document.querySelector('.nav__menu a[href*=' + sectionId + ']').classList.add('active-link')
      } else {
        document.querySelector('.nav__menu a[href*=' + sectionId + ']').classList.remove('active-link')
  
      }
    })
  }
  
  window.addEventListener('scroll', scrollActive);
  
  /*=============== SHOW SCROLL UP ===============*/ 
  function scrollUp(){
    const scrollUp = document.getElementById('scroll-up');
    if(this.scrollY  >= 350) scrollUp.classList.add('show-scroll');
  }
  window.addEventListener('scroll', scrollUp);
  
  
  /*=============== DARK LIGHT THEME ===============*/ 
  const themeButton= document.getElementById('theme-button')
  const darkTheme = 'dark-theme'
  const iconTheme ='bx-sun'
  
  //Previously selected topic (if user selected)
  const selectedTheme = localStorage.getItem('selected-theme')
  const selectedIcon = localStorage.getItem('selected-icon')
  
  //We obtain the current theme that the interface has by validating the dark-theme class
  const getCurrentTheme = () => document.body.classList.contains(darkTheme) ? 'dark' : 'light'
  const getCurrentIcon = () => themeButton.classList.contains(iconTheme) ? 'bx bx-moon' : 'bx bx-sun'
  
  //We validate if the user previously chose a topic
  if(selectedTheme){
    //If we validate is fulfilled, we ask what the issue was to know if we activated or desactivated the dark
    document.body.classList[selectedTheme === 'dark'? 'add' : 'remove'](darkTheme)
    themeButton.classList[selectedIcon === 'bx bx-moon' ? 'add' : 'remove'](iconTheme)
  }
  
  //Activate / desactivate the theme manually with the button
  themeButton.addEventListener('click', () =>{
  
    //Add  or remove the dark / icon theme
    document.body.classList.toggle(darkTheme)
    themeButton.classList.toggle(iconTheme)
  
    //We save the theme and the current icon that the user chose
    localStorage.setItem('selected-theme', getCurrentTheme())
    localStorage.setItem('selected-icon', getCurrentIcon())
  })
  

  
  