Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6C14C433C1
	for <linux-gpio@archiver.kernel.org>; Tue, 23 Mar 2021 01:47:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 98206619A9
	for <linux-gpio@archiver.kernel.org>; Tue, 23 Mar 2021 01:47:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231389AbhCWBqj (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Mon, 22 Mar 2021 21:46:39 -0400
Received: from mail-m17637.qiye.163.com ([59.111.176.37]:34438 "EHLO
        mail-m17637.qiye.163.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231285AbhCWBqI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 22 Mar 2021 21:46:08 -0400
X-Greylist: delayed 498 seconds by postgrey-1.27 at vger.kernel.org; Mon, 22 Mar 2021 21:46:08 EDT
Received: from wanjb-virtual-machine.localdomain (unknown [36.152.145.182])
        by mail-m17637.qiye.163.com (Hmail) with ESMTPA id 21B629801E7;
        Tue, 23 Mar 2021 09:37:48 +0800 (CST)
From:   Wan Jiabing <wanjiabing@vivo.com>
To:     Damien Le Moal <damien.lemoal@wdc.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-riscv@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     kael_w@yeah.net, Wan Jiabing <wanjiabing@vivo.com>
Subject: [PATCH] drivers: pinctrl: Remove duplicate include of io.h
Date:   Tue, 23 Mar 2021 09:37:27 +0800
Message-Id: <20210323013727.135571-1-wanjiabing@vivo.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
        oVCBIfWUFZTklDTE9DSUgdQ0lLVkpNSk1PTUhPTUNPT0hVEwETFhoSFyQUDg9ZV1kWGg8SFR0UWU
        FZT0tIVUpKS0hKQ1VLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6MSI6Djo*Oj8SAjoaARYOGCwD
        IxgwC0lVSlVKTUpNT01IT01CSE9IVTMWGhIXVQwaFRESGhkSFRw7DRINFFUYFBZFWVdZEgtZQVlI
        TVVKTklVSk9OVUpDSVlXWQgBWUFKTkJPNwY+
X-HM-Tid: 0a785cbb1739d992kuws21b629801e7
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linux/io.h has been included at line 6, so remove the 
duplicate include at line 18.

Signed-off-by: Wan Jiabing <wanjiabing@vivo.com>
---
 drivers/pinctrl/pinctrl-k210.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-k210.c b/drivers/pinctrl/pinctrl-k210.c
index 8a733cf77ba0..f831526d06ff 100644
--- a/drivers/pinctrl/pinctrl-k210.c
+++ b/drivers/pinctrl/pinctrl-k210.c
@@ -15,7 +15,6 @@
 #include <linux/pinctrl/pinmux.h>
 #include <linux/pinctrl/pinconf.h>
 #include <linux/pinctrl/pinconf-generic.h>
-#include <linux/io.h>
 
 #include <dt-bindings/pinctrl/k210-fpioa.h>
 
-- 
2.25.1

