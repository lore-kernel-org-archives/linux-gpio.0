From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH RFT 1/5] gpiolib: provide generic request/free implementations
Date: Mon, 5 Oct 2015 11:17:21 +0200
Message-ID: <CACRpkdbONs1Mbo8gYnvD0qi6G6V9U3onh8XopNiqvJbhn1vGfA@mail.gmail.com>
References: <1442150498-31116-1-git-send-email-jogo@openwrt.org>
	<1442150498-31116-2-git-send-email-jogo@openwrt.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f181.google.com ([209.85.214.181]:33071 "EHLO
	mail-ob0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752471AbbJEJRW (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 5 Oct 2015 05:17:22 -0400
Received: by obbbh8 with SMTP id bh8so123725126obb.0
        for <linux-gpio@vger.kernel.org>; Mon, 05 Oct 2015 02:17:21 -0700 (PDT)
In-Reply-To: <1442150498-31116-2-git-send-email-jogo@openwrt.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Jonas Gorski <jogo@openwrt.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, Joachim Eastwood <manabian@gmail.com>, Jonas Jensen <jonas.jensen@gmail.com>, Gregory CLEMENT <gregory.clement@free-electrons.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, James Hogan <james.hogan@imgtec.com>, Stefan Agner <stefan@agner.ch>, Jun Nie <jun.nie@linaro.org>, Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee@kernel.org>, Eric Anholt <eric@anholt.net>, Mika Westerberg <mika.westerberg@linux.intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Matthias Brugger <matthias.bgg@gmail.com>, Alessandro Rubini <rubini@unipv.it>, Sonic Zhang <sonic.zhang@analog.com>, Laxman Dewangan <ldewangan@nvidia.com>, Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, Jonas Aaberg <jonas.aberg@stericsson.com>, Baruch Siach <baruch@tkos.co.il>

On Sun, Sep 13, 2015 at 3:21 PM, Jonas Gorski <jogo@openwrt.org> wrote:

> Provide generic request/free implementations that pinctrl aware gpio
> drivers can use instead of open coding if they use a 1:1 pin to gpio
> signal mapping.
>
> Signed-off-by: Jonas Gorski <jogo@openwrt.org>

Hm. Is this really generic? Well I guess of more and more
SoC's get pin controllers in front of their GPIOs then yes. But
for an off-chip GPIO expander this is not really "generic".

> +/**
> + * gpiochip_generic_request() - request the gpio function for a pin
> + * @chip: the gpiochip owning the GPIO
> + * @gpio: the GPIO signal to request for GPIO function
> + */
> +int gpiochip_generic_request(struct gpio_chip *chip, unsigned gpio)

Second argument should be named "offset", "gpio" is ambigous
someone could think it's the global GPIO number.

Please collect the various ACKs and I will apply the patch series.

I have another comment which will be more of a discussion and
possible further improvement.

Yours,
Linus Walleij
