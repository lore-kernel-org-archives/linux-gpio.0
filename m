From: John Crispin <blogic@openwrt.org>
Subject: [PATCH 1/3] pinctrl: lantiq: 2 pins have the wrong mux list
Date: Mon,  4 Jan 2016 22:27:57 +0100
Message-ID: <1451942879-43265-1-git-send-email-blogic@openwrt.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from arrakis.dune.hu ([78.24.191.176]:42089 "EHLO arrakis.dune.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751913AbcADV2S (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Mon, 4 Jan 2016 16:28:18 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org

The latest vendor SDK contained this patch.

Signed-off-by: John Crispin <blogic@openwrt.org>
---
 drivers/pinctrl/pinctrl-xway.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-xway.c b/drivers/pinctrl/pinctrl-xway.c
index ae724bd..cac1fde 100644
--- a/drivers/pinctrl/pinctrl-xway.c
+++ b/drivers/pinctrl/pinctrl-xway.c
@@ -152,10 +152,10 @@ static const struct ltq_mfp_pin xway_mfp[] = {
 	MFP_XWAY(GPIO41, GPIO,	NONE,	NONE,	NONE),
 	MFP_XWAY(GPIO42, GPIO,	MDIO,	NONE,	NONE),
 	MFP_XWAY(GPIO43, GPIO,	MDIO,	NONE,	NONE),
-	MFP_XWAY(GPIO44, GPIO,	NONE,	GPHY,	SIN),
+	MFP_XWAY(GPIO44, GPIO,	MII,	SIN,	GPHY),
 	MFP_XWAY(GPIO45, GPIO,	NONE,	GPHY,	SIN),
 	MFP_XWAY(GPIO46, GPIO,	NONE,	NONE,	EXIN),
-	MFP_XWAY(GPIO47, GPIO,	NONE,	GPHY,	SIN),
+	MFP_XWAY(GPIO47, GPIO,	MII,	GPHY,	SIN),
 	MFP_XWAY(GPIO48, GPIO,	EBU,	NONE,	NONE),
 	MFP_XWAY(GPIO49, GPIO,	EBU,	NONE,	NONE),
 	MFP_XWAY(GPIO50, GPIO,	NONE,	NONE,	NONE),
-- 
1.7.10.4
