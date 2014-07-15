From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [GIT PULL] the great <mach/gpio.h> purge
Date: Tue, 15 Jul 2014 21:32:03 +0200
Message-ID: <CACRpkdZGg_=bUzVK6A_S50ZEbsuu1AnM-rzNs9u5w-_dHgqVGw@mail.gmail.com>
References: <CACRpkdbPHn6bWdr8t9BrmE2JZZuuVnF7ujzEFdrM86WmrRS5Hw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f173.google.com ([209.85.214.173]:53574 "EHLO
	mail-ob0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932890AbaGOTcF (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 15 Jul 2014 15:32:05 -0400
Received: by mail-ob0-f173.google.com with SMTP id vb8so6121836obc.18
        for <linux-gpio@vger.kernel.org>; Tue, 15 Jul 2014 12:32:04 -0700 (PDT)
In-Reply-To: <CACRpkdbPHn6bWdr8t9BrmE2JZZuuVnF7ujzEFdrM86WmrRS5Hw@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: "arm@kernel.org" <arm@kernel.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Kukjin Kim <kgene.kim@samsung.com>

On Mon, Jun 30, 2014 at 10:06 PM, Linus Walleij
<linus.walleij@linaro.org> wrote:

> Hi ARM SoC guys,
>
> please pull in this patch set removing <mach/gpio.h> for good.
> I guess it could collide with some S5P deletion.
> If you decide to pull the S5P purge first, tell me so I can rebase.
>
> Yours,
> Linus Walleij
>
>
> The following changes since commit 4c834452aad01531db949414f94f817a86348d59:
>
>   Linux 3.16-rc3 (2014-06-29 14:11:36 -0700)
>
> are available in the git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git
> tags/gpio-h-purge
>
> for you to fetch changes up to 53430333c345c3531f9443d43c6fba1da693abe4:
>
>   ARM: delete old reference to ARM_GPIOLIB_COMPLEX (2014-06-30 21:37:39 +0200)
>
> ----------------------------------------------------------------
> This is a purge of all things <mach/gpio.h>, now I never
> want to see it again.
>
> - Remove the need for <mach/gpio.h> from S5P
> - Kill CONFIG_NEED_MACH_GPIO_H
> - Kill remnants of ARM_GPIOLIB_COMPLEX
>
> ----------------------------------------------------------------
> Linus Walleij (4):
>       ARM: s5p: cut the custom ARCH_NR_GPIOS definition
>       ARM: mach-s5p: get rid of all <mach/gpio.h> headers
>       ARM: kill CONFIG_NEED_MACH_GPIO_H
>       ARM: delete old reference to ARM_GPIOLIB_COMPLEX

So ARM SoC folks, what do we do about this?

Shall I rebase it or can you pull this in as-is?

Yours,
Linus Walleij
