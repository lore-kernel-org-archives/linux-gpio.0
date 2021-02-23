Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0A52C433DB
	for <linux-gpio@archiver.kernel.org>; Tue, 23 Feb 2021 02:48:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 84C1B64E41
	for <linux-gpio@archiver.kernel.org>; Tue, 23 Feb 2021 02:48:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230083AbhBWCsE (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Mon, 22 Feb 2021 21:48:04 -0500
Received: from mail.kernel.org ([198.145.29.99]:45930 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229852AbhBWCsE (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 22 Feb 2021 21:48:04 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id BB0F76023B;
        Tue, 23 Feb 2021 02:47:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614048443;
        bh=qocXkMm/j3wt859YgBY8prdsyHO7RTq6pN9OYEh+1vA=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=MWGloHUCXBDtCjjFLBdz5CWRB9pxygjpOC1YUlKIR0YkjNqCMMVx6C9UBU+VgCWC+
         yETbq6d98/6mv7oSCo426OT/1j7tBpXMVNcxMgwnn6qk0zrysm4YBV7sDIlj5Yn6/g
         r2qvG4eJqzZGoiThhIa1ghWum2u2s6rMhejy0+MolTkc5caI8SPqpNA2lH+RThQtyG
         N68BdW3+cnJHk5jstLaL/Bp/uT4eRxQVGEBQnD2U/TcacUjPtoACgW6e1MhYmBrS15
         U92UOIT1LKAPnQ5TEZP8OhKjMNN9QMqSh5bKy9pEp/O/L9ct/oXjSjVsa3FigdwfpI
         QvMhqspKIrjSA==
Subject: Re: [GIT PULL] pinctrl changes for v5.12
From:   pr-tracker-bot@kernel.org
In-Reply-To: <CACRpkdbrBLXV+qyc-zWW6wRWnFZGviEus7+QP129bgDFxrhbjA@mail.gmail.com>
References: <CACRpkdbrBLXV+qyc-zWW6wRWnFZGviEus7+QP129bgDFxrhbjA@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-gpio.vger.kernel.org>
X-PR-Tracked-Message-Id: <CACRpkdbrBLXV+qyc-zWW6wRWnFZGviEus7+QP129bgDFxrhbjA@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git tags/pinctrl-v5.12-1
X-PR-Tracked-Commit-Id: b40b760aa2a9587cdcde62759642b4e99c40dedc
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 3b9cdafb5358eb9f3790de2f728f765fef100731
Message-Id: <161404844359.27009.16220684583041027650.pr-tracker-bot@kernel.org>
Date:   Tue, 23 Feb 2021 02:47:23 +0000
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The pull request you sent on Tue, 23 Feb 2021 00:50:51 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git tags/pinctrl-v5.12-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/3b9cdafb5358eb9f3790de2f728f765fef100731

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
