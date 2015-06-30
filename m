From: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
Subject: [PATCH] Documentation: gpio: correct platform data section
Date: Tue, 30 Jun 2015 16:07:52 -0400
Message-ID: <1435694872-23860-1-git-send-email-vivien.didelot@savoirfairelinux.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Vivien Didelot <vivien.didelot@savoirfairelinux.com>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-kernel@vger.kernel.org, kernel@savoirfairelinux.com
List-Id: linux-gpio@vger.kernel.org

The GPIO_LOOKUP_IDX macro has no dev_id parameter. Remove it from the
examples and move the dev_id description under the gpiod_lookup_table
example, where it belongs.

The gpio_lookup_flags are prefixed GPIO_, not GPIOF_. So correct the
flag list, and also add GPIO_ACTIVE_HIGH.

Finally rename the board.txt documentation file to machine.txt, to be
consistent with the related include/linux/gpio/machine.h file, similar
to the regulator files.

Signed-off-by: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
---
 Documentation/gpio/00-INDEX                   |  2 +-
 Documentation/gpio/{board.txt => machine.txt} | 18 ++++++++++--------
 2 files changed, 11 insertions(+), 9 deletions(-)
 rename Documentation/gpio/{board.txt => machine.txt} (90%)

diff --git a/Documentation/gpio/00-INDEX b/Documentation/gpio/00-INDEX
index 1de43ae..8def47e 100644
--- a/Documentation/gpio/00-INDEX
+++ b/Documentation/gpio/00-INDEX
@@ -6,7 +6,7 @@ consumer.txt
 	- How to obtain and use GPIOs in a driver
 driver.txt
 	- How to write a GPIO driver
-board.txt
+machine.txt
 	- How to assign GPIOs to a consumer device and a function
 sysfs.txt
 	- Information about the GPIO sysfs interface
diff --git a/Documentation/gpio/board.txt b/Documentation/gpio/machine.txt
similarity index 90%
rename from Documentation/gpio/board.txt
rename to Documentation/gpio/machine.txt
index b80606d..7000754 100644
--- a/Documentation/gpio/board.txt
+++ b/Documentation/gpio/machine.txt
@@ -98,23 +98,21 @@ files that desire to do so need to include the following header:
 GPIOs are mapped by the means of tables of lookups, containing instances of the
 gpiod_lookup structure. Two macros are defined to help declaring such mappings:
 
-	GPIO_LOOKUP(chip_label, chip_hwnum, dev_id, con_id, flags)
-	GPIO_LOOKUP_IDX(chip_label, chip_hwnum, dev_id, con_id, idx, flags)
+	GPIO_LOOKUP(chip_label, chip_hwnum, con_id, flags)
+	GPIO_LOOKUP_IDX(chip_label, chip_hwnum, con_id, idx, flags)
 
 where
 
   - chip_label is the label of the gpiod_chip instance providing the GPIO
   - chip_hwnum is the hardware number of the GPIO within the chip
-  - dev_id is the identifier of the device that will make use of this GPIO. It
-	can be NULL, in which case it will be matched for calls to gpiod_get()
-	with a NULL device.
   - con_id is the name of the GPIO function from the device point of view. It
 	can be NULL, in which case it will match any function.
   - idx is the index of the GPIO within the function.
   - flags is defined to specify the following properties:
-	* GPIOF_ACTIVE_LOW	- to configure the GPIO as active-low
-	* GPIOF_OPEN_DRAIN	- GPIO pin is open drain type.
-	* GPIOF_OPEN_SOURCE	- GPIO pin is open source type.
+	* GPIO_ACTIVE_HIGH	- to configure the GPIO as active-high
+	* GPIO_ACTIVE_LOW	- to configure the GPIO as active-low
+	* GPIO_OPEN_DRAIN	- GPIO pin is open drain type.
+	* GPIO_OPEN_SOURCE	- GPIO pin is open source type.
 
 In the future, these flags might be extended to support more properties.
 
@@ -134,6 +132,10 @@ struct gpiod_lookup_table gpios_table = {
 	},
 };
 
+where dev_id is the identifier of the device that will make use of these
+GPIOs. It can be NULL, in which case it will be matched for calls to
+gpiod_get() with a NULL device.
+
 And the table can be added by the board code as follows:
 
 	gpiod_add_lookup_table(&gpios_table);
-- 
2.4.5
