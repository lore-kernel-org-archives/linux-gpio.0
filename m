Return-Path: <SRS0=mKIB=5D=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5385C4332E
	for <linux-gpio@archiver.kernel.org>; Wed, 18 Mar 2020 21:09:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8E03320409
	for <linux-gpio@archiver.kernel.org>; Wed, 18 Mar 2020 21:09:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1584565775;
	bh=o2e8wMh9z7NTCPwAMSIFuXNtUqwqXclZwX/VgJCxUEI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=vay/145zAMc/djibe6fNtsv7X/unekTOc2H0DCc7PpehoNT0ZN7cgLkB69zSrZlVu
	 NGR5Cn0bdOG12iPsDiUsbtfQvo+Y1wfR/14sLjXuVtpiq54+9a9EAkB8PYXai8dr11
	 /cITL4x3YHpaliywdvUX3kKi5q3yiKUqiZw6CnAY=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727238AbgCRVJc (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Wed, 18 Mar 2020 17:09:32 -0400
Received: from mail.kernel.org ([198.145.29.99]:52798 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727279AbgCRUxo (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 18 Mar 2020 16:53:44 -0400
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3011620A8B;
        Wed, 18 Mar 2020 20:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1584564824;
        bh=o2e8wMh9z7NTCPwAMSIFuXNtUqwqXclZwX/VgJCxUEI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=mBG7VUtuIo2fRHJ3K9hUNrdtMGMCziQrqAhfDoRpgbiBQlYtCVgU9PyYhiFYpVEgt
         s5AEp5301HUJ6/k2J986dSUIxtx0jxYc5zV7Zmmr6jnom3kfKFHzeKGUVIzRz53iHP
         Bd9097ZXiBa+JppnMHQtgfOYPQExdDjHk+YHlM1c=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Nicolas Belin <nbelin@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Sasha Levin <sashal@kernel.org>, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org
Subject: [PATCH AUTOSEL 5.4 05/73] pinctrl: meson-gxl: fix GPIOX sdio pins
Date:   Wed, 18 Mar 2020 16:52:29 -0400
Message-Id: <20200318205337.16279-5-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200318205337.16279-1-sashal@kernel.org>
References: <20200318205337.16279-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Nicolas Belin <nbelin@baylibre.com>

[ Upstream commit dc7a06b0dbbafac8623c2b7657e61362f2f479a7 ]

In the gxl driver, the sdio cmd and clk pins are inverted. It has not caused
any issue so far because devices using these pins always take both pins
so the resulting configuration is OK.

Fixes: 0f15f500ff2c ("pinctrl: meson: Add GXL pinctrl definitions")
Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>
Signed-off-by: Nicolas Belin <nbelin@baylibre.com>
Link: https://lore.kernel.org/r/1582204512-7582-1-git-send-email-nbelin@baylibre.com
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/pinctrl/meson/pinctrl-meson-gxl.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/meson/pinctrl-meson-gxl.c b/drivers/pinctrl/meson/pinctrl-meson-gxl.c
index 72c5373c8dc1e..e8d1f3050487f 100644
--- a/drivers/pinctrl/meson/pinctrl-meson-gxl.c
+++ b/drivers/pinctrl/meson/pinctrl-meson-gxl.c
@@ -147,8 +147,8 @@ static const unsigned int sdio_d0_pins[]	= { GPIOX_0 };
 static const unsigned int sdio_d1_pins[]	= { GPIOX_1 };
 static const unsigned int sdio_d2_pins[]	= { GPIOX_2 };
 static const unsigned int sdio_d3_pins[]	= { GPIOX_3 };
-static const unsigned int sdio_cmd_pins[]	= { GPIOX_4 };
-static const unsigned int sdio_clk_pins[]	= { GPIOX_5 };
+static const unsigned int sdio_clk_pins[]	= { GPIOX_4 };
+static const unsigned int sdio_cmd_pins[]	= { GPIOX_5 };
 static const unsigned int sdio_irq_pins[]	= { GPIOX_7 };
 
 static const unsigned int nand_ce0_pins[]	= { BOOT_8 };
-- 
2.20.1

