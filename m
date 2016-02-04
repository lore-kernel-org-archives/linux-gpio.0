From: Helmut Buchsbaum <helmut.buchsbaum@gmail.com>
Subject: [PATCH] pinctrl: zynq: fix typo in group name for qspi1
Date: Thu,  4 Feb 2016 09:14:08 +0100
Message-ID: <1454573648-21751-1-git-send-email-helmut.buchsbaum@gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wm0-f42.google.com ([74.125.82.42]:37147 "EHLO
	mail-wm0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752421AbcBDIOZ (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 4 Feb 2016 03:14:25 -0500
Received: by mail-wm0-f42.google.com with SMTP id l66so105201789wml.0
        for <linux-gpio@vger.kernel.org>; Thu, 04 Feb 2016 00:14:24 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: =?UTF-8?q?S=C3=B6ren=20Brinkmann?= <soren.brinkmann@xilinx.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, Helmut Buchsbaum <helmut.buchsbaum@gmail.com>

Due to a typo Zynq pin controller does not set pin function of qspi1
when using function qspi1. So pin group for qspi1 has to be renamed to
"qspi1_0_grp" as outlined in the corresponding bindings documentation.

This also removes kernel message:
  zynq-pinctrl 700.pinctrl: invalid group "qspi1_0_grp" for function "qspi1"

Signed-off-by: Helmut Buchsbaum <helmut.buchsbaum@gmail.com>
---
 drivers/pinctrl/pinctrl-zynq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-zynq.c b/drivers/pinctrl/pinctrl-zynq.c
index af726b9..9150303 100644
--- a/drivers/pinctrl/pinctrl-zynq.c
+++ b/drivers/pinctrl/pinctrl-zynq.c
@@ -590,7 +590,7 @@ static const char * const usb1_groups[] = {"usb1_0_grp"};
 static const char * const mdio0_groups[] = {"mdio0_0_grp"};
 static const char * const mdio1_groups[] = {"mdio1_0_grp"};
 static const char * const qspi0_groups[] = {"qspi0_0_grp"};
-static const char * const qspi1_groups[] = {"qspi0_1_grp"};
+static const char * const qspi1_groups[] = {"qspi1_0_grp"};
 static const char * const qspi_fbclk_groups[] = {"qspi_fbclk_grp"};
 static const char * const qspi_cs1_groups[] = {"qspi_cs1_grp"};
 static const char * const spi0_groups[] = {"spi0_0_grp", "spi0_1_grp",
-- 
2.1.4

