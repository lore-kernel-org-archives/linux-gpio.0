From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: sh-pfc: Let gpio_chip.to_irq() return -ENXIO on error
Date: Mon, 2 May 2016 13:16:53 +0200
Message-ID: <CACRpkdZGAYYojRe5c-k34rUucLP1+GjDN5VtEEemQGPeOKM09w@mail.gmail.com>
References: <1461914677-24899-1-git-send-email-geert+renesas@glider.be>
	<CACRpkdayGoAsU2+dOg4Y9BcyOORVp4OmUUCbE_cW5gPzR=D7nw@mail.gmail.com>
	<CAMuHMdW+O-qtrfbfpORX_dWCATZ9goTqQQa_sD9h1Jq=7H9DMA@mail.gmail.com>
	<CACRpkdbtwSmGmCfBLBUi2w9NHkVTLhwg8Q5srMCxNLNjze6msg@mail.gmail.com>
	<CAMuHMdX6Qrx=zjyOgag1wdYVoG-u_kmFz=Kxzs8-mriYe-2y9g@mail.gmail.com>
	<CAMuHMdWxaPOfh-eU9ASTQmrbt74pyoiOT7oSyizvxbZ8zN0g8g@mail.gmail.com>
	<CACRpkdZLSRQfUfc4d=uO0CtH3svN+a17HLbEQYtdy8kMAS_sUA@mail.gmail.com>
	<CAMuHMdWiBq+rexBr_OYOStLHAQwfE2CbodxSF0RgtQZL7+Pe7g@mail.gmail.com>
	<CACRpkdZGOe+RaO-cZ+zYSBgzen4hi=C86kLF+MLKvH3ZdNZeqg@mail.gmail.com>
	<CAMuHMdWM_Y_ypisZFUXwec37Nc=8MBqWLmPSktzaNdOPbHmbow@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <CAMuHMdWM_Y_ypisZFUXwec37Nc=8MBqWLmPSktzaNdOPbHmbow@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, linux-renesas-soc@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

On Mon, May 2, 2016 at 12:05 PM, Geert Uytterhoeven
<geert@linux-m68k.org> wrote:

> gpiod_to_irq() is documented to return a negative error code on failure,
> cfr. Documentation/gpio/consumer.txt and drivers/gpio/gpiolib.c.
> In fact the check in mctrl_gpio_init() is the only caller that
> considers zero as an
> error.
>
> Perhaps gpiod_to_irq() should handle .to_irq() returning zero instead?

OK good point, I sent a patch like so, let's see what people say.

I'm a bit torn: part of me feel that since the function has *_to_irq()
in it it should use zero for NO_IRQ if there is no translation.

But this works too, whatever, rough consensus and running code.

Yours,
Linus Walleij
