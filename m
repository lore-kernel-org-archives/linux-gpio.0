Return-Path: <SRS0=PklQ=27=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AF6DC33C99
	for <linux-gpio@archiver.kernel.org>; Fri, 10 Jan 2020 03:55:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 695F320721
	for <linux-gpio@archiver.kernel.org>; Fri, 10 Jan 2020 03:55:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="PIFFStt4"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731186AbgAJDzj (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Thu, 9 Jan 2020 22:55:39 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:45965 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731184AbgAJDzj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 9 Jan 2020 22:55:39 -0500
Received: by mail-wr1-f68.google.com with SMTP id j42so409561wrj.12
        for <linux-gpio@vger.kernel.org>; Thu, 09 Jan 2020 19:55:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=kxV5SqlkFgP5zhfbsJuuWIogZXN6mvLl8MHissFHHxg=;
        b=PIFFStt4M2Cz2Rebcs6yKg3KO/1NffcQ2nsyYGiF3v14UXaVwoRU1JK1x+PnCqCias
         74Zj31cQwCO/1M+d7BTwBRHAB4EfVm5qDSnqowwCT+NfnBPsorCxstjYNi4FZ+X5BcOm
         3aYiA/2X+XiQCNOGr+aouB2NYaezcDRqlSh3o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=kxV5SqlkFgP5zhfbsJuuWIogZXN6mvLl8MHissFHHxg=;
        b=fslaZfXGGVgcG4zPp5w2i8Ua6ThjcIS+ezBViuT7v+mHZ7DGl3mNw6eeTOIsc44OXP
         hjprHcRYnnmCz1AHhyrtm+ByNaSDfNgzaeWpDC6i5gBLqS27MXYxey6GGvcpqFcF8h4+
         WGu0GFoaDsAxCPPTvP6KE2cTZGsEGoA5ZsDZq24di8AVseXrQw7ZNE+g0UWOGSh2UlQ/
         iszf1Try1TetdWb1ns7C/aC5jCl+5E/v3MQa/v0RghGm5bNWSLLql193OB2ZcrAKtNMy
         5x4WjB9kev3Be8YIaqVmmLrh/i96txXW4T5nlSwNzT4dMhmE+GUgwfxxjk27sDnkGlxh
         +Z7A==
X-Gm-Message-State: APjAAAVcLfNd/S2Ohfy43AdEixplY5MokloHQ5nc2mA6Rb13MLTaelp3
        AlyccEyMlqUdEhbHQqM4mTG3Zg==
X-Google-Smtp-Source: APXvYqwhH4tu3jlKFGUg12Tzi7qWJWfnfZa+c/G1dxcpt5oyAFIOPeAhb3CJjIDnMMTvI/n6+5g50w==
X-Received: by 2002:a5d:6748:: with SMTP id l8mr952505wrw.188.1578628537787;
        Thu, 09 Jan 2020 19:55:37 -0800 (PST)
Received: from rayagonda.dhcp.broadcom.net ([192.19.234.250])
        by smtp.gmail.com with ESMTPSA id e18sm674999wrw.70.2020.01.09.19.55.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2020 19:55:37 -0800 (PST)
From:   Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Chris Packham <chris.packham@alliedtelesis.co.nz>,
        Li Jin <li.jin@broadcom.com>,
        YueHaibing <yuehaibing@huawei.com>, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc:     Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>
Subject: [PATCH v1 1/1] pinctrl: iproc: Use platform_get_irq_optional() to avoid error message
Date:   Fri, 10 Jan 2020 09:25:24 +0530
Message-Id: <20200110035524.23511-1-rayagonda.kokatanur@broadcom.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Use platform_get_irq_optional() instead of platform_get_irq() to avoid
below error message during probe:

[ 0.589121] iproc-gpio 66424800.gpio: IRQ index 0 not found

Signed-off-by: Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>
---
 drivers/pinctrl/bcm/pinctrl-iproc-gpio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/bcm/pinctrl-iproc-gpio.c b/drivers/pinctrl/bcm/pinctrl-iproc-gpio.c
index 831a9318c384..0d2bdb818d41 100644
--- a/drivers/pinctrl/bcm/pinctrl-iproc-gpio.c
+++ b/drivers/pinctrl/bcm/pinctrl-iproc-gpio.c
@@ -843,7 +843,7 @@ static int iproc_gpio_probe(struct platform_device *pdev)
 							"gpio-ranges");
 
 	/* optional GPIO interrupt support */
-	irq = platform_get_irq(pdev, 0);
+	irq = platform_get_irq_optional(pdev, 0);
 	if (irq > 0) {
 		struct irq_chip *irqc;
 		struct gpio_irq_chip *girq;
-- 
2.17.1

