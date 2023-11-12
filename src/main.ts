/* eslint-disable @typescript-eslint/no-explicit-any */

const pins = ((self as any).pico8_gpio = new Proxy(new Array(120), {
  set(target, p: string, frame) {
    target[parseInt(p, 10)] = frame;
    document.getElementById('frame')!.innerText = frame;
    return true;
  },
}));

const reload = () => {
  pins[127] = 1;
  setTimeout(() => {
    pins[127] = 0;
  }, 50);
};

document.getElementById('reload')!.addEventListener('click', reload);

// setInterval(rerun, 5000);
