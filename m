Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1FB1EE4990
	for <linux-gpio@archiver.kernel.org>; Fri, 18 Aug 2023 18:56:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1379541AbjHRSzm (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Fri, 18 Aug 2023 14:55:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1379527AbjHRSz3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 18 Aug 2023 14:55:29 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 361743A98;
        Fri, 18 Aug 2023 11:55:28 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id C7858611CF;
        Fri, 18 Aug 2023 18:55:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3913BC433C8;
        Fri, 18 Aug 2023 18:55:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692384927;
        bh=8u62R3MeM8AltBt/wl6OjeJnRdhf4srCxdWNr0Os1kw=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=hmWWeM/khNBYNvX4Q8WGw9QVokCLzqzIB7zSQE6O3kU79JZls1eUoI9A00TNd6liF
         TLm9rM752TQMXoE8Q8wi62UxmfTrEdAz6CTDNqLnN0Ysh3iKAUXsW9NwNw3BmAPcjq
         j3eEKru9RTEobOvmcR38FCTkxsdlB1BkA67+Eyh14dtZjLV/66TCbSFN9bd6LEByia
         7HMQ/FsFs/VeD8KnBUmdZ7yufyGmtezfG0Hz0O1bTmMNEUGmkBcrnoSzrbF+NU68dh
         YumgSlUf1yX+lY2rI707xeI4Xw+vVSfdH4dxBdjNn5pcBIdcBTr33ia0gk334lUlXJ
         j4D/Eolh8OOkQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 21162C395DC;
        Fri, 18 Aug 2023 18:55:27 +0000 (UTC)
Subject: Re: [GIT PULL] gpio: fixes for v6.5-rc7
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20230818181649.20814-1-brgl@bgdev.pl>
References: <20230818181649.20814-1-brgl@bgdev.pl>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20230818181649.20814-1-brgl@bgdev.pl>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v6.5-rc7
X-PR-Tracked-Commit-Id: 3386fb86ecdef0d39ee3306aea8ec290e61b934f
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 3e13eee10521b236b6b96a0e1d7f29c6bf2fd989
Message-Id: <169238492712.16005.6989992896963565949.pr-tracker-bot@kernel.org>
Date:   Fri, 18 Aug 2023 18:55:27 +0000
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The pull request you sent on Fri, 18 Aug 2023 20:16:49 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v6.5-rc7

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/3e13eee10521b236b6b96a0e1d7f29c6bf2fd989

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
