From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] gpio: vx855: use the new open drain callback
Date: Sun, 10 Apr 2016 12:34:28 +0200
Message-ID: <1460284468-10149-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f45.google.com ([209.85.215.45]:33082 "EHLO
	mail-lf0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752285AbcDJKef (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sun, 10 Apr 2016 06:34:35 -0400
Received: by mail-lf0-f45.google.com with SMTP id e190so121796330lfe.0
        for <linux-gpio@vger.kernel.org>; Sun, 10 Apr 2016 03:34:34 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Daniel Drake <drake@endlessm.com>

The vx855 driver clearly states it has three groups of lines:
GPI, GPO and GPIO. The GPO are assumedly push-pull. The GPIO
are implicit open drain, but if the GPIO subsystem ask for them
to be explicitly open drain (i.e. set the flag on a machine table
that we want open drain) it will currently misbehave: it will
switch the GPIOs to input mode (emulate open drain). Instead:
indicate in the .set_single_ended() callback that we support
open drain and open drain only.

Cc: Daniel Drake <drake@endlessm.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-vx855.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/gpio/gpio-vx855.c b/drivers/gpio/gpio-vx855.c
index 8cdb9f7ec7e0..4e450121129b 100644
--- a/drivers/gpio/gpio-vx855.c
+++ b/drivers/gpio/gpio-vx855.c
@@ -186,6 +186,28 @@ static int vx855gpio_direction_output(struct gpio_chip *gpio,
 	return 0;
 }
 
+static int vx855gpio_set_single_ended(struct gpio_chip *gpio,
+				      unsigned int nr,
+				      enum single_ended_mode mode)
+{
+	/* The GPI cannot be single-ended */
+	if (nr < NR_VX855_GPI)
+		return -EINVAL;
+
+	/* The GPO's are push-pull */
+	if (nr < NR_VX855_GPInO) {
+		if (mode != LINE_MODE_PUSH_PULL)
+			return -ENOTSUPP;
+		return 0;
+	}
+
+	/* The GPIO's are open drain */
+	if (mode != LINE_MODE_OPEN_DRAIN)
+		return -ENOTSUPP;
+
+	return 0;
+}
+
 static const char *vx855gpio_names[NR_VX855_GP] = {
 	"VX855_GPI0", "VX855_GPI1", "VX855_GPI2", "VX855_GPI3", "VX855_GPI4",
 	"VX855_GPI5", "VX855_GPI6", "VX855_GPI7", "VX855_GPI8", "VX855_GPI9",
@@ -209,6 +231,7 @@ static void vx855gpio_gpio_setup(struct vx855_gpio *vg)
 	c->direction_output = vx855gpio_direction_output;
 	c->get = vx855gpio_get;
 	c->set = vx855gpio_set;
+	c->set_single_ended = vx855gpio_set_single_ended;
 	c->dbg_show = NULL;
 	c->base = 0;
 	c->ngpio = NR_VX855_GP;
-- 
2.4.3

