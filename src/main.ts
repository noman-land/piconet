const PIN = {
  frame: 0,
  reloads: 1,
  reload: 127,
};

// eslint-disable-next-line @typescript-eslint/no-explicit-any
const pins = ((self as any).pico8_gpio = new Proxy(new Array(128), {
  set(target, p: string, value) {
    const pin = parseInt(p, 10);
    target[pin] = value;
    switch (pin) {
      case PIN.frame: {
        frameText.innerText = value;
        if (target[PIN.frame] > 0 && reloadButton.getAttribute('disabled')) {
          reloadButton.removeAttribute('disabled');
        }
        break;
      }
      case PIN.reloads: {
        reloadsText.innerText = value;
        break;
      }
    }
    return true;
  },
}));

const reload = () => {
  pins[PIN.reload] = 1;
  setTimeout(() => {
    pins[PIN.reload] = 0;
  }, 20);
};

const reloadButton = document.getElementById('reload')!;
const frameText = document.getElementById('frame')!;
const reloadsText = document.getElementById('reloads')!;

reloadButton.addEventListener('click', reload);
