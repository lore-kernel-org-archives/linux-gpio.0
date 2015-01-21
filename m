From: Olliver Schinagl <o.schinagl@ultimaker.com>
Subject: [PATCH] gpio: correctly use const char * const
Date: Wed, 21 Jan 2015 21:35:37 +0100
Message-ID: <1421872537-18587-1-git-send-email-o.schinagl@ultimaker.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from 7of9.schinagl.nl ([88.159.158.68]:38959 "EHLO 7of9.schinagl.nl"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751526AbbAUUle (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Wed, 21 Jan 2015 15:41:34 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: linux-gpio@vger.kernel.org, open list <linux-kernel@vger.kernel.org>, Olliver Schinagl <oliver@schinagl.nl>

From: Olliver Schinagl <oliver@schinagl.nl>

On my previous patch I was overly hasty and made the suffixes string
array
const char const *suffixes, instaed of const char * const suffixes. This
patch corrects that

Signed-off-by: Olliver Schinagl <oliver@schinagl.nl>
---
 drivers/gpio/gpiolib.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 9d2a371..c926641 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1657,7 +1657,7 @@ static struct gpio_desc *of_find_gpio(struct device *dev, const char *con_id,
 				      unsigned int idx,
 				      enum gpio_lookup_flags *flags)
 {
-	static const char const *suffixes[] = { "gpios", "gpio" };
+	static const char * const suffixes[] = { "gpios", "gpio" };
 	char prop_name[32]; /* 32 is max size of property name */
 	enum of_gpio_flags of_flags;
 	struct gpio_desc *desc;
-- 
2.1.4

