[//]: # (If you want to make changes to this README, you need to also modify the README.md in the docs folder as well)
<h1 align="center">Helmet on Ass</h1>
<p align="center">
    <a href="https://github.com/DartsArmaMods/HelmetOnAss/releases/latest">
        <img src="https://img.shields.io/badge/Version-0.0.0-blue?style=flat-square" alt="Helmet on Ass Version">
    </a>
    <a href="https://github.com/DartsArmaMods/HelmetOnAss/issues">
        <img src="https://img.shields.io/github/issues-raw/DartsArmaMods/HelmetOnAss.svg?style=flat-square&label=Issues" alt="Helmet on Ass Issues">
    </a>
    <a href="https://steamcommunity.com/sharedfiles/filedetails/?id=3487820370">
        <img src="https://img.shields.io/steam/downloads/3487820370.svg?style=flat-square&label=Downloads" alt="Helmet on Ass Downloads">
    </a>
    <a href="https://github.com/DartsArmaMods/HelmetOnAss/blob/master/LICENSE">
        <img src="https://img.shields.io/badge/License-Legion Studios-red?style=flat-square" alt="Helmet on Ass License">
    </a>
    <img src="https://img.shields.io/github/actions/workflow/status/DartsArmaMods/HelmetOnAss/hemtt.yml?style=flat-square&label=HEMTT" alt="HEMTT">
</p>

<p align="center">
    <b>Requires the latest version of <a href="https://github.com/CBATeam/CBA_A3/releases/latest">CBA</a> and <a href="https://github.com/acemod/ACE3/releases/latest">ACE3</a></b>
</p>

**Helmet on Ass** adds a simple ACE interaction and keybind to sling your helmet, facewear, and nvgs to a configurable point.

The project is entirely **open-source** and any contributions are welcome.

## Core Features
- Ability to sling your worn helmet, nvgs, and/or facewear to a customizable position.
- Ability to throw your (worn or slung) helmet as a ~~last resort~~ tactical option.
- ACE Arsenal action to sling / swap your helmet.
- Ability to save / load slung items to loadouts.

## Contributing
For new contributers, see the [Contributing Setup & Guidelines](https://github.com/DartsArmaMods/HelmetOnAss/blob/main/.github/CONTRIBUTING.md).

## License
Helmet on Ass is licensed under the [Legion Studios License](https://github.com/DartsArmaMods/HelmetOnAss/blob/main/LICENSE.md).

Helmet on Ass uses a custom model for the ground holder that helmets are placed in, this model is a reupload (with permission) of the model from [GRAD_slingHelmet](https://github.com/gruppe-adler/grad_slingHelmet/blob/master/addons/main/model.p3d) and is instead licensed under the [GRAD APL](https://github.com/gruppe-adler/grad_slingHelmet/blob/master/LICENSE) license.

## For Modders
There are two custom config properties for helmets, nvgs, and facewear.
```cpp
hoa_sling_slingWithHelmet = 1; // 0-Nothing, 1-Sling with helmet
hoa_sling_hideWhenSlung = 0;   // 0-Nothing, 1-Hide item when slung
```

You can add your own sling option by calling hoa_sling_fnc_addSlingOption:
```sqf
["Sling Option Name", _position, [_vectorDir, _vectorUp]] call hoa_sling_fnc_addSlingOption;
```

This will have it appear in the CBA setting and allow people to select it. If you'd like, you can also create pull request adding it as a default option in the mod.

## For Screenshot Makers
There are "Sling Items" and "Unsling Items" Zeus modules and [ZEN Context Menu](https://steamcommunity.com/sharedfiles/filedetails/?id=1779063631) actions. These can be used on units (including "Unit Animator" modules from [Enhanced Artwork Supporter](https://steamcommunity.com/sharedfiles/filedetails/?id=2776005424)), which will let you sling items for making screenshots or videos.
