From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH V2 1/2] gpiolib: improve overlap check of range of gpio
Date: Tue, 17 Nov 2015 15:14:57 +0100
Message-ID: <CACRpkdYOQfMV46GCRfKBxeUFwz7FjUGw-r6Gej6SWef0_j03_A@mail.gmail.com>
References: <1447650167-29070-1-git-send-email-bamvor.zhangjian@linaro.org>
	<1447650167-29070-2-git-send-email-bamvor.zhangjian@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f43.google.com ([209.85.218.43]:34934 "EHLO
	mail-oi0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752315AbbKQOO5 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 17 Nov 2015 09:14:57 -0500
Received: by oige206 with SMTP id e206so5328000oig.2
        for <linux-gpio@vger.kernel.org>; Tue, 17 Nov 2015 06:14:57 -0800 (PST)
In-Reply-To: <1447650167-29070-2-git-send-email-bamvor.zhangjian@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Mark Brown <broonie@kernel.org>

On Mon, Nov 16, 2015 at 6:02 AM, Bamvor Jian Zhang
<bamvor.zhangjian@linaro.org> wrote:

> There are limitations for the current checker:
> 1.  Could not check the overlap if the new gpiochip is the secondly
>     gpiochip.
> 2.  Could not check the overlap if the new gpiochip is overlap
>     with the left of gpiochip. E.g. if we insert [c, d] between
>     [a,b] and [e, f], and e >= c + d, it will successful even if
>     c < a + b.
> 3.  Allow overlap of base of different gpiochip.
>
> This patch fix these issues by checking the overlap of both right and
> left gpiochip in the same loop statement.
>
> Signed-off-by: Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>

Patch applied with some tweaks. Had to rebase it because
I renamed ->dev to ->parent in the GPIO tree, then I found
it possible to get rid of the ret variable altogether.

Yours,
Linus Walleij
