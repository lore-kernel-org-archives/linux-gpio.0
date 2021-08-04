Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98FC7C4338F
	for <linux-gpio@archiver.kernel.org>; Wed,  4 Aug 2021 20:15:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 71DB261002
	for <linux-gpio@archiver.kernel.org>; Wed,  4 Aug 2021 20:15:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239768AbhHDUQH (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Wed, 4 Aug 2021 16:16:07 -0400
Received: from mail.kernel.org ([198.145.29.99]:52480 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231318AbhHDUQH (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 4 Aug 2021 16:16:07 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 38D7E61002;
        Wed,  4 Aug 2021 20:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1628108154;
        bh=rTN9xwsn4ueG2XaOtYkbcmOybx8jkHoTotp4J96AUJg=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=qd/fxGDHiq4FPuFykw99XGnuk6obhOWzO5WOusRKCX8TNjuDJInvfhAo7wELjHY0/
         Iu8g6azGzX2i1swVgw8XxVIRAo8zxIEEsVzrfoAIK5V7JpLncy1vN+rwDXoYM1NAjw
         UbB8jIzwt26EVsqEBHte8el9JC4RCTU6x3/lUyfFWmsQHoylSrfgPHFAxWyXCvnMTX
         nxpzBlbUiGDOJTPmjNEmRuBk0F7j4vCH6Wan22euIKo2aEg6k3JedrUXYovSCIQpHC
         ps7YY1jT0e+zzMKeSDXOvVksgiTiYtCoPHItt9zJ45pVIA+j/innBxrm+weItpKKd7
         gCTocWmtWN4wQ==
Subject: Re: [GIT PULL] gpio: fixes for v5.14-rc5
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20210804135922.13050-1-brgl@bgdev.pl>
References: <20210804135922.13050-1-brgl@bgdev.pl>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20210804135922.13050-1-brgl@bgdev.pl>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-updates-for-v5.14-rc5
X-PR-Tracked-Commit-Id: 9b87f43537acfa24b95c236beba0f45901356eb2
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 0c2e31d2bd432147f348f024e40779fa4d0dc2b9
Message-Id: <162810815412.7114.15707702543015006811.pr-tracker-bot@kernel.org>
Date:   Wed, 04 Aug 2021 20:15:54 +0000
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <brgl@bgdev.pl>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The pull request you sent on Wed,  4 Aug 2021 15:59:22 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-updates-for-v5.14-rc5

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/0c2e31d2bd432147f348f024e40779fa4d0dc2b9

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
