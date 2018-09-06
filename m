From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [PATCH] gpio: ep93xx: fix test for end of loop
Date: Thu, 6 Sep 2018 16:33:48 +0300
Message-ID: <20180906133348.brzvqt53nzukn7n2@kili.mountain>
References: <CACRpkdaHabhD_pW3XtDh+XzQ3d--r=qNRZVnhx44RV82p0boMA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdaHabhD_pW3XtDh+XzQ3d--r=qNRZVnhx44RV82p0boMA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Colin King <colin.king@canonical.com>
List-Id: linux-gpio@vger.kernel.org

The problem is that if port == ARRAY_SIZE() and "gc == &epg->gc[port]"
then that should be treated as invalid.

Fixes: fd935fc421e7 ("gpio: ep93xx: Do not pingpong irq numbers")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpio/gpio-ep93xx.c b/drivers/gpio/gpio-ep93xx.c
index 68a416fc3141..b0699f57ddf5 100644
--- a/drivers/gpio/gpio-ep93xx.c
+++ b/drivers/gpio/gpio-ep93xx.c
@@ -80,7 +80,7 @@ static int ep93xx_gpio_port(struct gpio_chip *gc)
 		port++;
 
 	/* This should not happen but is there as a last safeguard */
-	if (gc != &epg->gc[port]) {
+	if (port == ARRAY_SIZE(epg->gc)) {
 		pr_crit("can't find the GPIO port\n");
 		return 0;
 	}
