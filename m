Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 904DAC2D0E4
	for <linux-gpio@archiver.kernel.org>; Fri, 27 Nov 2020 15:07:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1BDB222240
	for <linux-gpio@archiver.kernel.org>; Fri, 27 Nov 2020 15:07:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=enlaps-fr.20150623.gappssmtp.com header.i=@enlaps-fr.20150623.gappssmtp.com header.b="FZ6Mczh3"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729113AbgK0PHd (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Fri, 27 Nov 2020 10:07:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728153AbgK0PHd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 27 Nov 2020 10:07:33 -0500
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B76FEC0613D1
        for <linux-gpio@vger.kernel.org>; Fri, 27 Nov 2020 07:07:32 -0800 (PST)
Received: by mail-wr1-x441.google.com with SMTP id m6so5897493wrg.7
        for <linux-gpio@vger.kernel.org>; Fri, 27 Nov 2020 07:07:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=enlaps-fr.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7m+5V7As82PrUFzHc3ech+CufWCm7BADGWBuVb+dvQc=;
        b=FZ6Mczh3PlCqOlnVuUZVJHoJUo6fDaNHtEZSaD04t/DJbbPBbrvCxAllQYdEbaO36q
         iVe3GYwxGLQWJJb03RNdbu0wUJPO5QhcPwNsZoOZutoOWlshR0h/zrxOJaMECKgx2rJ7
         h39D77NA/F3l00Za1XbxajpAW3LYfDnhmZmJYLJAwJUUE0Rf0Dj4BPosKhiUqSR+v6V2
         9/S56cDHkmxWNleJ9a+HZ6clXCNQvIB8vbf+OPSGnCbSv6LMPza8ExPrMNYxy2OZyRMJ
         cilO38yza+5zbYjzHCTNpW06YIVyEJgUUQ55cE4W9RnuvBvMaWx8EqSd65zEEJDO2wUV
         NFNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7m+5V7As82PrUFzHc3ech+CufWCm7BADGWBuVb+dvQc=;
        b=NeVqPLHIlotEq39f94pxQsyn4Bg1TxLDlMCUxq2ovyPsCRfeKvnLF7gdlCYZbXwp5W
         PID1jHQJOFzPkQevhNKtvEd164OB0C7LQ/Br/OdHjwmJDSm73GpeOxRp3m4kl8by8PNp
         DL1VWxi2GmmD0gOu7wFrvUDGiheQQ4w1LpAcdn+AZS9f8CPukZqDBZM0ZJ+eDZke8tkU
         t1GcvJw5ESFIjQ3RALV344jj0Z19e29k14/HBKCdz1CUWjRIb7GxikqCUGd1OOU0M5Xy
         8uZYhuyEHphOB5iv4zeARMZXoWKXFthX1KJ+HTOcwWwM2SV1/CplrVLl+BrLaTumElax
         r7VA==
X-Gm-Message-State: AOAM531D6jKtaa98kOiwjicTnl1D+El+HZx9szHuUvlhHJbslbpn+RBq
        sbhIF6MZONUuSdDi7wTIRtAToA4JyFjDi66W
X-Google-Smtp-Source: ABdhPJx7WammRP8AytrzaoOoK+SRp9iX/G5EEoDuuMkiJRgKRzWVeWwEUiDC7RyIsHmQXeTtZbNoHg==
X-Received: by 2002:adf:b64f:: with SMTP id i15mr11305525wre.125.1606489651560;
        Fri, 27 Nov 2020 07:07:31 -0800 (PST)
Received: from sabin.numericable.fr (161.112.141.88.rev.sfr.net. [88.141.112.161])
        by smtp.googlemail.com with ESMTPSA id o5sm13445540wmh.8.2020.11.27.07.07.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2020 07:07:31 -0800 (PST)
From:   Louis Rannou <louis@enlaps.fr>
X-Google-Original-From: Louis Rannou <louis.rannou@enlaps.fr>
To:     Dong Aisheng <aisheng.dong@nxp.com>, linux-gpio@vger.kernel.org
Cc:     Pengutronix Kernel Team <kernel@pengutronix.de>,
        Louis Rannou <louis.rannou@enlaps.fr>
Subject: [PATCH] Documentation: pinctrl: imx7ulp: fix incorrect pin CONFIG settings
Date:   Fri, 27 Nov 2020 16:06:25 +0100
Message-Id: <20201127150625.1767408-1-louis.rannou@enlaps.fr>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

According to the imx7ulp reference manual, the LSB refers to PS (Pull Select Field) and
the 2nd to PE (Pull-up Enable).

Signed-off-by: Louis Rannou <louis.rannou@enlaps.fr>
---
 .../devicetree/bindings/pinctrl/fsl,imx7ulp-pinctrl.txt        | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/fsl,imx7ulp-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/fsl,imx7ulp-pinctrl.txt
index bfa3703a7446..50ae260581eb 100644
--- a/Documentation/devicetree/bindings/pinctrl/fsl,imx7ulp-pinctrl.txt
+++ b/Documentation/devicetree/bindings/pinctrl/fsl,imx7ulp-pinctrl.txt
@@ -33,7 +33,8 @@ PAD_CTL_ODE		(1 << 5)
 PAD_CTL_PUSH_PULL	(0 << 5)
 PAD_CTL_SRE_SLOW	(1 << 2)
 PAD_CTL_SRE_STD		(0 << 2)
-PAD_CTL_PE		(1 << 0)
+PAD_CTL_PE		(1 << 1)
+PAD_CTL_PS		(1 << 0)
 
 Examples:
 #include "imx7ulp-pinfunc.h"
-- 
2.29.2

