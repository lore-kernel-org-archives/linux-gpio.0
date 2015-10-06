From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH RFT 4/5] gpio: gpio-pl061: use the generic request/free implementations
Date: Tue, 6 Oct 2015 09:23:30 +0200
Message-ID: <CACRpkdY_BAVhTJoMvyLXo9iDQ-YoezeO64jTesgpJ=1d8AxcFw@mail.gmail.com>
References: <1442150498-31116-1-git-send-email-jogo@openwrt.org>
	<1442150498-31116-5-git-send-email-jogo@openwrt.org>
	<CACRpkdbVQSTW3pEPLc-34m-zihWfw8fafQxWs_=wfU29GewkYA@mail.gmail.com>
	<5612772B.8090706@openwrt.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f50.google.com ([209.85.218.50]:33096 "EHLO
	mail-oi0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751786AbbJFHXa (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 6 Oct 2015 03:23:30 -0400
Received: by oixx17 with SMTP id x17so104053785oix.0
        for <linux-gpio@vger.kernel.org>; Tue, 06 Oct 2015 00:23:30 -0700 (PDT)
In-Reply-To: <5612772B.8090706@openwrt.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Jonas Gorski <jogo@openwrt.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Joachim Eastwood <manabian@gmail.com>, Jonas Jensen <jonas.jensen@gmail.com>, Gregory CLEMENT <gregory.clement@free-electrons.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, James Hogan <james.hogan@imgtec.com>, Stefan Agner <stefan@agner.ch>, Jun Nie <jun.nie@linaro.org>, Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee@kernel.org>, Eric Anholt <eric@anholt.net>, Mika Westerberg <mika.westerberg@linux.intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Matthias Brugger <matthias.bgg@gmail.com>, Alessandro Rubini <rubini@unipv.it>, Sonic Zhang <sonic.zhang@analog.com>, Laxman Dewangan <ldewangan@nvidia.com>, Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, Baruch Siach <baruch@tkos.co.il>, Andrew Bresticker <abrestic@chromium.org>, Heiko Stuebner <heiko@sntech.de>, Sr

On Mon, Oct 5, 2015 at 3:12 PM, Jonas Gorski <jogo@openwrt.org> wrote:
> [Me]
>> Can we think of a way to do this even more generic:
>> could gpiochip_generic_request() check if the range is
>> there instead?
>
> I thought about this, and AFAICT this would open a window in which gpio
> requests could bypass the pinctrl subsystem, as ranges are only registered
> after the gpio chip was registered.
> pinctrl_request_gpio() -> pinctrl_get_device_gpio_range() returns -EPROBEDEFER if
> it can't find a range for that reason.
>
> To solve this we could introduce a gpiochip_add_with_range(), then we can assign
> the generic _request/_free in gpiochip_add in case the callbacks aren't set yet
> (and keep the way _request/_free are implemented).

Hm! That sounds like a good idea. Alexandre, what do you think?

> static const struct __initconst pinctrl_gpio_range foo_range = {
>         .base = 0,
>         .pinbase = 0,
>         .npins = npins,
> };
>
> gpiochip_add_with_ranges(chip, "foo", &foo_range, 1);

Neato.

> which would be a bit more verbose, but for drivers like pinctrl-cygnus-gpio,
> which registers 51(!) pinranges for the same gpio chip, it would mean quite a
> bit of code reduction.

Now we're talking.

Are you interested in doing this refactoring? It'd be awesome.

(Do it on top of this series though, so we can merge this first.)

Yours,
Linus Walleij
