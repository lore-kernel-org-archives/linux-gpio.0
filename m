From: Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: [PATCH] pinctrl: rza1: Remove suffix from gpiochip label
Date: Thu, 24 Aug 2017 10:52:18 +0200
Message-ID: <1503564738-32392-1-git-send-email-jacopo+renesas@jmondi.org>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: linus.walleij@linaro.org, laurent.pinchart@ideasonboard.com, geert+renesas@glider.be
Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>, linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

The OF node name already contains the gpio chip identifier, no need to
append it when creating the label.

The following debug message clearly shows the suffix is not required
"pinctrl-rza1 fcfe3000.pin-controller: Parsed gpiochip gpio-0-0 with 6
pins"

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 drivers/pinctrl/pinctrl-rza1.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-rza1.c b/drivers/pinctrl/pinctrl-rza1.c
index dc164da..7e896bd 100644
--- a/drivers/pinctrl/pinctrl-rza1.c
+++ b/drivers/pinctrl/pinctrl-rza1.c
@@ -1096,8 +1096,8 @@ static int rza1_parse_gpiochip(struct rza1_pinctrl *rza1_pctl,

 	*chip		= rza1_gpiochip_template;
 	chip->base	= -1;
-	chip->label	= devm_kasprintf(rza1_pctl->dev, GFP_KERNEL, "%s-%u",
-					 np->name, gpioport);
+	chip->label	= devm_kasprintf(rza1_pctl->dev, GFP_KERNEL, "%s",
+					 np->name);
 	chip->ngpio	= of_args.args[2];
 	chip->of_node	= np;
 	chip->parent	= rza1_pctl->dev;
--
2.7.4
