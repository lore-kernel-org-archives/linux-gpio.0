Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9160ECAAD5
	for <linux-gpio@archiver.kernel.org>; Wed,  7 Sep 2022 02:11:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229719AbiIGCLs (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Tue, 6 Sep 2022 22:11:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229705AbiIGCLr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 6 Sep 2022 22:11:47 -0400
Received: from ssh248.corpemail.net (ssh248.corpemail.net [210.51.61.248])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A5158990D;
        Tue,  6 Sep 2022 19:11:45 -0700 (PDT)
Received: from ([60.208.111.195])
        by ssh248.corpemail.net ((D)) with ASMTP (SSL) id BBS00139;
        Wed, 07 Sep 2022 10:11:39 +0800
Received: from localhost.localdomain (10.200.104.82) by
 jtjnmail201619.home.langchao.com (10.100.2.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Wed, 7 Sep 2022 10:11:39 +0800
From:   Deming Wang <wangdeming@inspur.com>
To:     <linus.walleij@linaro.org>
CC:     <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Deming Wang <wangdeming@inspur.com>
Subject: [PATCH] pinctrl: Fix spelling typo in comment.
Date:   Tue, 6 Sep 2022 09:25:57 -0400
Message-ID: <20220906132557.3916-1-wangdeming@inspur.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.200.104.82]
X-ClientProxiedBy: Jtjnmail201613.home.langchao.com (10.100.2.13) To
 jtjnmail201619.home.langchao.com (10.100.2.19)
tUid:   2022907101139b50af114f4d3ee7780f514db44853ad2
X-Abuse-Reports-To: service@corp-email.com
Abuse-Reports-To: service@corp-email.com
X-Complaints-To: service@corp-email.com
X-Report-Abuse-To: service@corp-email.com
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

fix the world maxiumum to maximum.

Signed-off-by: Deming Wang <wangdeming@inspur.com>
---
 drivers/pinctrl/berlin/berlin.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/berlin/berlin.c b/drivers/pinctrl/berlin/berlin.c
index a073eedd71aa..1e427ea4d31b 100644
--- a/drivers/pinctrl/berlin/berlin.c
+++ b/drivers/pinctrl/berlin/berlin.c
@@ -209,7 +209,7 @@ static int berlin_pinctrl_build_state(struct platform_device *pdev)
 
 	for (i = 0; i < pctrl->desc->ngroups; i++) {
 		desc_group = pctrl->desc->groups + i;
-		/* compute the maxiumum number of functions a group can have */
+		/* compute the maximum number of functions a group can have */
 		max_functions += 1 << (desc_group->bit_width + 1);
 	}
 
-- 
2.27.0

