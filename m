From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [patch] gpio: ge: fix error code in gef_gpio_probe()
Date: Wed, 28 Jan 2015 22:13:20 +0300
Message-ID: <20150128191320.GB10259@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <kernel-janitors-owner@vger.kernel.org>
Content-Disposition: inline
Sender: kernel-janitors-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Kamlakant Patel <kamlakant.patel@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, kernel-janitors@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

If kstrdup() fails then we should return -ENOMEM but instead the current
code returns success.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpio/gpio-ge.c b/drivers/gpio/gpio-ge.c
index 6ea9303..07e9b39 100644
--- a/drivers/gpio/gpio-ge.c
+++ b/drivers/gpio/gpio-ge.c
@@ -77,8 +77,10 @@ static int __init gef_gpio_probe(struct platform_device *pdev)
 
 	/* Setup pointers to chip functions */
 	bgc->gc.label = kstrdup(pdev->dev.of_node->full_name, GFP_KERNEL);
-	if (!bgc->gc.label)
+	if (!bgc->gc.label) {
+		ret = -ENOMEM;
 		goto err0;
+	}
 
 	bgc->gc.base = -1;
 	bgc->gc.ngpio = (u16)(uintptr_t)of_id->data;
