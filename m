Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CD1CC433E6
	for <linux-gpio@archiver.kernel.org>; Thu, 31 Dec 2020 15:39:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 01AFF2242A
	for <linux-gpio@archiver.kernel.org>; Thu, 31 Dec 2020 15:39:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726210AbgLaPjm (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Thu, 31 Dec 2020 10:39:42 -0500
Received: from relmlor1.renesas.com ([210.160.252.171]:45167 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726080AbgLaPjm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 31 Dec 2020 10:39:42 -0500
X-IronPort-AV: E=Sophos;i="5.78,464,1599490800"; 
   d="scan'208";a="67552749"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 01 Jan 2021 00:38:51 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 73D3D400F51A;
        Fri,  1 Jan 2021 00:38:49 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH] gpio: Kconfig: Update help description for GPIO_RCAR
Date:   Thu, 31 Dec 2020 15:38:42 +0000
Message-Id: <20201231153842.25782-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The gpio-rcar driver supports R-Car Gen{1,2,3} and RZ/G{1,2} SoC's, update
the description to reflect this.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/gpio/Kconfig | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index c70f46e80a3b..47e545d71df1 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -486,11 +486,12 @@ config GPIO_PXA
 	  Say yes here to support the PXA GPIO device
 
 config GPIO_RCAR
-	tristate "Renesas R-Car GPIO"
+	tristate "Renesas R-Car Gen{1,2,3} and RZ/G{1,2} GPIO support"
 	depends on ARCH_RENESAS || COMPILE_TEST
 	select GPIOLIB_IRQCHIP
 	help
-	  Say yes here to support GPIO on Renesas R-Car SoCs.
+	  Say yes here to support GPIO on Renesas R-Car Gen{1,2,3} and
+	  RZ/G{1,2} SoCs.
 
 config GPIO_RDA
 	bool "RDA Micro GPIO controller support"
-- 
2.17.1

