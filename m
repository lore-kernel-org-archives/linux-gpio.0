Return-Path: <SRS0=fgCB=DQ=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A61A5C433E7
	for <linux-gpio@archiver.kernel.org>; Fri,  9 Oct 2020 19:31:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6C98A22282
	for <linux-gpio@archiver.kernel.org>; Fri,  9 Oct 2020 19:31:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1602271913;
	bh=E9C4kKMvWlYu8ZIt5o58tMpgO572jwt7xDVPltjq1p4=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:List-ID:From;
	b=10SyPyTQcR8YXRZSMnCw4GJLAACy0eLupkOwD56fFnUawUiMGtqgVczUZFv2tQgqf
	 vrP9mWdDJAWfRwX+YYGp2lSV4oK0vyTOOcVpuPubNmAwWbmgTWSCH/hK+HpSNN9ecQ
	 NbpjNmKo/R3sccTZPaoYCHlWY678HdgQKeG4tNE8=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390682AbgJITbv (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Fri, 9 Oct 2020 15:31:51 -0400
Received: from mail.kernel.org ([198.145.29.99]:44540 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388879AbgJITbu (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 9 Oct 2020 15:31:50 -0400
Subject: Re: [GIT PULL] late GPIO fixes for v5.9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602271909;
        bh=E9C4kKMvWlYu8ZIt5o58tMpgO572jwt7xDVPltjq1p4=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=ayF31Pp34RdteLoiO0tnmbkdGTmq9ifIZII0CGmMNhaR9bibf92AasrW8VkTV6TTZ
         pI0Hci7xIMzAktbtT5iEXcqu56GvFKni1Wx+FF6MFanb1ZX06jN7+7aSzB//l3tJ8u
         z6pF7Qel+SY6dyJE7NeI3DAVDbegrmUVw4fUPE+g=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <CACRpkdYLfx9qRb1hHi=u+hLxzYE=0aku+_8-KwYocHmPowMZbQ@mail.gmail.com>
References: <CACRpkdYLfx9qRb1hHi=u+hLxzYE=0aku+_8-KwYocHmPowMZbQ@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-gpio.vger.kernel.org>
X-PR-Tracked-Message-Id: <CACRpkdYLfx9qRb1hHi=u+hLxzYE=0aku+_8-KwYocHmPowMZbQ@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git tags/gpio-v5.9-3
X-PR-Tracked-Commit-Id: 8b81edd80baf12d64420daff1759380aa9a14998
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: d813a8cb8d90225a6c0051b5b050c8dd03cc435c
Message-Id: <160227190967.24155.1667999456954166571.pr-tracker-bot@kernel.org>
Date:   Fri, 09 Oct 2020 19:31:49 +0000
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The pull request you sent on Fri, 9 Oct 2020 10:20:48 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git tags/gpio-v5.9-3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/d813a8cb8d90225a6c0051b5b050c8dd03cc435c

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
