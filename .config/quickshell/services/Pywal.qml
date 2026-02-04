pragma Singleton

import Quickshell
import QtQuick 6.10

Singleton {
    id: root
    
    // Tokyo Night color properties
    property color background: "#24283b"
    property color foreground: "#c0caf5"
    property color cursor: "#c0caf5"
    
    // Individual color properties for easy access
    property color color0: "#1a1b26"
    property color color1: "#f7768e" // Red
    property color color2: "#9ece6a" // Green
    property color color3: "#e0af68" // Yellow
    property color color4: "#7aa2f7" // Blue
    property color color5: "#bb9af7" // Magenta
    property color color6: "#7dcfff" // Cyan
    property color color7: "#a9b1d6"
    property color color8: "#565f89" // Comment
    property color color9: "#f7768e"
    property color color10: "#9ece6a"
    property color color11: "#e0af68"
    property color color12: "#7aa2f7"
    property color color13: "#bb9af7"
    property color color14: "#7dcfff"
    property color color15: "#c0caf5"
    
    // === Semantic Color Tokens ===
    // Use these instead of hardcoded colors for consistency
    
    // Primary accent color
    readonly property color primary: color4
    readonly property color primaryContainer: Qt.rgba(color4.r, color4.g, color4.b, 0.2)
    readonly property color onPrimary: foreground
    
    // Secondary accent
    readonly property color secondary: color5
    readonly property color secondaryContainer: Qt.rgba(color5.r, color5.g, color5.b, 0.2)
    
    // Tertiary accent
    readonly property color tertiary: color6
    readonly property color tertiaryContainer: Qt.rgba(color6.r, color6.g, color6.b, 0.2)
    
    // Surface colors (for cards, popups, containers)
    readonly property color surface: background
    readonly property color surfaceDim: Qt.darker(background, 1.1)
    readonly property color surfaceBright: Qt.lighter(background, 1.3)
    readonly property color surfaceContainer: Qt.lighter(background, 1.15)
    readonly property color surfaceContainerLow: Qt.lighter(background, 1.08)
    readonly property color surfaceContainerHigh: Qt.lighter(background, 1.22)
    readonly property color surfaceContainerHighest: Qt.lighter(background, 1.3)
    readonly property color onSurface: foreground
    readonly property color onSurfaceVariant: color8
    
    // Outline colors
    readonly property color outline: color8
    readonly property color outlineVariant: Qt.rgba(color8.r, color8.g, color8.b, 0.5)
    
    // State colors
    readonly property color success: color2      // Green
    readonly property color onSuccess: background
    readonly property color warning: color3      // Orange
    readonly property color onWarning: background
    readonly property color error: color1        // Red
    readonly property color onError: foreground
    readonly property color info: color4         // Blue-ish accent
    
    // Interactive state overlays
    readonly property color stateLayerLight: Qt.rgba(foreground.r, foreground.g, foreground.b, 1)
    readonly property color stateLayerDark: Qt.rgba(background.r, background.g, background.b, 1)
    
    // Inverse colors (for contrast situations)
    readonly property color inverseSurface: foreground
    readonly property color inverseOnSurface: background
    readonly property color inversePrimary: Qt.lighter(primary, 1.5)
    
    // Scrim (overlay for modals)
    readonly property color scrim: Qt.rgba(0, 0, 0, 0.5)
    
    // Shadow color
    readonly property color shadow: Qt.rgba(0, 0, 0, 0.3)
}
