Return-Path: <SRS0=05vI=ZH=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F86EC432C3
	for <linux-gpio@archiver.kernel.org>; Fri, 15 Nov 2019 14:44:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 05DB12073A
	for <linux-gpio@archiver.kernel.org>; Fri, 15 Nov 2019 14:44:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="u5U/QZux"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727590AbfKOOo6 (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Fri, 15 Nov 2019 09:44:58 -0500
Received: from mail-pf1-f193.google.com ([209.85.210.193]:38634 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727556AbfKOOo6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 15 Nov 2019 09:44:58 -0500
Received: by mail-pf1-f193.google.com with SMTP id c13so6785497pfp.5
        for <linux-gpio@vger.kernel.org>; Fri, 15 Nov 2019 06:44:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZvwpS6dx4HzMyLNoM8rvn3UIuXUCh3TZTwo5Ge8pOiE=;
        b=u5U/QZuxOmATX5llsarwcKk1Z+ZoaPDGCwtcqMsULsepcuCDjkJca5fGHWxJ2X/fuj
         VyMc7N0el+h4YS7qdtSwjtQv+ZCDvHF8fKS7PrAq1Cd+ou96W5iqaoXgEUcWyGYOAKH5
         PcS1Uq9RF1x7pJ153AMoRUuxU+h/Mm83gb3serP0koy/bUdLTKvji+wQZfJ5CRaGEFJE
         MyaLrmuAod6Sd8OTtZNwNGiiMUFhQTRtbPVWHY03pmai1Ql+adtFodVm6mqjN9GOlrCs
         D/hVaN7HtfqKOSilEu9Jvof54RhXsHlXL+vEabd7L6q9iUsaHbkuUulafegbQG/+a8on
         zmiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZvwpS6dx4HzMyLNoM8rvn3UIuXUCh3TZTwo5Ge8pOiE=;
        b=s1n+YR/qoVegkCy7TSWTDGAiY+uDNvUjhnWJsuR3BE9SnErdcnPdqZ4zJ9xQkqGcn6
         WqVdrIf2cE6N7II9H6EB8qFiRzL96jNbsfMcmG2hH1l8n4iWlZr8ztIfMMUkIfVUxcQg
         Myc4ysUj080T69FQoZJ1Bhwn9m7ap5MRzAvPOXBy4ATt19QMBLQWmw/vP776k+f0YtDB
         Q9noUfzCRNe/fya3BSx2kx9ciggs/E8/qVlxEFUWdggONcs4iIHWP14bkdSRe9Z+Tlr5
         bwPkUx1cNPDVgWPwgOH+5e9r0Iftcma28nDuGy8cBYH/LPlfpNKg2igYw6BBIk+JCwIS
         ZOTQ==
X-Gm-Message-State: APjAAAX1PSDJifHmdNc2mCPyzFnXhsrF7Tby60N8SqNtIUIF4QOZKvJ3
        5bDTIL29+pZ/Rvv9z9BIfkPc64EY+YQ=
X-Google-Smtp-Source: APXvYqyrxc/mf2e8C2YHyFRFcGneSrN+sjHkO7ejolgVAuAnqFkXTwGWeveHdRuChtpYeS77h6qEFg==
X-Received: by 2002:a63:c406:: with SMTP id h6mr11202948pgd.213.1573829097422;
        Fri, 15 Nov 2019 06:44:57 -0800 (PST)
Received: from sol.lan (220-235-109-115.dyn.iinet.net.au. [220.235.109.115])
        by smtp.gmail.com with ESMTPSA id y123sm10517726pfg.64.2019.11.15.06.44.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Nov 2019 06:44:57 -0800 (PST)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, bgolaszewski@baylibre.com
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [libgpiod] [PATCH 06/19] bindings: cxx: initialise bitset with integer instead of string
Date:   Fri, 15 Nov 2019 22:43:42 +0800
Message-Id: <20191115144355.975-7-warthog618@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191115144355.975-1-warthog618@gmail.com>
References: <20191115144355.975-1-warthog618@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Initialising bitsets with string is inefficient and confusing.
Initialise them with the corresponding int instead.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 bindings/cxx/line_bulk.cpp | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/bindings/cxx/line_bulk.cpp b/bindings/cxx/line_bulk.cpp
index 8369930..c708c8b 100644
--- a/bindings/cxx/line_bulk.cpp
+++ b/bindings/cxx/line_bulk.cpp
@@ -11,9 +11,9 @@
 
 namespace gpiod {
 
-const ::std::bitset<32> line_request::FLAG_ACTIVE_LOW("001");
-const ::std::bitset<32> line_request::FLAG_OPEN_SOURCE("010");
-const ::std::bitset<32> line_request::FLAG_OPEN_DRAIN("100");
+const ::std::bitset<32> line_request::FLAG_ACTIVE_LOW(GPIOD_BIT(0));
+const ::std::bitset<32> line_request::FLAG_OPEN_SOURCE(GPIOD_BIT(1));
+const ::std::bitset<32> line_request::FLAG_OPEN_DRAIN(GPIOD_BIT(2));
 
 namespace {
 
-- 
2.24.0

