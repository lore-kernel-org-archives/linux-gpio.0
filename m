From: Alexandre Courbot <acourbot@nvidia.com>
Subject: [PATCH 1/3] gpiolib: devres: fix devm_gpiod_get_index()
Date: Sun, 20 Oct 2013 15:14:57 -0700
Message-ID: <1382307299-22587-2-git-send-email-acourbot@nvidia.com>
References: <1382307299-22587-1-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1382307299-22587-1-git-send-email-acourbot@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, gnurou@gmail.com, Alexandre Courbot <acourbot@nvidia.com>
List-Id: linux-gpio@vger.kernel.org

Fix the return value if devm_gpiod_get_index(). It was returning 0 while
it should return the obtained GPIO descriptor.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpio/devres.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/devres.c b/drivers/gpio/devres.c
index 2caa257..fceebdc 100644
--- a/drivers/gpio/devres.c
+++ b/drivers/gpio/devres.c
@@ -80,7 +80,7 @@ struct gpio_desc *__must_check devm_gpiod_get_index(struct device *dev,
 	*dr = desc;
 	devres_add(dev, dr);
 
-	return 0;
+	return desc;
 }
 EXPORT_SYMBOL(devm_gpiod_get_index);
 
-- 
1.8.4.1
