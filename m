From: Keerthy <j-keerthy@ti.com>
Subject: [PATCH V2 6/6] gpio: davinci: Remove redundant macros
Date: Fri, 13 Jan 2017 09:50:15 +0530
Message-ID: <1484281215-24576-7-git-send-email-j-keerthy@ti.com>
References: <1484281215-24576-1-git-send-email-j-keerthy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1484281215-24576-1-git-send-email-j-keerthy@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org, t-kristo@ti.com
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, gnurou@gmail.com, grygorii.strashko@ti.com, j-keerthy@ti.com
List-Id: linux-gpio@vger.kernel.org

Some of the macros were needed as per old driver design.
With the current implementation they are unwanted. Hence remove
them.

Signed-off-by: Keerthy <j-keerthy@ti.com>
---
 include/linux/platform_data/gpio-davinci.h | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/include/linux/platform_data/gpio-davinci.h b/include/linux/platform_data/gpio-davinci.h
index 90ae19c..f922601 100644
--- a/include/linux/platform_data/gpio-davinci.h
+++ b/include/linux/platform_data/gpio-davinci.h
@@ -45,14 +45,6 @@ struct davinci_gpio_controller {
 	unsigned int		base;
 };
 
-/*
- * basic gpio routines
- */
-#define	GPIO(X)		(X)	/* 0 <= X <= (DAVINCI_N_GPIO - 1) */
-
-/* Convert GPIO signal to GPIO pin number */
-#define GPIO_TO_PIN(bank, gpio)	(16 * (bank) + (gpio))
-
 static inline u32 __gpio_mask(unsigned gpio)
 {
 	return 1 << (gpio % 32);
-- 
1.9.1
