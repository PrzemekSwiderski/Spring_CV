/**
 * Template Name: Personal - v4.7.0
 * Template URL: https://bootstrapmade.com/personal-free-resume-bootstrap-template/
 * Author: BootstrapMade.com
 * License: https://bootstrapmade.com/license/
 */
(function () {
    "use strict";

    /**
     * Easy selector helper function
     */
    const select = (el, all = false) => {
        el = el.trim()
        if (all) {
            return [...document.querySelectorAll(el)]
        } else {
            return document.querySelector(el)
        }
    }

    /**
     * Easy event listener function
     */
    const on = (type, el, listener, all = false) => {
        let selectEl = select(el, all)

        if (selectEl) {
            if (all) {
                selectEl.forEach(e => e.addEventListener(type, listener))
            } else {
                selectEl.addEventListener(type, listener)
            }
        }
    }

    /**
     * Scrolls to an regMessage with header offset
     */
    const scrollto = (el) => {
        window.scrollTo({
            top: 0,
            behavior: 'smooth'
        })
    }

    /**
     * Mobile nav toggle
     */
    on('click', '.mobile-nav-toggle', function (e) {
        select('#navbar').classList.toggle('navbar-mobile')
        this.classList.toggle('bi-list')
        this.classList.toggle('bi-x')
    })

    /**
     * Scrool with ofset on links with a class name .scrollto
     */
    on('click', '#navbar .nav-link', function (e) {
        let section = select(this.hash)
        if (section) {
            e.preventDefault()

            let navbar = select('#navbar')
            let header = select('#header')
            let sections = select('section', true)
            let navlinks = select('#navbar .nav-link', true)

            navlinks.forEach((item) => {
                item.classList.remove('active')
            })

            this.classList.add('active')

            if (navbar.classList.contains('navbar-mobile')) {
                navbar.classList.remove('navbar-mobile')
                let navbarToggle = select('.mobile-nav-toggle')
                navbarToggle.classList.toggle('bi-list')
                navbarToggle.classList.toggle('bi-x')
            }

            if (this.hash == '#header') {
                header.classList.remove('header-top')
                sections.forEach((item) => {
                    item.classList.remove('section-show')
                })
                return;
            }

            if (!header.classList.contains('header-top')) {
                header.classList.add('header-top')
                setTimeout(function () {
                    sections.forEach((item) => {
                        item.classList.remove('section-show')
                    })
                    section.classList.add('section-show')

                }, 350);
            } else {
                sections.forEach((item) => {
                    item.classList.remove('section-show')
                })
                section.classList.add('section-show')
            }

            scrollto(this.hash)
        }
    }, true)

    /**
     * Activate/show sections on load with hash links
     */
    window.addEventListener('load', () => {
        if (window.location.hash) {
            let initial_nav = select(window.location.hash)

            if (initial_nav) {
                let header = select('#header')
                let navlinks = select('#navbar .nav-link', true)

                header.classList.add('header-top')

                navlinks.forEach((item) => {
                    if (item.getAttribute('href') == window.location.hash) {
                        item.classList.add('active')
                    } else {
                        item.classList.remove('active')
                    }
                })

                setTimeout(function () {
                    initial_nav.classList.add('section-show')
                }, 350);

                scrollto(window.location.hash)
            }
        }
    });

    /**
     * Skills animation
     */
    let skilsContent = select('.skills-content');
    if (skilsContent) {
        new Waypoint({
            element: skilsContent,
            offset: '80%',
            handler: function (direction) {
                let progress = select('.progress .progress-bar', true);
                progress.forEach((el) => {
                    el.style.width = el.getAttribute('aria-valuenow') + '%'
                });
            }
        })
    }

    /**
     * Testimonials slider
     */
    new Swiper('.testimonials-slider', {
        speed: 600,
        loop: true,
        autoplay: {
            delay: 5000,
            disableOnInteraction: false
        },
        slidesPerView: 'auto',
        pagination: {
            el: '.swiper-pagination',
            type: 'bullets',
            clickable: true
        },
        breakpoints: {
            320: {
                slidesPerView: 1,
                spaceBetween: 20
            },

            1200: {
                slidesPerView: 3,
                spaceBetween: 20
            }
        }
    });

    /**
     * Porfolio isotope and filter
     */
    window.addEventListener('load', () => {
        let portfolioContainer = select('.portfolio-container');
        if (portfolioContainer) {
            let portfolioIsotope = new Isotope(portfolioContainer, {
                itemSelector: '.portfolio-item',
                layoutMode: 'fitRows'
            });

            let portfolioFilters = select('#portfolio-flters li', true);

            on('click', '#portfolio-flters li', function (e) {
                e.preventDefault();
                portfolioFilters.forEach(function (el) {
                    el.classList.remove('filter-active');
                });
                this.classList.add('filter-active');

                portfolioIsotope.arrange({
                    filter: this.getAttribute('data-filter')
                });
            }, true);
        }

    });

    /**
     * Initiate portfolio lightbox
     */
    const portfolioLightbox = GLightbox({
        selector: '.portfolio-lightbox'
    });

    /**
     * Initiate portfolio details lightbox
     */
    const portfolioDetailsLightbox = GLightbox({
        selector: '.portfolio-details-lightbox',
        width: '90%',
        height: '90vh'

    });

    /**
     * Portfolio details slider
     */
    new Swiper('.portfolio-details-slider', {
        speed: 400,
        loop: true,
        autoplay: {
            delay: 5000,
            disableOnInteraction: false
        },
        pagination: {
            el: '.swiper-pagination',
            type: 'bullets',
            clickable: true
        }
    });

    const menuProfileText = document.getElementById("menu-profile-text");
    const menuProfileBox = document.getElementById("menu-profile-box");

    window.onclick = function (event) {
        if (event.target !== menuProfileBox && event.target !== menuProfileText) {
            menuProfileBox.classList.remove('show')
        }
    }

    if (menuProfileText !== null) {
        menuProfileText.onclick = function () {
            menuProfileBox.classList.toggle("show")
        };
    }


    const register = document.getElementById("register");
    const regMail = document.getElementById("reg-mail");
    const password = document.getElementById("reg-password");
    const repeatPassword = document.getElementById("reg-repeat-password");
    const regMessage = document.getElementById("reg-message");
    const regButton = document.getElementById("reg-button");
    const regName = document.getElementById("reg-firstname");

    if (repeatPassword !== null) {
        repeatPassword.onkeyup = function () {
            if (repeatPassword.value === password.value) {
                regMessage.style.color = "green";
                regMessage.innerHTML = ""
            } else {
                regMessage.style.color = "red";
                regMessage.innerHTML = "Has??a si?? nie zgadzaj??"
            }
        };
    }

    function validateEmail(email) {
        let re = /\S+@\S+\.\S+/;
        return re.test(email);
    }

    if (regButton !== null) {
        regButton.disabled = "disabled";
    }
    if (register !== null) {
        register.onkeyup = function () {
            if (validateEmail(regMail.value) && repeatPassword.value !== "" && repeatPassword.value === password.value && regName.value !== "") {
                regButton.disabled = false;
            } else {
                regButton.disabled = "disabled";
            }
        }
    }

    // const deletePortfolio = document.getElementById("delete-portfolio-3");
    const deletePortfolio = document.getElementsByClassName("delete-portfolio");
    if (deletePortfolio != null) {
        for (let i = 0; i < deletePortfolio.length; i++) {
            deletePortfolio[i].onclick = function () {
                let id = deletePortfolio[i].id;
                id = id.split('-')[2];
                document.getElementById("form-portfolio-" + id).submit();
            }
        }

    }


})()
