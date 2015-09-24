From: Olliver Schinagl <oliver+list@schinagl.nl>
Subject: [PATCH 1/1] gpio: gpiolib: fix identation
Date: Thu, 24 Sep 2015 09:14:52 +0200
Message-ID: <1443078892-4417-1-git-send-email-oliver+list@schinagl.nl>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from 7of9.schinagl.nl ([88.159.158.68]:54327 "EHLO 7of9.schinagl.nl"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752680AbbIXHPF (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Thu, 24 Sep 2015 03:15:05 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Olliver Schinagl <oliver@schinagl.nl>

From: Olliver Schinagl <oliver@schinagl.nl>

Just a very small cosmetical indentation fix, no code changes

Signed-off-by: Olliver Schinagl <oliver@schinagl.nl>
---
 drivers/gpio/gpiolib.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 980c1f8..5ef9ac2 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1746,6 +1746,8 @@ static struct gpio_desc *acpi_find_gpio(struct device *dev, const char *con_id,
 		if (con_id && strcmp(con_id, "gpios")) {
 			snprintf(propname, sizeof(propname), "%s-%s",
 				 con_id, gpio_suffixes[i]);
+			if (!IS_ERR(desc) || (PTR_ERR(desc) == -EPROBE_DEFER))
+				break;
 		} else {
 			snprintf(propname, sizeof(propname), "%s",
 				 gpio_suffixes[i]);
-- 
2.5.1

