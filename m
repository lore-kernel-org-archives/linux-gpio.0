Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AF46C433EF
	for <linux-gpio@archiver.kernel.org>; Tue,  7 Sep 2021 20:14:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2C448610E9
	for <linux-gpio@archiver.kernel.org>; Tue,  7 Sep 2021 20:14:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233066AbhIGUPb (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Tue, 7 Sep 2021 16:15:31 -0400
Received: from mail.kernel.org ([198.145.29.99]:45784 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230474AbhIGUP3 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 7 Sep 2021 16:15:29 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 8F73460187;
        Tue,  7 Sep 2021 20:14:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631045662;
        bh=BkQV6zeg2LQkGC46zrw+hhHOEnp7Tv+sYE/Fj0iNkmU=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=oVMAhW5tteryp/KM9INUTNwvVRdjz+56sVKQcF6E/gJwt8xqVU+TwLIUvnCvrESg/
         uVMe+U8vgRNlSWqrHGQhULJ05KRljVMzJ/Zd856tYkFgpQjWYJ4o7q+IeHuBVF430X
         zR/jCkRwwLXvn+HiwmPC+P9YYhGt6XHUcaWY1nE65POcyMyavd3d9OjUVL0aoGtnWx
         bQs+h2qBbjfMSSwgkvnnzZcIiD8NzC+BYikLIL6L81x0NbC9mXPqvGZ9rxN/kuJIQF
         wfqomO0kBetGkU82jq8q5cue3nml9Wk+H+7xpgwMO9SV9rj4yZX9vQxMAlG6qaeSXb
         aEnKyvb4cuXBw==
Subject: Re: [GIT PULL] gpio: updates for v5.15
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20210907083613.31268-1-brgl@bgdev.pl>
References: <20210907083613.31268-1-brgl@bgdev.pl>
X-PR-Tracked-List-Id: <linux-gpio.vger.kernel.org>
X-PR-Tracked-Message-Id: <20210907083613.31268-1-brgl@bgdev.pl>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-updates-for-v5.15
X-PR-Tracked-Commit-Id: 889a1b3f35db6ba5ba6a0c23a3a55594570b6a17
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 5e6a5845dd651b00754a62edec2f0a439182024d
Message-Id: <163104566243.21240.4845140527007156447.pr-tracker-bot@kernel.org>
Date:   Tue, 07 Sep 2021 20:14:22 +0000
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <brgl@bgdev.pl>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The pull request you sent on Tue,  7 Sep 2021 10:36:13 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-updates-for-v5.15

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/5e6a5845dd651b00754a62edec2f0a439182024d

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
