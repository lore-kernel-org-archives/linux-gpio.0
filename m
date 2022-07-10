Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9F0FCCA479
	for <linux-gpio@archiver.kernel.org>; Sun, 10 Jul 2022 16:06:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229510AbiGJQGN (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Sun, 10 Jul 2022 12:06:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229477AbiGJQGN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 10 Jul 2022 12:06:13 -0400
X-Greylist: delayed 954 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sun, 10 Jul 2022 09:06:07 PDT
Received: from mail-m975.mail.163.com (mail-m975.mail.163.com [123.126.97.5])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 066E012ACD;
        Sun, 10 Jul 2022 09:06:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
        s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=Vn4na
        ovKTOZQthrjfaP/ehRTLiCmrzMOGVk+9JX62aE=; b=F1KUBvAfY9Xhge8HUoIqp
        s2QIWtrjjeAKg2hkUhMwfBxsnSqZ0aIwppfw1HjZww0WrR9C5Quvz7/4gLXPb+sB
        SdNdDxgEV2KkhlFPGxz2Wrd7/ox15HG8Eh2A8615v7nyiYdXuLp3A11srtXuauoM
        IuKWgXc4jKalDUZjR1qcVE=
Received: from localhost.localdomain (unknown [123.58.221.99])
        by smtp5 (Coremail) with SMTP id HdxpCgCHlzED9cpiFZjPNQ--.1936S2;
        Sun, 10 Jul 2022 23:49:25 +0800 (CST)
From:   williamsukatube@163.com
To:     arinc.unal@arinc9.com, sergio.paracuellos@gmail.com,
        linus.walleij@linaro.org, linux-mips@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     William Dean <williamsukatube@gmail.com>,
        Hacash Robot <hacashRobot@santino.com>
Subject: [PATCH] pinctrl: ralink: Check for null return of devm_kcalloc
Date:   Sun, 10 Jul 2022 23:49:22 +0800
Message-Id: <20220710154922.2610876-1-williamsukatube@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: HdxpCgCHlzED9cpiFZjPNQ--.1936S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7ZrW7Zw48Xw1fKw4fKryDKFg_yoW8JF4xpF
        43ur15Ary5JrsrZFWjywnrZry3Wa18KrW3Ga4j9rZFvF45Aas7Cay5Krs2qrWDCrWkuw13
        tr4aq342gFykAFUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07b4_-dUUUUU=
X-Originating-IP: [123.58.221.99]
X-CM-SenderInfo: xzlozx5dpv3yxdwxuvi6rwjhhfrp/xtbBiAY6g1aECCBQGAAAsF
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: William Dean <williamsukatube@gmail.com>

Because of the possible failure of the allocation, data->domains might
be NULL pointer and will cause the dereference of the NULL pointer
later.
Therefore, it might be better to check it and directly return -ENOMEM
without releasing data manually if fails, because the comment of the
devm_kmalloc() says "Memory allocated with this function is
automatically freed on driver detach.".

Fixes: a86854d0c599b ("treewide: devm_kzalloc() -> devm_kcalloc()")
Reported-by: Hacash Robot <hacashRobot@santino.com>
Signed-off-by: William Dean <williamsukatube@gmail.com>
---
 drivers/pinctrl/ralink/pinctrl-ralink.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/pinctrl/ralink/pinctrl-ralink.c b/drivers/pinctrl/ralink/pinctrl-ralink.c
index 63429a287434..770862f45b3f 100644
--- a/drivers/pinctrl/ralink/pinctrl-ralink.c
+++ b/drivers/pinctrl/ralink/pinctrl-ralink.c
@@ -266,6 +266,8 @@ static int ralink_pinctrl_pins(struct ralink_priv *p)
 						p->func[i]->pin_count,
 						sizeof(int),
 						GFP_KERNEL);
+		if (!p->func[i]->pins)
+			return -ENOMEM;
 		for (j = 0; j < p->func[i]->pin_count; j++)
 			p->func[i]->pins[j] = p->func[i]->pin_first + j;
 
-- 
2.25.1

