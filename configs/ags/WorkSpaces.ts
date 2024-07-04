const hyprland = await Service.import("hyprland")

const activeWorkspaces = hyprland.bind("workspaces")
const currWorkspaceID = hyprland.active.workspace.bind("id");

export const testButton = Widget.Box({

}).hook(hyprland, self =>{

    // as bind wraps up in an object, we need to access the id by emitter
    self.children = activeWorkspaces.emitter.workspaces
       .filter((workspace) => workspace.id!== null)
       .sort((a, b) => a.id - b.id)
       .map((workspace) => Widget.Button({

            css: workspace.id == currWorkspaceID.emitter.id? "background-color:red":"",
            class_name: 'workspace-button button',
            label: workspace.id.toString(),
            on_clicked: () => hyprland.messageAsync(`dispatch workspace ${workspace.id}`)
        }));
});
