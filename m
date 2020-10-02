Return-Path: <SRS0=z0ms=DJ=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1C25C46466
	for <linux-gpio@archiver.kernel.org>; Fri,  2 Oct 2020 21:54:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6F2022072E
	for <linux-gpio@archiver.kernel.org>; Fri,  2 Oct 2020 21:54:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1601675675;
	bh=/Vw9E0a50ZIjvEkAjRiinAnML2NW/Z/qzob/ILpG3Ls=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:List-ID:From;
	b=XjJ0HBRzMWS6m/Tky87/+K9FFzQhA9wMvPoNFceHVLr/i72wxa6+bj4aEWH0RAbrc
	 SEKmIHPzJdbn4h9kB+q3AuM/6kdhEZH7ylPyF5gEDaEFXeD9HmbM5QZ4PdovYmNERJ
	 SvitEEYsKbWd19TWRjuGr+xxR6U37qZ83a5CPqTg=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725788AbgJBVyU (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Fri, 2 Oct 2020 17:54:20 -0400
Received: from mail.kernel.org ([198.145.29.99]:57204 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725777AbgJBVyQ (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 2 Oct 2020 17:54:16 -0400
Subject: Re: [GIT PULL] pin control fixes for v5.9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601675656;
        bh=/Vw9E0a50ZIjvEkAjRiinAnML2NW/Z/qzob/ILpG3Ls=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=GYAFTgbVsrtCOP6NIQZjd0UqcWj/ZHCOluJCFzOOgxS+lIUcvfZayw2QPZNLdMN3x
         CF9g+11EvafiO7vTmD5XKyCPUqRH/12k8FSNFxzdU2dBiofOpS27spOmhu1GjHidCB
         Tv40/FZKPF2jwr/AM70jnkzD4QOWMt8J26nFA5a8=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <CACRpkdZ=EC589q1WpdkzCcswfLRUcVe25Uuht-vqywEn16R7Tg@mail.gmail.com>
References: <CACRpkdZ=EC589q1WpdkzCcswfLRUcVe25Uuht-vqywEn16R7Tg@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-gpio.vger.kernel.org>
X-PR-Tracked-Message-Id: <CACRpkdZ=EC589q1WpdkzCcswfLRUcVe25Uuht-vqywEn16R7Tg@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git tags/pinctrl-v5.9-2
X-PR-Tracked-Commit-Id: 39c4dbe4cc363accd676162c24b264f44c581490
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: d3d45f8220d60a0b2aaaacf8fb2be4e6ffd9008e
Message-Id: <160167565612.8763.6452165041366614261.pr-tracker-bot@kernel.org>
Date:   Fri, 02 Oct 2020 21:54:16 +0000
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The pull request you sent on Fri, 2 Oct 2020 23:45:39 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git tags/pinctrl-v5.9-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/d3d45f8220d60a0b2aaaacf8fb2be4e6ffd9008e

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
