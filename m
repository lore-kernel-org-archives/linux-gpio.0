Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56189C48BE6
	for <linux-gpio@archiver.kernel.org>; Sat, 12 Jun 2021 00:22:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 232F9613EA
	for <linux-gpio@archiver.kernel.org>; Sat, 12 Jun 2021 00:22:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230188AbhFLAYq (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Fri, 11 Jun 2021 20:24:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:55032 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229937AbhFLAYq (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 11 Jun 2021 20:24:46 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id F05D9613D9;
        Sat, 12 Jun 2021 00:22:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1623457368;
        bh=dxhamDu7a2Q8eIIqihAjFhBx3xH7sRqXm9tzbnPC/NI=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=POyeFoXz3Yh3vUVwWzrJi5+W9RATdcc/WjFEgJpyAzXLB6h20HSAJxybO/7nz6m99
         TV4wnqyGMAKbqotOp/DpVkmb+m8WVhq5UAyJca4qRUV6XFyAw28Y3FHM3otzFilTC7
         vfDDP2PLZo0QL2KqlD+qSp0lZ8T9/+mLvJ+f7jG2LFDC9cj+eCePibRyAnB5Aard+h
         y6vT2nYKM0sSO3wJRuf0uCEokbQS6uMqfR8J+m5a2o9Oq5ChRDvV+oufKfRZ+kJhRN
         mJsersnrNBTHcuuNn1MG3fCLvHSrizp5UxWFx1MKXGAs52nlIk4jqVO0ZayLwzeulr
         +m6M2zRR1MD6Q==
Subject: Re: [GIT PULL] gpio: fixes for v5.13-rc6
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20210611194530.15593-1-brgl@bgdev.pl>
References: <20210611194530.15593-1-brgl@bgdev.pl>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20210611194530.15593-1-brgl@bgdev.pl>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v5.13-rc6
X-PR-Tracked-Commit-Id: dbec64b11c65d74f31427e2b9d5746fbf17bf840
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: e65b7914b2abfff4fde9dcca22bbab99fab5ba05
Message-Id: <162345736789.23405.12373052083884006953.pr-tracker-bot@kernel.org>
Date:   Sat, 12 Jun 2021 00:22:47 +0000
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <brgl@bgdev.pl>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The pull request you sent on Fri, 11 Jun 2021 21:45:30 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v5.13-rc6

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/e65b7914b2abfff4fde9dcca22bbab99fab5ba05

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
