Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9368FCE79C2
	for <linux-gpio@archiver.kernel.org>; Wed, 20 Sep 2023 10:33:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233376AbjITKdy (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Wed, 20 Sep 2023 06:33:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234374AbjITKdp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 20 Sep 2023 06:33:45 -0400
Received: from TWMBX03.aspeed.com (mail.aspeedtech.com [211.20.114.72])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB27E114;
        Wed, 20 Sep 2023 03:33:36 -0700 (PDT)
Received: from TWMBX02.aspeed.com (192.168.0.24) by TWMBX03.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 20 Sep
 2023 18:33:36 +0800
Received: from twmbx02.aspeed.com (192.168.10.13) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 20 Sep 2023 18:33:36 +0800
From:   Joe Wang <joe_wang@aspeedtech.com>
To:     <andrew@aj.id.au>, <linus.walleij@linaro.org>, <joel@jms.id.au>
CC:     <linux-aspeed@lists.ozlabs.org>, <openbmc@lists.ozlabs.org>,
        <linux-gpio@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH] pinctrl: pinctrl-aspeed-g6: Add more settings for USB2AHP function
Date:   Wed, 20 Sep 2023 18:33:32 +0800
Message-ID: <20230920103332.274151-1-joe_wang@aspeedtech.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

AST2600 USB2AHP (USB PortA: PCIe EHCI to PHY) function needs to set the
register SCUC20[16]. Set it to enable the PCIe EHCI device on PCIe bus.
Besides, also add USB2AHP signal expressions into pin declarations.

Signed-off-by: Joe Wang <joe_wang@aspeedtech.com>
---
 drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c b/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
index 80838dc54b3a..d376fa7114d1 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
@@ -1592,9 +1592,10 @@ SIG_EXPR_LIST_DECL_SEMG(A4, USB2ADPDP, USBA, USB2ADP, USB2ADP_DESC,
 			SIG_DESC_SET(SCUC20, 16));
 SIG_EXPR_LIST_DECL_SEMG(A4, USB2ADDP, USBA, USB2AD, USB2AD_DESC);
 SIG_EXPR_LIST_DECL_SEMG(A4, USB2AHDP, USBA, USB2AH, USB2AH_DESC);
-SIG_EXPR_LIST_DECL_SEMG(A4, USB2AHPDP, USBA, USB2AHP, USB2AHP_DESC);
+SIG_EXPR_LIST_DECL_SEMG(A4, USB2AHPDP, USBA, USB2AHP, USB2AHP_DESC,
+			SIG_DESC_SET(SCUC20, 16));
 PIN_DECL_(A4, SIG_EXPR_LIST_PTR(A4, USB2ADPDP), SIG_EXPR_LIST_PTR(A4, USB2ADDP),
-	  SIG_EXPR_LIST_PTR(A4, USB2AHDP));
+	  SIG_EXPR_LIST_PTR(A4, USB2AHDP), SIG_EXPR_LIST_PTR(A4, USB2AHPDP));
 
 #define B4 253
 SIG_EXPR_LIST_DECL_SEMG(B4, USB2ADPDN, USBA, USB2ADP, USB2ADP_DESC);
@@ -1602,7 +1603,7 @@ SIG_EXPR_LIST_DECL_SEMG(B4, USB2ADDN, USBA, USB2AD, USB2AD_DESC);
 SIG_EXPR_LIST_DECL_SEMG(B4, USB2AHDN, USBA, USB2AH, USB2AH_DESC);
 SIG_EXPR_LIST_DECL_SEMG(B4, USB2AHPDN, USBA, USB2AHP, USB2AHP_DESC);
 PIN_DECL_(B4, SIG_EXPR_LIST_PTR(B4, USB2ADPDN), SIG_EXPR_LIST_PTR(B4, USB2ADDN),
-	  SIG_EXPR_LIST_PTR(B4, USB2AHDN));
+	  SIG_EXPR_LIST_PTR(B4, USB2AHDN), SIG_EXPR_LIST_PTR(B4, USB2AHPDN));
 
 GROUP_DECL(USBA, A4, B4);
 
-- 
2.34.1

