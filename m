From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] gpiolib: rewrite gpiodev_add_to_list
Date: Mon, 7 Mar 2016 12:04:05 +0700
Message-ID: <CACRpkdYq7Dp7iiJVu2uuL7J8UGuVfVQjkQkXNGo1ynAe1AkiXw@mail.gmail.com>
References: <1456497434-11656-1-git-send-email-bamv2005@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f51.google.com ([209.85.218.51]:36590 "EHLO
	mail-oi0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750854AbcCGFEG (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 7 Mar 2016 00:04:06 -0500
Received: by mail-oi0-f51.google.com with SMTP id r187so72456507oih.3
        for <linux-gpio@vger.kernel.org>; Sun, 06 Mar 2016 21:04:05 -0800 (PST)
In-Reply-To: <1456497434-11656-1-git-send-email-bamv2005@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Bamvor Jian Zhang <bamv2005@gmail.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Mark Brown <broonie@kernel.org>, Julien Grossholtz <julien.grossholtz@savoirfairelinux.com>, Arnd Bergmann <arnd@arndb.de>, Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>

On Fri, Feb 26, 2016 at 9:37 PM, Bamvor Jian Zhang <bamv2005@gmail.com> wrote:

> From: Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>
>
> The original code of gpiodev_add_to_list is not very clear which
> lead to bugs or compiling warning, reference the following patches:
> Bugs:
> 1.  Commit ef7c7553039b ("gpiolib: improve overlap check of range of
>     gpio").
> 2.  Commit 96098df125c0 ("gpiolib: fix chip order in gpio list")
>
> Warning:
> 1.  Commit e28ecca6eac4 ("gpio: fix warning about iterator").
> of gpio").
>
> There is a off-list discussion about how to improve it consequently.
> This commit try to follow this by rewriting the whole functions.
>
> Tested pass with my gpio mockup driver and test scripts[1].
>
> [1] http://www.spinics.net/lists/linux-gpio/msg09598.html
>
> Suggested-by: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>

Patch applied. It surely looks much better like this!

Yours,
Linus Walleij
