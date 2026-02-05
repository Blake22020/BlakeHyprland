pragma Singleton

import Quickshell
import Quickshell.Io
import QtQuick

// Monitor volume using pamixer
Singleton {
    id: root
    
    property int percentage: 0
    property bool muted: false
    
    // Fast polling for responsive OSD (200ms)
    Timer {
        interval: 200
        repeat: true
        running: true
        triggeredOnStart: true
        
        onTriggered: {
            volumeProc.running = true
            muteProc.running = true
        }
    }
    
    Process {
        id: volumeProc
        command: ["pamixer", "--get-volume"]
        
        stdout: StdioCollector {
            onStreamFinished: {
                const vol = parseInt(text.trim())
                if (!isNaN(vol) && vol !== root.percentage) {
                    root.percentage = vol
                }
            }
        }
    }
    
    Process {
        id: muteProc
        command: ["pamixer", "--get-mute"]
        
        stdout: StdioCollector {
            onStreamFinished: {
                root.muted = text.trim() === "true"
            }
        }
    }

    // Process for setting volume/mute
    Process { id: controlProc }

    function setVolume(newPercentage) {
        controlProc.command = ["pamixer", "--set-volume", Math.round(newPercentage)]
        controlProc.running = true
        // force update
        volumeProc.running = true
    }

    function increaseVolume() {
        controlProc.command = ["pamixer", "-i", "5"]
        controlProc.running = true
        volumeProc.running = true
    }

    function decreaseVolume() {
        controlProc.command = ["pamixer", "-d", "5"]
        controlProc.running = true
        volumeProc.running = true
    }

    function toggleMute() {
        controlProc.command = ["pamixer", "-t"]
        controlProc.running = true
        muteProc.running = true
    }
    
    Component.onCompleted: {
        console.log("📊 [VolumeMonitor] Service loaded - monitoring with pamixer")
    }
}
