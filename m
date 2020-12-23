Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBC7EC4332E
	for <linux-gpio@archiver.kernel.org>; Wed, 23 Dec 2020 10:23:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A18BF207A2
	for <linux-gpio@archiver.kernel.org>; Wed, 23 Dec 2020 10:23:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728354AbgLWKXp (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Wed, 23 Dec 2020 05:23:45 -0500
Received: from relmlor1.renesas.com ([210.160.252.171]:5941 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728147AbgLWKXW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 23 Dec 2020 05:23:22 -0500
X-IronPort-AV: E=Sophos;i="5.78,441,1599490800"; 
   d="scan'208";a="66928588"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 23 Dec 2020 19:22:49 +0900
Received: from localhost.localdomain (unknown [10.166.252.89])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id B03874254F62;
        Wed, 23 Dec 2020 19:22:49 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     marek.vasut+renesas@gmail.com, lee.jones@linaro.org,
        matti.vaittinen@fi.rohmeurope.com, lgirdwood@gmail.com,
        broonie@kernel.org, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com
Cc:     khiem.nguyen.xt@renesas.com, linux-power@fi.rohmeurope.com,
        linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v6 06/12] gpio: bd9571mwv: Use the SPDX license identifier
Date:   Wed, 23 Dec 2020 19:22:37 +0900
Message-Id: <1608718963-21818-7-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1608718963-21818-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1608718963-21818-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Use the SPDX license identifier instead of a local description.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/gpio/gpio-bd9571mwv.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/gpio/gpio-bd9571mwv.c b/drivers/gpio/gpio-bd9571mwv.c
index c0abc9c..abb622c 100644
--- a/drivers/gpio/gpio-bd9571mwv.c
+++ b/drivers/gpio/gpio-bd9571mwv.c
@@ -1,17 +1,9 @@
+// SPDX-License-Identifier: GPL-2.0-only
 /*
  * ROHM BD9571MWV-M GPIO driver
  *
  * Copyright (C) 2017 Marek Vasut <marek.vasut+renesas@gmail.com>
  *
- * This program is free software; you can redistribute it and/or
- * modify it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation.
- *
- * This program is distributed "as is" WITHOUT ANY WARRANTY of any
- * kind, whether expressed or implied; without even the implied warranty
- * of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License version 2 for more details.
- *
  * Based on the TPS65086 driver
  *
  * NOTE: Interrupts are not supported yet.
-- 
2.7.4

