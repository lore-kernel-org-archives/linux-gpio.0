From: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Subject: [PATCH] pinctrl: uniphier: fix USB3 pin assignment for Pro4
Date: Thu,  6 Jul 2017 15:54:23 +0900
Message-ID: <1499324063-907-1-git-send-email-hayashi.kunihiko@socionext.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mx.socionext.com ([202.248.49.38]:24144 "EHLO mx.socionext.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752844AbdGFGyz (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 6 Jul 2017 02:54:55 -0400
Received: from mail.mfilter.local (unknown [10.213.24.62])
        by iyokan-ex.css.socionext.com (Postfix) with ESMTP id 1064A6007B
        for <linux-gpio@vger.kernel.org>; Thu,  6 Jul 2017 15:54:54 +0900 (JST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, yamada.masahiro@socionext.com
Cc: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>

According to pinctrl assignment for Pro4, each definition of USB#2 and
USB#3 are as follows.

  184: USB2VBUS
  185: USB2OD
  186: USB2ID
  187: USB3VBUS
  188: USB3OD

USB#2 has an additional pin "USB2ID", but the chip doesn't use this pin
while in host-mode. Considering this pin, the pin definitions for USB#3
should be {187, 188}.

Signed-off-by: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
---
 drivers/pinctrl/uniphier/pinctrl-uniphier-pro4.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/uniphier/pinctrl-uniphier-pro4.c b/drivers/pinctrl/uniphier/pinctrl-uniphier-pro4.c
index a433a30..c75e094 100644
--- a/drivers/pinctrl/uniphier/pinctrl-uniphier-pro4.c
+++ b/drivers/pinctrl/uniphier/pinctrl-uniphier-pro4.c
@@ -1084,7 +1084,7 @@ static const unsigned usb1_pins[] = {182, 183};
 static const int usb1_muxvals[] = {0, 0};
 static const unsigned usb2_pins[] = {184, 185};
 static const int usb2_muxvals[] = {0, 0};
-static const unsigned usb3_pins[] = {186, 187};
+static const unsigned usb3_pins[] = {187, 188};
 static const int usb3_muxvals[] = {0, 0};
 static const unsigned port_range0_pins[] = {
 	300, 301, 302, 303, 304, 305, 306, 307,		/* PORT0x */
-- 
2.7.4

