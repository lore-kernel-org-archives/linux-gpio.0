From: Alexandre Courbot <acourbot@nvidia.com>
Subject: [PATCH] gpiolib: fix of_find_gpio() when OF not defined
Date: Tue, 19 Nov 2013 10:37:29 +0900
Message-ID: <1384825049-8214-1-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from hqemgate15.nvidia.com ([216.228.121.64]:7168 "EHLO
	hqemgate15.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751064Ab3KSBhs (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 18 Nov 2013 20:37:48 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>

The prototype for static GPIO lookup functions has been updated to use
an explicit type for GPIO lookup flags. Unfortunately the definition of
of_find_gpio() when CONFIG_OF is not defined has been omitted, which
triggers a warning. This patch fixes this.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
--
This fixes the kbuild test robot warning about
"gpiolib: use dedicated flags for GPIO properties". Hopefully this can
be squashed into this same patch. Apologies for the trouble.
---
 drivers/gpio/gpiolib.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 48d1a67ed488..463496160a94 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -2299,7 +2299,8 @@ static struct gpio_desc *of_find_gpio(struct device *dev, const char *con_id,
 }
 #else
 static struct gpio_desc *of_find_gpio(struct device *dev, const char *con_id,
-				      unsigned int idx, unsigned long *flags)
+				      unsigned int idx,
+				      enum gpio_lookup_flags *flags)
 {
 	return ERR_PTR(-ENODEV);
 }
-- 
1.8.4.2

