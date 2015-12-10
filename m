From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 12/28] gpio: pch: allow build on MIPS platforms
Date: Thu, 10 Dec 2015 17:23:56 +0100
Message-ID: <CACRpkdZgYFMgEqd3AZn0Vp14BDiYQuUPzT7eGPB69Qs1m7Bo7w@mail.gmail.com>
References: <1448900513-20856-1-git-send-email-paul.burton@imgtec.com>
	<1448900513-20856-13-git-send-email-paul.burton@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f52.google.com ([209.85.218.52]:35835 "EHLO
	mail-oi0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751343AbbLJQX5 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Dec 2015 11:23:57 -0500
Received: by oige206 with SMTP id e206so49165855oig.2
        for <linux-gpio@vger.kernel.org>; Thu, 10 Dec 2015 08:23:56 -0800 (PST)
In-Reply-To: <1448900513-20856-13-git-send-email-paul.burton@imgtec.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Paul Burton <paul.burton@imgtec.com>
Cc: Linux MIPS <linux-mips@linux-mips.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Mon, Nov 30, 2015 at 5:21 PM, Paul Burton <paul.burton@imgtec.com> wrote:

> Allow the pch_gpio driver to be built for MIPS platforms, in preparation
> for use on the MIPS Boston board.
>
> Signed-off-by: Paul Burton <paul.burton@imgtec.com>

Patch applied to the GPIO tree.

All GPIO patches should go separately to the GPIO tree, especially
this merge window as I'm doing refactorings.

Yours,
Linus Walleij
