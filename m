Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46B1FC388F7
	for <linux-gpio@archiver.kernel.org>; Tue, 10 Nov 2020 21:56:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E890E2064B
	for <linux-gpio@archiver.kernel.org>; Tue, 10 Nov 2020 21:56:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="x2MLkGt2"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727275AbgKJV4Z (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Tue, 10 Nov 2020 16:56:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726467AbgKJV4Z (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 10 Nov 2020 16:56:25 -0500
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52957C0613D1
        for <linux-gpio@vger.kernel.org>; Tue, 10 Nov 2020 13:56:25 -0800 (PST)
Received: by mail-pg1-x541.google.com with SMTP id r10so11423475pgb.10
        for <linux-gpio@vger.kernel.org>; Tue, 10 Nov 2020 13:56:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=ixwwp1tp0QJ1czDiV+Ee/USu0gGUVFj7T0q8Sqh5cbY=;
        b=x2MLkGt2Kwxwa/HHIMbv11SZFn90oPX7JoStsS2efox7c3/KZbj2Ao/6N6ij4UdCCj
         q6KUmDWvn6uVsIs3NR/2/+FtTKtU/sdZ0s4inpDiewYBuunv7Mn9cLoyNqE6mjqgtp+J
         it9nzw/HAqCFP83xqB/MldOvypoYuS1zR5lG8DdZjKKDxTLwn1OCC42rnLMrPgcSa797
         9I2YJh918SdJMEtnoGa3SuHGw+UJQVwn0P9W2huMmMcNCcc3PO6OcxtTJhR2gLw1TtWP
         P74uE8tF1ZrfVoBYhwM1+pZsn51iCB2H5XD6FqwWB7xka6d06Q2hENyckPNSepCHE991
         7EKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=ixwwp1tp0QJ1czDiV+Ee/USu0gGUVFj7T0q8Sqh5cbY=;
        b=kW7uhZRorP5mkJTpWWYxzdKm3GE7JCfoJ9jeL1v1DPfd5kaUX83zm9iSv5yByipHAX
         fdg82COFx9Ok2Jmj8BE+9cbroRcy1gARMRocxIGzP2++87P/on/hPMET0C7LGiRi5hN+
         r4QURl0JJZn8OHcSOThm4F98bSlrEiiNNITAicUzzZljPWnpoYI9UZ1SOisPcTVu9dE/
         wyVTfAsD4AImM0gWKtS7aqQEjrSh3RhCj7B9xqGyxZHNcIkK8G8LMXUoESwPCqpe4QSO
         vOgYOWMEzVtW8Skn41Fc0+E4oQDsrkCqa9bGYBoSrkLhdPv5Lr8GNotbV8cO14ABB2E/
         CkYQ==
X-Gm-Message-State: AOAM531AGu3ATfqs2UeRovigfD/EMnBZ7wcsL5wdH2lqcz/UZ+bny0yc
        pbgmFDRC45dxCZS3N5/RYSfU2duNfk8idA==
X-Google-Smtp-Source: ABdhPJzx1zz5qx84FHMuwtUBJos+r15YzAWmoHyEyJtRcgfi/PqG9NhmRDy7ODxu0ONbm8LI+4F6gw==
X-Received: by 2002:a17:90b:1741:: with SMTP id jf1mr232895pjb.144.1605045384898;
        Tue, 10 Nov 2020 13:56:24 -0800 (PST)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
        by smtp.gmail.com with ESMTPSA id n1sm14414390pgl.31.2020.11.10.13.56.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2020 13:56:24 -0800 (PST)
From:   John Stultz <john.stultz@linaro.org>
To:     lkml <linux-kernel@vger.kernel.org>
Cc:     John Stultz <john.stultz@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Prasad Sodagudi <psodagud@codeaurora.org>,
        Vladimir Lypak <junak.pub@gmail.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: [PATCH v2] pinctrl: qcom: Fix msm8953 Kconfig entry to depend on, not select PINCTRL_MSM
Date:   Tue, 10 Nov 2020 21:56:19 +0000
Message-Id: <20201110215619.86076-1-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

One fixup following my patch commit be117ca32261 ("pinctrl:
qcom: Kconfig: Rework PINCTRL_MSM to be a depenency rather then
a selected config") being queued in LinusW's tree, as a new
config entry was added for the msm8953 that also needs the
change.

Applies to LinusW's pinctrl devel tree.

Cc: Andy Gross <agross@kernel.org>
Cc: Prasad Sodagudi <psodagud@codeaurora.org>
Cc: Vladimir Lypak <junak.pub@gmail.com>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-gpio@vger.kernel.org
Signed-off-by: John Stultz <john.stultz@linaro.org>
Change-Id: I9e8e83b1ea57aff338074be9174fce53cef29eff
---
v2:
* Fix flipped numbers in the soc name, pointed out by
  Jeffrey Hugo
---
 drivers/pinctrl/qcom/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/qcom/Kconfig b/drivers/pinctrl/qcom/Kconfig
index 8bdf878fe970c..cf56e029cd9c7 100644
--- a/drivers/pinctrl/qcom/Kconfig
+++ b/drivers/pinctrl/qcom/Kconfig
@@ -115,7 +115,7 @@ config PINCTRL_MSM8916
 config PINCTRL_MSM8953
 	tristate "Qualcomm 8953 pin controller driver"
 	depends on GPIOLIB && OF
-	select PINCTRL_MSM
+	depends on PINCTRL_MSM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
 	  Qualcomm TLMM block found on the Qualcomm MSM8953 platform.
-- 
2.17.1

