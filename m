Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41241C433DB
	for <linux-gpio@archiver.kernel.org>; Sat, 27 Mar 2021 01:33:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 13F8161976
	for <linux-gpio@archiver.kernel.org>; Sat, 27 Mar 2021 01:33:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230121AbhC0BdY (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Fri, 26 Mar 2021 21:33:24 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:14492 "EHLO
        szxga05-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231267AbhC0BdC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 26 Mar 2021 21:33:02 -0400
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.59])
        by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4F6hBC2kNdzyQgd;
        Sat, 27 Mar 2021 09:30:59 +0800 (CST)
Received: from thunder-town.china.huawei.com (10.174.179.202) by
 DGGEMS412-HUB.china.huawei.com (10.3.19.212) with Microsoft SMTP Server id
 14.3.498.0; Sat, 27 Mar 2021 09:32:49 +0800
From:   Zhen Lei <thunder.leizhen@huawei.com>
To:     Damien Le Moal <damien.lemoal@wdc.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-riscv <linux-riscv@lists.infradead.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
CC:     Zhen Lei <thunder.leizhen@huawei.com>
Subject: [PATCH 1/1] pinctrl: Remove duplicated header file inclusion
Date:   Sat, 27 Mar 2021 09:32:38 +0800
Message-ID: <20210327013238.1712-1-thunder.leizhen@huawei.com>
X-Mailer: git-send-email 2.26.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.174.179.202]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The header file <linux/io.h> is already included above and can be
removed here.

Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
---
 drivers/pinctrl/pinctrl-k210.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-k210.c b/drivers/pinctrl/pinctrl-k210.c
index 8a733cf77ba0522..f831526d06ff68f 100644
--- a/drivers/pinctrl/pinctrl-k210.c
+++ b/drivers/pinctrl/pinctrl-k210.c
@@ -15,7 +15,6 @@
 #include <linux/pinctrl/pinmux.h>
 #include <linux/pinctrl/pinconf.h>
 #include <linux/pinctrl/pinconf-generic.h>
-#include <linux/io.h>
 
 #include <dt-bindings/pinctrl/k210-fpioa.h>
 
-- 
1.8.3


