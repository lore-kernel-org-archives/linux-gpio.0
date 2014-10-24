From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v5 2/4] gpio: vf610: add gpiolib/IRQ chip driver for Vybrid
Date: Fri, 24 Oct 2014 14:21:01 +0200
Message-ID: <CACRpkdYB8MEhSXiiRBbZeMdj_+ts9XU8VFy=sYM0wbe9qJznuQ@mail.gmail.com>
References: <cover.1413488264.git.stefan@agner.ch>
	<97db7732f2fc24402a5be56f5ba19f00b7e2c66a.1413488264.git.stefan@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <97db7732f2fc24402a5be56f5ba19f00b7e2c66a.1413488264.git.stefan@agner.ch>
Sender: linux-kernel-owner@vger.kernel.org
To: Stefan Agner <stefan@agner.ch>
Cc: Alexandre Courbot <gnurou@gmail.com>, Shawn Guo <shawn.guo@freescale.com>, Sascha Hauer <kernel@pengutronix.de>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, bpringlemeir@nbsps.com, Lucas Stach <l.stach@pengutronix.de>
List-Id: linux-gpio@vger.kernel.org

On Thu, Oct 16, 2014 at 9:47 PM, Stefan Agner <stefan@agner.ch> wrote:

> Add a gpiolib and IRQ chip driver for Vybrid ARM SoC using the
> Vybrid's GPIO and PORT module. The driver is instanced once per
> each GPIO/PORT module pair and handles 32 GPIO's.
>
> Signed-off-by: Stefan Agner <stefan@agner.ch>
> Acked-by: Shawn Guo <shawn.guo@freescale.com>

Patch applied to the GPIO tree.

Yours,
Linus Walleij
