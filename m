From: Rabin Vincent <rabin@rab.in>
Subject: [PATCH 1/3] gpio: etraxfs: fix set register flag
Date: Wed, 22 Jul 2015 15:05:17 +0200
Message-ID: <1437570319-25297-1-git-send-email-rabin@rab.in>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org, gnurou@gmail.com
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Rabin Vincent <rabin@rab.in>
List-Id: linux-gpio@vger.kernel.org

BGPIO_F_UNREADABLE_REG_SET is incorrect, since the set register _is_
readable.  What's really required is BGPIO_F_READ_OUTPUT_REG_SET:
reading the set register reads the set output value.

Signed-off-by: Rabin Vincent <rabin@rab.in>
---
 drivers/gpio/gpio-etraxfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-etraxfs.c b/drivers/gpio/gpio-etraxfs.c
index 28071f4..c1ce80d 100644
--- a/drivers/gpio/gpio-etraxfs.c
+++ b/drivers/gpio/gpio-etraxfs.c
@@ -140,7 +140,7 @@ static int etraxfs_gpio_probe(struct platform_device *pdev)
 				 NULL,			/* clr */
 				 regs + port->oe,	/* dirout */
 				 NULL,			/* dirin */
-				 BGPIOF_UNREADABLE_REG_SET);
+				 BGPIOF_READ_OUTPUT_REG_SET);
 		if (ret)
 			return ret;
 
-- 
2.1.4
