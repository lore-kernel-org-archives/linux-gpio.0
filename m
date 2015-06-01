From: Fabio Estevam <fabio.estevam@freescale.com>
Subject: [PATCH 3/7] pinctrl: sun6i-a31s: Remove .owner field
Date: Mon, 1 Jun 2015 09:54:01 -0300
Message-ID: <1433163245-5780-3-git-send-email-fabio.estevam@freescale.com>
References: <1433163245-5780-1-git-send-email-fabio.estevam@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-bn1bn0108.outbound.protection.outlook.com ([157.56.110.108]:28664
	"EHLO na01-bn1-obe.outbound.protection.outlook.com"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1751357AbbFAMyc (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Mon, 1 Jun 2015 08:54:32 -0400
In-Reply-To: <1433163245-5780-1-git-send-email-fabio.estevam@freescale.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org
Cc: linux-gpio@vger.kernel.org, Fabio Estevam <fabio.estevam@freescale.com>

platform_driver does not need to set the owner field, as it will be 
populated by the driver core, so just remove it.

The semantic patch that makes this change is available
in scripts/coccinelle/api/platform_no_drv_owner.cocci.

Signed-off-by: Fabio Estevam <fabio.estevam@freescale.com>
---
 drivers/pinctrl/sunxi/pinctrl-sun6i-a31s.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/pinctrl/sunxi/pinctrl-sun6i-a31s.c b/drivers/pinctrl/sunxi/pinctrl-sun6i-a31s.c
index d3725dc..e570d5c 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sun6i-a31s.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sun6i-a31s.c
@@ -804,7 +804,6 @@ static struct platform_driver sun6i_a31s_pinctrl_driver = {
 	.probe	= sun6i_a31s_pinctrl_probe,
 	.driver	= {
 		.name		= "sun6i-a31s-pinctrl",
-		.owner		= THIS_MODULE,
 		.of_match_table	= sun6i_a31s_pinctrl_match,
 	},
 };
-- 
1.9.1

