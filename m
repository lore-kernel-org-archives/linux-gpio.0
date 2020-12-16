Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27F95C2BBD5
	for <linux-gpio@archiver.kernel.org>; Wed, 16 Dec 2020 07:39:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id ED2F523357
	for <linux-gpio@archiver.kernel.org>; Wed, 16 Dec 2020 07:39:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725936AbgLPHiw (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Wed, 16 Dec 2020 02:38:52 -0500
Received: from relmlor2.renesas.com ([210.160.252.172]:48579 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725846AbgLPHiw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 16 Dec 2020 02:38:52 -0500
X-IronPort-AV: E=Sophos;i="5.78,423,1599490800"; 
   d="scan'208";a="65934715"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 16 Dec 2020 16:38:20 +0900
Received: from localhost.localdomain (unknown [10.166.252.89])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 0BE8941F2CA9;
        Wed, 16 Dec 2020 16:38:20 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     marek.vasut+renesas@gmail.com, lee.jones@linaro.org,
        matti.vaittinen@fi.rohmeurope.com, lgirdwood@gmail.com,
        broonie@kernel.org, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com
Cc:     khiem.nguyen.xt@renesas.com, linux-power@fi.rohmeurope.com,
        linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v3 03/12] mfd: rohm-generic: Add BD9571 and BD9574
Date:   Wed, 16 Dec 2020 16:37:46 +0900
Message-Id: <1608104275-13174-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1608104275-13174-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1608104275-13174-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add chip IDs for BD9571MWV and BD9574MWF.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Reviewed-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
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

