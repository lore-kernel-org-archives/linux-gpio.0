From: Wolfram Sang <wsa@the-dreams.de>
Subject: [PATCH 2/2] Documentation: gpio: correct return value of gpiod_get_direction
Date: Tue,  9 Jan 2018 12:35:54 +0100
Message-ID: <20180109113554.4337-2-wsa@the-dreams.de>
References: <20180109113554.4337-1-wsa@the-dreams.de>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:41448 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750911AbeAILgE (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 9 Jan 2018 06:36:04 -0500
In-Reply-To: <20180109113554.4337-1-wsa@the-dreams.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>

From: Wolfram Sang <wsa+renesas@sang-engineering.com>

The use of the GPIOF_* flags is deprecated, so don't advertise them
here. Document the plain numbers for now until we have a better
solution.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 Documentation/gpio/consumer.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/gpio/consumer.txt b/Documentation/gpio/consumer.txt
index 63e1bd1d88e324..7aac3308151016 100644
--- a/Documentation/gpio/consumer.txt
+++ b/Documentation/gpio/consumer.txt
@@ -184,7 +184,7 @@ A driver can also query the current direction of a GPIO:
 
 	int gpiod_get_direction(const struct gpio_desc *desc)
 
-This function will return either GPIOF_DIR_IN or GPIOF_DIR_OUT.
+This function returns 0 for output, 1 for input, or an error code in case of error.
 
 Be aware that there is no default direction for GPIOs. Therefore, **using a GPIO
 without setting its direction first is illegal and will result in undefined
-- 
2.11.0

