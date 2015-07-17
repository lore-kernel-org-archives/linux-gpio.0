From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [patch 00/19] gpio: Interrupt cleanups and API change preparation
Date: Fri, 17 Jul 2015 14:47:53 +0200
Message-ID: <CACRpkdbho-XvNip3TXiS42Smysfrt4d8Mn29wp2byJGa2S-vug@mail.gmail.com>
References: <20150712232317.244138485@linutronix.de>
	<CACRpkdZqGfB-5e+gt8qk+m+iXnO8+S7K_-qQbL+nvHQaxD36BQ@mail.gmail.com>
	<alpine.DEB.2.11.1507161611320.18576@nanos>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f171.google.com ([209.85.214.171]:34860 "EHLO
	mail-ob0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754375AbbGQMry (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 17 Jul 2015 08:47:54 -0400
Received: by obbop1 with SMTP id op1so65068287obb.2
        for <linux-gpio@vger.kernel.org>; Fri, 17 Jul 2015 05:47:53 -0700 (PDT)
In-Reply-To: <alpine.DEB.2.11.1507161611320.18576@nanos>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Jiang Liu <jiang.liu@linux.intel.com>

On Thu, Jul 16, 2015 at 4:13 PM, Thomas Gleixner <tglx@linutronix.de> wrote:
> On Thu, 16 Jul 2015, Linus Walleij wrote:

>> git pull git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git irq/gpio
>> fatal: Couldn't find remote ref irq/gpio
>>
>> Same with pinctrl, did you push it?
>>
>> Or am I a shitty git operator ... don't rule that out :/
>
> No, I have moved the branches because they got accidentally pulled
> into next :)
>
>  git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git queue/irq/gpio
>  git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git queue/irq/pinctrl
>
> Both have the latest fixes included.

OK I pulled the GPIO patches to my GPIO tree and the pinctrl patches
to the pinctrl tree and pushed to the 0day builder.

If it builds I will push both to next so they turn up there by tomorrow or so.

Yours,
Linus Walleij
