Return-Path: <SRS0=Utw9=DU=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CFE2C433E7
	for <linux-gpio@archiver.kernel.org>; Tue, 13 Oct 2020 18:24:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4760520E65
	for <linux-gpio@archiver.kernel.org>; Tue, 13 Oct 2020 18:24:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1602613456;
	bh=28E6B7UdNH5prH8Ppnhu/d5WnQrzdaRA3oG0hW/gQqM=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:List-ID:From;
	b=0aPzmqIOlkG+NMs3B8ecUAjI+cjz5zyFfmHSfVb8c+2jmZ507rKU1AiwmTwQOe7Vs
	 GODqQHWM3f7WiWCdjdXFMtoI+Y/x8wxWLoDe2mE0an6ufrg1nWH8KS7EW92CKsXzP+
	 8DQVsOVc4+ap9uCibMZTfsqfKCx9n39Lkfx1x0uA=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728211AbgJMSYM (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Tue, 13 Oct 2020 14:24:12 -0400
Received: from mail.kernel.org ([198.145.29.99]:42846 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728432AbgJMSYI (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 13 Oct 2020 14:24:08 -0400
Subject: Re: [GIT PULL] GPIO bulk changes for the v5.10 kernel series
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602613447;
        bh=28E6B7UdNH5prH8Ppnhu/d5WnQrzdaRA3oG0hW/gQqM=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=VSsqcOJneElwrnDx3ueyEbmEpE2jhXqWeWR2hERCLNi17s+Zthxp1oTsnV0BvBAf6
         hxcqd4R1h/LAWkpbnOeixMG3mf4KPioqh7lQk/jri48r5pSFh743vnZluCP5iTLGDU
         Rc767YI5+4/1GPanZzj2rOItoM2hkeR6hehTzSlQ=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <CACRpkdbQU7xBcJ5GMhmovhvdpyDXmmr49wGUcuppHcKEc_Kacw@mail.gmail.com>
References: <CACRpkdbQU7xBcJ5GMhmovhvdpyDXmmr49wGUcuppHcKEc_Kacw@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CACRpkdbQU7xBcJ5GMhmovhvdpyDXmmr49wGUcuppHcKEc_Kacw@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git tags/gpio-v5.10-1
X-PR-Tracked-Commit-Id: fc709df553a34fd18010f52e6b47652268d83e7d
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 0486beaf88d2460e9dbcbba281dab683a838f0c6
Message-Id: <160261344752.11865.1744640158963896072.pr-tracker-bot@kernel.org>
Date:   Tue, 13 Oct 2020 18:24:07 +0000
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Kent Gibson <warthog618@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The pull request you sent on Tue, 13 Oct 2020 11:49:35 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git tags/gpio-v5.10-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/0486beaf88d2460e9dbcbba281dab683a838f0c6

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
