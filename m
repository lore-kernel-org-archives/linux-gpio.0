From: Andrey Smirnov <andrew.smirnov@gmail.com>
Subject: [PATCH 14/14] pinctrl-sx150x: Remove magic numbers from sx150x_reset
Date: Tue,  1 Nov 2016 08:57:48 -0700
Message-ID: <1478015868-10309-15-git-send-email-andrew.smirnov@gmail.com>
References: <1478015868-10309-1-git-send-email-andrew.smirnov@gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pf0-f193.google.com ([209.85.192.193]:35579 "EHLO
        mail-pf0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751568AbcKAP6P (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 1 Nov 2016 11:58:15 -0400
In-Reply-To: <1478015868-10309-1-git-send-email-andrew.smirnov@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: linus.walleij@linaro.org, narmstrong@baylibre.com, linux-kernel@vger.kernel.org, cphealy@gmail.com, Andrey Smirnov <andrew.smirnov@gmail.com>

Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
---
 drivers/pinctrl/pinctrl-sx150x.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-sx150x.c b/drivers/pinctrl/pinctrl-sx150x.c
index 13afcb9..580a6de 100644
--- a/drivers/pinctrl/pinctrl-sx150x.c
+++ b/drivers/pinctrl/pinctrl-sx150x.c
@@ -48,6 +48,8 @@ enum {
 	SX150X_MAX_REGISTER = 0xad,
 	SX150X_IRQ_TYPE_EDGE_RISING = 0x1,
 	SX150X_IRQ_TYPE_EDGE_FALLING = 0x2,
+	SX150X_789_RESET_KEY1 = 0x12,
+	SX150X_789_RESET_KEY2 = 0x34,
 };
 
 struct sx150x_123_pri {
@@ -761,13 +763,13 @@ static int sx150x_reset(struct sx150x_pinctrl *pctl)
 
 	err = i2c_smbus_write_byte_data(pctl->client,
 					pctl->data->pri.x789.reg_reset,
-					0x12);
+					SX150X_789_RESET_KEY1);
 	if (err < 0)
 		return err;
 
 	err = i2c_smbus_write_byte_data(pctl->client,
 					pctl->data->pri.x789.reg_reset,
-					0x34);
+					SX150X_789_RESET_KEY2);
 	return err;
 }
 
-- 
2.5.5

