Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B101C11F6D
	for <linux-gpio@archiver.kernel.org>; Mon, 12 Jul 2021 19:44:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2E73561370
	for <linux-gpio@archiver.kernel.org>; Mon, 12 Jul 2021 19:44:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236499AbhGLTre (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Mon, 12 Jul 2021 15:47:34 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:56489 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S236491AbhGLTrd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 12 Jul 2021 15:47:33 -0400
X-IronPort-AV: E=Sophos;i="5.84,234,1620658800"; 
   d="scan'208";a="87354843"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 13 Jul 2021 04:44:43 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id C0F0C40E0116;
        Tue, 13 Jul 2021 04:44:40 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 3/5] drivers: clk: renesas: r9a07g044-cpg: Add GPIO clock and reset entries
Date:   Mon, 12 Jul 2021 20:44:20 +0100
Message-Id: <20210712194422.12405-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210712194422.12405-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20210712194422.12405-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add GPIO clock and reset entries in CPG driver.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/clk/renesas/r9a07g044-cpg.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/clk/renesas/r9a07g044-cpg.c b/drivers/clk/renesas/r9a07g044-cpg.c
index 5d81e59f5cfe..824a0d410580 100644
--- a/drivers/clk/renesas/r9a07g044-cpg.c
+++ b/drivers/clk/renesas/r9a07g044-cpg.c
@@ -116,6 +116,8 @@ static struct rzg2l_mod_clk r9a07g044_mod_clks[] = {
 				0x584, 4),
 	DEF_MOD("sci0",		R9A07G044_SCI0_CLKP, R9A07G044_CLK_P0,
 				0x588, 0),
+	DEF_MOD("gpio",		R9A07G044_GPIO_HCLK, R9A07G044_OSCCLK,
+				0x598, 0),
 };
 
 static struct rzg2l_reset r9a07g044_resets[] = {
@@ -134,6 +136,9 @@ static struct rzg2l_reset r9a07g044_resets[] = {
 	DEF_RST(R9A07G044_SCIF3_RST_SYSTEM_N, 0x884, 3),
 	DEF_RST(R9A07G044_SCIF4_RST_SYSTEM_N, 0x884, 4),
 	DEF_RST(R9A07G044_SCI0_RST, 0x888, 0),
+	DEF_RST(R9A07G044_GPIO_RSTN, 0x898, 0),
+	DEF_RST(R9A07G044_GPIO_PORT_RESETN, 0x898, 1),
+	DEF_RST(R9A07G044_GPIO_SPARE_RESETN, 0x898, 2),
 };
 
 static const unsigned int r9a07g044_crit_mod_clks[] __initconst = {
-- 
2.17.1

