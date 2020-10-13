Return-Path: <SRS0=Utw9=DU=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4930DC433DF
	for <linux-gpio@archiver.kernel.org>; Tue, 13 Oct 2020 06:44:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E4E4320E65
	for <linux-gpio@archiver.kernel.org>; Tue, 13 Oct 2020 06:44:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389731AbgJMGoM (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Tue, 13 Oct 2020 02:44:12 -0400
Received: from lucky1.263xmail.com ([211.157.147.130]:48184 "EHLO
        lucky1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389638AbgJMGoE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 13 Oct 2020 02:44:04 -0400
Received: from localhost (unknown [192.168.167.16])
        by lucky1.263xmail.com (Postfix) with ESMTP id 8BA22CCD3B;
        Tue, 13 Oct 2020 14:37:34 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-ANTISPAM-LEVEL: 2
X-ABS-CHECKED: 0
Received: from localhost.localdomain (unknown [58.22.7.114])
        by smtp.263.net (postfix) whith ESMTP id P30218T139798958167808S1602571053396950_;
        Tue, 13 Oct 2020 14:37:34 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <61acd240078281ebd28490af1f12a39f>
X-RL-SENDER: jay.xu@rock-chips.com
X-SENDER: xjq@rock-chips.com
X-LOGIN-NAME: jay.xu@rock-chips.com
X-FST-TO: linus.walleij@linaro.org
X-SENDER-IP: 58.22.7.114
X-ATTACHMENT-NUM: 0
X-DNS-TYPE: 0
X-System-Flag: 0
From:   Jianqun Xu <jay.xu@rock-chips.com>
To:     linus.walleij@linaro.org, heiko@sntech.de
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-rockchip@lists.infradead.org,
        Jianqun Xu <jay.xu@rock-chips.com>
Subject: [PATCH v3 1/3] pinctrl: rockchip: make driver be tristate module
Date:   Tue, 13 Oct 2020 14:37:29 +0800
Message-Id: <20201013063731.3618-2-jay.xu@rock-chips.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201013063731.3618-1-jay.xu@rock-chips.com>
References: <20201013063731.3618-1-jay.xu@rock-chips.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Make pinctrl-rockchip driver to be tristate module, support to build as
a module, this is useful for GKI.

Reviewed-by: Heiko Stuebner <heiko@sntech.de>
Signed-off-by: Jianqun Xu <jay.xu@rock-chips.com>
---
 drivers/pinctrl/Kconfig            |  2 +-
 drivers/pinctrl/pinctrl-rockchip.c | 13 +++++++++++++
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
index 815095326e2d..bc9774c1ae8d 100644
--- a/drivers/pinctrl/Kconfig
+++ b/drivers/pinctrl/Kconfig
@@ -207,7 +207,7 @@ config PINCTRL_OXNAS
 	select MFD_SYSCON
 
 config PINCTRL_ROCKCHIP
-	bool
+	tristate "Rockchip gpio and pinctrl driver"
 	depends on OF
 	select PINMUX
 	select GENERIC_PINCONF
diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl-rockchip.c
index 0401c1da79dd..927d132d6716 100644
--- a/drivers/pinctrl/pinctrl-rockchip.c
+++ b/drivers/pinctrl/pinctrl-rockchip.c
@@ -16,10 +16,12 @@
  */
 
 #include <linux/init.h>
+#include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/io.h>
 #include <linux/bitops.h>
 #include <linux/gpio/driver.h>
+#include <linux/of_device.h>
 #include <linux/of_address.h>
 #include <linux/of_irq.h>
 #include <linux/pinctrl/machine.h>
@@ -4258,3 +4260,14 @@ static int __init rockchip_pinctrl_drv_register(void)
 	return platform_driver_register(&rockchip_pinctrl_driver);
 }
 postcore_initcall(rockchip_pinctrl_drv_register);
+
+static void __exit rockchip_pinctrl_drv_unregister(void)
+{
+	platform_driver_unregister(&rockchip_pinctrl_driver);
+}
+module_exit(rockchip_pinctrl_drv_unregister);
+
+MODULE_DESCRIPTION("ROCKCHIP Pin Controller Driver");
+MODULE_LICENSE("GPL");
+MODULE_ALIAS("platform:pinctrl-rockchip");
+MODULE_DEVICE_TABLE(of, rockchip_pinctrl_dt_match);
-- 
2.17.1



