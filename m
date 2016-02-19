From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Subject: [PATCH] gpio: pisosr: add missing unlock
Date: Fri, 19 Feb 2016 14:53:00 +0530
Message-ID: <1455873780-31935-1-git-send-email-sudipm.mukherjee@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: linux-kernel@vger.kernel.org, "Andrew F. Davis" <afd@ti.com>, linux-gpio@vger.kernel.org, Sudip Mukherjee <sudipm.mukherjee@gmail.com>
List-Id: linux-gpio@vger.kernel.org

If spi_read() fails then we just returned but we missed unlocking the
mutex.

Signed-off-by: Sudip Mukherjee <sudip@vectorindia.org>
---
 drivers/gpio/gpio-pisosr.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-pisosr.c b/drivers/gpio/gpio-pisosr.c
index 58ea08d..f9f1074 100644
--- a/drivers/gpio/gpio-pisosr.c
+++ b/drivers/gpio/gpio-pisosr.c
@@ -53,12 +53,10 @@ static int pisosr_gpio_refresh(struct pisosr_gpio *gpio)
 	}
 
 	ret = spi_read(gpio->spi, gpio->buffer, gpio->buffer_size);
-	if (ret)
-		return ret;
 
 	mutex_unlock(&gpio->lock);
 
-	return 0;
+	return ret;
 }
 
 static int pisosr_gpio_get_direction(struct gpio_chip *chip,
-- 
1.9.1
