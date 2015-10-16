From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: Add driver for MEN 16Z127 GPIO controller
Date: Fri, 16 Oct 2015 21:54:55 +0200
Message-ID: <CACRpkdbUWBXSPuiyvEck=Cvo8xygSkGx6T-Cxr9nN0VkfjH+sQ@mail.gmail.com>
References: <1444068553-16899-1-git-send-email-andy@wernerandy.de>
	<CACRpkdZhdf787xAH-AY=8fY3YXOuLriVXhJHAn554YFWtDYZ7g@mail.gmail.com>
	<20151008194926.GA10709@linux-rrhd.site>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20151008194926.GA10709@linux-rrhd.site>
Sender: linux-kernel-owner@vger.kernel.org
To: Andreas Werner <andy@wernerandy.de>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Johannes Thumshirn <morbidrsa@gmail.com>
List-Id: linux-gpio@vger.kernel.org

On Thu, Oct 8, 2015 at 9:49 PM, Andreas Werner <andy@wernerandy.de> wrote:

> if i will implement the open drain support, does it really makes sense to go with the
> generic gpio lib?

Open Drain yes, for more esoterin pin config you may need to
also implement pin control, see Documentation/pinctrl.txt

> I need to replace the direction_input and direction_outpu functions
> because if the userland set an open drain pin to input i need to
> set the pin to High-Z (driver "1") instead of setting the input bit
> in the direction register.

Laurent has the same usecase I think, we need some fixes but
then we can detect (in the driver) that the gpio descriptor has
the open drain flag set in the .request() callback so you
can set it up there.

> So at the end there are just the "set" and "dat"
> functions used to drive an output and to get an input state.
> Alle other functions needs to be implemented in the driver.

I don't understand this question.

Yours,
Linus Walleij
