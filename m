Return-Path: <SRS0=VCro=XW=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 788EEC352AB
	for <linux-gpio@archiver.kernel.org>; Fri, 27 Sep 2019 01:16:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4E10C2086A
	for <linux-gpio@archiver.kernel.org>; Fri, 27 Sep 2019 01:16:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1569547005;
	bh=PZtyDM2liT0VEcgwIYTVTYCYsCFPcFxFMVarl4i+dKA=;
	h=From:To:Cc:Subject:Date:List-ID:From;
	b=JTGQW9LShC9rua+ENNPZ99QMHxF3S0LXBE6L4mUfpKHMVodj1wk0+LN+hvo2TqzgK
	 uuSfR+8lUcyNbSWg5t9VX6xrH5Hy5KaBQ8l3kbzO26CTGxl8ZABYe+Z6TSvjo7T5+7
	 M5s2WHwW8rt81hqfVt+PN8MSDTiFIRDcMdVLJru8=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726202AbfI0BQp (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Thu, 26 Sep 2019 21:16:45 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:35826 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726140AbfI0BQo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 26 Sep 2019 21:16:44 -0400
Received: by mail-io1-f68.google.com with SMTP id q10so11914050iop.2
        for <linux-gpio@vger.kernel.org>; Thu, 26 Sep 2019 18:16:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=H2GyEMBjk27THtCkzskXmMVgGtiHssCWYkVZJhAzOdg=;
        b=BY3eP8mGIkLH/kjnNmwFxxobZiK8CoYQi9lyd2yXukK5S/NAvSa5KF4f8hpeLfkQuM
         hHoxaOV2Pa6GF2CZECb3AqZAjQ8p/pS1vAuURM2Totchz2gfdi/b/I0AjYAv0jGL0aKX
         552gq4qW4lMnHWn2Ek2jKIBttdf8IHEWRQcnU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=H2GyEMBjk27THtCkzskXmMVgGtiHssCWYkVZJhAzOdg=;
        b=q4TQHWmKO0lc7AlJcilcwU/b2WueRNt1NJO9Dnkn3v4mCXeZ8JAFiSECURraEI7J1K
         7op/70TsOduf/G6QM51ja3LqjNdyhp+xcDTMxQRcUY6WQZlZz1tmP7C6J6+kjIobXyfG
         oTrTyictNbnR+maCLml+o2dNIh5E7h2y2bSFq3toL1AuNpt5UHnF/gXBQ4jJ14jbDeLp
         7AYRJfb6PsGneu6diEY//xa9A4Xl3nMqLS+em6Kwlkb9w57Jlmz5Iyk2MPwFLb4slvr8
         3jsDDGFSMwKMwwe5k4ewwKY0WbQAvvVJDffUq1+lfeOz3spF9AIGUnf6uTcR5DtJiu7P
         uoQw==
X-Gm-Message-State: APjAAAVHJWCYsmnPyJcuZD+wtq6iHP3H77qpUtqqLHkThzRhePhAFXvp
        ORshVjBwZO2NbLJpRs0L+1J3mw==
X-Google-Smtp-Source: APXvYqw4JUFgbiVAQSuDwJ3BV44jJ7VB5OKgmirW3uvkHAOBn1S/AOu+UhOVLSlxzghLpFiI9P2BvQ==
X-Received: by 2002:a6b:fa07:: with SMTP id p7mr6298691ioh.164.1569547003964;
        Thu, 26 Sep 2019 18:16:43 -0700 (PDT)
Received: from shuah-t480s.internal (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id x2sm1652121iob.74.2019.09.26.18.16.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Sep 2019 18:16:43 -0700 (PDT)
From:   Shuah Khan <skhan@linuxfoundation.org>
To:     linus.walleij@linaro.org, bgolaszewski@baylibre.com
Cc:     Shuah Khan <skhan@linuxfoundation.org>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: [PATCH RESEND] tools: gpio: Use !building_out_of_srctree to determine srctree
Date:   Thu, 26 Sep 2019 19:16:41 -0600
Message-Id: <20190927011641.4858-1-skhan@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

make TARGETS=gpio kselftest fails with:

Makefile:23: tools/build/Makefile.include: No such file or directory

When the gpio tool make is invoked from tools Makefile, srctree is
cleared and the current logic check for srctree equals to empty
string to determine srctree location from CURDIR.

When the build in invoked from selftests/gpio Makefile, the srctree
is set to "." and the same logic used for srctree equals to empty is
needed to determine srctree.

Check building_out_of_srctree undefined as the condition for both
cases to fix "make TARGETS=gpio kselftest" build failure.

Signed-off-by: Shuah Khan <skhan@linuxfoundation.org>
---
Rsending with corrected address for linux-kselftest@vger.kernel.org

 tools/gpio/Makefile | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/tools/gpio/Makefile b/tools/gpio/Makefile
index 6ecdd1067826..1178d302757e 100644
--- a/tools/gpio/Makefile
+++ b/tools/gpio/Makefile
@@ -3,7 +3,11 @@ include ../scripts/Makefile.include
 
 bindir ?= /usr/bin
 
-ifeq ($(srctree),)
+# This will work when gpio is built in tools env. where srctree
+# isn't set and when invoked from selftests build, where srctree
+# is set to ".". building_out_of_srctree is undefined for in srctree
+# builds
+ifndef building_out_of_srctree
 srctree := $(patsubst %/,%,$(dir $(CURDIR)))
 srctree := $(patsubst %/,%,$(dir $(srctree)))
 endif
-- 
2.20.1

