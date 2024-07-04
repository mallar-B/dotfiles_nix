import { testButton } from "./WorkSpaces.ts"
export const Bar = (/** @type {number} */ monitor) => Widget.Window({
    monitor,
    name: `bar${monitor}`,
    anchor: ['top', 'left', 'right'],
    exclusivity: 'exclusive',
    child: Widget.CenterBox({
        end_widget: Widget.Label({
            hpack: 'center',
            label: 'Welcome to AGS!',
        }),
        start_widget: testButton,
    }),
})

App.config({
    windows: [Bar(0)],
})