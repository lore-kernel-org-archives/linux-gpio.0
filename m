From: Colin King <colin.king@canonical.com>
Subject: [PATCH] gpio: ep93xx: fix incorrect array element size check
Date: Thu,  6 Sep 2018 12:58:30 +0100
Message-ID: <20180906115830.19386-1-colin.king@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently the while loop checks for the end of the array using
the size of egp->gc rather that the number of elements in the array,
so fix this. Also, perform the array size check first as stylistically
it is always good to bounds check on an array first before referencing
the array (in this case, we're just computing the address of an
element in an array so this is a moot point).

Fixes: fd935fc421e7 ("gpio: ep93xx: Do not pingpong irq numbers")

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpio/gpio-ep93xx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-ep93xx.c b/drivers/gpio/gpio-ep93xx.c
index 68a416fc3141..dd22ea19c3ed 100644
--- a/drivers/gpio/gpio-ep93xx.c
+++ b/drivers/gpio/gpio-ep93xx.c
@@ -76,7 +76,7 @@ static int ep93xx_gpio_port(struct gpio_chip *gc)
 	struct ep93xx_gpio *epg = gpiochip_get_data(gc);
 	int port = 0;
 
-	while (gc != &epg->gc[port] && port < sizeof(epg->gc))
+	while (port < ARRAY_SIZE(epg->gc) && gc != &epg->gc[port])
 		port++;
 
 	/* This should not happen but is there as a last safeguard */
-- 
2.17.1
