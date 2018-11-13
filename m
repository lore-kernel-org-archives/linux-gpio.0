From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 2/3] gpio: davinci: restore a way to manually specify the GPIO base
Date: Tue, 13 Nov 2018 14:50:50 +0100
Message-ID: <20181113135051.15308-3-brgl@bgdev.pl>
References: <20181113135051.15308-1-brgl@bgdev.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <20181113135051.15308-1-brgl@bgdev.pl>
Sender: stable-owner@vger.kernel.org
To: Sekhar Nori <nsekhar@ti.com>, Kevin Hilman <khilman@kernel.org>, Russell King <linux@armlinux.org.uk>, Keerthy <j-keerthy@ti.com>, Linus Walleij <linus.walleij@linaro.org>, Grygorii Strashko <grygorii.strashko@ti.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>, stable@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Commit 587f7a694f01 ("gpio: davinci: Use dev name for label and
automatic base selection") broke the network support in legacy boot
mode for da850-evm since we can no longer request the MDIO clock GPIO.

Other boards may be broken too, which I haven't tested.

The problem is in the fact that most board files still use the legacy
GPIO API where lines are requested by numbers rather than descriptors.

While this should be fixed eventually, in order to unbreak the board
for now - provide a way to manually specify the GPIO base in platform
data.

Fixes: 587f7a694f01 ("gpio: davinci: Use dev name for label and automatic base selection")
Cc: stable@vger.kernel.org
Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/gpio/gpio-davinci.c                | 2 +-
 include/linux/platform_data/gpio-davinci.h | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-davinci.c b/drivers/gpio/gpio-davinci.c
index 5c1564fcc24e..bdb29e51b417 100644
--- a/drivers/gpio/gpio-davinci.c
+++ b/drivers/gpio/gpio-davinci.c
@@ -258,7 +258,7 @@ static int davinci_gpio_probe(struct platform_device *pdev)
 	chips->chip.set = davinci_gpio_set;
 
 	chips->chip.ngpio = ngpio;
-	chips->chip.base = -1;
+	chips->chip.base = pdata->no_auto_base ? pdata->base : -1;
 
 #ifdef CONFIG_OF_GPIO
 	chips->chip.of_gpio_n_cells = 2;
diff --git a/include/linux/platform_data/gpio-davinci.h b/include/linux/platform_data/gpio-davinci.h
index f92a47e18034..a93841bfb9f7 100644
--- a/include/linux/platform_data/gpio-davinci.h
+++ b/include/linux/platform_data/gpio-davinci.h
@@ -17,6 +17,8 @@
 #define __DAVINCI_GPIO_PLATFORM_H
 
 struct davinci_gpio_platform_data {
+	bool	no_auto_base;
+	u32	base;
 	u32	ngpio;
 	u32	gpio_unbanked;
 };
-- 
2.19.1
