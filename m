Return-Path: <SRS0=XCvj=DM=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F408C4727D
	for <linux-gpio@archiver.kernel.org>; Mon,  5 Oct 2020 13:04:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 23A0020848
	for <linux-gpio@archiver.kernel.org>; Mon,  5 Oct 2020 13:04:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726735AbgJENE3 (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Mon, 5 Oct 2020 09:04:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725946AbgJENEK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 5 Oct 2020 09:04:10 -0400
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98D4CC0613A7
        for <linux-gpio@vger.kernel.org>; Mon,  5 Oct 2020 05:50:53 -0700 (PDT)
Received: from ramsan ([84.195.186.194])
        by michel.telenet-ops.be with bizsmtp
        id cCqq2300S4C55Sk06CqqDh; Mon, 05 Oct 2020 14:50:51 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1kPPx4-0006Zp-Dg; Mon, 05 Oct 2020 14:50:50 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1kPPx4-000711-C9; Mon, 05 Oct 2020 14:50:50 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Punit Agrawal <punit1.agrawal@toshiba.co.jp>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] pinctrl: visconti: PINCTRL_TMPV7700 should depend on ARCH_VISCONTI
Date:   Mon,  5 Oct 2020 14:50:49 +0200
Message-Id: <20201005125049.26926-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The Toshiba Visconti TMPV7700 series pin controller is only present on
Visconti SoCs.  Hence add a dependency on ARCH_VISCONTI, to prevent
asking the user about this driver when configuring a kernel without
Visconti platform support.

Fixes: a68a7844264e4fb9 ("pinctrl: visconti: Add Toshiba Visconti SoCs pinctrl support")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/visconti/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/visconti/Kconfig b/drivers/pinctrl/visconti/Kconfig
index 198ec33189cc4706..42653fc60413d203 100644
--- a/drivers/pinctrl/visconti/Kconfig
+++ b/drivers/pinctrl/visconti/Kconfig
@@ -9,6 +9,6 @@ config PINCTRL_VISCONTI
 config PINCTRL_TMPV7700
 	bool "Toshiba Visconti TMPV7700 series pinctrl driver"
 	depends on OF
-	depends on ARM64 || COMPILE_TEST
+	depends on ARCH_VISCONTI || COMPILE_TEST
 	select PINCTRL_VISCONTI
-	default ARM64 && ARCH_VISCONTI
+	default ARCH_VISCONTI
-- 
2.17.1

