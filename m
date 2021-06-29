Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BD5FC11F66
	for <linux-gpio@archiver.kernel.org>; Tue, 29 Jun 2021 14:34:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4DCD561DC2
	for <linux-gpio@archiver.kernel.org>; Tue, 29 Jun 2021 14:34:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234285AbhF2Ogi (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Tue, 29 Jun 2021 10:36:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234256AbhF2Ogi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 29 Jun 2021 10:36:38 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B005AC061760;
        Tue, 29 Jun 2021 07:34:10 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id b3so26085506wrm.6;
        Tue, 29 Jun 2021 07:34:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DjlbP7xHIVTiMz/8QK+KYO/x7VOxeKFY13KcrY6RCNw=;
        b=Pu+/X0p3cgSpV49L2RbqTTQW9E5GfAzCB+cbuEJlMNiXT8n7jmdHvgU3tOj7NQaK6f
         VOZ3ajAzF3Df0k8ovHUhla5AQ3O2bkNDwi78/jxbRP3saS6IRS6t25uyRcTSjFTX71gA
         kLRUpGeoIq96TFm2ZX7UcoLxyduX365eITYbYy7TJupQ0jcgyI8O0WZfyEjMFmrTGccN
         HnLx69LSojAxoi823YEW9x/cFFRnWHfnxOynFWCjJdcd3KXPtuCV9K8ynT8hAbQgC6iy
         E8Z2ujuZF2SWCapQeROx84lEmpC75tVpBixGb6X77ONfS1/jeHtUc2obYAfJy3ghuXZj
         hr5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DjlbP7xHIVTiMz/8QK+KYO/x7VOxeKFY13KcrY6RCNw=;
        b=KlB5Ay68D8Fnumj/k/GETG5YTAEQQmicVS3B9RDrpg4NIKn5/uuo6Ai9U/7yqaU0sl
         md2KjziUxlqXcAiJPBgkrm0Fty5f1CnKJode/TjQzYXf6tx6O5ri3HPVstduMlxd3fcO
         K/zuTtUiF3lisVflymz4zmfhPjxO+MePDAGnStEnTCC/F6xhUPQiyfUCuVnAfuw7GDvm
         qCek393uFdhXo2M6/RIJfWyHP81FjSXbI97qe3YyMZWbIvL51kn3rfdK84rALSGBGVDU
         q0ON5P4PArsXepo5U/lFmzwwu3XUkYPjJBBjICh+y6YDpM4oDKy2Z7MS3FW9TpQimxlm
         Yw7g==
X-Gm-Message-State: AOAM533hzwyePXOCfEibNo6DimLpc5wsbBCG0loKpjlx1HFn7VfoDzrv
        khyUBNuvXb2POiuUuESiDYk=
X-Google-Smtp-Source: ABdhPJwxWqiXs4rGRA/jSSFSBSD4zQCDJo/4DQDonMD28ukgpf30Zx0keUfTI1j/44RVctFL75t3cw==
X-Received: by 2002:a5d:6841:: with SMTP id o1mr4143300wrw.370.1624977249133;
        Tue, 29 Jun 2021 07:34:09 -0700 (PDT)
Received: from localhost.localdomain (98.red-81-38-58.dynamicip.rima-tde.net. [81.38.58.98])
        by smtp.gmail.com with ESMTPSA id f6sm1257058wrs.13.2021.06.29.07.34.08
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 29 Jun 2021 07:34:08 -0700 (PDT)
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
To:     linus.walleij@linaro.org
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel test robot <lkp@intel.com>
Subject: [PATCH] pinctrl: ralink: rt305x: add missing include
Date:   Tue, 29 Jun 2021 16:34:07 +0200
Message-Id: <20210629143407.14703-1-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Header 'rt305x.h' is ralink architecture dependent file where
other general definitions which are in 'ralink_regs.h' are
being used. This 'rt305x.h' is only being included in two
different files: 'rt305x.c' and 'pinctrl-rt305x.c'. When
file 'pinctrl-rt305x.c' is being compiled definitions in
'ralink_regs.h' are need to build it properly. Hence, add
missing include 'ralink_regs.h' in 'pinctrl-rt305x.c'
source to avoid compilation problems.

Fixes: 3a1b0ca5a83b ("pinctrl: ralink: move RT305X SoC pinmux config into a new 'pinctrl-rt305x.c' file")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
 drivers/pinctrl/ralink/pinctrl-rt305x.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/ralink/pinctrl-rt305x.c b/drivers/pinctrl/ralink/pinctrl-rt305x.c
index 699fe18e7000..5d8fa156c003 100644
--- a/drivers/pinctrl/ralink/pinctrl-rt305x.c
+++ b/drivers/pinctrl/ralink/pinctrl-rt305x.c
@@ -1,5 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 
+#include <asm/mach-ralink/ralink_regs.h>
 #include <asm/mach-ralink/rt305x.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
-- 
2.25.1

