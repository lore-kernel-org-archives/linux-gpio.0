Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37A2CC433FE
	for <linux-gpio@archiver.kernel.org>; Thu, 26 May 2022 22:05:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349398AbiEZWFA (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Thu, 26 May 2022 18:05:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349993AbiEZWE4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 26 May 2022 18:04:56 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5AD875DA3A;
        Thu, 26 May 2022 15:04:55 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id DDCC361BEF;
        Thu, 26 May 2022 22:04:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 36858C36AE5;
        Thu, 26 May 2022 22:04:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1653602694;
        bh=qk7AP8/K8hdhmOzogrVLOPSXEqmDbE7fQptkkwVNruo=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=R+Dv2mekf+s5LXivu0yAZ3/ItLdo0a81lnEy5wVitHnaXByjSIlZF/lu4mA9EGcoL
         aJN0ouAT4axV5Wa95hSycL/W14p+rPhjexEMVR5xjzKuqGzR+18RKt5oKnAK8xGTRm
         JNwbY7vkY/da/5Xm3JMwWRzaVw0Nm/ISrV1bb3P3hwFcOpmVyb0opYaXgsRwrnH0fX
         S2pQG6lsDgJiYsBb6rE3WA0l9ntnBluzsM5XgjFYPIK9oeEK5RJ/YeOA1GDUfg0KNB
         C7kWeY/UYUyvYUWVvgxnf56tKNDvocpDbl7jLzbjPa84wmOpvgaqiOKaTsduW7nJlZ
         MvnaWQio8lvgA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 23C5DF03942;
        Thu, 26 May 2022 22:04:54 +0000 (UTC)
Subject: Re: [GIT PULL] gpio: updates for v5.19
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20220525161220.151201-1-brgl@bgdev.pl>
References: <20220525161220.151201-1-brgl@bgdev.pl>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20220525161220.151201-1-brgl@bgdev.pl>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-updates-for-v5.19
X-PR-Tracked-Commit-Id: 5a7cb9f3978d1fe8cfba798b4c9c054ce226e8fd
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 7182e897695d5b70fb772736f1f08639ca0fff78
Message-Id: <165360269414.24340.324746412142816756.pr-tracker-bot@kernel.org>
Date:   Thu, 26 May 2022 22:04:54 +0000
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <brgl@bgdev.pl>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The pull request you sent on Wed, 25 May 2022 18:12:20 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-updates-for-v5.19

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/7182e897695d5b70fb772736f1f08639ca0fff78

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
