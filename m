Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D02AC433F5
	for <linux-gpio@archiver.kernel.org>; Tue,  8 Mar 2022 08:46:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235249AbiCHIr2 (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Tue, 8 Mar 2022 03:47:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345089AbiCHIr1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 8 Mar 2022 03:47:27 -0500
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF6BE3FDBA
        for <linux-gpio@vger.kernel.org>; Tue,  8 Mar 2022 00:46:30 -0800 (PST)
Received: by mail-wr1-x431.google.com with SMTP id r10so27289314wrp.3
        for <linux-gpio@vger.kernel.org>; Tue, 08 Mar 2022 00:46:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OLXg6E8TUMHFsnuG3Sj+Po22TMyHRxb1PD+53CulAoE=;
        b=0yaAu98zbIRzipzC2IQi6xxkiM6bdTQ02PHWFVpvF3EIuvhOKqJ8+pCq59CUtbHPp8
         ekgvbk9FfSpl3myiDSdknNPtdyGFXZnZw1pCD9VAuokcGmbMIewtpNfDOxSEaiwxhGm/
         Z4WpSocLSPILU9Mu27dQkFWYHw43fbopsYbd/sPQtsJdpaQXoHw0y2hP/N7QEiVY/tBr
         pZBmEEGHapglyvSiJyZqDHXdSt5De0kgGKkYLaslNdebCQ0vN1Sjr5Ofu04AASdNz6Or
         RSQ73zc7c3ysIdz9XelRQXfbnf2HH0lkyWwgyaJlAQ2Rqt+ZhXQxiDzcyoyvWbWSVhar
         qjig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OLXg6E8TUMHFsnuG3Sj+Po22TMyHRxb1PD+53CulAoE=;
        b=prOmH6lwo/GaPaqW+uP+CxMJiiaotKTvgJCWagMaMtzmjY8r1Ho+67PMLN32ZSc2xf
         6Hiu5sDBdQDCoWI918/0cFKP89ntgl7qKHCpIERj7q1GetBrAhwCk2iPckwMnaGw4dU3
         LjILhb6oH9DGQrtwlzUDbMsCkC+w44iZumBZLZAUglx6gzoinYfPDJkMPFxb0HXpQ4Mc
         6PqBAho3IJp7T6BND9+UKP6YnlRzYdLTb7rWe9T5ct9tp1+9FcHaJLnj+Dh7Gru/0Bry
         CWMx357oazRjo5hQtCaoQjCjS48s931Zh7kCO2ursCd548SF4XiujxlxuX4a8N4eRY4s
         ClYA==
X-Gm-Message-State: AOAM5322c4V4szKPQEL4PHIkvFiAamOW6c8jPGMs39QMJ4kPr54+myx/
        T0FT3MkqOvzX6XC/vc4L2i8nMg==
X-Google-Smtp-Source: ABdhPJx3IQxtLDc2kDnwLu+lxeA/1bK9NijhYySncspKbiXRwKyN4SqkqhZ3fblj8BRH0svzdivBQQ==
X-Received: by 2002:adf:ef81:0:b0:1f0:95f:30a7 with SMTP id d1-20020adfef81000000b001f0095f30a7mr11209869wro.636.1646729189305;
        Tue, 08 Mar 2022 00:46:29 -0800 (PST)
Received: from debian-brgl.home ([2a01:cb1d:334:ac00:7d50:ff5:f5c1:e225])
        by smtp.gmail.com with ESMTPSA id g6-20020a5d5406000000b001f049726044sm13284385wrv.79.2022.03.08.00.46.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Mar 2022 00:46:29 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH] gpio: sim: fix a typo
Date:   Tue,  8 Mar 2022 09:46:27 +0100
Message-Id: <20220308084627.214720-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Just noticed this when applying Andy's patch. s/childred/children/

Fixes: cb8c474e79be ("gpio: sim: new testing module")
Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 drivers/gpio/gpio-sim.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-sim.c b/drivers/gpio/gpio-sim.c
index bb9bb595c1a8..8e5d87984a48 100644
--- a/drivers/gpio/gpio-sim.c
+++ b/drivers/gpio/gpio-sim.c
@@ -547,7 +547,7 @@ struct gpio_sim_bank {
 	 *
 	 * So we need to store the pointer to the parent struct here. We can
 	 * dereference it anywhere we need with no checks and no locking as
-	 * it's guaranteed to survive the childred and protected by configfs
+	 * it's guaranteed to survive the children and protected by configfs
 	 * locks.
 	 *
 	 * Same for other structures.
-- 
2.30.1

