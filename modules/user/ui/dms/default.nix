{
  config,
  pkgs,
  lib,
  inputs,
  ...
}:
let
  cfg = config.userSettings.ui.dms;
in
{
  imports = [
    inputs.dms.homeModules.dank-material-shell
  ];

  options.userSettings.ui.dms.enable = lib.mkEnableOption "Enable DankMaterialShell";

  config = lib.mkIf (cfg.enable) {
    home.packages = with pkgs; [
      matugen
      i2c-tools
      cava
    ];
    programs.dank-material-shell = {
      enable = true;

      systemd = {
        enable = true;
        restartIfChanged = true;
      };
      settings = {
        theme = "dark";

        currentThemeName = "dynamic";
        currentThemeCategory = "dynamic";
        customThemeFile = "";
        registryThemeVariants = { };
        matugenScheme = "scheme-fidelity";
        runUserMatugenTemplates = true;
        matugenTargetMonitor = "";
        popupTransparency = 1;
        dockTransparency = 1;
        widgetBackgroundColor = "sch";
        widgetColorMode = "default";
        cornerRadius = 12;
        e24HourClock = true;
        showSeconds = false;
        useFahrenheit = false;
        nightModeEnabled = false;
        animationSpeed = 1;
        customAnimationDuration = 250;
        wallpaperFillMode = "Fill";
        blurredWallpaperLayer = false;
        blurWallpaperOnOverview = true;
        showLauncherButton = true;
        showWorkspaceSwitcher = true;
        showFocusedWindow = true;
        showWeather = true;
        showMusic = true;
        showClipboard = true;
        showCpuUsage = true;
        HeyshowMemUsage = true;
        showCpuTemp = true;
        showGpuTemp = true;
        selectedGpuIndex = 0;
        enabledGpuPciIds = [ ];
        showSystemTray = true;
        showClock = true;
        showNotificationButton = true;
        showBattery = true;
        showControlCenterButton = true;
        showCapsLockIndicator = true;
        controlCenterShowNetworkIcon = true;
        controlCenterShowBluetoothIcon = true;
        controlCenterShowAudioIcon = true;
        controlCenterShowAudioPercent = false;
        controlCenterShowVpnIcon = true;
        controlCenterShowBrightnessIcon = false;
        controlCenterShowBrightnessPercent = false;
        controlCenterShowMicIcon = false;
        controlCenterShowMicPercent = true;
        controlCenterShowBatteryIcon = false;
        controlCenterShowPrinterIcon = false;
        controlCenterShowScreenSharingIcon = true;
        showPrivacyButton = true;
        privacyShowMicIcon = false;
        privacyShowCameraIcon = false;
        privacyShowScreenShareIcon = false;
        controlCenterWidgets = [
          {
            id = "volumeSlider";
            enabled = true;
            width = 50;
          }
          {
            id = "brightnessSlider";
            enabled = true;
            width = 50;
          }
          {
            id = "wifi";
            enabled = true;
            width = 50;
          }
          {
            id = "bluetooth";
            enabled = true;
            width = 50;
          }
          {
            id = "audioOutput";
            enabled = true;
            width = 50;
          }
          {
            id = "audioInput";
            enabled = true;
            width = 50;
          }
          {
            id = "nightMode";
            enabled = true;
            width = 50;
          }
          {
            id = "darkMode";
            enabled = true;
            width = 50;
          }
        ];
        showWorkspaceIndex = false;
        showWorkspaceName = false;
        showWorkspacePadding = false;
        workspaceScrolling = false;
        showWorkspaceApps = false;
        maxWorkspaceIcons = 3;
        groupWorkspaceApps = true;
        workspaceFollowFocus = false;
        showOccupiedWorkspacesOnly = false;
        reverseScrolling = false;
        dwlShowAllTags = false;
        workspaceColorMode = "default";
        workspaceOccupiedColorMode = "none";
        workspaceUnfocusedColorMode = "default";
        workspaceUrgentColorMode = "default";
        workspaceFocusedBorderEnabled = false;
        workspaceFocusedBorderColor = "primary";
        workspaceFocusedBorderThickness = 2;
        workspaceNameIcons = {
          work = {
            type = "icon";
            value = "work";
          };
          web = {
            type = "icon";
            value = "wifi";
          };
          gaming = {
            type = "icon";
            value = "sports_esports";
          };
          dev = {
            type = "icon";
            value = "code";
          };
          chat = {
            type = "icon";
            value = "chat";
          };
          music = {
            type = "icon";
            value = "music_note";
          };
        };
        waveProgressEnabled = true;
        scrollTitleEnabled = true;
        audioVisualizerEnabled = true;
        audioScrollMode = "volume";
        clockCompactMode = false;
        focusedWindowCompactMode = false;
        runningAppsCompactMode = true;
        keyboardLayoutNameCompactMode = false;
        runningAppsCurrentWorkspace = false;
        runningAppsGroupByApp = false;
        appIdSubstitutions = [ ];
        centeringMode = "index";
        clockDateFormat = "";
        lockDateFormat = "";
        mediaSize = 1;
        appLauncherViewMode = "list";
        spotlightModalViewMode = "list";
        sortAppsAlphabetically = true;
        appLauncherGridColumns = 4;
        spotlightCloseNiriOverview = true;
        niriOverviewOverlayEnabled = true;
        useAutoLocation = false;
        weatherEnabled = false;
        networkPreference = "auto";
        vpnLastConnected = "";
        iconTheme = "System Default";
        cursorSettings = {
          theme = "Bibata-Modern-Classic";
          size = 24;
          niri = {
            hideWhenTyping = false;
            hideAfterInactiveMs = 0;
          };
          hyprland = {
            hideOnKeyPress = false;
            hideOnTouch = false;
            inactiveTimeout = 0;
          };
          dwl = {
            cursorHideTimeout = 0;
          };
        };
        launcherLogoMode = "os";
        launcherLogoCustomPath = "";
        launcherLogoColorOverride = "";
        launcherLogoColorInvertOnMode = false;
        launcherLogoBrightness = 0.5;
        launcherLogoContrast = 1;
        launcherLogoSizeOffset = 0;
        fontFamily = "Inter Variable";
        monoFontFamily = "Noto Sans Mono";
        fontWeight = 400;
        fontScale = 1;
        notepadUseMonospace = true;
        notepadFontFamily = "";
        notepadFontSize = 14;
        notepadShowLineNumbers = false;
        adLastCustomTransparency = 0.7;
        soundsEnabled = true;
        useSystemSoundTheme = false;
        soundNewNotification = true;
        soundVolumeChanged = true;
        soundPluggedIn = true;
        acMonitorTimeout = 300;
        acLockTimeout = 180;
        acSuspendTimeout = 900;
        acSuspendBehavior = 0;
        acProfileName = "";
        batteryMonitorTimeout = 0;
        batteryLockTimeout = 0;
        batterySuspendTimeout = 0;
        batterySuspendBehavior = 0;
        batteryProfileName = "";
        batteryChargeLimit = 100;
        lockBeforeSuspend = true;
        loginctlLockIntegration = true;
        fadeToLockEnabled = true;
        fadeToLockGracePeriod = 5;
        fadeToDpmsEnabled = true;
        fadeToDpmsGracePeriod = 5;
        launchPrefix = "";
        brightnessDevicePins = { };
        wifiNetworkPins = { };
        bluetoothDevicePins = { };
        audioInputDevicePins = { };
        audioOutputDevicePins = { };
        gtkThemingEnabled = false;
        qtThemingEnabled = false;
        syncModeWithPortal = true;
        terminalsAlwaysDark = true;
        runDmsMatugenTemplates = true;
        matugenTemplateGtk = true;
        matugenTemplateNiri = true;
        matugenTemplateHyprland = true;
        matugenTemplateMangowc = true;
        matugenTemplateQt5ct = true;
        matugenTemplateQt6ct = true;
        matugenTemplateFirefox = true;
        matugenTemplatePywalfox = true;
        matugenTeHeymplateZenBrowser = true;
        matugenTemplateVesktop = true;
        matugenTemplateEquibop = true;
        matugenTemplateGhostty = true;
        matugenTemplateKitty = true;
        matugenTemplateFoot = true;
        matugenTemplateAlacritty = true;
        matugenTemplateNeovim = true;
        matugenTemplateWezterm = true;
        matugenTemplateDgop = true;
        matugenTemplateKcolorscheme = true;
        matugenTemplateVscode = true;
        showDock = false;
        dockAutoHide = false;
        dockSmartAutoHide = false;
        dockGroupByApp = false;
        dockOpenOnOverview = false;
        dockPosition = 1;
        dockSpacing = 4;
        dockBottomGap = 0;
        dockMargin = 0;
        dockIconSize = 40;
        dockIndicatorStyle = "circle";
        dockBorderEnabled = false;
        dockBorderColor = "surfaceText";
        dockBorderOpacity = 1;
        dockBorderThickness = 1;
        dockIsolateDisplays = false;
        notificationOverlayEnabled = true;
        modalDarkenBackground = true;
        lockScreenShowPowerActions = true;
        lockScreenShowSystemIcons = true;
        lockScreenShowTime = true;
        lockScreenShowDate = true;
        lockScreenShowProfileImage = true;
        lockScreenShowPasswordField = true;
        lockScreenPowerOffMonitorsOnLock = false;
        enableFprint = false;
        maxFprintTries = 15;
        lockScreenActiveMonitor = "all";
        lockScreenInactiveColor = "#000000";
        lockScreenNotificationMode = 2;
        hideBrightnessSlider = false;
        notificationTimeoutLow = 5000;
        notificationTimeoutNormal = 5000;
        notificationTimeoutCritical = 0;
        notificationCompactMode = false;
        notificationPopupPosition = 0;
        notificationHistoryEnabled = true;
        notificationHistoryMaxCount = 50;
        notificationHistoryMaxAgeDays = 7;
        notificatHeyionHistorySaveLow = true;
        notificationHistorySaveNormal = true;
        notificationHistorySaveCritical = true;
        osdAlwaysShowValue = false;
        osdPosition = 5;
        osdVolumeEnabled = true;
        osdMediaVolumeEnabled = true;
        osdBrightnessEnabled = true;
        osdIdleInhibitorEnabled = true;
        osdMicMuteEnabled = true;
        osdCapsLockEnabled = true;
        osdPowerProfileEnabled = true;
        osdAudioOutputEnabled = true;
        powerActionConfirm = true;
        powerActionHoldDuration = 0.5;
        powerMenuActions = [
          "reboot"
          "logout"
          "poweroff"
          "lock"
          "suspend"
          "restart"
        ];
        powerMenuDefaultAction = "logout";
        powerMenuGridLayout = false;
        customPowerActionLock = "";
        customPowerActionLogout = "";
        customPowerActionSuspend = "";
        customPowerActionHibernate = "";
        customPowerActionReboot = "";
        customPowerActionPowerOff = "";
        updaterHideWidget = true;
        updaterUseCustomCommand = false;
        updaterCustomCommand = "";
        updaterTerminalAdditionalParams = "";
        displayNameMode = "system";
        screenPreferences = {
          notifications = [
            "all"
          ];
        };
        showOnLastDisplay = {
          notifications = true;
        };
        niriOutputSettings = { };
        hyprlandOutputSettings = { };
        barConfigs = [
          {
            id = "default";
            name = "Main Bar";
            enabled = true;
            position = 0;
            screenPreferences = [
              "all"
            ];
            showOnLastDisplay = true;
            leftWidgets = [
              "launcherButton"
              {
                id = "workspaceSwitcher";
                enabled = true;
              }
            ];
            centerWidgets = [
              "clock"
              {
                id = "weather";
                enabled = true;
              }
            ];
            rightWidgets = [
              {
                id = "music";
                enabled = true;
              }
              {
                id = "systemTray";
                enabled = true;
              }
              {
                id = "notificationButton";
                enabled = true;
              }
              {
                id = "clipboard";
                enabled = true;
              }
              {
                id = "battery";
                enabled = true;
              }
              {
                id = "controlCenterButton";
                enabled = true;
              }
            ];
            spacing = 0;
            innerPadding = 3;
            bottomGap = 0;
            transparency = 1;
            widgetTransparency = 1;
            squareCorners = true;
            noBackground = true;
            gothCornersEnabled = true;
            gothCornerRadiusOverride = false;
            gothCornerRadiusValue = 12;
            borderEnabled = false;
            borderColor = "surfaceText";
            borderOpacity = 1;
            borderThickness = 1;
            widgetOutlineEnabled = false;
            widgetOutlineColor = "primary";
            widgetOutlineOpacity = 1;
            widgetOutlineThickness = 1;
            fontScale = 1;
            autoHide = false;
            autoHideDelay = 250;
            showOnWindowsOpen = false;
            openOnOverview = false;
            visible = true;
            popupGapsAuto = true;
            popupGapsManual = 4;
            maximizeDetection = true;
            scrollEnabled = false;
            scrollXBehavior = "column";
            scrollYBehavior = "workspace";
            shadowIntensity = 0;
            shadowOpacity = 60;
            shadowColorMode = "text";
            shadowCustomColor = "#000000";
            clickThrough = false;
          }
        ];
        desktopClockEnabled = false;
        desktopClockStyle = "analog";
        desktopClockTransparency = 0.8;
        desktopClockColorMode = "primary";
        desktopClockCustomColor = {
          r = 1;
          g = 1;
          b = 1;
          a = 1;
          lSaturation = 0;
          hslLightness = 1;
          valid = true;
        };
        desktopClockShowDate = true;
        desktopClockShowAnalogNumbers = false;
        desktopClockShowAnalogSeconds = true;
        sktopClockWidth = 280;
        desktopClockHeight = 180;
        desktopClockDisplayPreferences = [
          "all"
        ];
        systemMonitorEnabled = false;
        systemMonitorShowHeader = true;
        systemMonitorTransparency = 0.8;
        systemMonitorColorMode = "primary";
        systemMonitorCustomColor = {
          r = 1;
          g = 1;
          b = 1;
          a = 1;
          vSaturation = 0;
          hsvValue = 1;
          lSaturation = 0;
          hslLightness = 1;
          valid = true;
        };
        systemMonitorShowCpu = true;
        systemMonitorShowCpuGraph = true;
        systemMonitorShowCpuTemp = true;
        systemMonitorShowGpuTemp = false;
        systemMonitorGpuPciId = "";
        systemMonitorShowMemory = true;
        systemMonitorShowMemoryGraph = true;
        systemMonitorShowNetwork = true;
        systemMonitorShowNetworkGraph = true;
        systemMonitorShowDisk = true;
        systemMonitorShowTopProcesses = false;
        systemMonitorTopProcessCount = 3;
        systemMonitorTopProcessSortBy = "cpu";
        systemMonitorGraphInterval = 60;
        systemMonitorLayoutMode = "auto";
        stemMonitorWidth = 320;
        systemMonitorHeight = 480;
        systemMonitorDisplayPreferences = [
          "all"
        ];
        systemMonitorVariants = [ ];
        desktopWidgetPositions = { };
        desktopWidgetGridSettings = { };
        desktopWidgetInstances = [ ];
        desktopWidgetGroups = [ ];
        builtInPluginSettings = {
          dms_settings_search = {
            trigger = "?";
            enabled = false;
          };
          dms_notepad = {
            enabled = false;
          };
        };
        configVersion = 5;

      };
    };
    home.activation = {
      installPywalfox = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
        set -u
        touch ~/.config/niri/dms/colors.kdl
        mkdir -p ~/.cache/wal
        ln -sfn ~/.cache/wal/dank-pywalfox.json ~/.cache/wal/colors.json 2>/dev/null
      '';
    };
  };
}
