From: Aaron Sierra <asierra@xes-inc.com>
Subject: [PATCH] gpio: pca953x: Fix gpio_base may not default to -1
Date: Fri, 7 Feb 2014 19:23:04 -0600 (CST)
Message-ID: <284331514.125966.1391822584020.JavaMail.zimbra@xes-inc.com>
References: <430364938.125965.1391822577770.JavaMail.zimbra@xes-inc.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from xes-mad.com ([216.165.139.218]:11434 "EHLO xes-mad.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750756AbaBHBXH (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Fri, 7 Feb 2014 20:23:07 -0500
In-Reply-To: <430364938.125965.1391822577770.JavaMail.zimbra@xes-inc.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>

If no device tree node existed for a device when CONFIG_OF_GPIO was
defined, then gpio_base would not default to -1.

Signed-off-by: Aaron Sierra <asierra@xes-inc.com>
---
 drivers/gpio/gpio-pca953x.c |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index 948a074..d550d8e 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -627,11 +627,12 @@ pca953x_get_alt_pdata(struct i2c_client *client, int *gpio_base, u32 *invert)
 	const __be32 *val;
 	int size;
 
+	*gpio_base = -1;
+
 	node = client->dev.of_node;
 	if (node == NULL)
 		return;
 
-	*gpio_base = -1;
 	val = of_get_property(node, "linux,gpio-base", &size);
 	WARN(val, "%s: device-tree property 'linux,gpio-base' is deprecated!", __func__);
 	if (val) {
-- 
1.7.9.5

