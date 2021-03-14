/*
 *  Copyright (C) 2020 Darshak Parikh
 *  Copyright (C) 2021 gavr
 *
 *  This program is free software: you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation, either version 3 of the License, or
 *  (at your option) any later version.
 *
 *  This program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with this program.  If not, see <https://www.gnu.org/licenses/>.
 *
 *  Authored by: Darshak Parikh <darshak@protonmail.com>
 *  Authored by: gavr <gavr123456789 at gmail.com>
 *
 */
 
using Gtk;
using Gdk;

namespace Easypass {
	public class MainWindow : Gtk.ApplicationWindow {

		public MainWindow (Gtk.Application app) {
			Object (application: app);
		}
		construct {
			var lblSite =   new Label("Site:") { halign = Gtk.Align.END };
            var entrySite = new Entry();
            var imgTip =    new Image.from_icon_name("dialog-information-symbolic") { 
                halign = Gtk.Align.START, 
                tooltip_text = "Use only domain name without .com etc." };

            var lblKeyWord =    new Label("Key Word:") { halign = Gtk.Align.END };
            var entryKey =      new PasswordEntry() { show_peek_icon = true};
            var generateBtn =   new Button.with_label("Generate");
            var generatedPass = new PasswordEntry() { show_peek_icon = true };
        
            generateBtn.clicked.connect(() => {
                try {
                    generatedPass.text = Crypto.derive_password(entryKey.text, entrySite.text.down());
                } catch (CryptoError error) {
                    prin("CRYPRO ERROR");
                }
            });

            var grid = new Grid() { 
                halign = Gtk.Align.CENTER, 
                margin_end = 30, 
                margin_start = 30, 
                margin_top = 30, 
                row_spacing = 4, 
                column_spacing = 4
            };

            grid.attach (lblSite, 0, 0);
            grid.attach_next_to (entrySite, lblSite, RIGHT);
            grid.attach_next_to (imgTip, entrySite, RIGHT);

            grid.attach (lblKeyWord, 0, 1);
            grid.attach_next_to (entryKey, lblKeyWord, RIGHT);

            grid.attach (generateBtn, 0, 2, 4, 1);
            grid.attach (generatedPass, 0, 3, 4, 1);
            set_child (grid);
		}
	}
}

[Print] 
public void prin(string x) { stdout.printf(x + "\n"); }

