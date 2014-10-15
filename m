From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v4 2/4] gpio: vf610: add gpiolib/IRQ chip driver for Vybrid
Date: Wed, 15 Oct 2014 09:27:35 +0200
Message-ID: <CACRpkdY2m+rvKzHGcZ8b=JMBCWQfjj_Bfucu4hFNGpianz4TJw@mail.gmail.com>
References: <cover.1411731755.git.stefan@agner.ch>
	<d978829094e6a287415dc1baeabb0aed2799aafc.1411731755.git.stefan@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <d978829094e6a287415dc1baeabb0aed2799aafc.1411731755.git.stefan@agner.ch>
Sender: linux-kernel-owner@vger.kernel.org
To: Stefan Agner <stefan@agner.ch>
Cc: Shawn Guo <shawn.guo@freescale.com>, Alexandre Courbot <gnurou@gmail.com>, Sascha Hauer <kernel@pengutronix.de>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, bpringlemeir@nbsps.com, Lucas Stach <l.stach@pengutronix.de>
List-Id: linux-gpio@vger.kernel.org

On Fri, Sep 26, 2014 at 1:57 PM, Stefan Agner <stefan@agner.ch> wrote:

> Add a gpiolib and IRQ chip driver for Vybrid ARM SoC using the
> Vybrid's GPIO and PORT module. The driver is instanced once per
> each GPIO/PORT module pair and handles 32 GPIO's.
>
> Signed-off-by: Stefan Agner <stefan@agner.ch>
> Acked-by: Shawn Guo <shawn.guo@freescale.com>

I'd like to apply this after the merge window, can you
please rebase it to my GPIO tree on the "devel" branch
or use Torvalds' HEAD?

Yours,
Linus Walleij
