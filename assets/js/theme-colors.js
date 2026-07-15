export function rgbStringToHex(rgbString) {
  const [r, g, b] = rgbString.split(',').map(s => parseInt(s.trim()));
  return (r << 16) + (g << 8) + b;
}

export function getThemeColors() {
  const root = getComputedStyle(document.documentElement);
  return {
    primary: rgbStringToHex(root.getPropertyValue('--color-primary-500')),
    secondary: rgbStringToHex(root.getPropertyValue('--color-secondary-500')),
    background: document.documentElement.classList.contains('dark')
      ? rgbStringToHex(root.getPropertyValue('--color-neutral-900'))
      : rgbStringToHex(root.getPropertyValue('--color-neutral-50'))
  };
}
