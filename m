Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A602C433EF
	for <linux-gpio@archiver.kernel.org>; Wed, 22 Sep 2021 07:53:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 861AC61215
	for <linux-gpio@archiver.kernel.org>; Wed, 22 Sep 2021 07:53:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233283AbhIVHz2 (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Wed, 22 Sep 2021 03:55:28 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:58567 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S233391AbhIVHz2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 22 Sep 2021 03:55:28 -0400
X-IronPort-AV: E=Sophos;i="5.85,313,1624287600"; 
   d="scan'208";a="94795517"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 22 Sep 2021 16:53:57 +0900
Received: from localhost.localdomain (unknown [10.226.92.203])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id D2313400B9D8;
        Wed, 22 Sep 2021 16:53:55 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH] pinctrl: renesas: rzg2l: Fix missing port register 21h
Date:   Wed, 22 Sep 2021 08:41:40 +0100
Message-Id: <20210922074140.22178-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Remove the duplicate port register 22h and replace it with missing port
register 21h.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index dbf2f521bb27..20b2af889ca9 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
@@ -852,7 +852,7 @@ static const u32 rzg2l_gpio_configs[] = {
 	RZG2L_GPIO_PORT_PACK(2, 0x1e, RZG2L_MPXED_PIN_FUNCS),
 	RZG2L_GPIO_PORT_PACK(2, 0x1f, RZG2L_MPXED_PIN_FUNCS),
 	RZG2L_GPIO_PORT_PACK(2, 0x20, RZG2L_MPXED_PIN_FUNCS),
-	RZG2L_GPIO_PORT_PACK(3, 0x22, RZG2L_MPXED_PIN_FUNCS),
+	RZG2L_GPIO_PORT_PACK(3, 0x21, RZG2L_MPXED_PIN_FUNCS),
 	RZG2L_GPIO_PORT_PACK(2, 0x22, RZG2L_MPXED_PIN_FUNCS),
 	RZG2L_GPIO_PORT_PACK(2, 0x23, RZG2L_MPXED_PIN_FUNCS),
 	RZG2L_GPIO_PORT_PACK(3, 0x24, RZG2L_MPXED_ETH_PIN_FUNCS(PIN_CFG_IOLH_ETH0)),
-- 
2.17.1

