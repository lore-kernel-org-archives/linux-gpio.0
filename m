Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82175C433EF
	for <linux-gpio@archiver.kernel.org>; Fri, 19 Nov 2021 19:46:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6AC7461A58
	for <linux-gpio@archiver.kernel.org>; Fri, 19 Nov 2021 19:46:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236178AbhKSTtR (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Fri, 19 Nov 2021 14:49:17 -0500
Received: from mail.kernel.org ([198.145.29.99]:45430 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236157AbhKSTtR (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 19 Nov 2021 14:49:17 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id CC0A661AFB;
        Fri, 19 Nov 2021 19:46:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637351173;
        bh=vPT9NoWWzwiuBAnqRnEmnpCTr1jTfXYLVV9+qNBdHKo=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=a4U5jMKYYoyyn34yDSdkZZCaWmWQde49S5kL2nrzPXqTdEEgRkxw7B2qo2NjDdoW+
         5sq75+an5WAvAtIzThgtFI1ox/yepAxomQEXuz1UsXLPr/lpoqA/0FTjb7zK/4uNuz
         0LXLbtSJ/c6zrHFWpxH8kfymRS+UvCibe9YleiOWwrN+lm04NwcKY+nD/B7Cf4Z982
         rauS4fb1qx9rI++sJCysr82KtTP7HzERaxnJ7vTwj9rmu4a5Rcc4ctHLITT1zjhX0G
         igTEFrze9tgdsNcTnTuITejMHG7OHX9AfjBJxJ1IT6hAXZJvEgXYg4/RydKpLnMF1k
         NHqmRrrMMAYlw==
Subject: Re: [GIT PULL] gpio: fixes for v5.16-rc2
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20211119150703.8326-1-brgl@bgdev.pl>
References: <20211119150703.8326-1-brgl@bgdev.pl>
X-PR-Tracked-List-Id: <linux-gpio.vger.kernel.org>
X-PR-Tracked-Message-Id: <20211119150703.8326-1-brgl@bgdev.pl>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v5.16-rc2
X-PR-Tracked-Commit-Id: d6912b1251b47e6b04ea8c8881dfb35a6e7a3e29
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 447916982455ef18dc648da03d1c012b630122c4
Message-Id: <163735117380.2946.4854723028617043523.pr-tracker-bot@kernel.org>
Date:   Fri, 19 Nov 2021 19:46:13 +0000
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <brgl@bgdev.pl>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The pull request you sent on Fri, 19 Nov 2021 16:07:03 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v5.16-rc2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/447916982455ef18dc648da03d1c012b630122c4

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
