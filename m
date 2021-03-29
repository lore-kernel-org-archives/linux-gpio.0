Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA840C433E4
	for <linux-gpio@archiver.kernel.org>; Mon, 29 Mar 2021 11:18:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A3BCA61981
	for <linux-gpio@archiver.kernel.org>; Mon, 29 Mar 2021 11:18:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231977AbhC2LRa (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Mon, 29 Mar 2021 07:17:30 -0400
Received: from mail.thorsis.com ([92.198.35.195]:55144 "EHLO mail.thorsis.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232030AbhC2LRT (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 29 Mar 2021 07:17:19 -0400
Received: from localhost (localhost [127.0.0.1])
        by mail.thorsis.com (Postfix) with ESMTP id 0B5443585;
        Mon, 29 Mar 2021 13:17:18 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.thorsis.com
Received: from mail.thorsis.com ([127.0.0.1])
        by localhost (mail.thorsis.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id mt-4ynEJV8i1; Mon, 29 Mar 2021 13:17:17 +0200 (CEST)
Received: by mail.thorsis.com (Postfix, from userid 109)
        id E199A35AD; Mon, 29 Mar 2021 13:17:17 +0200 (CEST)
From:   Alexander Dahl <ada@thorsis.com>
To:     linux-doc@vger.kernel.org, linux-gpio@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Alexander Dahl <ada@thorsis.com>
Subject: [PATCH 0/3] docs: gpio: mockup: Fix parameter name and missing entry
Date:   Mon, 29 Mar 2021 13:16:45 +0200
Message-Id: <20210329111648.7969-1-ada@thorsis.com>
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hei hei,

while experimenting with the gpio-mockup driver, I found minor flaws in
the documentation, addressed in the three patches of this series.

Greets
Alex

Alexander Dahl (3):
  docs: gpio: mockup: Fix parameter name
  docs: kernel-parameters: Move gpio-mockup for alphabetic order
  docs: kernel-parameters: Add gpio_mockup_named_lines

 Documentation/admin-guide/gpio/gpio-mockup.rst  |  2 +-
 Documentation/admin-guide/kernel-parameters.txt | 10 ++++++----
 2 files changed, 7 insertions(+), 5 deletions(-)


base-commit: a5e13c6df0e41702d2b2c77c8ad41677ebb065b3
-- 
2.20.1

