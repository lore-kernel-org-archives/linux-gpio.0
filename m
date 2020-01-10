Return-Path: <SRS0=PklQ=27=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3A31C282DD
	for <linux-gpio@archiver.kernel.org>; Fri, 10 Jan 2020 00:15:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CB53420661
	for <linux-gpio@archiver.kernel.org>; Fri, 10 Jan 2020 00:15:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1578615309;
	bh=bNp8BM+V90h4bbEQ/kyFkRoZzVW+vSiT8eU3crkOFew=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:List-ID:From;
	b=Eq+HVW/n7S4kTnfr7qJuP5Mh8xseny5oQhxCVuYG1KeEQ7xqKy+fqzYPGKntMjFNQ
	 ovhj0ppsi87hFnBCSjV/oJltaH8ZXgW3WUb1BWD+4hcqTf6l3pV/n1/LMUM72H+V7m
	 sbl4XV5IhhSjrvoyQtH/LioZfK4Z0kaop8buEybI=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730144AbgAJAPH (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Thu, 9 Jan 2020 19:15:07 -0500
Received: from mail.kernel.org ([198.145.29.99]:36924 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730033AbgAJAPH (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 9 Jan 2020 19:15:07 -0500
Subject: Re: [GIT PULL] GPIO fixes for v5.5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1578615306;
        bh=bNp8BM+V90h4bbEQ/kyFkRoZzVW+vSiT8eU3crkOFew=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=otlspGE6r+yystQ3Se3s6NhSOaAPmnlnM8iOxtJokScoUERZX3XwCkDQinsOQ4ikL
         tEpf2duuTH9GyadCcqoeOZrP3dULJagmd7YyaWsnNL3N/rJAHsZTyjgW4Kap7eqH98
         tvJ5wlHY+cdX3rd74upZGhYSx3QsSGCAjQVrvzUI=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <CACRpkdaUEAxP8Q9iLR+DBuDAkq0U9mAhSwJsrqT7dCF3zAC8vA@mail.gmail.com>
References: <CACRpkdaUEAxP8Q9iLR+DBuDAkq0U9mAhSwJsrqT7dCF3zAC8vA@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CACRpkdaUEAxP8Q9iLR+DBuDAkq0U9mAhSwJsrqT7dCF3zAC8vA@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git
 tags/gpio-v5.5-3
X-PR-Tracked-Commit-Id: aa23ca3d98f756d5b1e503fb140665fb24a41a38
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 4a3033ef6e6bb4c566bd1d556de69b494d76976c
Message-Id: <157861530680.24562.15864965051300616648.pr-tracker-bot@kernel.org>
Date:   Fri, 10 Jan 2020 00:15:06 +0000
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Hans de Goede <hdegoede@redhat.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The pull request you sent on Thu, 9 Jan 2020 23:00:49 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git tags/gpio-v5.5-3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/4a3033ef6e6bb4c566bd1d556de69b494d76976c

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
