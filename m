From: Nicholas Mc Guire <hofrat@osadl.org>
Subject: [PATCH V2] pinctrl: rza1: handle devm_kasprintf() failure cases
Date: Fri,  7 Dec 2018 11:34:27 +0100
Message-ID: <1544178867-13169-1-git-send-email-hofrat@osadl.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>, Geert Uytterhoeven <geert@linux-m68k.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Nicholas Mc Guire <hofrat@osadl.org>
List-Id: linux-gpio@vger.kernel.org

 devm_kasprintf() may return NULL on failure of internal allocation
thus the assignments are not safe if not checked. On error
rza1_pinctrl_register() respectively rza1_parse_gpiochip() return
negative values so -ENOMEM in the (unlikely) failure case of
devm_kasprintf() should be fine here.

Signed-off-by: Nicholas Mc Guire <hofrat@osadl.org>
Fixes: 5a49b644b307 ("pinctrl: Renesas RZ/A1 pin and gpio controller")
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---

Problem was located with an experimental coccinelle script

V2: drop the dev_err() messages as requested by Geert Uytterhoeven
    <geert@linux-m68k.org> - thanks !

Patch was compile tested with: shmobile_defconfig (implies PINCTRL_RZA1=y)

Patch is against 4.20-rc5 (localversion-next is next-20181207)

 drivers/pinctrl/pinctrl-rza1.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-rza1.c b/drivers/pinctrl/pinctrl-rza1.c
index 14eb576..9cfe9d0 100644
--- a/drivers/pinctrl/pinctrl-rza1.c
+++ b/drivers/pinctrl/pinctrl-rza1.c
@@ -1225,6 +1225,9 @@ static int rza1_parse_gpiochip(struct rza1_pinctrl *rza1_pctl,
 	chip->base	= -1;
 	chip->label	= devm_kasprintf(rza1_pctl->dev, GFP_KERNEL, "%pOFn",
 					 np);
+	if (!chip->label)
+		return -ENOMEM;
+
 	chip->ngpio	= of_args.args[2];
 	chip->of_node	= np;
 	chip->parent	= rza1_pctl->dev;
@@ -1326,6 +1329,8 @@ static int rza1_pinctrl_register(struct rza1_pinctrl *rza1_pctl)
 		pins[i].number = i;
 		pins[i].name = devm_kasprintf(rza1_pctl->dev, GFP_KERNEL,
 					      "P%u-%u", port, pin);
+		if (!pins[i].name)
+			return -ENOMEM;
 
 		if (i % RZA1_PINS_PER_PORT == 0) {
 			/*
-- 
2.1.4
