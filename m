Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3688CC43331
	for <linux-gpio@archiver.kernel.org>; Wed, 23 Dec 2020 10:24:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0A0E2207A2
	for <linux-gpio@archiver.kernel.org>; Wed, 23 Dec 2020 10:24:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728584AbgLWKYF (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Wed, 23 Dec 2020 05:24:05 -0500
Received: from relmlor2.renesas.com ([210.160.252.172]:44721 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728157AbgLWKXV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 23 Dec 2020 05:23:21 -0500
X-IronPort-AV: E=Sophos;i="5.78,441,1599490800"; 
   d="scan'208";a="66712867"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 23 Dec 2020 19:22:49 +0900
Received: from localhost.localdomain (unknown [10.166.252.89])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 5D7784255D30;
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
Subject: [PATCH v6 03/12] mfd: rohm-generic: Add BD9571 and BD9574
Date:   Wed, 23 Dec 2020 19:22:34 +0900
Message-Id: <1608718963-21818-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1608718963-21818-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1608718963-21818-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add chip IDs for BD9571MWV and BD9574MWF.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Reviewed-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>
---
 include/linux/mfd/rohm-generic.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/linux/mfd/rohm-generic.h b/include/linux/mfd/rohm-generic.h
index 4283b5b..affacf8 100644
--- a/include/linux/mfd/rohm-generic.h
+++ b/include/linux/mfd/rohm-generic.h
@@ -12,6 +12,8 @@ enum rohm_chip_type {
 	ROHM_CHIP_TYPE_BD71847,
 	ROHM_CHIP_TYPE_BD70528,
 	ROHM_CHIP_TYPE_BD71828,
+	ROHM_CHIP_TYPE_BD9571,
+	ROHM_CHIP_TYPE_BD9574,
 	ROHM_CHIP_TYPE_AMOUNT
 };
 
-- 
2.7.4

