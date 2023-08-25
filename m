Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 502EDC6787B
	for <linux-gpio@archiver.kernel.org>; Fri, 25 Aug 2023 16:52:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344107AbjHYQwB (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Fri, 25 Aug 2023 12:52:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344122AbjHYQvf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 25 Aug 2023 12:51:35 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 375BE212C;
        Fri, 25 Aug 2023 09:51:24 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id BC6CB63A98;
        Fri, 25 Aug 2023 16:51:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 31132C433C7;
        Fri, 25 Aug 2023 16:51:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692982283;
        bh=NgF6u4BJm8ITywsgqHEBJ5TNjdYuMXiR7h/57lGz6Uk=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=rrjxEgTSzVA1X4NamKpz3dTKIIAbAqxL38mYuTQvyLNpTm7Cy1VhaH7WvsjTYVfVW
         NsFf/JtyT6e+6VNG8iZ+i8CtvJsS5XM6S8j/eO+0dWrJ2L9ujGlulWQAg5gc7NeZlY
         mxGcojYRe0aIFXEl2Dc6F5wzwjtrH/aFWMCP0yec1CYWEfW9E9LXojDagAK0UYFj8n
         zNwqveLJz1t7bPc7ATPTKxnFwU9QxUdurxXJOboX2wnTJRyBOpQak9zj3cmS2Jjd0T
         iSlRRTQF3aLVp5aHPrmHDpgT+hI36ju757whGm1Am2JgXMN50fVeqC/ugQ0RuTSpDj
         gyNRLNFmAx2eg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 1D2D6C595D7;
        Fri, 25 Aug 2023 16:51:23 +0000 (UTC)
Subject: Re: [GIT PULL] late pin control fixes for v6.5
From:   pr-tracker-bot@kernel.org
In-Reply-To: <CACRpkdYqWQ57FR95R31nbv=d+qqq2xGkj38Yd_SN2wDiOO3NTg@mail.gmail.com>
References: <CACRpkdYqWQ57FR95R31nbv=d+qqq2xGkj38Yd_SN2wDiOO3NTg@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CACRpkdYqWQ57FR95R31nbv=d+qqq2xGkj38Yd_SN2wDiOO3NTg@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git tags/pinctrl-v6.5-4
X-PR-Tracked-Commit-Id: 6bc3462a0f5ecaa376a0b3d76dafc55796799e17
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: a87eaffbb26b810d50769272effbe6747e1e3ea4
Message-Id: <169298228310.13860.11833239927719364402.pr-tracker-bot@kernel.org>
Date:   Fri, 25 Aug 2023 16:51:23 +0000
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The pull request you sent on Fri, 25 Aug 2023 10:22:05 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git tags/pinctrl-v6.5-4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/a87eaffbb26b810d50769272effbe6747e1e3ea4

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
