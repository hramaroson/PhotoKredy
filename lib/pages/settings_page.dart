// Copyright (C) 2018  Herizo Ramaroson
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program.  If not, see <http://www.gnu.org/licenses/>.

import 'package:flutter/material.dart';
import 'package:preferences/preferences.dart';
 
import 'package:photokredy/localizations.dart';
import 'package:photokredy/application.dart';

class SettingsPage extends StatelessWidget {
  Widget build(BuildContext context){
    return Scaffold (
      appBar: new AppBar(title: new Text(AppLocalizations.of(context).settingsPageTitle())),
      body: PreferencePage([
        PreferenceTitle(AppLocalizations.of(context).settingsPageGeneralPreferenceTitle()),

        DropdownPreference(
          AppLocalizations.of(context).settingsPageLanguageDropdownLabel(),  
          "language",
          desc: AppLocalizations.of(context).settingsPageLanguageDropdownDesc(),
          defaultVal: Localizations.localeOf(context).languageCode,
          values: application.supportedLanguagesCodes,
          displayValues: application.supportedLanguages,
          onChange: (languageCode) {
              application.onLocaleChanged(Locale(languageCode));
          }
        ),

        SwitchPreference(
          AppLocalizations.of(context).settingsPageSoundSwitchLabel(), 
          "sound",
          desc: AppLocalizations.of(context).settingsPageSoundSwitchDesc(),
          defaultVal: application.soundEnabled,
          onEnable: () {
              application.soundEnabled = true;
          },
          onDisable: () {
              application.soundEnabled = false;
          }
        )

      ]),
    );
  }
}