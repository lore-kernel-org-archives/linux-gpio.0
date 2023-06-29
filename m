Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7114FC0015E
	for <linux-gpio@archiver.kernel.org>; Thu, 29 Jun 2023 17:34:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232200AbjF2Rez (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Thu, 29 Jun 2023 13:34:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232782AbjF2Rem (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 29 Jun 2023 13:34:42 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BA6835A6;
        Thu, 29 Jun 2023 10:34:41 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 11EA5615CB;
        Thu, 29 Jun 2023 17:34:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 77CC8C433C9;
        Thu, 29 Jun 2023 17:34:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1688060080;
        bh=5VWh3fG5lbmMow2I5Zds4MSvhEzrHGNSK2fRSLf/fg4=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=ra3e4ERV1lJhM9vP/DRku2NgbGC7OI/xCVur1z67XwkSToyshFbMs6cO4jJRHGZe9
         O+IWwhzAdIGkLZh1sPvRSKMATt3DEPesR9wPgWRQz3ug6PYOxT0vXXfe51J/AcAGYk
         dmj1tYfrwpjwAhipBuLnyUPggtHa6ihxwlCd4n4Zj+Xc1S/xvk3zbTa9sYu+gE2RLr
         b6eYnRnolYZ3McvGO9KBthe5YJ/BusOObZo1Bkq2Xspq+Xhf18oimZSqg3AlTK8c0N
         usoxm1xtzAFcs0rl4SJYhhy72u4LwrAS2MsRS4TfiQtd1WmVI2J3Uj6nvxPnr2iL3q
         wiKhuu5J6RoOQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 6598FC43158;
        Thu, 29 Jun 2023 17:34:40 +0000 (UTC)
Subject: Re: [GIT PULL] gpio: updates for v6.5
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20230627162730.117824-1-brgl@bgdev.pl>
References: <20230627162730.117824-1-brgl@bgdev.pl>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20230627162730.117824-1-brgl@bgdev.pl>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-updates-for-v6.5
X-PR-Tracked-Commit-Id: 0ff9f5e57c5bb45b6b807a4d466228de39d8cd2f
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: e5476f57b32621eb8eab892a908df4d0b4808835
Message-Id: <168806008040.7356.6983312532741788586.pr-tracker-bot@kernel.org>
Date:   Thu, 29 Jun 2023 17:34:40 +0000
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The pull request you sent on Tue, 27 Jun 2023 18:27:30 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-updates-for-v6.5

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/e5476f57b32621eb8eab892a908df4d0b4808835

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
