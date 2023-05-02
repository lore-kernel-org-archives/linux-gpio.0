Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E42E7C77B75
	for <linux-gpio@archiver.kernel.org>; Tue,  2 May 2023 22:59:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230426AbjEBW7W (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Tue, 2 May 2023 18:59:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229838AbjEBW7V (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 2 May 2023 18:59:21 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73D164481;
        Tue,  2 May 2023 15:58:56 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 2A16E62A20;
        Tue,  2 May 2023 22:50:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 87E9BC433EF;
        Tue,  2 May 2023 22:50:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1683067800;
        bh=991SvigG+kU0Z/u6B0wlJjM3uDLXg6cFN/gcnrmlkS4=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=tWaHbArUCggSJyvRJB7EzrADdUKORXa1MHhOWRstVukem3+9BDp9eInN8qmRfYumw
         aaad26Q6JSAwZj7tIfwxk/k9THvVMZVenwYjjn+hmmSNUgDae4GUREq9gff6aXo3V3
         KiIzVL/VTCZWteJAr7mp4kpN+gEBauvAeXbkYuse3kTsYaIxMcgvX3muiKoLw3LJA8
         DqprJq/ot9e1ZCMCyzNMS3vdiu8Mse5KezOhRZl8FhvSmt2REgnAl6/5jEUZbMXGU0
         4shV6mvajC7H2vO/gwNKB4bvvWE9M2pHbz6hIO9/ICp01aEZHUJCkWDpxG7KfLDBbX
         BawLahgcDIeuw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 74801C41677;
        Tue,  2 May 2023 22:50:00 +0000 (UTC)
Subject: Re: [GIT PULL] pin control bulk changes for v6.4
From:   pr-tracker-bot@kernel.org
In-Reply-To: <CACRpkdZ=bpsSKKgqGbGThvVAZc8fEx2vStbm9GUaZ5s1p5YGmQ@mail.gmail.com>
References: <CACRpkdZ=bpsSKKgqGbGThvVAZc8fEx2vStbm9GUaZ5s1p5YGmQ@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CACRpkdZ=bpsSKKgqGbGThvVAZc8fEx2vStbm9GUaZ5s1p5YGmQ@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git tags/pinctrl-v6.4-1
X-PR-Tracked-Commit-Id: b7badd752de05312fdb1aeb388480f706d0c087f
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 348551ddaf311c76b01cdcbaf61b6fef06a49144
Message-Id: <168306780046.4082.4222056325406889872.pr-tracker-bot@kernel.org>
Date:   Tue, 02 May 2023 22:50:00 +0000
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The pull request you sent on Tue, 2 May 2023 22:29:20 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git tags/pinctrl-v6.4-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/348551ddaf311c76b01cdcbaf61b6fef06a49144

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
