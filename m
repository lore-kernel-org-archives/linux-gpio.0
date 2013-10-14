From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Subject: Re: [PATCH] RFC: gpio: add API to be strict about GPIO IRQ usage
Date: Mon, 14 Oct 2013 12:23:32 +0200
Message-ID: <20131014102332.GA24882@ns203013.ovh.net>
References: <1380022390-21262-1-git-send-email-linus.walleij@linaro.org>
 <5241D12E.4050405@wwwdotorg.org>
 <CACRpkdZh_2v=_cudk2Kdq64DRtH1VPTECW0s15iaZAw4+ZW2Dg@mail.gmail.com>
 <52584D3E.7030809@wwwdotorg.org>
 <CACRpkdbxFwK8j+FbsXTJaiEFU+uaNJSDKAmADAbcxGKJDAHSWw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from 3.mo6.mail-out.ovh.net ([178.33.253.26]:43591 "EHLO
	mo6.mail-out.ovh.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1756663Ab3JNPpn (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Oct 2013 11:45:43 -0400
Received: from mail620.ha.ovh.net (gw6.ovh.net [213.251.189.206])
	by mo6.mail-out.ovh.net (Postfix) with SMTP id 65A0FFFA481
	for <linux-gpio@vger.kernel.org>; Mon, 14 Oct 2013 12:22:03 +0200 (CEST)
Content-Disposition: inline
In-Reply-To: <CACRpkdbxFwK8j+FbsXTJaiEFU+uaNJSDKAmADAbcxGKJDAHSWw@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Stephen Warren <swarren@wwwdotorg.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Enric Balletbo i Serra <eballetbo@gmail.com>, Grant Likely <grant.likely@linaro.org>, Santosh Shilimkar <santosh.shilimkar@ti.com>

On 10:03 Mon 14 Oct     , Linus Walleij wrote:
> On Fri, Oct 11, 2013 at 9:10 PM, Stephen Warren <swarren@wwwdotorg.org> wrote:
> > On 10/11/2013 02:39 AM, Linus Walleij wrote:
> 
> >> However that is not the whole story, is it? We have a gazillion
> >> drivers calling irq_create_mapping() in this function, so I would
> >> say that things are already a mess here.
> >
> > I expect things are a mess indeed:-)
> >
> > I believe that if a driver is only calling irq_create_mapping() inside
> > gpio_to_irq(), it's a bug. I think things can operate correctly in one
> > of two cases, at least with DT:
> >
> > 1) irq_create_mapping() is called from both gpio_to_irq() and the
> > of_xlate callback for IRQs.
> >
> > (I don't think this method would work in a board-file-based system where
> > of_xlate isn't called for IRQs...)
> >
> > or:
> >
> > 2) irq_create_mapping() is called for all IRQs when registering the IRQ
> > controller/domain.
> >
> > To me, (2) is much simpler, and avoids the issue (1) probably has with
> > only supporting direct IRQ usage (without something calling gpio_to_irq()).
> 
> Hm. Jean-Christophe says (1) is the way to go ... This is
> arch/arm/mach-at91/gpio.c I guess.

no this is in the new pinctrl+ gpio driver
in drivers/pinctrl/pinctrl-at91.c

the arch/arm/mach-at91/gpio.c is the old one for non-dt support that is going
to be drop
> 
> But this seems to call irq_create_mapping() for all IRQs on
> all gpiochips in at91_gpio_irq_setup() which is called by the board
> init code?
> 
> Maybe I'm not following this :-/

it's in at91_gpio_irq_domain_xlate
> 
> I'll take a look over "my" GPIO drivers and see how I can make
> those a bit more elegant so as to set a good example.
> 
> Yours,
> Linus Walleij
