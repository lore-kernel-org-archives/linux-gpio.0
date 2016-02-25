From: Gabor Juhos <juhosg@openwrt.org>
Subject: [PATCH] Documentation: gpio: board: fix GPIO_LOOKUP{,_IDX} documentation
Date: Thu, 25 Feb 2016 08:00:45 +0100
Message-ID: <1456383645-26941-1-git-send-email-juhosg@openwrt.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from arrakis.dune.hu ([78.24.191.176]:34721 "EHLO arrakis.dune.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1758068AbcBYHBC (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Thu, 25 Feb 2016 02:01:02 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org, Gabor Juhos <juhosg@openwrt.org>

The 'dev_id' parameter of the GPIO_LOOKUP{,_IDX} macros were removed by
commit ad824783fb23 ("gpio: better lookup method for platform GPIOs").

Update the documentation to reflect that.

Signed-off-by: Gabor Juhos <juhosg@openwrt.org>
---
 Documentation/gpio/board.txt |   11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/Documentation/gpio/board.txt b/Documentation/gpio/board.txt
index 3092178..86d3fa9 100644
--- a/Documentation/gpio/board.txt
+++ b/Documentation/gpio/board.txt
@@ -111,16 +111,13 @@ files that desire to do so need to include the following header:
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
@@ -134,7 +131,9 @@ In the future, these flags might be extended to support more properties.
 Note that GPIO_LOOKUP() is just a shortcut to GPIO_LOOKUP_IDX() where idx = 0.
 
 A lookup table can then be defined as follows, with an empty entry defining its
-end:
+end. The 'dev_id' field of the table is the identifier of the device that will
+make use of these GPIOs. It can be NULL, in which case it will be matched for
+calls to gpiod_get() with a NULL device.
 
 struct gpiod_lookup_table gpios_table = {
 	.dev_id = "foo.0",
-- 
1.7.10
