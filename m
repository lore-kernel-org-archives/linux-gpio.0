From: Grygorii Strashko <grygorii.strashko@ti.com>
Subject: [PATCH 1/2] gpio: davinci: get rid of DAVINCI_N_GPIO
Date: Thu, 21 Nov 2013 17:34:35 +0200
Message-ID: <1385048076-7875-2-git-send-email-grygorii.strashko@ti.com>
References: <1385048076-7875-1-git-send-email-grygorii.strashko@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1385048076-7875-1-git-send-email-grygorii.strashko@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org
Cc: prabhakar.csengg@gmail.com, nsekhar@ti.com, Santosh Shilimkar <santosh.shilimkar@ti.com>, linux-kernel@vger.kernel.org, Grygorii Strashko <grygorii.strashko@ti.com>
List-Id: linux-gpio@vger.kernel.org

Since Davinci GPIO driver is moved to support gpiolib it has to use
ARCH_NR_GPIOS (can be configured using CONFIG_ARCH_NR_GPIO Kconfig
option) configuration instead of any mach/platform specific options.

Hence, replace private DAVINCI_N_GPIO with common ARCH_NR_GPIOS. This is
safe because default value for ARCH_NR_GPIOS=256 and maximum number of
supported GPIOs for Davinci is DAVINCI_N_GPIO=144.

More over, this is one of steps to re-use Davinci GPIO driver by other
mach/platform.

Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>
---
 drivers/gpio/gpio-davinci.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-davinci.c b/drivers/gpio/gpio-davinci.c
index 1f33fcd..944c819 100644
--- a/drivers/gpio/gpio-davinci.c
+++ b/drivers/gpio/gpio-davinci.c
@@ -160,8 +160,8 @@ static int davinci_gpio_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
-	if (WARN_ON(DAVINCI_N_GPIO < ngpio))
-		ngpio = DAVINCI_N_GPIO;
+	if (WARN_ON(ARCH_NR_GPIOS < ngpio))
+		ngpio = ARCH_NR_GPIOS;
 
 	chips = devm_kzalloc(dev,
 			     ngpio * sizeof(struct davinci_gpio_controller),
-- 
1.7.9.5
