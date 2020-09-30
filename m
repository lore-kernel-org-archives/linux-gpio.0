Return-Path: <SRS0=1XUe=DH=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86DA0C4727C
	for <linux-gpio@archiver.kernel.org>; Wed, 30 Sep 2020 17:51:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5300C2074B
	for <linux-gpio@archiver.kernel.org>; Wed, 30 Sep 2020 17:51:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=beagleboard-org.20150623.gappssmtp.com header.i=@beagleboard-org.20150623.gappssmtp.com header.b="Tjo5bueI"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726540AbgI3Rva (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Wed, 30 Sep 2020 13:51:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725372AbgI3Rva (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 30 Sep 2020 13:51:30 -0400
Received: from mail-oo1-xc44.google.com (mail-oo1-xc44.google.com [IPv6:2607:f8b0:4864:20::c44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8AF0CC061755
        for <linux-gpio@vger.kernel.org>; Wed, 30 Sep 2020 10:51:30 -0700 (PDT)
Received: by mail-oo1-xc44.google.com with SMTP id y25so723511oog.4
        for <linux-gpio@vger.kernel.org>; Wed, 30 Sep 2020 10:51:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=x+f7BiFjDcEDxXFaCSJ99BZco4Ifg1L6EBbZcOFvnW0=;
        b=Tjo5bueIAl+YDaXQLfjHBsvP2PoT4OLmNlcC8xwkoQH/VR1hvMl7i49v/9KgdlGYAn
         K+EPBZKlnqCsEWjW9J0VQYCpcb1MkZiJX5YM8I/dgwwFG1OlzdkTdzMmPlhxMR6bKtOm
         glqau5EHXF0wVVACBnxT/XX5X+nIsn50LfD0Wp42IlCXali/Ys55JD6CXmSnUvbpkV9u
         kblc+yKAA781zQqkLnNIP6BfrM78D1/LF0+h9fEhrkWcQ5kEHqDD0gT2odKSrVWsOCf3
         4y3Pwa6P8b0/r2hahzmw00WFbLNFZcx2pBwEUNshnFnGqEz7CJRbQv/AccBDHTKFauoy
         +lGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=x+f7BiFjDcEDxXFaCSJ99BZco4Ifg1L6EBbZcOFvnW0=;
        b=kiw6CTsS3GtFuQroaJpnoegoN9RtSwlcuNf5AgWY1sxBSkV9h8BfIsUJQFMD4WsDaX
         ORoTQNzBxGNQydigQHAvqNfRYKQLGBY698iQ+MB7V/j/1XZp9TM3zcJYhWLtz3KhHLXo
         7vIlhy/Ab4gRxXuzqyDlqnF4EUUnZndUf9TYgOoPtreC3/bsJqjLwRnzuh8NbBqjXQz0
         fBxLYKAPifoQ/TF2MavFXtlj91FlqAf/10tsFyVmlPRo6gneh65IVaIaU2+rN1GOdvTt
         1eUKik2KnFH9oDA5DU4hwEix4n8NB4pXsCQrtxDNXrCZ0zpgRKMLL1FCqk9XQKuYMXT3
         62nA==
X-Gm-Message-State: AOAM531qLI8tGYb8dlYbljzzcXoHsDV4O41uVDZv8NLcL5+DVlypgVBG
        ELYtKaxayUscB99fcSe7PlNOCA==
X-Google-Smtp-Source: ABdhPJx6+FOJ8Sbrdh3dEoSm+MMGjJn5gdkjEoss8V0I6jvvphZMyBw9mR4SxW7UOFzuQbn1x5gTUQ==
X-Received: by 2002:a4a:95f1:: with SMTP id p46mr2629057ooi.93.1601488289996;
        Wed, 30 Sep 2020 10:51:29 -0700 (PDT)
Received: from x1.attlocal.net ([2600:1702:da0:ff40:985b:42bd:cfe:59b7])
        by smtp.gmail.com with ESMTPSA id f194sm469873oib.44.2020.09.30.10.51.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2020 10:51:29 -0700 (PDT)
From:   Drew Fustini <drew@beagleboard.org>
To:     Tony Lindgren <tony@atomide.com>, Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@gmail.com>,
        Trent Piepho <tpiepho@gmail.com>,
        Christina Quast <cquast@hanoverdisplays.com>,
        linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org
Cc:     Drew Fustini <drew@beagleboard.org>
Subject: [PATCH v2] pinctrl: single: fix pinctrl_spec.args_count bounds check
Date:   Wed, 30 Sep 2020 12:48:40 -0500
Message-Id: <20200930174839.1308344-1-drew@beagleboard.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The property #pinctrl-cells can either be 1 or 2:

- if #pinctrl-cells = <1>, then pinctrl_spec.args_count = 2
- if #pinctrl-cells = <2>, then pinctrl_spec.args_count = 3

All other values of pinctrl_spec.args_count are incorrect.  This fix
checks the upper bound instead of just the lower bound.

Fixes: a13395418888 ("pinctrl: single: parse #pinctrl-cells = 2")
Reported-by: Trent Piepho <tpiepho@gmail.com>
Link: https://lore.kernel.org/linux-omap/3139716.CMS8C0sQ7x@zen.local/
Signed-off-by: Drew Fustini <drew@beagleboard.org>
---
v2 change:
- correct the description as I had previously been mistakenly using the
  term #pinctrl-cells instead of pinctrl_spec.args_count

 drivers/pinctrl/pinctrl-single.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-single.c b/drivers/pinctrl/pinctrl-single.c
index efe41abc5d47..5cbf0e55087c 100644
--- a/drivers/pinctrl/pinctrl-single.c
+++ b/drivers/pinctrl/pinctrl-single.c
@@ -1014,7 +1014,7 @@ static int pcs_parse_one_pinctrl_entry(struct pcs_device *pcs,
 		if (res)
 			return res;
 
-		if (pinctrl_spec.args_count < 2) {
+		if (pinctrl_spec.args_count < 2 || pinctrl_spec.args_count > 3) {
 			dev_err(pcs->dev, "invalid args_count for spec: %i\n",
 				pinctrl_spec.args_count);
 			break;
-- 
2.25.1

