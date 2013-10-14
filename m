From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] RFC: gpio: add API to be strict about GPIO IRQ usage
Date: Mon, 14 Oct 2013 10:03:57 +0200
Message-ID: <CACRpkdbxFwK8j+FbsXTJaiEFU+uaNJSDKAmADAbcxGKJDAHSWw@mail.gmail.com>
References: <1380022390-21262-1-git-send-email-linus.walleij@linaro.org>
	<5241D12E.4050405@wwwdotorg.org>
	<CACRpkdZh_2v=_cudk2Kdq64DRtH1VPTECW0s15iaZAw4+ZW2Dg@mail.gmail.com>
	<52584D3E.7030809@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ie0-f182.google.com ([209.85.223.182]:36314 "EHLO
	mail-ie0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753536Ab3JNID6 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Oct 2013 04:03:58 -0400
Received: by mail-ie0-f182.google.com with SMTP id as1so10443850iec.13
        for <linux-gpio@vger.kernel.org>; Mon, 14 Oct 2013 01:03:58 -0700 (PDT)
In-Reply-To: <52584D3E.7030809@wwwdotorg.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Enric Balletbo i Serra <eballetbo@gmail.com>, Grant Likely <grant.likely@linaro.org>, Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>, Santosh Shilimkar <santosh.shilimkar@ti.com>

On Fri, Oct 11, 2013 at 9:10 PM, Stephen Warren <swarren@wwwdotorg.org> wrote:
> On 10/11/2013 02:39 AM, Linus Walleij wrote:

>> However that is not the whole story, is it? We have a gazillion
>> drivers calling irq_create_mapping() in this function, so I would
>> say that things are already a mess here.
>
> I expect things are a mess indeed:-)
>
> I believe that if a driver is only calling irq_create_mapping() inside
> gpio_to_irq(), it's a bug. I think things can operate correctly in one
> of two cases, at least with DT:
>
> 1) irq_create_mapping() is called from both gpio_to_irq() and the
> of_xlate callback for IRQs.
>
> (I don't think this method would work in a board-file-based system where
> of_xlate isn't called for IRQs...)
>
> or:
>
> 2) irq_create_mapping() is called for all IRQs when registering the IRQ
> controller/domain.
>
> To me, (2) is much simpler, and avoids the issue (1) probably has with
> only supporting direct IRQ usage (without something calling gpio_to_irq()).

Hm. Jean-Christophe says (1) is the way to go ... This is
arch/arm/mach-at91/gpio.c I guess.

But this seems to call irq_create_mapping() for all IRQs on
all gpiochips in at91_gpio_irq_setup() which is called by the board
init code?

Maybe I'm not following this :-/

I'll take a look over "my" GPIO drivers and see how I can make
those a bit more elegant so as to set a good example.

Yours,
Linus Walleij
