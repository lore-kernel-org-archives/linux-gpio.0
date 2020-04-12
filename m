Return-Path: <SRS0=f3+o=54=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E371C2BA2B
	for <linux-gpio@archiver.kernel.org>; Sun, 12 Apr 2020 14:35:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3C256206E5
	for <linux-gpio@archiver.kernel.org>; Sun, 12 Apr 2020 14:35:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IxklJ81u"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726843AbgDLOfC (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Sun, 12 Apr 2020 10:35:02 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:42741 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726689AbgDLOfB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 12 Apr 2020 10:35:01 -0400
Received: by mail-pf1-f193.google.com with SMTP id r20so1754686pfh.9
        for <linux-gpio@vger.kernel.org>; Sun, 12 Apr 2020 07:35:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=t3l/b3BkwVPw7rBu6NQJtxUnkNuDJSDnYtrlNw2pk4E=;
        b=IxklJ81uyWWTUB3x7GnjKq1Z8WTAT5yxkw3HoSMYeizKXA6JQR1jwIVCjhdXgTyrW9
         vBubtKgNEMz/wyls8aL4BIGR5cmmXGLEKqzR3cDdIeKBc7bQvz5szbM5bV5qQnhaxOIF
         8QvtMDe3pG2GHCltB2gXSwzvzguXZZ1ARwgC88wSDLBzW2u5cY9fau5ExmbhAIyKCaOO
         7Fcglc7qUAkL1f/R49785+BSOR465O3C26Of2Ywh24egTAO4OCZqCZvIv+anPE0SuQ48
         SjBkgrF+f1f3vAeGh2badX5ZdfgSQuLsfRAyMELLAxgPJVtkg8P4QR0N7UNJ9vO0MFWp
         crNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=t3l/b3BkwVPw7rBu6NQJtxUnkNuDJSDnYtrlNw2pk4E=;
        b=sHePQCkw3snDXYKuhCMoBBXqq6YamKgUuqjvjKTMpfgkd+f2A2EsSJvm7CH2U+OqT5
         xD1SRENcLiemcDHe3+aOMRWcZoSEyxVKMI0cAeQFHB2LlWYY6LG1ZsS/XK0FT/1byFdB
         GSjjJZ8ySePsJ9/oNW86CE09h1qg5x7vzj3KuTJ3EIbEfHP1Djh500z4cnHU9jH+rQ0X
         cNxFgQCWAvDFKLy8MzCXbLGSayxtl3hMKDpidwVpPC5U9huuEuRXKt+xkpPSs4WqHyjH
         EZ1YAcotaFRoCLYU4AVXkCb4vVGpG7No8lwxh/jue7awBfA2O0vt0CMWpi0DdRGwYaS/
         FVqw==
X-Gm-Message-State: AGi0PuYcK578qTVhw8A48UatmUSKJuLc1nk2dQ1tTPQyRLkCr4vN178J
        MWohpOlv6OtBEXpxW3BGdcA=
X-Google-Smtp-Source: APiQypL3VozPjhSynVo+qpa75w8IPU8Y+h1fiju2DQtQYj5jvzBcovETWHbuzwmucZVg/c6mu5UKuw==
X-Received: by 2002:a62:5c1:: with SMTP id 184mr1691507pff.68.1586702101288;
        Sun, 12 Apr 2020 07:35:01 -0700 (PDT)
Received: from localhost.localdomain ([106.215.54.38])
        by smtp.gmail.com with ESMTPSA id y13sm6403901pfp.88.2020.04.12.07.34.57
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 12 Apr 2020 07:35:00 -0700 (PDT)
From:   Amit Singh Tomar <amittomer25@gmail.com>
To:     andre.przywara@arm.com, matheus@castello.eng.br,
        manivannan.sadhasivam@linaro.org, afaerber@suse.de,
        linus.walleij@linaro.org
Cc:     linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-actions@lists.infradead.org,
        Amit Singh Tomar <amittomer25@gmail.com>
Subject: [PATCH] pinctrl: actions:  fix function group name for i2c0_group
Date:   Sun, 12 Apr 2020 20:04:20 +0530
Message-Id: <1586702060-3769-1-git-send-email-amittomer25@gmail.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

After commit 6f87359e8bcaf88381b9c9c038929e0e6872d308("pinctrl: actions: Fix
functions groups names for S700 SoC") following error has been observed
while booting Linux on Cubieboard7-lite(based on S700 SoC).

[    1.206245] pinctrl-s700 e01b0000.pinctrl: invalid group "i2c0_mfp" for function "i2c0"

This commit fixes it by using correct name for i2c0_group.

Fixes: 6f87359 ("pinctrl: actions: Fix functions groups names for S700 SoC")
Signed-off-by: Amit Singh Tomar <amittomer25@gmail.com>
---
 drivers/pinctrl/actions/pinctrl-s700.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/actions/pinctrl-s700.c b/drivers/pinctrl/actions/pinctrl-s700.c
index 47a4ccd..f579a65 100644
--- a/drivers/pinctrl/actions/pinctrl-s700.c
+++ b/drivers/pinctrl/actions/pinctrl-s700.c
@@ -1435,7 +1435,7 @@ static const char * const sd2_groups[] = {
 static const char * const i2c0_groups[] = {
 	"uart0_rx_mfp",
 	"uart0_tx_mfp",
-	"i2c0_mfp_mfp",
+	"i2c0_mfp",
 };
 
 static const char * const i2c1_groups[] = {
-- 
2.7.4

