From: Alban <albeu@free.fr>
Subject: Re: [PATCH 2/3] gpio: ath79: Move to the generic GPIO driver
Date: Sun, 1 Nov 2015 18:46:59 +0100
Message-ID: <20151101184659.1824dc35@tock>
References: <1446201391-22553-1-git-send-email-albeu@free.fr>
	<1446201391-22553-2-git-send-email-albeu@free.fr>
	<CACRpkdY3Xjir7pHLhpT9nv1w-KA5E3a767vqZoQronyAWZ1F1w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from smtp2-g21.free.fr ([212.27.42.2]:53466 "EHLO smtp2-g21.free.fr"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752448AbbKARrJ (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Sun, 1 Nov 2015 12:47:09 -0500
In-Reply-To: <CACRpkdY3Xjir7pHLhpT9nv1w-KA5E3a767vqZoQronyAWZ1F1w@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Aban Bedel <albeu@free.fr>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>

On Sat, 31 Oct 2015 22:02:53 +0100
Linus Walleij <linus.walleij@linaro.org> wrote:

> On Fri, Oct 30, 2015 at 11:36 AM, Alban Bedel <albeu@free.fr> wrote:
> 
> > Turn the ath79 driver into a true driver supporting multiple
> > instances while dropping most of the code in favor of the generic
> > MMIO GPIO driver.
> >
> > As the driver now depend on CONFIG_GPIO_GENERIC also add a Kconfig
> > entry to make the driver optional.
> >
> > Signed-off-by: Alban Bedel <albeu@free.fr>
> 
> This patch looks nice but sadly does not apply to my "devel" branch in
> the GPIO tree:
> https://git.kernel.org/cgit/linux/kernel/git/linusw/linux-gpio.git/log/?h=devel
> 
> Please rebase it on this branch or wait until after the merge window.

I see that you applied my previous patch "gpio: ath79: Convert to the
state container design pattern", this series was supposed to replace
this patch. I'm sorry I forgot to mention this. That old patch doesn't
make much sense any more as most of the code it changed just get
dropped in the move to GPIO_GENERIC.

> > +config GPIO_ATH79
> > +       tristate "Atheros AR71XX/AR724X/AR913X GPIO support"
> > +       default y if ATH79
> > +       depends on ATH79 || COMPILE_TEST
> 
> I think the build robot is complaining because of COMPILE_TEST. This
> driver doesn't really compile on anything else than ATH79 does it?
> Noone else has asm/mach-ath79/ar71xx_regs.h
>
> So I suggest dropping the compile test until this is fixed (e.g. by
> moving the GPIO register offsets into the driver, what do I know).

I'm going to split the compile test support to a separate patch.
 
Alban
