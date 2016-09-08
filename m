From: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
Subject: [PATCH v2 3/3] gpio: mxc: add generic gpio request/free callbacks to pinctrl
Date: Thu, 8 Sep 2016 04:48:16 +0300
Message-ID: <1473299296-22458-4-git-send-email-vladimir_zapolskiy@mentor.com>
References: <1473299296-22458-1-git-send-email-vladimir_zapolskiy@mentor.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from relay1.mentorg.com ([192.94.38.131]:56970 "EHLO
        relay1.mentorg.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756088AbcIHBsh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 7 Sep 2016 21:48:37 -0400
In-Reply-To: <1473299296-22458-1-git-send-email-vladimir_zapolskiy@mentor.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: Deepak Das <deepak_das@mentor.com>, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org

If a GPIO controller description in board DTB contains information
about mappings between GPIOs and pads under IOMUX control use it to
request and free GPIOs with respect to pinctrl/pinmux subsystems.

One of immediate positive functional changes is inability to
request non-existing GPIOs, i.e. if there is no pad such. Also
pinctrl/pinmux may now properly account pads occupied by requested
GPIOs.

The change has no effect, if "gpio-ranges" property is not found
including the case if a board has no DTB firmware.

Signed-off-by: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
---
Changes from v1 to v2:
* none

 drivers/gpio/gpio-mxc.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
index 1fdd5d804b5b..e38989a4fa0c 100644
--- a/drivers/gpio/gpio-mxc.c
+++ b/drivers/gpio/gpio-mxc.c
@@ -458,6 +458,11 @@ static int mxc_gpio_probe(struct platform_device *pdev)
 	if (err)
 		goto out_bgio;
 
+	if (of_property_read_bool(np, "gpio-ranges")) {
+		port->gc.request = gpiochip_generic_request;
+		port->gc.free = gpiochip_generic_free;
+	}
+
 	port->gc.to_irq = mxc_gpio_to_irq;
 	port->gc.base = (pdev->id < 0) ? of_alias_get_id(np, "gpio") * 32 :
 					     pdev->id * 32;
-- 
2.8.1

