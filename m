Return-Path: <SRS0=d8BZ=5H=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45338C54EEB
	for <linux-gpio@archiver.kernel.org>; Sun, 22 Mar 2020 10:10:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0B5FC20714
	for <linux-gpio@archiver.kernel.org>; Sun, 22 Mar 2020 10:10:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yd6j3htw"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726866AbgCVKKV (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Sun, 22 Mar 2020 06:10:21 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:37366 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726895AbgCVKKV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 22 Mar 2020 06:10:21 -0400
Received: by mail-lj1-f195.google.com with SMTP id r24so11271287ljd.4
        for <linux-gpio@vger.kernel.org>; Sun, 22 Mar 2020 03:10:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=r8JLqywymFW9of0flwpIn7h5dE0pspzdLsAD+4b5au0=;
        b=Yd6j3htwQFpN4xj7p1Rh1QIHioLmqaKdKK48FotKAaM2KFN5HCDBZVfAzmL2jDscPB
         xK7ipym2gnK99cxNZkW7PtN9M27Cf8zy33PpqjdwNC+cB8PA0KBya5HgJnL7FolRpb1d
         gddroYY9mtaFaONt+kxmmAdtb3ng5sHp0KogY5I3RXVSAXTmrdfSsr9HBVMnfm21Jb9N
         bh2c1BbPEOVYjfeJ/wMYXmXUOi84Edl4QDa9Ugv2KOGdZ2ra5N9Vlny3js14f7wwqgZH
         yEMHF8loUgA/cqBzPBfko3ODy+XX6n1p4F/eAXzfxJ/x+hXPlczkEDmvNPXgcOOX5n5+
         XFCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=r8JLqywymFW9of0flwpIn7h5dE0pspzdLsAD+4b5au0=;
        b=qBRGUX9aHA9DixsdhNylelnu8byGcZTyCtFuQKC8BPKDRGnRy9pIRu39+QFZY8xP3D
         vqeqBJrtiq6kd+pDOJVRTEmYY5W8Mphk0rpE1QiXn9BkO4DPXt1nIqmLMSXZ5lk47QFp
         gIaqx+5FdkXAWa+FOaAwAh+jzcQaAIP9fX62e8Xoux+CedyfwZjTyIFXl6673bUsd3kL
         AMNYdlacDX1mfTruonVe/xMKgW3M63h8mZ0K0n9E56ssAxHIvCUkOyhIUnvXtevRCcYL
         vGvNNGFSIFCLl153bsNcxVE4n61oTuxji4roTXzR4QGJpBnabs+to+q7k5+zn3+jfzA/
         cF7Q==
X-Gm-Message-State: ANhLgQ2XpTtpPp9IvQQiPJFYkiKmZnw1+/Dwz0dbtpKmZ0mDJ4x6sj68
        FJCUbU9R4KwgpxuYjmvnocQ=
X-Google-Smtp-Source: ADFU+vtTs/M44qJ8sPC6d+NhnirCZBU81LudHDdPd488wGpRE7TuYLjOKous0dICDitwI2pguxyZMg==
X-Received: by 2002:a2e:914b:: with SMTP id q11mr10584881ljg.235.1584871818552;
        Sun, 22 Mar 2020 03:10:18 -0700 (PDT)
Received: from kbp1-lhp-F54859 ([77.47.205.181])
        by smtp.gmail.com with ESMTPSA id q4sm6586875lfc.32.2020.03.22.03.10.18
        (version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Sun, 22 Mar 2020 03:10:18 -0700 (PDT)
Date:   Sun, 22 Mar 2020 12:10:17 +0200
From:   Mykyta Poturai <mykyta.poturai@gmail.com>
To:     linux-gpio@vger.kernel.org
Cc:     linus.walleij@linaro.org, bgolaszewski@baylibre.com
Subject: [PATCH] tools: gpio: Fix typo in gpio-utils
Message-ID: <20200322100943.GA22132@kbp1-lhp-F54859>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Replace COMSUMER with proper CONSUMER

Signed-off-by: Mykyta Poturai <mykyta.poturai@gmail.com>
---
 tools/gpio/gpio-utils.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/gpio/gpio-utils.c b/tools/gpio/gpio-utils.c
index 53470de..0600378 100644
--- a/tools/gpio/gpio-utils.c
+++ b/tools/gpio/gpio-utils.c
@@ -17,7 +17,7 @@
 #include <linux/gpio.h>
 #include "gpio-utils.h"
 
-#define COMSUMER "gpio-utils"
+#define CONSUMER "gpio-utils"
 
 /**
  * doc: Operation of gpio
@@ -209,7 +209,7 @@ int gpiotools_gets(const char *device_name, unsigned int *lines,
 
 	ret = gpiotools_request_linehandle(device_name, lines, nlines,
 					   GPIOHANDLE_REQUEST_INPUT, data,
-					   COMSUMER);
+					   CONSUMER);
 	if (ret < 0)
 		return ret;
 
@@ -259,7 +259,7 @@ int gpiotools_sets(const char *device_name, unsigned int *lines,
 
 	ret = gpiotools_request_linehandle(device_name, lines, nlines,
 					   GPIOHANDLE_REQUEST_OUTPUT, data,
-					   COMSUMER);
+					   CONSUMER);
 	if (ret < 0)
 		return ret;
 
-- 
2.7.4

