From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] RFT: pinctrl: sunxi: convert to GPIO irqchip helpers
Date: Wed, 28 May 2014 10:57:16 +0200
Message-ID: <CACRpkda5tnDFgOFUk6GL58s-fWZmRfCLiBvbOqNgwrYVFNWySA@mail.gmail.com>
References: <1399621082-10712-1-git-send-email-linus.walleij@linaro.org>
	<20140527153456.GL4730@lukather>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20140527153456.GL4730@lukather>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>
List-Id: linux-gpio@vger.kernel.org

On Tue, May 27, 2014 at 5:34 PM, Maxime Ripard
<maxime.ripard@free-electrons.com> wrote:

> I've been quite late at testing this, I'm sorry, but I finally gave it
> a try.
>
> Besides the minor glitches here and there that were expected, I think
> that it can't really work now given the state of gpiolib_irqchip.

OK I buy that, it was a nice try from my side :-)

Now let's drop this patch to the floor and accept that the sunxi
gpio irqs are complex and cannot be handled by simple helpers.

Thanks a lot for testing the code though!

Yours,
Linus Walleij
