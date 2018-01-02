From: Julia Lawall <Julia.Lawall@lip6.fr>
Subject: [PATCH 08/12] pinctrl: axp209: account for const type of of_device_id.data
Date: Tue,  2 Jan 2018 14:28:04 +0100
Message-ID: <1514899688-27844-9-git-send-email-Julia.Lawall@lip6.fr>
References: <1514899688-27844-1-git-send-email-Julia.Lawall@lip6.fr>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1514899688-27844-1-git-send-email-Julia.Lawall@lip6.fr>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: kernel-janitors@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

The return value of of_device_get_match_data has type const void *.
The desc field of the pctl structure also has a const type, so there
is no need for the const-discarding cast between them.

Done using Coccinelle.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/pinctrl/pinctrl-axp209.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff -u -p a/drivers/pinctrl/pinctrl-axp209.c b/drivers/pinctrl/pinctrl-axp209.c
--- a/drivers/pinctrl/pinctrl-axp209.c
+++ b/drivers/pinctrl/pinctrl-axp209.c
@@ -414,7 +414,7 @@ static int axp20x_pctl_probe(struct plat
 	pctl->chip.direction_input	= axp20x_gpio_input;
 	pctl->chip.direction_output	= axp20x_gpio_output;
 
-	pctl->desc = (struct axp20x_pctrl_desc *)of_device_get_match_data(dev);
+	pctl->desc = of_device_get_match_data(dev);
 
 	pctl->chip.ngpio		= pctl->desc->npins;
 
