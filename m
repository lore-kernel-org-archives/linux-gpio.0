Return-Path: <SRS0=3pww=WE=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89173C0650F
	for <linux-gpio@archiver.kernel.org>; Thu,  8 Aug 2019 07:43:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5B8D0217F4
	for <linux-gpio@archiver.kernel.org>; Thu,  8 Aug 2019 07:43:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eiq6X8Tz"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731031AbfHHHnl (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Thu, 8 Aug 2019 03:43:41 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:44404 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730626AbfHHHnl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 8 Aug 2019 03:43:41 -0400
Received: by mail-pf1-f193.google.com with SMTP id t16so43584819pfe.11
        for <linux-gpio@vger.kernel.org>; Thu, 08 Aug 2019 00:43:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AXMgHZSW8OzhX2h3m9wp9Eh7S5gfMVKOdy1D1KtKg9w=;
        b=eiq6X8TzI7Xk3wU/n9OgCmYpDnxV2fGlt/1wPUpafi7XxZrWN0tGz2HL3tJAu5jPDi
         zyVM7iStU24pw7TpxyFoUsApV72HiqDwYIlnweJMVZ/HuYqWuQlogsYUZBzVFt2B9kLB
         RyLeRRLbf6FxL8pk0USD51hy4Q779KHa/g7k76MV02cmpZwHhfl9ETGYs6cy/rlujC20
         EaEPR35nPu2X9O5+nyp6zgF0MywiBp6O9nA5f/SkcHb+/XEAmRwL+Q84Is1t/LqVxvlI
         DefmJoubzYu00/jclsPwn+kSiKvQiY8pO7Yb9dAEOtCDzqlbfs66DCZmPXrmOo+3z8gJ
         BYYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AXMgHZSW8OzhX2h3m9wp9Eh7S5gfMVKOdy1D1KtKg9w=;
        b=nTzcA88Hy6VrhJPSWvV4RYa08ar12he48LOHjJJBvNxreQ/daHK8KyFFawir4hKTwi
         7TgcPd02hMI3RTO8Q74gl3AiG1kQd75Oj3OeD+IGGQhOZMPymOIsAZhkCkI2FkR+I0qn
         rG13nqwvVm3NvrTo5p0kIP9A/CgBNmGsdrG/ktR1pKMmCl/KGRZSH9ih1KjcIn5mXibM
         vJB2JxFD1JTdtMip7l1QvvWjk26IorLSaRrXKAE4Gn36ig4Tjpldo8XQ/YQlDlQm/HD9
         Eb/IogrAl8eAxGMwWWJInFYEWUGdfVMeAIBlPCjLq5FaQ1D5kaFVpZjSQ/WnzxD7BPBQ
         1MDA==
X-Gm-Message-State: APjAAAXl/pERF1ovM65hU56aNDcPltSLVHZn9AKHeNxE4NdDjdCKvzZZ
        RQaoFam0gCZYebTB+gZjDcfSzVFyq7c=
X-Google-Smtp-Source: APXvYqwN1AxHVus0cnOL01mL/P2S4iHiE0iwJ0x9QB3CCNmiNMbakyUCANGPnxjUFe3IoGYE9UJ+MA==
X-Received: by 2002:a65:50c5:: with SMTP id s5mr11547439pgp.368.1565250221233;
        Thu, 08 Aug 2019 00:43:41 -0700 (PDT)
Received: from localhost.localdomain ([122.163.44.6])
        by smtp.gmail.com with ESMTPSA id t8sm1231332pji.24.2019.08.08.00.43.38
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 08 Aug 2019 00:43:40 -0700 (PDT)
From:   Nishka Dasgupta <nishkadg.linux@gmail.com>
To:     linus.walleij@linaro.org, orsonzhai@gmail.com,
        baolin.wang@linaro.org, zhang.lyra@gmail.com,
        linux-gpio@vger.kernel.org
Cc:     Nishka Dasgupta <nishkadg.linux@gmail.com>
Subject: [PATCH] pinctrl: sprd: Add of_node_put() before return to prevent memory leak
Date:   Thu,  8 Aug 2019 13:13:29 +0530
Message-Id: <20190808074329.15579-1-nishkadg.linux@gmail.com>
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
 drivers/pinctrl/sprd/pinctrl-sprd.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/sprd/pinctrl-sprd.c b/drivers/pinctrl/sprd/pinctrl-sprd.c
index c31b58168772..5abb64da2c0d 100644
--- a/drivers/pinctrl/sprd/pinctrl-sprd.c
+++ b/drivers/pinctrl/sprd/pinctrl-sprd.c
@@ -940,8 +940,10 @@ static int sprd_pinctrl_parse_dt(struct sprd_pinctrl *sprd_pctl)
 
 	for_each_child_of_node(np, child) {
 		ret = sprd_pinctrl_parse_groups(child, sprd_pctl, grp);
-		if (ret)
+		if (ret) {
+			of_node_put(child);
 			return ret;
+		}
 
 		*temp++ = grp->name;
 		grp++;
@@ -950,8 +952,11 @@ static int sprd_pinctrl_parse_dt(struct sprd_pinctrl *sprd_pctl)
 			for_each_child_of_node(child, sub_child) {
 				ret = sprd_pinctrl_parse_groups(sub_child,
 								sprd_pctl, grp);
-				if (ret)
+				if (ret) {
+					of_node_put(sub_child);
+					of_node_put(child);
 					return ret;
+				}
 
 				*temp++ = grp->name;
 				grp++;
-- 
2.19.1

