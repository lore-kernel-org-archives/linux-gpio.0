Return-Path: <SRS0=Ebct=4X=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BB8AC10F00
	for <linux-gpio@archiver.kernel.org>; Fri,  6 Mar 2020 14:16:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6397620848
	for <linux-gpio@archiver.kernel.org>; Fri,  6 Mar 2020 14:16:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="g6MK4Dz2"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726231AbgCFOQo (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Fri, 6 Mar 2020 09:16:44 -0500
Received: from mail-lf1-f68.google.com ([209.85.167.68]:44635 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726300AbgCFOQn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 6 Mar 2020 09:16:43 -0500
Received: by mail-lf1-f68.google.com with SMTP id i10so2014760lfg.11
        for <linux-gpio@vger.kernel.org>; Fri, 06 Mar 2020 06:16:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9/0gI8ozQuxXpqjac2sUOEwjrc0MZgkTZf8Mr1Hp6Z8=;
        b=g6MK4Dz2QTTwOchAt/bZludSNiE1qznro2tEwdQ+lN0IwcwvagVPwYV5X3RCu3MsGX
         sOYGk9wMmhLCum0JYYcLvVM40NNBdZhXKtS1vAdl3i0RK7HAdcDQQIAB9elAGwVJvPkV
         I2nVa+mmig6+mzLBg4+XDyb65QIPknOReIBBUpNTt89rgFnmd9CMIyszMRBDFH288vT9
         V8P4YMf7zvD2elx4eHMzucw4WUREyxAROzSvjPjXmD4R5b4xTwa5Khzguld7USWwbJA+
         kY5K6dVpRm3Wo29rRmngsc7hd9qfFt9ipWnTLAiiwoy3Y+vVLivvS4x4eQ+GWAT+kms4
         z6fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9/0gI8ozQuxXpqjac2sUOEwjrc0MZgkTZf8Mr1Hp6Z8=;
        b=KjAjj614smxNSHnnr3HmeNJ1XDAzmCT8U02nPNNHJPfjVCFsTLHnL1nKPANs7+YWUT
         YYkQkWck9NPLLRpC/b9zuXxaOL49mMnAi7YRCMDJzv7Up4mw6NL0edF3ZS1eQDNGouYF
         F26+Rev2AIdIclZC+hdOZPJCtt/l0qI4JjFHLIR33X2frqfhx4JqTfSKEAS9ANPPlBTm
         pzJTq/dG7bH3PyJ0M96mc9I4YwaSKQ8e8SFUbUZoscD3pkA0Eg81Mf0wjBisSwVEZ1LR
         7xWYK4r+WonNXFIB7NrvohknJ/T0FMV4P2Wm4RV8X3YByTbf/4Sg0lQbHYYvARgLxdLn
         CapQ==
X-Gm-Message-State: ANhLgQ0y4YVLc8J+D2qf3h/kjeFAeS+oPEuBHsw5lldmyVlRBtZi/k+5
        QF5BiNN9Xn6HeKSEgzBDGfsLqgcgAPU=
X-Google-Smtp-Source: ADFU+vua8wOdWgh1ZGzlneSxkj1QwGcR0M4r32jtX0/GZXVhZS3OB+rKpPcQ3EiomUCXXxoe/GKFzQ==
X-Received: by 2002:ac2:50c7:: with SMTP id h7mr2141447lfm.101.1583504199950;
        Fri, 06 Mar 2020 06:16:39 -0800 (PST)
Received: from genomnajs.ideon.se ([85.235.10.227])
        by smtp.gmail.com with ESMTPSA id s17sm13765957lfs.6.2020.03.06.06.16.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2020 06:16:39 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-gpio@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Brian Masney <masneyb@onstation.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        stable@vger.kernel.org
Subject: [PATCH] pinctrl: qcom: ssbi-gpio: Fix fwspec parsing bug
Date:   Fri,  6 Mar 2020 15:16:37 +0100
Message-Id: <20200306141637.1434388-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

We are parsing SSBI gpios as fourcell fwspecs but they are
twocell. Probably a simple copy-and-paste bug.

Tested on the APQ8060 DragonBoard and after this ethernet
and MMC card detection works again.

Cc: Brian Masney <masneyb@onstation.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: stable@vger.kernel.org
Fixes: ae436fe81053 ("pinctrl: ssbi-gpio: convert to hierarchical IRQ helpers in gpio core")
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c b/drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c
index dca86886b1f9..6b7f0d56a532 100644
--- a/drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c
+++ b/drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c
@@ -794,7 +794,7 @@ static int pm8xxx_gpio_probe(struct platform_device *pdev)
 	girq->fwnode = of_node_to_fwnode(pctrl->dev->of_node);
 	girq->parent_domain = parent_domain;
 	girq->child_to_parent_hwirq = pm8xxx_child_to_parent_hwirq;
-	girq->populate_parent_fwspec = gpiochip_populate_parent_fwspec_fourcell;
+	girq->populate_parent_fwspec = gpiochip_populate_parent_fwspec_twocell;
 	girq->child_offset_to_irq = pm8xxx_child_offset_to_irq;
 	girq->child_irq_domain_ops.translate = pm8xxx_domain_translate;
 
-- 
2.24.1

