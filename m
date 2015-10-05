From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH RFT 4/5] gpio: gpio-pl061: use the generic request/free implementations
Date: Mon, 5 Oct 2015 11:19:15 +0200
Message-ID: <CACRpkdbVQSTW3pEPLc-34m-zihWfw8fafQxWs_=wfU29GewkYA@mail.gmail.com>
References: <1442150498-31116-1-git-send-email-jogo@openwrt.org>
	<1442150498-31116-5-git-send-email-jogo@openwrt.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f182.google.com ([209.85.214.182]:34778 "EHLO
	mail-ob0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751973AbbJEJTP (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 5 Oct 2015 05:19:15 -0400
Received: by obbda8 with SMTP id da8so123958364obb.1
        for <linux-gpio@vger.kernel.org>; Mon, 05 Oct 2015 02:19:15 -0700 (PDT)
In-Reply-To: <1442150498-31116-5-git-send-email-jogo@openwrt.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Jonas Gorski <jogo@openwrt.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, Joachim Eastwood <manabian@gmail.com>, Jonas Jensen <jonas.jensen@gmail.com>, Gregory CLEMENT <gregory.clement@free-electrons.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, James Hogan <james.hogan@imgtec.com>, Stefan Agner <stefan@agner.ch>, Jun Nie <jun.nie@linaro.org>, Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee@kernel.org>, Eric Anholt <eric@anholt.net>, Mika Westerberg <mika.westerberg@linux.intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Matthias Brugger <matthias.bgg@gmail.com>, Alessandro Rubini <rubini@unipv.it>, Sonic Zhang <sonic.zhang@analog.com>, Laxman Dewangan <ldewangan@nvidia.com>, Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, Jonas Aaberg <jonas.aberg@stericsson.com>, Baruch Siach <baruch@tkos.co.il>

On Sun, Sep 13, 2015 at 3:21 PM, Jonas Gorski <jogo@openwrt.org> wrote:

>         spin_lock_init(&chip->lock);
> -       if (of_property_read_bool(dev->of_node, "gpio-ranges"))
> -               chip->uses_pinctrl = true;
> +       if (of_property_read_bool(dev->of_node, "gpio-ranges")) {
> +               chip->gc.request = gpiochip_generic_request;
> +               chip->gc.free = gpiochip_generic_free;
> +       }

This is way better.

But now this code is starting to multiply in drivers.

Can we think of a way to do this even more generic:
could gpiochip_generic_request() check if the range is
there instead?

Yours,
Linus Walleij
