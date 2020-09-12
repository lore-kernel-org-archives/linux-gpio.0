Return-Path: <SRS0=FrA0=CV=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E155C43461
	for <linux-gpio@archiver.kernel.org>; Sat, 12 Sep 2020 02:23:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 50543221E5
	for <linux-gpio@archiver.kernel.org>; Sat, 12 Sep 2020 02:23:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aW5rk5Q4"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725769AbgILCXq (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Fri, 11 Sep 2020 22:23:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725763AbgILCXp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 11 Sep 2020 22:23:45 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25E82C061573
        for <linux-gpio@vger.kernel.org>; Fri, 11 Sep 2020 19:23:45 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id k13so1745400plk.3
        for <linux-gpio@vger.kernel.org>; Fri, 11 Sep 2020 19:23:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uKxJ6l42Rr5bTxZ/Q1sZtoURjghjoZrwJA5CjXTKf5Q=;
        b=aW5rk5Q4IvXJTT+ZW7ew/dkS+MAJ0bhgjbtltAzqwRHkc6gNaq3XTUKwbORNmWl8eh
         S0AqCkwXps/Oct6HMBNOqW++OplFXb+tVGjjdnbM7eEhgXJj1IJ7deWOqvOyWEShSAz3
         YXffSOoXsIfkJ5UvXD/zv4yh1WcBhXZF8nNCRcv5ySAlLoKmMWBsaSjc6WhreYzz881i
         GZEh/CNUKFKcaToef1T0xtIPgHdzPyTVIMzyrDwXS1tdr0LdEEt/wZgV0OQNzF38AeE1
         x3/3yAcDrOVAkE07EgjRcor0gm1G3UnuBOIN048fJIWLHLjO4683B1EpjXLm7PeHZWlz
         0KaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uKxJ6l42Rr5bTxZ/Q1sZtoURjghjoZrwJA5CjXTKf5Q=;
        b=tmanSLZf63fnTozk7igiWIkOZ6GnUorU7rcLGUh7Ie+a91aSvl5uQQ67JSM6LTa2Gk
         t+EDR+/Gkl4OqV69tts1Ci3mPCcQ4lu98Y/V3tWqkW7my0EbVniBkqZHlfLDGVvT/fbj
         Pe+7+nEXTRyqH9p4gDPH1y7aYxouDBPlTbl/tYbGuo3FQF40s8qvQHMWH+L3jFQ2y4XH
         we1c1/E0bcTg2ldrkxHnhXnjv1AtvVApL791GMtzXgt62BT65Ryi6EDW4NvnWGRlyVTV
         HUTsa6I3weyAVdHgzG5vsUBqU9xbvPB6zPusaLK4RqJlyeouZ+AdXB473MqvnrXjjifv
         Flmw==
X-Gm-Message-State: AOAM530WrV7W26Mg6rkhcSlorCYFC7h37LpcNLPxJezcujqwO4NMHw7U
        F2lUiqCd7rkFngm46/WQDVwpx40KGrM=
X-Google-Smtp-Source: ABdhPJyeyH/7fNsQfngGjICx2TqSouxhv5x/RAEFC2DoZUFqgOuhmLXCetw0PjeAu9pMCLrbmC+nRQ==
X-Received: by 2002:a17:90a:f206:: with SMTP id bs6mr4821140pjb.196.1599877424324;
        Fri, 11 Sep 2020 19:23:44 -0700 (PDT)
Received: from sol.lan (106-69-184-100.dyn.iinet.net.au. [106.69.184.100])
        by smtp.gmail.com with ESMTPSA id g21sm3545574pfh.30.2020.09.11.19.23.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2020 19:23:43 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, bgolaszewski@baylibre.com
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [libgpiod][PATCH 2/2] core: fix reading subset of available events
Date:   Sat, 12 Sep 2020 10:22:48 +0800
Message-Id: <20200912022248.16240-3-warthog618@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200912022248.16240-1-warthog618@gmail.com>
References: <20200912022248.16240-1-warthog618@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Only read the requested number of events from the kernel rather than
reading up to 16 and quietly discarding any surplus.

The previous behavour is particularly bad for reading single events as
userspace must read the events as quickly as they arrive, effectively
negating the presence of the kernel event kfifo.

Fixes: 44921ecc9a00 (core: provide functions for reading multiple
line events at once)

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 lib/core.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/lib/core.c b/lib/core.c
index ad76051..b964272 100644
--- a/lib/core.c
+++ b/lib/core.c
@@ -1090,7 +1090,10 @@ int gpiod_line_event_read_fd_multiple(int fd, struct gpiod_line_event *events,
 
 	memset(evdata, 0, sizeof(evdata));
 
-	rd = read(fd, evdata, sizeof(evdata));
+	if (num_events > 16)
+		num_events = 16;
+
+	rd = read(fd, evdata, num_events * sizeof(*evdata));
 	if (rd < 0) {
 		return -1;
 	} else if ((unsigned int)rd < sizeof(*evdata)) {
-- 
2.28.0

