From: Keerthy <j-keerthy@ti.com>
Subject: [PATCH V3 2/5] gpio: davinci: Remove unwanted blank line
Date: Tue, 17 Jan 2017 21:49:12 +0530
Message-ID: <1484669955-5349-3-git-send-email-j-keerthy@ti.com>
References: <1484669955-5349-1-git-send-email-j-keerthy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1484669955-5349-1-git-send-email-j-keerthy@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, gnurou@gmail.com, grygorii.strashko@ti.com, j-keerthy@ti.com, t-kristo@ti.com
List-Id: linux-gpio@vger.kernel.org

Remove redundant blank line.

Signed-off-by: Keerthy <j-keerthy@ti.com>
Reviewed-by: Grygorii Strashko <grygorii.strashko@ti.com>
---
 include/linux/platform_data/gpio-davinci.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/linux/platform_data/gpio-davinci.h b/include/linux/platform_data/gpio-davinci.h
index 44ca530..18127c4 100644
--- a/include/linux/platform_data/gpio-davinci.h
+++ b/include/linux/platform_data/gpio-davinci.h
@@ -26,7 +26,6 @@ struct davinci_gpio_platform_data {
 	u32	gpio_unbanked;
 };
 
-
 struct davinci_gpio_controller {
 	struct gpio_chip	chip;
 	struct irq_domain	*irq_domain;
-- 
1.9.1
