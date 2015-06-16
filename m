From: Mario Bambagini <mario.bambagini@gmail.com>
Subject: [PATCH] added tabs instead of spaces
Date: Tue, 16 Jun 2015 22:32:30 +0200
Message-ID: <1434486750-28728-1-git-send-email-mario.bambagini@gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wi0-f181.google.com ([209.85.212.181]:37999 "EHLO
	mail-wi0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754532AbbFPUdk (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 16 Jun 2015 16:33:40 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, mario.bambagini@gmail.com

Tabs have been inserted instead of spaces to indent the code
correctly. Same error fixed four times.

Signed-off-by: Mario Bambagini <mario.bambagini@gmail.com>
---
 drivers/pinctrl/pinctrl-adi2-bf60x.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-adi2-bf60x.c b/drivers/pinctrl/pinctrl-adi2-bf60x.c
index 4cb59fe..fcfa008 100644
--- a/drivers/pinctrl/pinctrl-adi2-bf60x.c
+++ b/drivers/pinctrl/pinctrl-adi2-bf60x.c
@@ -394,25 +394,25 @@ static const unsigned short ppi2_16b_mux[] = {
 static const unsigned short lp0_mux[] = {
 	P_LP0_CLK, P_LP0_ACK, P_LP0_D0, P_LP0_D1, P_LP0_D2,
 	P_LP0_D3, P_LP0_D4, P_LP0_D5, P_LP0_D6, P_LP0_D7,
-        0
+	0
 };
 
 static const unsigned short lp1_mux[] = {
 	P_LP1_CLK, P_LP1_ACK, P_LP1_D0, P_LP1_D1, P_LP1_D2,
 	P_LP1_D3, P_LP1_D4, P_LP1_D5, P_LP1_D6, P_LP1_D7,
-        0
+	0
 };
 
 static const unsigned short lp2_mux[] = {
 	P_LP2_CLK, P_LP2_ACK, P_LP2_D0, P_LP2_D1, P_LP2_D2,
 	P_LP2_D3, P_LP2_D4, P_LP2_D5, P_LP2_D6, P_LP2_D7,
-        0
+	0
 };
 
 static const unsigned short lp3_mux[] = {
 	P_LP3_CLK, P_LP3_ACK, P_LP3_D0, P_LP3_D1, P_LP3_D2,
 	P_LP3_D3, P_LP3_D4, P_LP3_D5, P_LP3_D6, P_LP3_D7,
-        0
+	0
 };
 
 static const struct adi_pin_group adi_pin_groups[] = {
-- 
2.1.4

