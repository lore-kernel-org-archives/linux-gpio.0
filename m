From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: [PATCH] pinctrl: cherryview: limit Strago DMI workarounds to version
 1.0
Date: Tue, 28 Nov 2017 11:14:35 -0800
Message-ID: <20171128191435.uxftu3bl4x4f2fxi@dtor-ws>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Guenter Roeck <linux@roeck-us.net>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

As Google/Intel will fix the BIOS/Coreboot issues with hardcoding
virtual interrupt numbers for keyboard/touchpa/touchscreen controllers
in ACPI tables, they will also update BIOS version number from 1.0
to 1.1. Let's limit the DMI quirks that try to preserve virtual IRQ
numbers on Strago boards to those that still carry BIOSes 1.0.

Bugzilla: https://bugzilla.kernel.org/show_bug.cgi?id=197953
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/pinctrl/intel/pinctrl-cherryview.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/pinctrl/intel/pinctrl-cherryview.c b/drivers/pinctrl/intel/pinctrl-cherryview.c
index be37946182e1..b22ea0fe86f1 100644
--- a/drivers/pinctrl/intel/pinctrl-cherryview.c
+++ b/drivers/pinctrl/intel/pinctrl-cherryview.c
@@ -1545,6 +1545,7 @@ static const struct dmi_system_id chv_no_valid_mask[] = {
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "GOOGLE"),
 			DMI_MATCH(DMI_PRODUCT_FAMILY, "Intel_Strago"),
+			DMI_MATCH(DMI_BIOS_VERSION, "1.0"),
 		},
 	},
 	{
@@ -1552,6 +1553,7 @@ static const struct dmi_system_id chv_no_valid_mask[] = {
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "HP"),
 			DMI_MATCH(DMI_PRODUCT_NAME, "Setzer"),
+			DMI_MATCH(DMI_BIOS_VERSION, "1.0"),
 		},
 	},
 	{
@@ -1559,6 +1561,7 @@ static const struct dmi_system_id chv_no_valid_mask[] = {
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "GOOGLE"),
 			DMI_MATCH(DMI_PRODUCT_NAME, "Cyan"),
+			DMI_MATCH(DMI_BIOS_VERSION, "1.0"),
 		},
 	},
 	{
@@ -1566,6 +1569,7 @@ static const struct dmi_system_id chv_no_valid_mask[] = {
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "GOOGLE"),
 			DMI_MATCH(DMI_PRODUCT_NAME, "Celes"),
+			DMI_MATCH(DMI_BIOS_VERSION, "1.0"),
 		},
 	},
 	{}
-- 
2.15.0.417.g466bffb3ac-goog


-- 
Dmitry
