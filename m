From: Robert Jarzmik <robert.jarzmik@free.fr>
Subject: [PATCH] gpio: pxa: fix legacy non pinctrl aware builds again
Date: Thu, 15 Nov 2018 18:16:38 +0100
Message-ID: <20181115171638.5704-1-robert.jarzmik@free.fr>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Robert Jarzmik <robert.jarzmik@free.fr>, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

As pointed out by Gregor, spitz keyboard matrix is broken, with or
without CONFIG_PINCTRL set, quoting :
"The gpio matrix keypard on the Zaurus C3x00 (see spitz.c) does not work
properly. Noticeable are that rshift+c does nothing where as lshift+c
creates C.  Opposite it is for rshift+a vs lshift+a, here only rshift
works. This affects a few other combinations using the rshift or lshift
buttons."

As a matter of fact, as for platform_data based builds CONFIG_PINCTRL=n
is required for now (as opposed for devicetree builds where it should be
set), this means gpio driver should change the direction, which is what
was attempted by commit c4e5ffb6f224 ("gpio: pxa: fix legacy non pinctrl
aware builds").

Unfortunately, the input case was inverted, and the direction change was
never done. This wasn't seen up until now because the initial platform
setup (MFP) was setting this direction. Yet in Gregory's case, the
matrix-keypad driver changes back and forth the direction dynamically,
and this is why he's the first to report it.

Fixes: c4e5ffb6f224 ("gpio: pxa: fix legacy non pinctrl aware builds")
Tested-by: Greg <greguu@null.net>
Signed-off-by: Robert Jarzmik <robert.jarzmik@free.fr>
---
 drivers/gpio/gpio-pxa.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-pxa.c b/drivers/gpio/gpio-pxa.c
index 63536655f274..501147c5f3ca 100644
--- a/drivers/gpio/gpio-pxa.c
+++ b/drivers/gpio/gpio-pxa.c
@@ -268,8 +268,8 @@ static int pxa_gpio_direction_input(struct gpio_chip *chip, unsigned offset)
 
 	if (pxa_gpio_has_pinctrl()) {
 		ret = pinctrl_gpio_direction_input(chip->base + offset);
-		if (!ret)
-			return 0;
+		if (ret)
+			return ret;
 	}
 
 	spin_lock_irqsave(&gpio_lock, flags);
-- 
2.11.0
