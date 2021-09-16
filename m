Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72E8BC433F5
	for <linux-gpio@archiver.kernel.org>; Thu, 16 Sep 2021 11:19:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5BCF56121F
	for <linux-gpio@archiver.kernel.org>; Thu, 16 Sep 2021 11:19:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237526AbhIPLVJ (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Thu, 16 Sep 2021 07:21:09 -0400
Received: from mx.socionext.com ([202.248.49.38]:63446 "EHLO mx.socionext.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236992AbhIPLVI (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 16 Sep 2021 07:21:08 -0400
Received: from unknown (HELO kinkan2-ex.css.socionext.com) ([172.31.9.52])
  by mx.socionext.com with ESMTP; 16 Sep 2021 20:19:46 +0900
Received: from mail.mfilter.local (m-filter-1 [10.213.24.61])
        by kinkan2-ex.css.socionext.com (Postfix) with ESMTP id BE15F2059034;
        Thu, 16 Sep 2021 20:19:46 +0900 (JST)
Received: from 172.31.9.51 (172.31.9.51) by m-FILTER with ESMTP; Thu, 16 Sep 2021 20:19:46 +0900
Received: from plum.e01.socionext.com (unknown [10.212.243.119])
        by kinkan2.css.socionext.com (Postfix) with ESMTP id 57BCEAB192;
        Thu, 16 Sep 2021 20:19:46 +0900 (JST)
From:   Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Masami Hiramatsu <mhiramat@kernel.org>
Cc:     linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Subject: [PATCH 0/3] gpio: uniphier: Misc fixes
Date:   Thu, 16 Sep 2021 20:19:34 +0900
Message-Id: <1631791177-27229-1-git-send-email-hayashi.kunihiko@socionext.com>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This patch series includes fixes and changes for UniPhier GPIO driver.

Patch 1 is to remove the return value of each function according to
the return type of irq_chip callback functions.

Patch 2 is to replace direct access to IRQ hardware number with
helper functions.

Patch 3 is to replace direct access to private data from IRQ data
with helper functions.

Kunihiko Hayashi (3):
  gpio: uniphier: Fix void functions to remove return value
  gpio: uniphier: Use helper function to get IRQ hardware number
  gpio: uniphier: Use helper functions to get private data from IRQ data

 drivers/gpio/gpio-uniphier.c | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

-- 
2.7.4

