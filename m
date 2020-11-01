Return-Path: <SRS0=ntgE=EH=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5905FC2D0A3
	for <linux-gpio@archiver.kernel.org>; Sun,  1 Nov 2020 09:01:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 13B0320882
	for <linux-gpio@archiver.kernel.org>; Sun,  1 Nov 2020 09:01:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726145AbgKAJBR (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Sun, 1 Nov 2020 04:01:17 -0500
Received: from aposti.net ([89.234.176.197]:35454 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726118AbgKAJBR (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sun, 1 Nov 2020 04:01:17 -0500
From:   Paul Cercueil <paul@crapouillou.net>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Zhou Yanjie <zhouyanjie@wanyeetech.com>, od@zcrc.me,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH 0/2] pinctrl: ingenic: Cleanup & add lcd-8bit group
Date:   Sun,  1 Nov 2020 09:01:02 +0000
Message-Id: <20201101090104.5088-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

A cleanup patch to get rid of a lot of const data, and a patch to add
the lcd-8bit group for JZ4770 SoCs.

Based on your latest for-next branch, since there are already some
commits on pinctrl-ingenic.c there that aren't on v5.10-rc1.

Cheers,
-Paul

Paul Cercueil (2):
  pinctrl: ingenic: Get rid of repetitive data
  pinctrl: ingenic: Add lcd-8bit group for JZ4770

 drivers/pinctrl/pinctrl-ingenic.c | 1267 +++++++++++------------------
 1 file changed, 455 insertions(+), 812 deletions(-)

-- 
2.28.0

