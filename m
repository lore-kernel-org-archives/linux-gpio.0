Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D510C43460
	for <linux-gpio@archiver.kernel.org>; Fri, 23 Apr 2021 17:26:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DD328613F5
	for <linux-gpio@archiver.kernel.org>; Fri, 23 Apr 2021 17:26:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243364AbhDWR0l (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Fri, 23 Apr 2021 13:26:41 -0400
Received: from mail.kernel.org ([198.145.29.99]:58320 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231966AbhDWR0k (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 23 Apr 2021 13:26:40 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 0852F613D5;
        Fri, 23 Apr 2021 17:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619198764;
        bh=6zMoHw/VBY/e8RJbI71N7/NWOr/2/DETkGuRnIBCHGw=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=QMXSl6LmbZW6/RHClQgaTkbPJg9eeYOfEe4e/xLY3c4NCLdYAvPBb7Fs5iNCcAkl+
         +oiuqLdlRao/N2XUv3y9OKQdZz/iak900FRxmSlgrbDdS6hbKvmWZy8MOQF1I4OvyP
         t+fHDdqJ1t0oJXtP9SEdz2k34R0RYIjLhDfhgv7Q5n+8+MeMpfeAA2er/fBH5v5QDN
         6v013qZ2YSi0w3UmF3lxfgxNXDC4Ai29g08vWDN4i4dbC5B6lCEJmlCvKsPH3kolrV
         2kyOrZCf/Ms0fP61MfLKD5O2jwKd0PWaBfQNWOHPPtHWCvZWmGDirMs46E5BNyswVe
         uA/J++YWRXjJw==
Subject: Re: [GIT PULL] gpio: fixes for v5.12
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20210423081638.16925-1-brgl@bgdev.pl>
References: <20210423081638.16925-1-brgl@bgdev.pl>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20210423081638.16925-1-brgl@bgdev.pl>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v5.12
X-PR-Tracked-Commit-Id: ddd8d94ca31e768c76cf8bfe34ba7b10136b3694
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 22c4e5bcd3cd7a798f1c6b4df646f75587813e72
Message-Id: <161919876400.26356.3180382453638492872.pr-tracker-bot@kernel.org>
Date:   Fri, 23 Apr 2021 17:26:04 +0000
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <brgl@bgdev.pl>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The pull request you sent on Fri, 23 Apr 2021 10:16:38 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v5.12

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/22c4e5bcd3cd7a798f1c6b4df646f75587813e72

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
