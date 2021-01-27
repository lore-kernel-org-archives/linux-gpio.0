Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CF37C433DB
	for <linux-gpio@archiver.kernel.org>; Wed, 27 Jan 2021 10:50:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 013282074B
	for <linux-gpio@archiver.kernel.org>; Wed, 27 Jan 2021 10:50:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236151AbhA0KuI (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Wed, 27 Jan 2021 05:50:08 -0500
Received: from forward102o.mail.yandex.net ([37.140.190.182]:33627 "EHLO
        forward102o.mail.yandex.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235846AbhA0KsM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 27 Jan 2021 05:48:12 -0500
Received: from iva4-31e05f600ad9.qloud-c.yandex.net (iva4-31e05f600ad9.qloud-c.yandex.net [IPv6:2a02:6b8:c0c:1493:0:640:31e0:5f60])
        by forward102o.mail.yandex.net (Yandex) with ESMTP id 5E0BD66827A6;
        Wed, 27 Jan 2021 13:46:26 +0300 (MSK)
Received: from iva6-2d18925256a6.qloud-c.yandex.net (iva6-2d18925256a6.qloud-c.yandex.net [2a02:6b8:c0c:7594:0:640:2d18:9252])
        by iva4-31e05f600ad9.qloud-c.yandex.net (mxback/Yandex) with ESMTP id 2YM4roT5AX-kPGO1Wmq;
        Wed, 27 Jan 2021 13:46:26 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=maquefel.me; s=mail; t=1611744386;
        bh=X6QfomTan/HH9I6uy632rlEwjgbCDUdghehKW286j0M=;
        h=In-Reply-To:References:Date:Subject:To:From:Message-Id:Cc;
        b=tUJe0YdcL3LXmPJcOqZz+jFCaDTRXUP+aUzza9v/366qV239riVcxZUlsi98sGsF9
         vwQxgfGjfGdAXmanWq7RclQ/9QWLATXbGRegR2bJVBSD0PrgwMSqUaL5kS4pFBZoCP
         ASH2DRsk1nqJZlfoHhp+G82X+Bnj1ra2rkYkV3HE=
Authentication-Results: iva4-31e05f600ad9.qloud-c.yandex.net; dkim=pass header.i=@maquefel.me
Received: by iva6-2d18925256a6.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA id AUuDuROonk-kPm8vInI;
        Wed, 27 Jan 2021 13:46:25 +0300
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client certificate not present)
From:   Nikita Shubin <nikita.shubin@maquefel.me>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Nikita Shubin <nikita.shubin@maquefel.me>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Alexander Sverdlin <alexander.sverdlin@gmail.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/9] gpio: ep93xx: fixes series patch
Date:   Wed, 27 Jan 2021 13:46:08 +0300
Message-Id: <20210127104617.1173-1-nikita.shubin@maquefel.me>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201228150052.2633-1-nikita.shubin@maquefel.me>
References: <20201228150052.2633-1-nikita.shubin@maquefel.me>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Series of patches to fix ep93xx gpio driver to make IRQ's working.

The following are fix patches (these are enough to get gpio-ep93xx
working with modern kernel):

[PATCH v2 1/9] gpio: ep93xx: fix BUG_ON port F usage
[PATCH v2 2/9] gpio: ep93xx: Fix single irqchip with multi
 gpiochips
[PATCH v2 3/9] gpio: ep93xx: Fix wrong irq numbers in port F

The following are cleanup and style patches:

[PATCH v2 4/9] gpio: ep93xx: drop to_irq binding
[PATCH v2 5/9] gpio: ep93xx: Fix typo s/hierarchial/hierarchical
[PATCH v2 6/9] gpio: ep93xx: refactor ep93xx_gpio_add_bank
[PATCH v2 7/9] gpio: ep93xx: separate IRQ's setup
[PATCH v2 8/9] gpio: ep93xx: refactor base IRQ number
[PATCH v2 9/9] gpio: ep93xx: replace bools with idx for IRQ ports

The futher work can be done by removing ep93xx_gpio_port function
and, maybe, ep93xx_gpio_update_int_params. But i think it's better 
to be done in conjunction with converting ep93xx to DT support.
