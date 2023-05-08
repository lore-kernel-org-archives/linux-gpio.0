Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A1ABC77B7F
	for <linux-gpio@archiver.kernel.org>; Mon,  8 May 2023 13:21:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232748AbjEHNVJ (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Mon, 8 May 2023 09:21:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234149AbjEHNVC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 8 May 2023 09:21:02 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FBEF2C3E1
        for <linux-gpio@vger.kernel.org>; Mon,  8 May 2023 06:20:41 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-50bc37e1525so8808360a12.1
        for <linux-gpio@vger.kernel.org>; Mon, 08 May 2023 06:20:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683552039; x=1686144039;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9DPSTYLZzx0IB6urGrXbO9kytDdB95tFh7AHyKZFl7s=;
        b=kaRvbigS/7N1hlGDbYjC230gag7zBGHtym03wChKWPTr9C1dlkkHeSRMuoizAhx07g
         i//WLMw2mSEmWrWJqUCcVBB1ZBmPV9H8kVE7UmXgAVihUegtK70UuTZDziQnWlbYiOPo
         BTHfKtc6dcy8hDt+u0tTZKMNvYmMrAPFJbJLEnpRie+51AeXXqjiTw9w1ctnz3N5Qosb
         rSV04DbMHej61wMkgPYOVAI1QvAmLXCK0HaPFEyNoZ1AIqJPONRFGMdJXirv3cQCMPTi
         rM76dTgHGCz4PKIuLWw5vbY2jTq1xdv69duh4R54vAV49uRSDAbJ9qsdbar4Al5b3Gwp
         d9WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683552039; x=1686144039;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9DPSTYLZzx0IB6urGrXbO9kytDdB95tFh7AHyKZFl7s=;
        b=JOdGoWLQegxHEaZ86SAmd+wolZNBjS+lKwUygBesbR142bYCIWx1RNtp/eHk2gZdSH
         lJBe1lXk3oe4CQ82RRuvAb1T64CnwvzYghKC3cc5Gyh2pbD1g9Gv4IidGMJ6ZgBQJIjb
         dlKBPcxKsLiGcy4xcUuadaPRrtU90iyhE/MBB5Xu4jjaJ5Xd/dWt35ud8oe2wGVjaFKF
         TbDO3OYDRFTM7PKnQ3pkj29XIvv399is7no35qtEbQASLCekxK6wdbw2/Q+wHm3wJ0ih
         x+7zidtarWSlBwDJ1DIxnsyJWIGhkqfvtUTb5gyjfLG+JPkve1sx3usWvpA9E9HI5cNx
         vDtQ==
X-Gm-Message-State: AC+VfDzrPAdMezNNd4RDbkpEZpWCEX3qelb+QXenwr7kYs/Y7uJplCkR
        60XzcQDGdvksmI2zAb/sOiyUmMq2iVlz9A==
X-Google-Smtp-Source: ACHHUZ4IaC0FqAkYNwiY8ldS4aQxf4ciE68zWkCg5/XCpyNP1aNbxW0Sk7zjJSLEsKKx9gGMk5PP+g==
X-Received: by 2002:aa7:cd4e:0:b0:504:ae37:77d0 with SMTP id v14-20020aa7cd4e000000b00504ae3777d0mr9154152edw.10.1683552039593;
        Mon, 08 May 2023 06:20:39 -0700 (PDT)
Received: from computer001049.comelit.it (net-2-40-105-25.cust.vodafonedsl.it. [2.40.105.25])
        by smtp.gmail.com with ESMTPSA id s2-20020aa7cb02000000b0050d82f96860sm3551901edt.59.2023.05.08.06.20.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 May 2023 06:20:39 -0700 (PDT)
From:   Milo Spadacini <milo.spadacini@gmail.com>
To:     linus.walleij@linaro.org, brgl@bgdev.pl,
        linux-gpio@vger.kernel.org, warthog618@gmail.com,
        andy.shevchenko@gmail.com
Cc:     Milo Spadacini <milo.spadacini@gmail.com>
Subject: [PATCH v3] tools: gpio: fix debounce_period_us output of lsgpio
Date:   Mon,  8 May 2023 15:18:48 +0200
Message-Id: <20230508131848.142602-1-milo.spadacini@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Fix incorrect output that could occur when more attributes are used and
GPIO_V2_LINE_ATTR_ID_DEBOUNCE is not the first one.

Signed-off-by: Milo Spadacini <milo.spadacini@gmail.com>
---
V2 -> V3 add signature
V1 -> V2 fix commit syntax
---
 tools/gpio/lsgpio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/gpio/lsgpio.c b/tools/gpio/lsgpio.c
index c61d061247e1..52a0be45410c 100644
--- a/tools/gpio/lsgpio.c
+++ b/tools/gpio/lsgpio.c
@@ -94,7 +94,7 @@ static void print_attributes(struct gpio_v2_line_info *info)
 	for (i = 0; i < info->num_attrs; i++) {
 		if (info->attrs[i].id == GPIO_V2_LINE_ATTR_ID_DEBOUNCE)
 			fprintf(stdout, ", debounce_period=%dusec",
-				info->attrs[0].debounce_period_us);
+				info->attrs[i].debounce_period_us);
 	}
 }
 
-- 
2.34.1

