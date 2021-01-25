Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEB52C433DB
	for <linux-gpio@archiver.kernel.org>; Tue, 26 Jan 2021 05:26:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7AA8A22795
	for <linux-gpio@archiver.kernel.org>; Tue, 26 Jan 2021 05:26:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730536AbhAZF0l (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Tue, 26 Jan 2021 00:26:41 -0500
Received: from mail.kernel.org ([198.145.29.99]:38890 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731161AbhAYSvk (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 25 Jan 2021 13:51:40 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id A3DEF206FA;
        Mon, 25 Jan 2021 18:50:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1611600660;
        bh=9syJUnrfT6eHtc3UwXYfWGhePUW1WZ3FCs5lGNvBCJQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=1qQN87Si+VPwNLaXkuyIZhshb6Zy8BbFZiGFvtV9v5dAU5Ix74GzYbhGysFrySTyh
         lmDW+4qVBoNWhNmir3PNE7I+y8WCHSP7rOv+KG+ZjT4FyhqPpqNPllDyOiv/IVHsmk
         jkrwEO0WVA6hW7e77/q+EB+tO05j41TB2CRlawik=
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     linux-kernel@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        stable@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, Thierry Reding <treding@nvidia.com>,
        Greentime Hu <greentime.hu@sifive.com>,
        Yash Shah <yash.shah@sifive.com>,
        Sasha Levin <sashal@kernel.org>
Subject: [PATCH 5.10 102/199] gpio: sifive: select IRQ_DOMAIN_HIERARCHY rather than depend on it
Date:   Mon, 25 Jan 2021 19:38:44 +0100
Message-Id: <20210125183220.580593553@linuxfoundation.org>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210125183216.245315437@linuxfoundation.org>
References: <20210125183216.245315437@linuxfoundation.org>
User-Agent: quilt/0.66
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Randy Dunlap <rdunlap@infradead.org>

[ Upstream commit 18eedf2b5ec7c8ce2bb23d9148cfd63949207414 ]

This is the only driver in the kernel source tree that depends on
IRQ_DOMAIN_HIERARCHY instead of selecting it. Since it is not a
visible Kconfig symbol, depending on it (expecting a user to
set/enable it) doesn't make much sense, so change it to select
instead of "depends on".

Fixes: 96868dce644d ("gpio/sifive: Add GPIO driver for SiFive SoCs")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: linux-gpio@vger.kernel.org
Cc: Thierry Reding <treding@nvidia.com>
Cc: Greentime Hu <greentime.hu@sifive.com>
Cc: Yash Shah <yash.shah@sifive.com>
Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpio/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 5d4de5cd67595..f20ac3d694246 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -508,7 +508,8 @@ config GPIO_SAMA5D2_PIOBU
 
 config GPIO_SIFIVE
 	bool "SiFive GPIO support"
-	depends on OF_GPIO && IRQ_DOMAIN_HIERARCHY
+	depends on OF_GPIO
+	select IRQ_DOMAIN_HIERARCHY
 	select GPIO_GENERIC
 	select GPIOLIB_IRQCHIP
 	select REGMAP_MMIO
-- 
2.27.0



