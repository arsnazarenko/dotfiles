#!/bin/bash

activate_headless () {
    swaymsg create_output
    # 1: current_mode
    CURRENT_WIDTH=$(swaymsg -t get_outputs | jq -r '.[] | select(.name | startswith("eDP-1")) | .current_mode.width') 
    CURRENT_HEIGHT=$(swaymsg -t get_outputs | jq -r '.[] | select(.name | startswith("eDP-1")) | .current_mode.height') 
    
    # 2: Find the name of the newly created output
    NEW_OUTPUT=$(swaymsg -t get_outputs | jq -r '.[] | select(.name | startswith("HEADLESS-")) | .name' | sort | tail -n 1)
    
    # Check if the output was successfully created
    if [ -z "$NEW_OUTPUT" ]; then
        echo "Failed to create a new output."
        exit 1
    fi
    
    # Step 3: Assign a workspace to the new output
    swaymsg workspace 1 output "$NEW_OUTPUT"
    
    # Step 4: Set the resolution for the new output
    swaymsg output "$NEW_OUTPUT" resolution "$CURRENT_WIDTH"x"$CURRENT_HEIGHT"
    
    # Step 5: Set the background color for the new output
    swaymsg output "$NEW_OUTPUT" bg "#000000" solid_color
    
    # Step 6: Switch to workspace sshr and then back to the previous workspace
    CURRENT_WORKSPACE=$(swaymsg -t get_workspaces | jq -r '.[] | select(.focused) | .name')
    swaymsg workspace 1
    swaymsg workspace "$CURRENT_WORKSPACE"
    
    wl-mirror "$NEW_OUTPUT"
}

deactivate_headless () {

    # Get all outputs with names starting with HEADLESS-
    HEADLESS_OUTPUTS=$(swaymsg -t get_outputs | jq -r '.[] | select(.name | startswith("HEADLESS-")) | .name')
    
    # Check if there are any HEADLESS outputs
    if [ -z "$HEADLESS_OUTPUTS" ]; then
        echo "No HEADLESS outputs found."
        exit 0
    fi
    
    # Unplug each HEADLESS output
    for output in $HEADLESS_OUTPUTS; do
        echo "Unplugging $output..."
        swaymsg output "$output" unplug
    done
}
#
# trap ctrl-c and deactivate_headless()
trap deactivate_headless SIGINT SIGQUIT SIGKILL
# activate
activate_headless

