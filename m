Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7FD4C83F19
	for <linux-gpio@archiver.kernel.org>; Tue, 29 Aug 2023 18:09:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238364AbjH2SIl (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Tue, 29 Aug 2023 14:08:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238249AbjH2SIK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 29 Aug 2023 14:08:10 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E506B184;
        Tue, 29 Aug 2023 11:08:07 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id C6D8761575;
        Tue, 29 Aug 2023 18:08:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3A1A9C433CC;
        Tue, 29 Aug 2023 18:08:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1693332487;
        bh=kbQBM2pbYznnsfE7KCAOIXngnWWAeGey9eZKwzyyfFY=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=LO+KNMAsuy2vPztjkojInrYD74WzMbmpj0LgSVElfHi73pLreZnFvPilvf4yUDhgz
         SEJ9VWZXSGGQ3wgAWPtUZgIP1K31LtpuAX+/W7WzIDVx6HA8IjaYRyMdYiZHKxwQ8h
         Q68GR0xFAoK5E1FB16+bpeyPC9IaqAbgFo+/YqGm345LmqhUgSQ0G9WDNgBmqKiDSK
         NMLvufAY2nDbzDOqvgPHpgD3h8mCQxQlRXSi3s0WRaAXvD8d7iOti8DpbK30FyIG+7
         Sen4n1F7M8A0u7QWIgPb4fbTso/Akqlbm3MTGVrW5fejwmhhV/HiSvMQaOuyYQ7csS
         rqioNSpcuNrAQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 25FCBC3959E;
        Tue, 29 Aug 2023 18:08:07 +0000 (UTC)
Subject: Re: [GIT PULL] gpio: updates for v6.6
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20230829114301.10450-1-brgl@bgdev.pl>
References: <20230829114301.10450-1-brgl@bgdev.pl>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20230829114301.10450-1-brgl@bgdev.pl>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-updates-for-v6.6
X-PR-Tracked-Commit-Id: 3d0957b07e27abd3237b1fe0c7f06485ba80852f
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: f97e18a3f2fb78a4ed0d25e427535d9f853b9e9e
Message-Id: <169333248715.16601.3923044857684477231.pr-tracker-bot@kernel.org>
Date:   Tue, 29 Aug 2023 18:08:07 +0000
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The pull request you sent on Tue, 29 Aug 2023 13:43:01 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-updates-for-v6.6

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/f97e18a3f2fb78a4ed0d25e427535d9f853b9e9e

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
