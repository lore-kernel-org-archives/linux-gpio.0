From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [RFC PATCH v1] pinctrl: meson: meson8b: fix requesting GPIOs greater than GPIOZ_3
Date: Wed, 24 Jan 2018 01:27:38 +0100
Message-ID: <20180124002738.32338-1-martin.blumenstingl@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wm0-f67.google.com ([74.125.82.67]:43575 "EHLO
        mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752455AbeAXA1r (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 23 Jan 2018 19:27:47 -0500
Received: by mail-wm0-f67.google.com with SMTP id g1so5175292wmg.2
        for <linux-gpio@vger.kernel.org>; Tue, 23 Jan 2018 16:27:47 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: khilman@baylibre.com, linux-gpio@vger.kernel.org, linux-amlogic@lists.infradead.org, carlo@caione.org, jbrunet@baylibre.com
Cc: linus.walleij@linaro.org, linus.luessing@c0d3.blue, Martin Blumenstingl <martin.blumenstingl@googlemail.com>

Meson8b is a cost reduced variant of the Meson8 SoC. It's package size
is smaller than Meson8.
Unfortunately there are a few key differences which cannot be seen
without close inspection of the code and the public S805 data-sheet:
- the GPIOX bank is missing the GPIOX_12, GPIOX_13, GPIOX_14 and
  GPIOX_15 GPIOs
- the GPIOY bank is missing the GPIOY_2, GPIOY_4, GPIOY_5, GPIOY_15 and
  GPIOY_16 GPIOs
- the GPIODV bank is missing all GPIOs except GPIODV_9, GPIODV_24,
  GPIODV_25, GPIODV_26, GPIODV_27, GPIODV_28 and GPIODV_29
- the GPIOZ bank is missing completely
- there is a new GPIO bank called "DIF"
- (all other pads exist on both, Meson8 and Meson8b)

The pinctrl-meson driver internally uses struct meson_bank, which
assumes that the GPIOs are continuous, without any holes in between.
This also matches with how the registers work:
- GPIOX_0 for example uses bit 0 for switching this pad between
  input/output, configuring pull-up/down, etc.
- GPIOX_16 uses bit 16 for switching this pad between input/output,
  configuring pull-up/down/, etc
GPIOX_16 uses bit 16 even though GPIOX12..15 don't exist. (This is
probably the reason why Meson8b inherits the dt-bindings - with all GPIO
IDs - from Meson8)
This means that Meson8b only has 83 actual GPIO lines. Without any holes
there would be 130 GPIO lines in total (120 are inherited from Meson8
plus 10 new from the DIF bank).

The pinctrl framework handles holes in the pin list fine, which can be
seen in debugfs:
$ cat /sys/kernel/debug/pinctrl/c1109880.pinctrl/pins
pin 9 (GPIOX_9)  c1109880.pinctrl
pin 10 (GPIOX_10)  c1109880.pinctrl
pin 11 (GPIOX_11)  c1109880.pinctrl
pin 16 (GPIOX_16)  c1109880.pinctrl
pin 17 (GPIOX_17)  c1109880.pinctrl

GPIOs which don't exist cannot be requested either ("base" of the GPIO
controller is 382):
$ echo 394 > /sys/class/gpio/export
meson8b-pinctrl c1109880.pinctrl: pin 12 is not registered so it cannot be requested
meson8b-pinctrl c1109880.pinctrl: pin-12 (cbus-banks:394) status -22

Unfortunately GPIOs greater GPIOZ_3 (whose ID is 83 - as a reminder:
this is exactly the number of actual GPIO lines on Meson8b) cannot be
requested. Using CARD_6 (ID 100, "base of the GPIO controller is 382) as
an example:
$ echo 482 > /sys/class/gpio/export
export_store: invalid GPIO 482

The problem here is that struct gpio_chip's "ngpio" is set to 83. Thus
requesting a GPIO higher than 83 fails. Commit 984cffdeaeb7ea ("pinctrl:
Fix gpio/pin mapping for Meson8b") fixed this problem a while ago, by
setting "ngpio" to 130. Unfortunately this broke again while cleaning up
the pinctrl-meson driver in commit db80f0e158e621 ("pinctrl: meson: get
rid of unneeded domain structures"), which started using
ARRAY_SIZE(meson8b_cbus_pins) - which evaluates to 83 - as "ngpio".

This is now fixed by introducing a new "override_ngpio" field in struct
meson_pinctrl_data. This value is passed to struct gpio_chip's "ngpio"
when set - if override_ngpio is <= 0 then num_pins is used (which works
for all other Meson SoCs, except Meson8b).
The definitions in "include/dt-bindings/gpio/meson8b-gpio.h" were not
changed. Cleaning up these definitions would allow us to get rid of the
GPIOZ definitions (which are inherited from Meson8). However, we still
need to handle GPIO banks with holes (such as GPIOX), so this include is
not touched for now (touching it could also break the device-tree ABI).

Meson8b's AO GPIO controller is not affected by this issue since it does
not have any holes in it - only the CBUS GPIO controller is affected.

This was initially seen by Linus Lüssing who was preparing SD card
support on Odroid-C1 which uses CARD_6 as "card detect" GPIO.

Fixes: db80f0e158e621 ("pinctrl: meson: get rid of unneeded domain structures")
Reported-by: Linus Lüssing <linus.luessing@c0d3.blue>
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/pinctrl/meson/pinctrl-meson.c   |  7 ++++++-
 drivers/pinctrl/meson/pinctrl-meson.h   |  1 +
 drivers/pinctrl/meson/pinctrl-meson8b.c | 14 ++++++++++++++
 3 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/meson/pinctrl-meson.c b/drivers/pinctrl/meson/pinctrl-meson.c
index 29a458da78db..1befe67fd187 100644
--- a/drivers/pinctrl/meson/pinctrl-meson.c
+++ b/drivers/pinctrl/meson/pinctrl-meson.c
@@ -413,7 +413,12 @@ static int meson_gpiolib_register(struct meson_pinctrl *pc)
 	pc->chip.get = meson_gpio_get;
 	pc->chip.set = meson_gpio_set;
 	pc->chip.base = -1;
-	pc->chip.ngpio = pc->data->num_pins;
+
+	if (pc->data->override_ngpio > 0)
+		pc->chip.ngpio = pc->data->override_ngpio;
+	else
+		pc->chip.ngpio = pc->data->num_pins;
+
 	pc->chip.can_sleep = false;
 	pc->chip.of_node = pc->of_node;
 	pc->chip.of_gpio_n_cells = 2;
diff --git a/drivers/pinctrl/meson/pinctrl-meson.h b/drivers/pinctrl/meson/pinctrl-meson.h
index 183b6e471635..afd7efaad9bb 100644
--- a/drivers/pinctrl/meson/pinctrl-meson.h
+++ b/drivers/pinctrl/meson/pinctrl-meson.h
@@ -108,6 +108,7 @@ struct meson_pinctrl_data {
 	struct meson_bank *banks;
 	unsigned int num_banks;
 	const struct pinmux_ops *pmx_ops;
+	unsigned int override_ngpio;
 };
 
 struct meson_pinctrl {
diff --git a/drivers/pinctrl/meson/pinctrl-meson8b.c b/drivers/pinctrl/meson/pinctrl-meson8b.c
index 5bd808dc81e1..05bb4c3143d9 100644
--- a/drivers/pinctrl/meson/pinctrl-meson8b.c
+++ b/drivers/pinctrl/meson/pinctrl-meson8b.c
@@ -916,6 +916,20 @@ static struct meson_pinctrl_data meson8b_cbus_pinctrl_data = {
 	.num_funcs	= ARRAY_SIZE(meson8b_cbus_functions),
 	.num_banks	= ARRAY_SIZE(meson8b_cbus_banks),
 	.pmx_ops	= &meson8_pmx_ops,
+	/*
+	 * there are holes in the meson8b_cbus_pins mapping because we are
+	 * mapping the GPIO identifiers to register bits. on Meson8b some bits
+	 * (and thus the corresponding pads) are not used on the SoC
+	 * (presumably because they were skipped because Meson8b is a cost
+	 * reduced variant of Meson8 and it didn't make sense to create a whole
+	 * new register layout for this variant).
+	 * this informs the GPIO framework know about the number of GPIOs we
+	 * have, including the pins which are not available on Meson8b (= the
+	 * holes). The pinctrl/GPIO framework knows the holes because it checks
+	 * all pinctrl_pin_desc in meson8b_cbus_pins and reports an error as
+	 * soon as a GPIO is requested which is not part of meson8b_cbus_pins.
+	 */
+	.override_ngpio	= 130,
 };
 
 static struct meson_pinctrl_data meson8b_aobus_pinctrl_data = {
-- 
2.16.1

