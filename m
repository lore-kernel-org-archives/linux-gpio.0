Return-Path: <SRS0=6v+K=ZI=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A985EC43215
	for <linux-gpio@archiver.kernel.org>; Sat, 16 Nov 2019 16:16:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 81CAE21479
	for <linux-gpio@archiver.kernel.org>; Sat, 16 Nov 2019 16:16:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1573920974;
	bh=TSfcfKMerSp3xOiFklG5ABCAq1n+d8pMG/0OHuwn+yU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=ga/yoOxfvzgORASdBz/QF1ud9feu5/whNg0ayge6JPfkDL+Y7KoYmNYOvh52csgGW
	 8JUGN7PzND9TeMdVn3APDGe9plMpjXmbban0jwYhHvutFav7x/HOKG4fAZ1zFRlcP8
	 YKgtjV4DKpX7Sgz1DkZnj2cbDxzbZceNL8LarKBA=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728747AbfKPQQJ (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Sat, 16 Nov 2019 11:16:09 -0500
Received: from mail.kernel.org ([198.145.29.99]:53704 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729589AbfKPPrF (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sat, 16 Nov 2019 10:47:05 -0500
Received: from sasha-vm.mshome.net (unknown [50.234.116.4])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 117C22083E;
        Sat, 16 Nov 2019 15:47:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1573919225;
        bh=TSfcfKMerSp3xOiFklG5ABCAq1n+d8pMG/0OHuwn+yU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=LVVLIxlMj7Swf6PM3zsF/dU/AvZNzXZpl0LfXPun2d/DK87Jbm4lJ0ok78bL7b2Cz
         byMny3x5PLxTxF6+oHkSJv3g7XJDA5ZezQBpvNga9geNpykJWjZ/lxRHnrkOHeC3iO
         J4CE2y/P+lhw1Rx7ZQQoe6G4mJ/H/BYGwvOPTrbw=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Nathan Chancellor <natechancellor@gmail.com>,
        Stefan Wahren <stefan.wahren@i2se.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Sasha Levin <sashal@kernel.org>, linux-gpio@vger.kernel.org,
        clang-built-linux@googlegroups.com
Subject: [PATCH AUTOSEL 4.19 228/237] pinctrl: bcm2835: Use define directive for BCM2835_PINCONF_PARAM_PULL
Date:   Sat, 16 Nov 2019 10:41:03 -0500
Message-Id: <20191116154113.7417-228-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191116154113.7417-1-sashal@kernel.org>
References: <20191116154113.7417-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Nathan Chancellor <natechancellor@gmail.com>

[ Upstream commit b40ac08ff886302a6aa457fd72e94a969f50e245 ]

Clang warns when one enumerated type is implicitly converted to another:

drivers/pinctrl/bcm/pinctrl-bcm2835.c:707:40: warning: implicit
conversion from enumeration type 'enum bcm2835_pinconf_param' to
different enumeration type 'enum pin_config_param' [-Wenum-conversion]
        configs[0] = pinconf_to_config_packed(BCM2835_PINCONF_PARAM_PULL, pull);
                     ~~~~~~~~~~~~~~~~~~~~~~~~ ^~~~~~~~~~~~~~~~~~~~~~~~~~
1 warning generated.

It is expected that pinctrl drivers can extend pin_config_param because
of the gap between PIN_CONFIG_END and PIN_CONFIG_MAX so this conversion
isn't an issue. Most drivers that take advantage of this define the
PIN_CONFIG variables as constants, rather than enumerated values. Do the
same thing here so that Clang no longer warns.

Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
Acked-by: Stefan Wahren <stefan.wahren@i2se.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/pinctrl/bcm/pinctrl-bcm2835.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/bcm/pinctrl-bcm2835.c b/drivers/pinctrl/bcm/pinctrl-bcm2835.c
index 08925d24180b0..1bd3c10ce1893 100644
--- a/drivers/pinctrl/bcm/pinctrl-bcm2835.c
+++ b/drivers/pinctrl/bcm/pinctrl-bcm2835.c
@@ -72,10 +72,8 @@
 #define GPIO_REG_OFFSET(p)	((p) / 32)
 #define GPIO_REG_SHIFT(p)	((p) % 32)
 
-enum bcm2835_pinconf_param {
-	/* argument: bcm2835_pinconf_pull */
-	BCM2835_PINCONF_PARAM_PULL = (PIN_CONFIG_END + 1),
-};
+/* argument: bcm2835_pinconf_pull */
+#define BCM2835_PINCONF_PARAM_PULL	(PIN_CONFIG_END + 1)
 
 struct bcm2835_pinctrl {
 	struct device *dev;
-- 
2.20.1

