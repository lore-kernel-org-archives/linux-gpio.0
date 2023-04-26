Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D757C77B61
	for <linux-gpio@archiver.kernel.org>; Wed, 26 Apr 2023 00:50:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239052AbjDZAuP (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Tue, 25 Apr 2023 20:50:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239060AbjDZAuB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 25 Apr 2023 20:50:01 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4844819A48;
        Tue, 25 Apr 2023 17:49:54 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A5BF76324E;
        Wed, 26 Apr 2023 00:49:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 17A4BC433A8;
        Wed, 26 Apr 2023 00:49:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1682470180;
        bh=IVUUkH2YNQB8nGBhBSDID+e1X/VsgFy8ScZqkVB3hjk=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=t0Vn0RxC1qH9cMfkkOWkfdHc2pcncLe71cLHWvm/8ekbIdpm0E6P5eU2OIWNXgmkt
         i5zp06XiQ4zGzK3IsdcTrNXnISCxGlOYN00LKedSIUh24gQjXHFEqD2tJT8BJ+1nZn
         KV5hxPIlFDcmkCNr92xtx/eoPr+qYCK8THjwQYN9j88h2EkGUpdNXA3lRZgeXBDMWW
         Fl45l8vS+22peoyLQ2g6M5CLjsIkmEC2iqk+5eaOiCJyjTmHK4Guoz91Nuphl8MDeQ
         j1V0NLWNlpsAG9X978Z9qloccsER/BxegHhyksqn2jjNDGz2X4khiwm4EHiK05PX6b
         ql8Q/Vkr3Yx9Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 07DA6E5FFC9;
        Wed, 26 Apr 2023 00:49:40 +0000 (UTC)
Subject: Re: [GIT PULL] gpio: updates for v6.4
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20230424141354.7168-1-brgl@bgdev.pl>
References: <20230424141354.7168-1-brgl@bgdev.pl>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20230424141354.7168-1-brgl@bgdev.pl>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-updates-for-v6.4
X-PR-Tracked-Commit-Id: 8a4adcf67a39b3f308bb8cf686e41c0e26aa12e8
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 2c96606a0f8b7900387dbeb6532b59527999834d
Message-Id: <168247018002.10866.7732979444002686987.pr-tracker-bot@kernel.org>
Date:   Wed, 26 Apr 2023 00:49:40 +0000
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The pull request you sent on Mon, 24 Apr 2023 16:13:54 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-updates-for-v6.4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/2c96606a0f8b7900387dbeb6532b59527999834d

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
