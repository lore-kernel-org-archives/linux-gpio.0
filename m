From: Baruch Siach <baruch@tkos.co.il>
Subject: Re: [PATCH 103/182] pinctrl: digicolor: use gpiochip data pointer
Date: Wed, 9 Dec 2015 16:08:13 +0200
Message-ID: <20151209140813.GA2383@sapphire.tkos.co.il>
References: <1449667921-2612-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from guitar.tcltek.co.il ([192.115.133.116]:45805 "EHLO
	mx.tkos.co.il" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754759AbbLIOPi (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Wed, 9 Dec 2015 09:15:38 -0500
Content-Disposition: inline
In-Reply-To: <1449667921-2612-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>

Hi Linus,

On Wed, Dec 09, 2015 at 02:32:01PM +0100, Linus Walleij wrote:
> This makes the driver use the data pointer added to the gpio_chip
> to store a pointer to the state container instead of relying on
> container_of().
> 
> Cc: Baruch Siach <baruch@tkos.co.il>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Acked-by: Baruch Siach <baruch@tkos.co.il>

Thanks,
baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
