From: Simon Guinot <simon.guinot@sequanux.org>
Subject: [PATCH v2] gpio: f7188x: set can_sleep attribute
Date: Fri,  3 Jan 2014 16:04:08 +0100
Message-ID: <1388761448-5045-1-git-send-email-simon.guinot@sequanux.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from vm1.sequanux.org ([188.165.36.56]:59888 "EHLO vm1.sequanux.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751950AbaACPEN (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Fri, 3 Jan 2014 10:04:13 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Grant Likely <grant.likely@linaro.org>
Cc: linux-gpio@vger.kernel.org, Vincent Donnefort <vdonnefort@gmail.com>, Simon Guinot <simon.guinot@sequanux.org>

Since request_muxed_region() is used to synchronize access on the
Super-I/O controller, then the can_sleep attribute must be set for
the f7188x GPIO chips.

Signed-off-by: Simon Guinot <simon.guinot@sequanux.org>
---
Changes since v1: initialize can_sleep with a boolean

 drivers/gpio/gpio-f7188x.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpio-f7188x.c b/drivers/gpio/gpio-f7188x.c
index 9cb8320e1181..8f73ee093739 100644
--- a/drivers/gpio/gpio-f7188x.c
+++ b/drivers/gpio/gpio-f7188x.c
@@ -135,6 +135,7 @@ static void f7188x_gpio_set(struct gpio_chip *chip, unsigned offset, int value);
 			.set              = f7188x_gpio_set,		\
 			.base             = _base,			\
 			.ngpio            = _ngpio,			\
+			.can_sleep        = true,			\
 		},							\
 		.regbase = _regbase,					\
 	}
-- 
1.8.5.2

