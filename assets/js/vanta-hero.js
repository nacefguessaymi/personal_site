import { getThemeColors } from './theme-colors.js';

let vantaInstance = null;

function sizeHeroContainer() {
  const el = document.getElementById('vanta-hero');
  if (el) {
    el.style.position = 'fixed';
    el.style.top = '0';
    el.style.left = '0';
    el.style.width = '100vw';
    el.style.height = '100vh';
    el.style.zIndex = '-1';
  }
}

function initVanta() {
  sizeHeroContainer();
  const colors = getThemeColors();
  if (vantaInstance) vantaInstance.destroy();
  vantaInstance = VANTA.DOTS({
    el: "#vanta-hero",
    mouseControls: true,
    touchControls: true,
    gyroControls: false,
    minHeight: 200.00,
    minWidth: 200.00,
    color: colors.primary,
    color2: colors.secondary,
    backgroundColor: colors.background,
    size: 1.20,
    spacing: 28.00,
    showLines: false
  });
}

initVanta();

// Resize the container and Vanta whenever the window changes size
window.addEventListener('resize', () => {
  sizeHeroContainer();
  if (vantaInstance) vantaInstance.resize();
});

// Re-run whenever Blowfish toggles dark mode
const observer = new MutationObserver(initVanta);
observer.observe(document.documentElement, { attributes: true, attributeFilter: ['class'] });
