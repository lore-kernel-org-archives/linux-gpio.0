Return-Path: <SRS0=75sK=YP=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B9F0CA9EA0
	for <linux-gpio@archiver.kernel.org>; Tue, 22 Oct 2019 12:58:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4DB4F2075A
	for <linux-gpio@archiver.kernel.org>; Tue, 22 Oct 2019 12:58:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20150623.gappssmtp.com header.i=@bgdev-pl.20150623.gappssmtp.com header.b="pURmsg3Z"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388814AbfJVM6O (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Tue, 22 Oct 2019 08:58:14 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:54054 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388457AbfJVM6N (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 22 Oct 2019 08:58:13 -0400
Received: by mail-wm1-f67.google.com with SMTP id i13so1886143wmd.3
        for <linux-gpio@vger.kernel.org>; Tue, 22 Oct 2019 05:58:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=suoqoyc2KQhHanRPOnMPc0a6qX46Z0P9q3VM6Yl3yYc=;
        b=pURmsg3ZvYXJK8XvHt/BHLj6RBj38TSigA4fWfNUzzS3L5gWOei+3ecBrw7B33uJF/
         OuRji/7cCTaaHC18YUHXPtMk1WaNW1PM363T8Y/zqtqY0pULuS9A3bxesXSTXywZf2bG
         TIc6+sP91T9gbNxeZTSH3I3W79iLvOqwBeBl7ArROOEAbNQc3OvO43hGlbkrbkMty6z5
         9ACYnpGTTVvtVA5SNXkcVWqFog4LnTUDigTEXAqDubpLF/J2jQF0eSFwaouWtxx3JbRV
         eSvJNcUg8ximh2RCen5ATaIUHPil+7DjAaANvRPnn7HPtaWaNn2Z/m6z2x0o/5R8XPj2
         7snQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=suoqoyc2KQhHanRPOnMPc0a6qX46Z0P9q3VM6Yl3yYc=;
        b=bqDzTj+n8RfK5YJ8ZSspzlm+UI3I815j+XLW3XGfZbjco7JAviYFE76CU4R67QOACB
         Mu+kUa1+VzFxFybqSMMZtXr13A5L8j7V3UWqX8qprcQqHp7uqMYqw4tHYH08pMh9jQL0
         wJiEzYF91SFBojaszPT7+HX2vJZoIHWkfodlzfvvXfk0/FDldeHnyiOjI+kEnlHyH9d8
         HWmARnJxYsbhQl5ZwEmYYHibezXoHSPiJYnh5gq39vAKguBcPT4HEum+55XTMzZaqoko
         ZeaVLnd6zvdfeQf2bg2zMwot9dyvdLO28yeYGryx9gzDuSaeTKAsq/CJ2vQDbh/g7/SG
         XHSw==
X-Gm-Message-State: APjAAAVx604ZbiHIc7YcpN+Gv1s1PqUr8tGBc0W7E3RUA2BOz3+ZsBvk
        2sbTNjq7cTc1dnw9YFiU6QvlxABhXxg=
X-Google-Smtp-Source: APXvYqy0xt0Uy9n58az7lHIgOVJsQWa7z7JFTD78gzq8RwceJ3T8Ozf5oT/aOUc2tu5uCCEmv+f5Hg==
X-Received: by 2002:a7b:cf0d:: with SMTP id l13mr2809023wmg.47.1571749091654;
        Tue, 22 Oct 2019 05:58:11 -0700 (PDT)
Received: from localhost.localdomain (amontpellier-652-1-281-69.w109-210.abo.wanadoo.fr. [109.210.96.69])
        by smtp.gmail.com with ESMTPSA id j63sm21598588wmj.46.2019.10.22.05.58.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2019 05:58:10 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [GIT PULL] gpio: fixes for v5.4-rc5
Date:   Tue, 22 Oct 2019 14:58:07 +0200
Message-Id: <20191022125807.14998-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Linus,

please pull the following fix for build failure with GPIO selftests.

The following changes since commit 7d194c2100ad2a6dded545887d02754948ca5241:

  Linux 5.4-rc4 (2019-10-20 15:56:22 -0400)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-v5.4-rc5-fixes-for-linus

for you to fetch changes up to 4a6a6f5c4aeedb72db871d60bfcca89835f317aa:

  tools: gpio: Use !building_out_of_srctree to determine srctree (2019-10-22 14:42:42 +0200)

----------------------------------------------------------------
gpio fixes for v5.4-rc5

- fix building gpio selftests

----------------------------------------------------------------
Shuah Khan (1):
      tools: gpio: Use !building_out_of_srctree to determine srctree

 tools/gpio/Makefile | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)
