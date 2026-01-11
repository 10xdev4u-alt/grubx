# Headless Servers

Should you theme a server with no monitor?

## The Short Answer
No.

## The Nuance
If you have a server that you occasionally connect a KVM switch or monitor to (e.g., in a datacenter crash cart scenario), a theme can actually be helpful to clearly identify the machine.

## High Contrast
For servers, use a **High Contrast** variant (`variants/theme_server.txt`).
- Red background = Production.
- Green background = Staging.

This visual cue prevents you from rebooting the wrong server manually.

## Performance
Disable the timeout countdown or set it to 1 second for faster boots.
