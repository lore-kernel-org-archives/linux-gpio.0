Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE427C433EF
	for <linux-gpio@archiver.kernel.org>; Fri, 25 Mar 2022 21:07:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233243AbiCYVIf (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Fri, 25 Mar 2022 17:08:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233237AbiCYVIe (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 25 Mar 2022 17:08:34 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2887A1EC60E;
        Fri, 25 Mar 2022 14:07:00 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id CDB7BB829E7;
        Fri, 25 Mar 2022 21:06:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 850E2C004DD;
        Fri, 25 Mar 2022 21:06:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1648242417;
        bh=/gzkPSO1hMYGhjETfIaRh7tvmL2QyHGKMO2BKZfT+Nk=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=H1sjVNvnQPpxzvM3AesxNvMOk3/qB3JBd/Gqzwai6ZHuYJRw4chH6Jhv4b8bf+QBx
         aHMBZJnxV3eVuSjn0QkFtVrkE3divIZ/v3VE6HaqX9ZDF7H6b5zTODheQ/BbNGe6ln
         fYZgp2/aSFYxicajGb2kYBSNBWdtzR4s0VtoAc9yPFCC/uXf1HyUoDvNpEBHP2GNRF
         Y8kxUrAJ437MAK5qU1OFqkB9xK/LF/dahI7WGlL3foxLpvukD742UTRgQMxnz06yej
         e9CyMoaNUa8KPrvMpqvtf93zZypKuxQ2kt/+Zx3z+4hoWMf+QyEwr8nn1qqqmuhS8d
         kbFzER1oyge+w==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 718EEE6BBCA;
        Fri, 25 Mar 2022 21:06:57 +0000 (UTC)
Subject: Re: [GIT PULL] gpio: updates for v5.18
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20220323163230.691802-1-brgl@bgdev.pl>
References: <20220323163230.691802-1-brgl@bgdev.pl>
X-PR-Tracked-List-Id: <linux-gpio.vger.kernel.org>
X-PR-Tracked-Message-Id: <20220323163230.691802-1-brgl@bgdev.pl>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-updates-for-v5.18
X-PR-Tracked-Commit-Id: 87ba5badc541a79bab2fa3243ee0008c0880c64a
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: ebcb577aee1448fd60904fc4126cbf7ec012bd0b
Message-Id: <164824241746.8431.10429637770703695319.pr-tracker-bot@kernel.org>
Date:   Fri, 25 Mar 2022 21:06:57 +0000
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <brgl@bgdev.pl>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The pull request you sent on Wed, 23 Mar 2022 17:32:30 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-updates-for-v5.18

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/ebcb577aee1448fd60904fc4126cbf7ec012bd0b

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
