From: Keerthy <j-keerthy@ti.com>
Subject: [PATCH V2 2/6] gpio: davinci: Remove unwanted blank line
Date: Fri, 13 Jan 2017 09:50:11 +0530
Message-ID: <1484281215-24576-3-git-send-email-j-keerthy@ti.com>
References: <1484281215-24576-1-git-send-email-j-keerthy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from lelnx193.ext.ti.com ([198.47.27.77]:25645 "EHLO
        lelnx193.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751089AbdAMEUs (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 12 Jan 2017 23:20:48 -0500
In-Reply-To: <1484281215-24576-1-git-send-email-j-keerthy@ti.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org, t-kristo@ti.com
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, gnurou@gmail.com, grygorii.strashko@ti.com, j-keerthy@ti.com

Remove redundant blank line.

Signed-off-by: Keerthy <j-keerthy@ti.com>
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

