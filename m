Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77949C432C3
	for <linux-gpio@archiver.kernel.org>; Wed,  3 Mar 2021 12:58:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4E95864EBB
	for <linux-gpio@archiver.kernel.org>; Wed,  3 Mar 2021 12:58:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234389AbhCCMS0 (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Wed, 3 Mar 2021 07:18:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239761AbhCCDdz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 2 Mar 2021 22:33:55 -0500
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A397C06121F
        for <linux-gpio@vger.kernel.org>; Tue,  2 Mar 2021 19:31:27 -0800 (PST)
Received: by mail-pf1-x42b.google.com with SMTP id 201so15288410pfw.5
        for <linux-gpio@vger.kernel.org>; Tue, 02 Mar 2021 19:31:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=+0F+pGitTgwubWfG1pa09cZYXP+gzbeba4SznEWwqGI=;
        b=NxviuoedHqex1136fXmzceOOH1rLLDrZKHeclScAeylCEzqGB6HNwfHBLw+VRSNWKE
         w9LyE+UAP79zJPoq/6XzaJY61r86/ZzpLuy1c9H0Vhjx3EfeKAbUZYaZciNMwfWNf8Vv
         jMr1X72Fpznz/NB53A1Mfdiq+wBBASamhhqg/HrxSUInvWRHCK8hPdlwnm3gtP30lKWi
         BTc8zYoBhkxDKXwnQ89aDbWDv5hyae5xbqvIP9BCsr0FlOQxNMLXfXz+aHn0YqLwlyae
         Q0JKkG6eFj4iMPrGgNudgSZPuCuFAFy6Zloj5LMSUEbR/YxEFM8QXwx9HaTySPEip6SY
         thkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=+0F+pGitTgwubWfG1pa09cZYXP+gzbeba4SznEWwqGI=;
        b=lxmNeSmwo4uOcVgoZSA4hp2JnfA0aDVbhUG9wNID7IonbUCRnri1oseMdII76VRiqS
         WqJSKoE8Fp/yafNt8QP1llj/xm3X0pNllb7CDBj8fDr7jxZCs8MgFsz39Td7eIXbyRzw
         j5fo8zR2R12hNrEBlPowA1pXOwV1+TXkQBqCjgj/qztSjWuGYQSq4kqjQf2PeWB+2C/W
         yunwWF9wEb5ARyvl1DHxsx6yKfSGG19ash4l94Ti3JtxJj0IWdaE2Tx9dnMyUVWCG+Tz
         xJNjV7q42aiAm0tqCauRjG/EotD4CtNCa3wBemka0ck2bq7/Yl7XuHAUW4+p5yQSTbDE
         hq6Q==
X-Gm-Message-State: AOAM531InN6o9xTVSUaMyhrYy7h01c+UjQe2vMkBORA14URdLuW8ccoy
        iSph6VsWiV9i7WmzEZ00NAgcGg==
X-Google-Smtp-Source: ABdhPJznP8usQoH+CSTZzZ7Cbg6it5ya6bVS9YOZmFL7I1t4ENQgoxl77nM/aFPWJzl6dz1yh27qmA==
X-Received: by 2002:a62:6444:0:b029:1ee:67c6:a169 with SMTP id y65-20020a6264440000b02901ee67c6a169mr15389830pfb.47.1614742286942;
        Tue, 02 Mar 2021 19:31:26 -0800 (PST)
Received: from localhost.localdomain (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id c4sm16057511pfo.2.2021.03.02.19.31.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Mar 2021 19:31:26 -0800 (PST)
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Shawn Guo <shawn.guo@linaro.org>,
        Vinod Koul <vkoul@kernel.org>
Subject: [PATCH 4/4] arm64: dts: qcom: sm8350: fix number of pins in 'gpio-ranges'
Date:   Wed,  3 Mar 2021 11:31:06 +0800
Message-Id: <20210303033106.549-5-shawn.guo@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210303033106.549-1-shawn.guo@linaro.org>
References: <20210303033106.549-1-shawn.guo@linaro.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The last cell of 'gpio-ranges' should be number of GPIO pins, and in
case of qcom platform it should match msm_pinctrl_soc_data.ngpio rather
than msm_pinctrl_soc_data.ngpio - 1.

This fixes the problem that when the last GPIO pin in the range is
configured with the following call sequence, it always fails with
-EPROBE_DEFER.

    pinctrl_gpio_set_config()
        pinctrl_get_device_gpio_range()
            pinctrl_match_gpio_range()

Fixes: b7e8f433a673 ("arm64: dts: qcom: Add basic devicetree support for SM8350 SoC")
Cc: Vinod Koul <vkoul@kernel.org>
Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8350.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index 5ef460458f5c..fab211298c35 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -382,7 +382,7 @@
 			#gpio-cells = <2>;
 			interrupt-controller;
 			#interrupt-cells = <2>;
-			gpio-ranges = <&tlmm 0 0 203>;
+			gpio-ranges = <&tlmm 0 0 204>;
 
 			qup_uart3_default_state: qup-uart3-default-state {
 				rx {
-- 
2.17.1

