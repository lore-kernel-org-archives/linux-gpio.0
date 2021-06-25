Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C0ACC2B9F4
	for <linux-gpio@archiver.kernel.org>; Fri, 25 Jun 2021 17:49:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 65F93616EA
	for <linux-gpio@archiver.kernel.org>; Fri, 25 Jun 2021 17:49:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229955AbhFYRvU (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Fri, 25 Jun 2021 13:51:20 -0400
Received: from mail.kernel.org ([198.145.29.99]:36146 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229531AbhFYRvT (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 25 Jun 2021 13:51:19 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id C5A636187E;
        Fri, 25 Jun 2021 17:48:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624643338;
        bh=2B+URFQ8+XNl4+OlS1RtgkgNgGqizvLSuNM+FHuUAvM=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=VS7pdTIo4GUhamw58yYUG04hsSlznEnbHOxPJmLqydufQU2PMr81DcYpyRoeSeuqz
         wqunGBH+VP4B9s6DK+pqzT9NZgxnWqQFj/6n03G3w0RKLU9mX+fNVJU7AzS2ig47Y3
         /VSJ7vTrYDsqi1fQA8sgmjmiC5YCKDJlsnEwQjM3lTfujsenCJ0UAn0t3GDwnOQwnw
         t4usiZBPCgc7JCaOsyMSJjzRASBK1HzHb8VWIGC+4KL8zwhcbPUA5O43R4WaRfkVn+
         kxmigRA1N79RflV5ptIHmiTSShquplnoPtouM++5nZdqXTURYCIO/G9VurVYeRkX2/
         POhBLPdoVcx8w==
Subject: Re: [GIT PULL] gpio: fixes for v5.13
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20210625123320.26510-1-brgl@bgdev.pl>
References: <20210625123320.26510-1-brgl@bgdev.pl>
X-PR-Tracked-List-Id: <linux-gpio.vger.kernel.org>
X-PR-Tracked-Message-Id: <20210625123320.26510-1-brgl@bgdev.pl>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v5.13
X-PR-Tracked-Commit-Id: c6414e1a2bd26b0071e2b9d6034621f705dfd4c0
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: c13e3021331ed7736996fe61d6f26983ac3b84cc
Message-Id: <162464333869.2214.9845530934079220985.pr-tracker-bot@kernel.org>
Date:   Fri, 25 Jun 2021 17:48:58 +0000
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <brgl@bgdev.pl>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The pull request you sent on Fri, 25 Jun 2021 14:33:20 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v5.13

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/c13e3021331ed7736996fe61d6f26983ac3b84cc

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
