Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9D99C433B4
	for <linux-gpio@archiver.kernel.org>; Wed, 31 Mar 2021 18:06:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BEF0360FF0
	for <linux-gpio@archiver.kernel.org>; Wed, 31 Mar 2021 18:06:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234618AbhCaSF6 (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Wed, 31 Mar 2021 14:05:58 -0400
Received: from mail.kernel.org ([198.145.29.99]:46892 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234623AbhCaSF2 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 31 Mar 2021 14:05:28 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 05A3C60FE8;
        Wed, 31 Mar 2021 18:05:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617213928;
        bh=7sFe7JUaOWsgEkdbJcdCFAa7nDG0CyBIMGHomgVjqZE=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=CPNQWZVsiioUfaM7BTl8L0E23Xk0LgBswOkPsp3vzidsErPibxFjTe+3CdQUeNQMB
         rNX9BYLDKjBXZen3W7t5+7e1R2dJ69kJW3HpUDLF9tbM317+W3OCg/KYWPEhcgYbh+
         Q5H0AdH3e5iZQeZ0O4TyC9UCJ7ewSrVcOME9+nIG3jzivPMtHoRk0d774jRPciYuv5
         Rs81/SzIlbZTDxMS5asheGQbliOW3x/s3LegaFPe3Ib0PF9GMv0v5dqCQI0tAZZlXJ
         487VhnJhZen40pzzMyysD1Gy7VsUiPgiwVewDJh5fph5ShLLs/1Nx7gkufQBAmZAa8
         O1lZuP+AAlvrA==
Subject: Re: [GIT PULL] pin control fixes for the v5.12 kernel
From:   pr-tracker-bot@kernel.org
In-Reply-To: <CACRpkdazjQ0jPdXYPNsC6BmYEHZgf7_zUObHTEa+B9LZCmaT8g@mail.gmail.com>
References: <CACRpkdazjQ0jPdXYPNsC6BmYEHZgf7_zUObHTEa+B9LZCmaT8g@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CACRpkdazjQ0jPdXYPNsC6BmYEHZgf7_zUObHTEa+B9LZCmaT8g@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git tags/pinctrl-v5.12-2
X-PR-Tracked-Commit-Id: ba845907b23a6584e5944f6fbffda3efb010c28b
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 39192106d4efd482f96a0be8b7aaae7ec150d9ee
Message-Id: <161721392790.28439.7257359589804558368.pr-tracker-bot@kernel.org>
Date:   Wed, 31 Mar 2021 18:05:27 +0000
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Lars Povlsen <lars.povlsen@microchip.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The pull request you sent on Wed, 31 Mar 2021 14:31:36 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git tags/pinctrl-v5.12-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/39192106d4efd482f96a0be8b7aaae7ec150d9ee

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
