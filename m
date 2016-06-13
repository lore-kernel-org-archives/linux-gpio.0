From: Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH] pinctrl: max77620: Remove unused structure definition
Date: Mon, 13 Jun 2016 13:51:44 +0100
Message-ID: <1465822304-16493-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from hqemgate16.nvidia.com ([216.228.121.65]:3544 "EHLO
	hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1422860AbcFMMv5 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 13 Jun 2016 08:51:57 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Laxman Dewangan <ldewangan@nvidia.com>, Jon Hunter <jonathanh@nvidia.com>

The strucuture 'max77620_cfg_param' is defined but never used by the
max77620 driver. Remove this structure definition.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 drivers/pinctrl/pinctrl-max77620.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-max77620.c b/drivers/pinctrl/pinctrl-max77620.c
index 19005a01b667..d9ff53e8f715 100644
--- a/drivers/pinctrl/pinctrl-max77620.c
+++ b/drivers/pinctrl/pinctrl-max77620.c
@@ -50,11 +50,6 @@ struct max77620_pin_function {
 	int mux_option;
 };
 
-struct max77620_cfg_param {
-	const char *property;
-	enum max77620_pinconf_param param;
-};
-
 static const struct pinconf_generic_params max77620_cfg_params[] = {
 	{
 		.property = "maxim,active-fps-source",
-- 
2.1.4

