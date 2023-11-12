# piconet

A p2p pico-8 chatroom.

## Development

### In the browser

1. Run `npm i && npm run dev`

### In a native pico-8

Keep the project folder where you keep all your coding projects, then symlink it to the pico-8 carts folder. On a Mac this would be something similar to:

```bash
ln -s $HOME/dev/piconet $HOME/Library/Application\ Support/pico-8/carts
```

In the pico8 terminal you can load the game by running:

```bash
load piconet/piconet.p8
```

## Deployment

1. Make sure to set a shell variable for `$PICO8_PATH`. On a Mac, something similar to the following can be added to your `.bashrc` or `.zshrc` or whatever shell you use.

   ```bash
   export PICO8_PATH="/Applications/pico-8/PICO-8.app/Contents/MacOS/pico8"
   ```

1. Run `npm run export`.

1. Push to Github.
