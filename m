From: Robert Jarzmik <robert.jarzmik@free.fr>
Subject: Re: Problems with commit a770d946371e ("gpio: pxa: add pin control gpio direction and request")
Date: Sun, 27 Mar 2016 22:29:00 +0200
Message-ID: <87oa9zr7g3.fsf@belgarion.home>
References: <56F730DF.9080307@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from smtp11.smtpout.orange.fr ([80.12.242.133]:24978 "EHLO
	smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751532AbcC0U3H (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sun, 27 Mar 2016 16:29:07 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Guenter Roeck <guenter@roeck-us.net>
Cc: Linus Walleij <linus.walleij@linaro.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

Guenter Roeck <guenter@roeck-us.net> writes:

> Hi,
Hi Guenter,

> when trying pxa_defconfig with various pxa270 and pxa255 qemu targets, I
> noticed that the gpio pin direction is no longer set. Bisect points to commit
> a770d946371e ("gpio: pxa: add pin control gpio direction and request").
This is a bug, you're perfectly right.

> As it turns out, pxa_defconfig does not configure PINCTRL. As a result,
> pinctrl stub functions are used.
Not having PINCTRL for pxa platforms is also right : only pxa device-tree
platforms will have pinctrl in a first stage, the legacy ones will lives for
several cycles without pinctrl.

> Those all return 0 if PINCTRL is not configured. This causes the pxa gpio
> driver to wrongly assume that pinctrl configured the gpio pin direction, and
> does nothing.
And as you explain, this is the root case.

> Looking into gpio-mvebu.c, its use of the pinctrl functions is completely
> different. It aborts on error, not on success, from the pinctrl
> functions.
> Given that, I have no idea how to resolve the problem. Having the stub
> functions return an error might cause the mvebu driver (and maybe others) to
> fail if there is no pinctrl driver, so that does not seem to be an option.
You're right, it's the inverted logic in pxa_gpio_direction_output() which is at
fault, ie. the commit you pointed out.

> If the idea is to mandate pinctrl for PXA architectures, it should probably be
> enabled for those architectures. Unless I am missing something, PXA
> architectures to not select PINCTRL, which suggests that the problem may
> affect a wide range of systems. Please have a look.
As I said above, selecting PINCTRL is not yet an option. But fixing gpio-pxa is
a necessity for sure. It is beyond me how this can pass through my
non-regression Jenkins ... oh wait, I found :
 - pxa machine files still use the old "mfp" stuff
 - in this mfp (arch/arm/mach-pxa/mfp-pxa[23]xxx.c", GPDR is directly accessed

But no more poor excuses, would you try the patch at the end of this mail, while
I'm doing the same on my Jenkins, on both device-tree and legacy platform-data
builds, to see if we can fix this ?

Cheers.

-- 
Robert

---8<---
>From 05c5c95d4ee77918be9c2ef271edf8dcd492ab81 Mon Sep 17 00:00:00 2001
From: Robert Jarzmik <robert.jarzmik@free.fr>
Date: Sun, 27 Mar 2016 21:13:20 +0200
Subject: [PATCH] gpio: pxa: fix legacy non pinctrl aware builds

In legacy pxa builds, ie. non device-tree and platform-data only builds,
pinctrl is not yet available. As a consequence, the pinctrl gpio
direction change function is a stub, returning always success.

In the current state, the gpio driver direction function believes the
pinctrl direction change was successful, and exits without actually
changing the gpio direction.

This patch changes the logic :
 - if the pinctrl direction function fails, gpio direction will report
   that failure
 - if the pinctrl direction function succeeds, gpio direction is changed
   by the gpio driver anyway.
   This is sub optimal in the pinctrl aware case, as the gpio direction
   will be changed twice: once by pinctrl function and another time by
   the gpio direction function.

Yet it should be acceptable in this form, as this is functional for all
pxa platforms (device-tree and platform-data), and moreover changing a
gpio direction is very very seldom, usually in machine initialization,
seldom in drivers probe, and an exception for ac97 reset bug.

Fixes: a770d946371e ("gpio: pxa: add pin control gpio direction and request")
Reported-by: Guenter Roeck <guenter@roeck-us.net>
Signed-off-by: Robert Jarzmik <robert.jarzmik@free.fr>
---
 drivers/gpio/gpio-pxa.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-pxa.c b/drivers/gpio/gpio-pxa.c
index b2b7b78664b8..76ac906b4d78 100644
--- a/drivers/gpio/gpio-pxa.c
+++ b/drivers/gpio/gpio-pxa.c
@@ -283,8 +283,8 @@ static int pxa_gpio_direction_output(struct gpio_chip *chip,
 	writel_relaxed(mask, base + (value ? GPSR_OFFSET : GPCR_OFFSET));
 
 	ret = pinctrl_gpio_direction_output(chip->base + offset);
-	if (!ret)
-		return 0;
+	if (ret)
+		return ret;
 
 	spin_lock_irqsave(&gpio_lock, flags);
 
-- 
2.1.4

