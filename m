Return-Path: <SRS0=bajv=WA=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12700C19759
	for <linux-gpio@archiver.kernel.org>; Sun,  4 Aug 2019 15:50:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CED5E2054F
	for <linux-gpio@archiver.kernel.org>; Sun,  4 Aug 2019 15:50:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SzG8UoTS"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726190AbfHDPuB (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Sun, 4 Aug 2019 11:50:01 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:35208 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726181AbfHDPuB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 4 Aug 2019 11:50:01 -0400
Received: by mail-pf1-f196.google.com with SMTP id u14so38360818pfn.2
        for <linux-gpio@vger.kernel.org>; Sun, 04 Aug 2019 08:50:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Up2AVb1THuCCcUlmyjeQre9xUUi6KWpV7OEb7NJrgyc=;
        b=SzG8UoTSuLA63JBor9J7wsREKp2cwezocTwALqqILDU2z48mVEsREo7/fO6jPBLda4
         42O4eBK+xdtoRoVcdryQZExM4BBSRQBhdkSUDxbVrMdMJSgyxAXi+AxBnt/jwd/UUfBe
         2EzdxMlFampaB9XuM0rQ2B9tKKp+8UydzKuh+30bxLYF+zrAZvzrzea6kYqzyTfJZdZh
         h4HLEmYkgDQJU2kkxt2AmDtZYrydSfeeb9pvPNLifT/hFVTFWKb5Tnt36eTDbC3UnegW
         9u2lA7GAgWOQ/TYYu3znQfjrpWOvp3523PT7m6S51K1nZJppTr7sQA3FM9nEglEaEl/i
         FT7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Up2AVb1THuCCcUlmyjeQre9xUUi6KWpV7OEb7NJrgyc=;
        b=W2K6FYzp5hoTGnUmq3X7ZqVW0ItF9GWd76r/F4MDYrcdJsLuLZA1Oa/bKUZ9orvP1r
         QiEfIkOl7svMn7xBIRkaqs1FsQ0mUHevH7l334jsn7/T4lrRibPFajtf43LLbt6fx7hb
         tgtjKTZaqxf+E8N9YfQvTv74orrPvO7mBSrSdlkRKfFAsCmbTONZEx9dlBJJK1OwlD45
         n46pT1vDmWs2Ua6bmpJzgIyzYQluUARCncKFm4iwTzns3M1Z6C6UYIoO91KXdgVtUFhV
         7j1p8h2w+MLzkWDtvYJab715RiNLKz8mx31hkfVeEWTOKApwouEAI2kcmlV4F2Qq1bsR
         HRKQ==
X-Gm-Message-State: APjAAAWejKNPVsc2ScXOl8wvVdTGe8Zlh94uUGgXxSKa6+01Rc82TNda
        n9McY5PQVyAbM/0zVaHcZ9U=
X-Google-Smtp-Source: APXvYqwAq1UBXazMt4AzbvcxllJZz/tfMNFpbB26TP2eQPqHkzGQZ+XGow2WWQpZznUtZLwXGJ+ZFA==
X-Received: by 2002:a17:90a:2163:: with SMTP id a90mr13384385pje.3.1564933800698;
        Sun, 04 Aug 2019 08:50:00 -0700 (PDT)
Received: from localhost.localdomain ([122.163.105.8])
        by smtp.gmail.com with ESMTPSA id 85sm86623561pfv.130.2019.08.04.08.49.58
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sun, 04 Aug 2019 08:50:00 -0700 (PDT)
From:   Nishka Dasgupta <nishkadg.linux@gmail.com>
To:     vireshk@kernel.org, linus.walleij@linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
Cc:     Nishka Dasgupta <nishkadg.linux@gmail.com>
Subject: [PATCH] pinctrl: spear: spear: Add of_node_put() before return
Date:   Sun,  4 Aug 2019 21:19:48 +0530
Message-Id: <20190804154948.4584-1-nishkadg.linux@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Each iteration of for_each_child_of_node puts the previous node, but in
the case of a return from the middle of the loop, there is no put, thus
causing a memory leak. Hence add an of_node_put before the return in
two places.
Issue found with Coccinelle.

Signed-off-by: Nishka Dasgupta <nishkadg.linux@gmail.com>
---
 drivers/pinctrl/spear/pinctrl-spear.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/spear/pinctrl-spear.c b/drivers/pinctrl/spear/pinctrl-spear.c
index c4f850345dc4..7ec19c73f870 100644
--- a/drivers/pinctrl/spear/pinctrl-spear.c
+++ b/drivers/pinctrl/spear/pinctrl-spear.c
@@ -157,12 +157,16 @@ static int spear_pinctrl_dt_node_to_map(struct pinctrl_dev *pctldev,
 	/* calculate number of maps required */
 	for_each_child_of_node(np_config, np) {
 		ret = of_property_read_string(np, "st,function", &function);
-		if (ret < 0)
+		if (ret < 0) {
+			of_node_put(np);
 			return ret;
+		}
 
 		ret = of_property_count_strings(np, "st,pins");
-		if (ret < 0)
+		if (ret < 0) {
+			of_node_put(np);
 			return ret;
+		}
 
 		count += ret;
 	}
-- 
2.19.1

