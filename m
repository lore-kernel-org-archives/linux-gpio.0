From: Keerthy <j-keerthy@ti.com>
Subject: [PATCH 1/3] gpio: davinci: Remove unwanted blank line
Date: Wed, 11 Jan 2017 10:30:39 +0530
Message-ID: <1484110841-2391-2-git-send-email-j-keerthy@ti.com>
References: <1484110841-2391-1-git-send-email-j-keerthy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from fllnx209.ext.ti.com ([198.47.19.16]:35070 "EHLO
        fllnx209.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1761508AbdAKFC4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Jan 2017 00:02:56 -0500
In-Reply-To: <1484110841-2391-1-git-send-email-j-keerthy@ti.com>
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

