From: Luis Henriques <luis.henriques@canonical.com>
Subject: [3.11.y.z extended stable] Patch "gpio: twl4030: Fix regression for twl gpio output" has been added to staging queue
Date: Thu,  5 Dec 2013 11:20:38 +0000
Message-ID: <1386242438-28509-1-git-send-email-luis.henriques@canonical.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from youngberry.canonical.com ([91.189.89.112]:34949 "EHLO
	youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752228Ab3LELUl (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 5 Dec 2013 06:20:41 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Tony Lindgren <tony@atomide.com>
Cc: linux-gpio@vger.kernel.org, Peter Ujfalusi <peter.ujfalusi@ti.com>, Linus Walleij <linus.walleij@linaro.org>, Luis Henriques <luis.henriques@canonical.com>, kernel-team@lists.ubuntu.com

This is a note to let you know that I have just added a patch titled

    gpio: twl4030: Fix regression for twl gpio output

to the linux-3.11.y-queue branch of the 3.11.y.z extended stable tree 
which can be found at:

 http://kernel.ubuntu.com/git?p=ubuntu/linux.git;a=shortlog;h=refs/heads/linux-3.11.y-queue

If you, or anyone else, feels it should not be added to this tree, please 
reply to this email.

For more information about the 3.11.y.z tree, see
https://wiki.ubuntu.com/Kernel/Dev/ExtendedStable

Thanks.
-Luis

------

>From b71699df238e61274d47b43161320fe67e50568e Mon Sep 17 00:00:00 2001
From: Tony Lindgren <tony@atomide.com>
Date: Mon, 18 Nov 2013 15:22:49 -0800
Subject: gpio: twl4030: Fix regression for twl gpio output

commit 0b2aa8bed3e13892fcac77e4f50ec6e80125469d upstream.

Commit c111feabe2e2 (gpio: twl4030: Cache the direction and output
states in private data) improved things in general, but caused a
regression for setting the GPIO output direction.

The change reorganized twl_direction_out() and twl_set() and swapped
the function names around in the process. While doing that, a bug got
introduced that's not obvious while reading the patch as it appears
as no change to the code.

The bug is we now call function twl4030_set_gpio_dataout() twice in
both twl_direction_out() and twl_set(). Instead, we should first
call twl_direction_out() in twl_direction_out() followed by
twl4030_set_gpio_dataout() in twl_set().

This regression probably has gone unnoticed for a long time as the
bootloader may have set the GPIO direction properly in many cases.
This fixes at least the LCD panel not turning on omap3 LDP for
example.

Cc: linux-gpio@vger.kernel.org
Reviewed-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
Acked-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Tony Lindgren <tony@atomide.com>
Signed-off-by: Luis Henriques <luis.henriques@canonical.com>
---
 drivers/gpio/gpio-twl4030.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-twl4030.c b/drivers/gpio/gpio-twl4030.c
index 4d330e3..ed1d10a 100644
--- a/drivers/gpio/gpio-twl4030.c
+++ b/drivers/gpio/gpio-twl4030.c
@@ -354,17 +354,18 @@ static void twl_set(struct gpio_chip *chip, unsigned offset, int value)
 static int twl_direction_out(struct gpio_chip *chip, unsigned offset, int value)
 {
 	struct gpio_twl4030_priv *priv = to_gpio_twl4030(chip);
+	int ret = -EINVAL;

 	mutex_lock(&priv->mutex);
 	if (offset < TWL4030_GPIO_MAX)
-		twl4030_set_gpio_dataout(offset, value);
+		ret = twl4030_set_gpio_direction(offset, 0);

 	priv->direction |= BIT(offset);
 	mutex_unlock(&priv->mutex);

 	twl_set(chip, offset, value);

-	return 0;
+	return ret;
 }

 static int twl_to_irq(struct gpio_chip *chip, unsigned offset)
--
1.8.3.2

