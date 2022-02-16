Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B742C433EF
	for <linux-gpio@archiver.kernel.org>; Wed, 16 Feb 2022 12:27:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233185AbiBPM15 (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Wed, 16 Feb 2022 07:27:57 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:54840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230100AbiBPM14 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 16 Feb 2022 07:27:56 -0500
Received: from ssl.serverraum.org (ssl.serverraum.org [IPv6:2a01:4f8:151:8464::1:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5A6F2A39F5
        for <linux-gpio@vger.kernel.org>; Wed, 16 Feb 2022 04:27:44 -0800 (PST)
Received: from mwalle01.kontron.local. (unknown [213.135.10.150])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by ssl.serverraum.org (Postfix) with ESMTPSA id B4B6122246;
        Wed, 16 Feb 2022 13:27:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2016061301;
        t=1645014457;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=papN3QpdwQf9C62sFFns3emevR7CyK/275hQyIq1OFw=;
        b=HZGhfzVUiwdbNjTjTmteQtLGOsPYIxGXfEf8tEaqnG59No1jAUn0Nh6ri5G4zMGCJYYSxs
        cq3dcxIRtkGUzbxKuJ3DU2JCgb1iv5rcXj5DMnJxJ/4WHsGuBtFzJQgkhtkDAxLsmfKWxE
        NrShh6+ditm/LvNL0ETD09Q6CkVmYxo=
From:   Michael Walle <michael@walle.cc>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Colin Foster <colin.foster@in-advantage.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Michael Walle <michael@walle.cc>
Subject: [PATCH] pinctrl: ocelot: fix duplicate debugfs entry
Date:   Wed, 16 Feb 2022 13:27:27 +0100
Message-Id: <20220216122727.1005041-1-michael@walle.cc>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This driver can have up to two regmaps. If the second one is registered
its debugfs entry will have the same name as the first one and the
following error will be printed:

[    2.242568] debugfs: Directory 'e2004064.pinctrl' with parent 'regmap' already present!

Give the second regmap a name to avoid this.

Fixes: 076d9e71bcf8 ("pinctrl: ocelot: convert pinctrl to regmap")
Signed-off-by: Michael Walle <michael@walle.cc>
---
 drivers/pinctrl/pinctrl-ocelot.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/pinctrl-ocelot.c b/drivers/pinctrl/pinctrl-ocelot.c
index a859fbcb09af..35b213de1af8 100644
--- a/drivers/pinctrl/pinctrl-ocelot.c
+++ b/drivers/pinctrl/pinctrl-ocelot.c
@@ -1890,6 +1890,7 @@ static struct regmap *ocelot_pinctrl_create_pincfg(struct platform_device *pdev)
 		.val_bits = 32,
 		.reg_stride = 4,
 		.max_register = 32,
+		.name = "pincfg",
 	};
 
 	base = devm_platform_ioremap_resource(pdev, 1);
-- 
2.30.2

