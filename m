From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [patch] pinctrl: nsp-gpio: forever loop in nsp_gpio_get_strength()
Date: Thu, 24 Dec 2015 10:25:32 +0300
Message-ID: <20151224072532.GC29642@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <kernel-janitors-owner@vger.kernel.org>
Content-Disposition: inline
Sender: kernel-janitors-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Yendapally Reddy Dhananjaya Reddy <yrdreddy@broadcom.com>
Cc: Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Jon Mason <jonmason@broadcom.com>, linux-gpio@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, kernel-janitors@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

There is a signedness bug here so the loop will never exit.

Fixes: 8bfcbbbcabe0 ('pinctrl: nsp: add gpio-a driver support for Broadcom NSP SoC')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/pinctrl/bcm/pinctrl-nsp-gpio.c b/drivers/pinctrl/bcm/pinctrl-nsp-gpio.c
index 34648f6..ac7b010 100644
--- a/drivers/pinctrl/bcm/pinctrl-nsp-gpio.c
+++ b/drivers/pinctrl/bcm/pinctrl-nsp-gpio.c
@@ -439,9 +439,10 @@ static int nsp_gpio_set_strength(struct nsp_gpio *chip, unsigned gpio,
 static int nsp_gpio_get_strength(struct nsp_gpio *chip, unsigned gpio,
 				 u16 *strength)
 {
-	unsigned int i, offset, shift;
+	unsigned int offset, shift;
 	u32 val;
 	unsigned long flags;
+	int i;
 
 	offset = NSP_GPIO_DRV_CTRL;
 	shift = gpio;
