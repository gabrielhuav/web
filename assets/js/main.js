// Main JavaScript file for Portfolio

// Initialize AOS (Animate On Scroll)
AOS.init({
    duration: 1000,
    easing: 'ease-in-out',
    once: true,
    mirror: false
});

// Navbar scroll effect
window.addEventListener('scroll', function() {
    const navbar = document.querySelector('.navbar');
    if (window.scrollY > 50) {
        navbar.classList.add('scrolled');
    } else {
        navbar.classList.remove('scrolled');
    }
});

// Smooth scrolling for navigation links
document.querySelectorAll('a[href^="#"]').forEach(anchor => {
    anchor.addEventListener('click', function (e) {
        e.preventDefault();
        const target = document.querySelector(this.getAttribute('href'));
        if (target) {
            target.scrollIntoView({
                behavior: 'smooth',
                block: 'start'
            });
        }
    });
});

// Active navigation link highlighting
window.addEventListener('scroll', function() {
    const sections = document.querySelectorAll('section[id]');
    const navLinks = document.querySelectorAll('.navbar-nav .nav-link');
    
    let current = '';
    sections.forEach(section => {
        const sectionTop = section.offsetTop;
        const sectionHeight = section.clientHeight;
        if (scrollY >= (sectionTop - 200)) {
            current = section.getAttribute('id');
        }
    });

    navLinks.forEach(link => {
        link.classList.remove('active');
        if (link.getAttribute('href').slice(1) === current) {
            link.classList.add('active');
        }
    });
});

// Animated counter
function animateCounters() {
    const counters = document.querySelectorAll('.counter');
    const speed = 200;

    counters.forEach(counter => {
        const animate = () => {
            const value = +counter.getAttribute('data-target') || +counter.innerText.replace('+', '');
            const data = +counter.innerText.replace('+', '') || 0;
            
            const time = value / speed;
            if (data < value) {
                counter.innerText = Math.ceil(data + time) + '+';
                setTimeout(animate, 1);
            } else {
                counter.innerText = value + '+';
            }
        }
        animate();
    });
}

document.addEventListener('DOMContentLoaded', function() {
    // Carrusel automático para imágenes de proyectos
    const carousels = document.querySelectorAll('.project-image-carousel');
    
    carousels.forEach(carousel => {
        const images = carousel.querySelectorAll('.carousel-image');
        const indicators = carousel.querySelectorAll('.indicator');
        let currentIndex = 0;
        
        function showImage(index) {
            // Ocultar todas las imágenes
            images.forEach(img => img.classList.remove('active'));
            indicators.forEach(ind => ind.classList.remove('active'));
            
            // Mostrar imagen actual
            images[index].classList.add('active');
            indicators[index].classList.add('active');
        }
        
        function nextImage() {
            currentIndex = (currentIndex + 1) % images.length;
            showImage(currentIndex);
        }
        
        // Cambiar imagen cada 3 segundos
        setInterval(nextImage, 3000);
        
        // Click en indicadores
        indicators.forEach((indicator, index) => {
            indicator.addEventListener('click', () => {
                currentIndex = index;
                showImage(currentIndex);
            });
        });
        
        // Pausar en hover
        carousel.addEventListener('mouseenter', () => {
            carousel.classList.add('paused');
        });
        
        carousel.addEventListener('mouseleave', () => {
            carousel.classList.remove('paused');
        });
    });
});


// Trigger counter animation when in viewport
const observeCounters = new IntersectionObserver((entries) => {
    entries.forEach(entry => {
        if (entry.isIntersecting) {
            animateCounters();
            observeCounters.unobserve(entry.target);
        }
    });
});

document.addEventListener('DOMContentLoaded', function() {
    const aboutSection = document.querySelector('#about');
    if (aboutSection) {
        observeCounters.observe(aboutSection);
    }
});

// Skill progress bars animation
function animateSkillBars() {
    const skillBars = document.querySelectorAll('.progress-bar');
    skillBars.forEach(bar => {
        const width = bar.style.width;
        bar.style.width = '0%';
        setTimeout(() => {
            bar.style.width = width;
        }, 500);
    });
}

// Trigger skill bars animation when in viewport
const observeSkills = new IntersectionObserver((entries) => {
    entries.forEach(entry => {
        if (entry.isIntersecting) {
            animateSkillBars();
            observeSkills.unobserve(entry.target);
        }
    });
});

document.addEventListener('DOMContentLoaded', function() {
    const skillsSection = document.querySelector('#skills');
    if (skillsSection) {
        observeSkills.observe(skillsSection);
    }
});

// Contact form handling
document.addEventListener('DOMContentLoaded', function() {
    const contactForm = document.querySelector('.contact-form');
    if (contactForm) {
        contactForm.addEventListener('submit', function(e) {
            e.preventDefault();
            
            // Get form data
            const formData = new FormData(this);
            const submitBtn = this.querySelector('button[type="submit"]');
            const originalText = submitBtn.innerHTML;
            
            // Show loading state
            submitBtn.innerHTML = '<span class="loading"></span> Enviando...';
            submitBtn.disabled = true;
            
            // Simulate form submission (replace with actual implementation)
            setTimeout(() => {
                // Show success message
                showNotification('¡Mensaje enviado correctamente!', 'success');
                
                // Reset form
                this.reset();
                
                // Reset button
                submitBtn.innerHTML = originalText;
                submitBtn.disabled = false;
            }, 2000);
        });
    }
});

// Notification system
function showNotification(message, type = 'info') {
    // Remove existing notifications
    const existingNotifications = document.querySelectorAll('.notification');
    existingNotifications.forEach(notif => notif.remove());
    
    // Create notification element
    const notification = document.createElement('div');
    notification.className = `notification alert alert-${type === 'success' ? 'success' : 'info'} alert-dismissible fade show`;
    notification.style.cssText = `
        position: fixed;
        top: 20px;
        right: 20px;
        z-index: 9999;
        min-width: 300px;
        box-shadow: 0 4px 12px rgba(0,0,0,0.15);
    `;
    
    notification.innerHTML = `
        ${message}
        <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
    `;
    
    document.body.appendChild(notification);
    
    // Auto remove after 5 seconds
    setTimeout(() => {
        if (notification) {
            notification.remove();
        }
    }, 5000);
}

// Typing effect for hero section
function typeWriter(element, text, speed = 100) {
    let i = 0;
    element.innerHTML = '';
    
    function type() {
        if (i < text.length) {
            element.innerHTML += text.charAt(i);
            i++;
            setTimeout(type, speed);
        }
    }
    type();
}

// Initialize typing effect when page loads
document.addEventListener('DOMContentLoaded', function() {
    const heroTitle = document.querySelector('.hero-section h1 .text-primary');
    if (heroTitle) {
        const originalText = heroTitle.textContent;
        setTimeout(() => {
            typeWriter(heroTitle, originalText, 150);
        }, 1000);
    }
});

// Parallax effect for hero content (translates content elements to avoid white background gaps)
window.addEventListener('scroll', function() {
    const scrolled = window.pageYOffset;
    const heroContent = document.querySelector('.hero-content');
    const heroImage = document.querySelector('.hero-image');
    if (heroContent) {
        heroContent.style.transform = `translateY(${scrolled * 0.25}px)`;
    }
    if (heroImage) {
        heroImage.style.transform = `translateY(${scrolled * 0.15}px)`;
    }
});

// Project card hover effects
document.addEventListener('DOMContentLoaded', function() {
    const projectCards = document.querySelectorAll('.project-card');
    
    projectCards.forEach(card => {
        card.addEventListener('mouseenter', function() {
            this.style.transform = 'translateY(-10px) scale(1.02)';
        });
        
        card.addEventListener('mouseleave', function() {
            this.style.transform = 'translateY(0) scale(1)';
        });
    });
});

// Lazy loading for images
document.addEventListener('DOMContentLoaded', function() {
    const images = document.querySelectorAll('img[data-src]');
    
    const imageObserver = new IntersectionObserver((entries, observer) => {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                const img = entry.target;
                img.src = img.dataset.src;
                img.classList.remove('lazy');
                imageObserver.unobserve(img);
            }
        });
    });
    
    images.forEach(img => imageObserver.observe(img));
});

// Theme switcher (optional)
function toggleTheme() {
    const body = document.body;
    const isDark = body.classList.contains('dark-theme');
    
    if (isDark) {
        body.classList.remove('dark-theme');
        localStorage.setItem('theme', 'light');
    } else {
        body.classList.add('dark-theme');
        localStorage.setItem('theme', 'dark');
    }
}

// Load saved theme
document.addEventListener('DOMContentLoaded', function() {
    const savedTheme = localStorage.getItem('theme');
    if (savedTheme === 'dark') {
        document.body.classList.add('dark-theme');
    }
});

// Preloader
window.addEventListener('load', function() {
    const preloader = document.querySelector('.preloader');
    if (preloader) {
        preloader.style.opacity = '0';
        setTimeout(() => {
            preloader.style.display = 'none';
        }, 500);
    }
});

// Back to top button
document.addEventListener('DOMContentLoaded', function() {
    // Create back to top button
    const backToTopBtn = document.createElement('button');
    backToTopBtn.innerHTML = '<i class="fas fa-arrow-up"></i>';
    backToTopBtn.className = 'btn btn-primary back-to-top';
    backToTopBtn.style.cssText = `
        position: fixed;
        bottom: 20px;
        right: 20px;
        z-index: 1000;
        border-radius: 50%;
        width: 50px;
        height: 50px;
        display: none;
        transition: all 0.3s ease;
    `;
    
    document.body.appendChild(backToTopBtn);
    
    // Show/hide button based on scroll position
    window.addEventListener('scroll', function() {
        if (window.pageYOffset > 300) {
            backToTopBtn.style.display = 'block';
        } else {
            backToTopBtn.style.display = 'none';
        }
    });
    
    // Scroll to top functionality
    backToTopBtn.addEventListener('click', function() {
        window.scrollTo({
            top: 0,
            behavior: 'smooth'
        });
    });
});

// Console log for developers
console.log(`
    ____             __  ____      ___    
   / __ \\____  _____/ /_/ __/___  / (_)___
  / /_/ / __ \\/ ___/ __/ /_/ __ \\/ / / __ \\
 / ____/ /_/ / /  / /_/ __/ /_/ / / / /_/ /
/_/    \\____/_/   \\__/_/  \\____/_/_/\\____/ 

¡Hola desarrollador! 👋
Si estás viendo esto, probablemente eres un desarrollador curioso.
¡Me encantaría conectar contigo!

Portafolio creado con ❤️ usando Bootstrap 5
`);
// ===== Project category filter (All / Web / Android) =====
document.addEventListener('DOMContentLoaded', function () {
    const filterBtns = document.querySelectorAll('.filter-btn');
    const grid = document.getElementById('projectsGrid');
    if (!filterBtns.length || !grid) return;
    const items = grid.querySelectorAll('[data-category]');
    filterBtns.forEach(function (btn) {
        btn.addEventListener('click', function () {
            filterBtns.forEach(b => b.classList.remove('active'));
            btn.classList.add('active');
            const f = btn.getAttribute('data-filter');
            items.forEach(function (it) {
                const show = (f === 'all') || (it.getAttribute('data-category') === f);
                it.style.display = show ? '' : 'none';
            });
            if (window.AOS && AOS.refresh) AOS.refresh();
        });
    });
});

// ===== Project double-carousel showcase (outer = projects, inner = images) =====
(function () {
    function initShowcase(id, projects, labels) {
        var root = document.getElementById(id);
        if (!root || !projects || !projects.length) return;
        var media = root.querySelector('.showcase-media');
        var img = root.querySelector('.sc-img');
        var dots = root.querySelector('.sc-dots');
        var badge = root.querySelector('.sc-badge');
        var badgeText = root.querySelector('.sc-badge-text');
        var nameEl = root.querySelector('.sc-name');
        var descEl = root.querySelector('.sc-desc');
        var techEl = root.querySelector('.sc-tech');
        var linksEl = root.querySelector('.sc-links');
        var counter = root.querySelector('.sc-counter');
        var pills = root.querySelector('.sc-pills');
        var imgPrev = root.querySelector('.sc-img-prev');
        var imgNext = root.querySelector('.sc-img-next');
        var pi = 0, ii = 0, timer = null;

        var isES = (document.documentElement.lang || '').toLowerCase().indexOf('es') === 0;
        function getPlay(p) {
            for (var i = 0; i < (p.links || []).length; i++) {
                if ((p.links[i].url || '').indexOf('play.google.com') !== -1) return p.links[i].url;
            }
            return null;
        }
        projects.forEach(function (p, idx) {
            var b = document.createElement('button');
            b.className = 'sc-pill';
            b.type = 'button';
            if (getPlay(p)) {
                b.innerHTML = p.name + ' <i class="fas fa-circle-check sc-pill-check"></i>';
                b.title = isES ? 'App oficial en Google Play' : 'Official app on Google Play';
            } else {
                b.textContent = p.name;
            }
            b.addEventListener('click', function () { pi = idx; renderProject(); });
            pills.appendChild(b);
        });

        // Official Play Store apps get a verified check in the info panel and on the media corner.
        var verified = document.createElement('a');
        verified.className = 'sc-verified';
        verified.target = '_blank';
        verified.rel = 'noopener';
        verified.innerHTML = '<i class="fas fa-circle-check"></i> ' + (isES ? 'Oficial · Google Play' : 'Official · Google Play');
        nameEl.parentNode.insertBefore(verified, nameEl);
        var mediaCheck = document.createElement('a');
        mediaCheck.className = 'sc-media-check';
        mediaCheck.target = '_blank';
        mediaCheck.rel = 'noopener';
        mediaCheck.title = isES ? 'App oficial en Google Play' : 'Official app on Google Play';
        mediaCheck.innerHTML = '<i class="fas fa-circle-check"></i>';
        media.appendChild(mediaCheck);

        function renderImage() {
            var p = projects[pi];
            img.src = p.images[ii] || '';
            img.alt = p.name;
            Array.prototype.forEach.call(dots.children, function (d, k) {
                d.classList.toggle('active', k === ii);
            });
        }
        function buildDots(p) {
            dots.innerHTML = '';
            p.images.forEach(function (_, k) {
                var d = document.createElement('span');
                d.className = 'sc-dot' + (k === 0 ? ' active' : '');
                d.addEventListener('click', function () { ii = k; renderImage(); restart(); });
                dots.appendChild(d);
            });
            var single = p.images.length <= 1;
            dots.style.display = single ? 'none' : '';
            imgPrev.style.display = single ? 'none' : '';
            imgNext.style.display = single ? 'none' : '';
        }
        function renderProject() {
            ii = 0;
            var p = projects[pi];
            buildDots(p);
            renderImage();
            nameEl.textContent = p.name;
            descEl.textContent = p.desc;
            if (p.badge) {
                badge.style.display = '';
                badge.href = p.badgeUrl || '#';
                badge.title = p.badgeTitle || '';
                badgeText.textContent = p.badgeText || labels.badge;
            } else {
                badge.style.display = 'none';
            }
            var pu = getPlay(p);
            if (pu) {
                verified.style.display = ''; verified.href = pu;
                mediaCheck.style.display = ''; mediaCheck.href = pu;
            } else {
                verified.style.display = 'none';
                mediaCheck.style.display = 'none';
            }
            techEl.innerHTML = '';
            p.tech.forEach(function (t) {
                var s = document.createElement('span');
                s.className = 'tech-badge';
                s.textContent = t;
                techEl.appendChild(s);
            });
            linksEl.innerHTML = '';
            p.links.forEach(function (l, k) {
                var a = document.createElement('a');
                a.href = l.url; a.target = '_blank'; a.rel = 'noopener';
                a.className = 'btn btn-sm ' + (k === 0 ? 'btn-primary' : 'btn-outline-primary') + ' me-2 mb-2';
                a.innerHTML = (l.icon ? '<i class="' + l.icon + '"></i> ' : '') + l.label;
                linksEl.appendChild(a);
            });
            counter.textContent = (pi + 1) + ' / ' + projects.length;
            Array.prototype.forEach.call(pills.children, function (b, k) {
                b.classList.toggle('active', k === pi);
            });
            var active = pills.children[pi];
            if (active && active.scrollIntoView) active.scrollIntoView({ block: 'nearest', inline: 'center' });
            restart();
        }
        function nextImg() { var p = projects[pi]; ii = (ii + 1) % p.images.length; renderImage(); }
        function prevImg() { var p = projects[pi]; ii = (ii - 1 + p.images.length) % p.images.length; renderImage(); }
        function restart() {
            if (timer) clearInterval(timer);
            if (projects[pi].images.length > 1) timer = setInterval(nextImg, 4000);
        }
        root.querySelector('.sc-next').addEventListener('click', function () { pi = (pi + 1) % projects.length; renderProject(); });
        root.querySelector('.sc-prev').addEventListener('click', function () { pi = (pi - 1 + projects.length) % projects.length; renderProject(); });
        imgNext.addEventListener('click', function () { nextImg(); restart(); });
        imgPrev.addEventListener('click', function () { prevImg(); restart(); });
        media.addEventListener('mouseenter', function () { if (timer) clearInterval(timer); });
        media.addEventListener('mouseleave', function () { restart(); });

        renderProject();
    }
    document.addEventListener('DOMContentLoaded', function () {
        if (!window.PROJECT_DATA) return;
        var L = window.SC_LABELS || { badge: 'DB Course' };
        initShowcase('showcase-android', window.PROJECT_DATA.android, L);
        initShowcase('showcase-web', window.PROJECT_DATA.web, L);
    });
})();

// ===== Teaching: expandable course repositories =====
document.addEventListener('DOMContentLoaded', function () {
    document.querySelectorAll('.course-repo-toggle').forEach(function (btn) {
        btn.addEventListener('click', function () {
            var panel = document.getElementById(btn.getAttribute('data-target'));
            if (!panel) return;
            var willOpen = panel.hasAttribute('hidden');
            if (willOpen) { panel.removeAttribute('hidden'); } else { panel.setAttribute('hidden', ''); }
            btn.setAttribute('aria-expanded', willOpen ? 'true' : 'false');
            btn.classList.toggle('open', willOpen);
        });
    });
});
