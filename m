From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [RESEND RFC PATCH 0/2] fixing the gpio ownership
Date: Thu, 18 Jan 2018 11:16:44 +0100
Message-ID: <CACRpkdbNqn-MJuzq=BpbNYveD-F8Hee2NY6ny4-SJL+F=wHq7g@mail.gmail.com>
References: <20180115162407.6314-1-ludovic.desroches@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180115162407.6314-1-ludovic.desroches@microchip.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ludovic Desroches <ludovic.desroches@microchip.com>
Cc: linux-gpio@vger.kernel.org, Linux ARM <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>
List-Id: linux-gpio@vger.kernel.org

Hi Ludovic, thanks for your patches!

On Mon, Jan 15, 2018 at 5:24 PM, Ludovic Desroches
<ludovic.desroches@microchip.com> wrote:

> A few weeks ago, I have sent an RFC about adding bias support for GPIOs [1].

I was confused I think, because the issue of ownership and adding
bias support were conflated.

I think I discussed properly the ideas I have for pin control properties
vs the GPIOlib API/ABI in my response to patch 1.

> It was motivated by the fact that I wanted to enable the pinmuxing strict mode
> for my pin controller which can muxed a pin as a peripheral or as a GPIO.

So that is a different thing from bias support.

> Enabling the strict mode prevents several devices to be probed because
> requesting a GPIO fails. The pin request function complains about the
> ownership of the GPIO which is different from the mux ownership. I have to
> remove my pinctrl node to avoid this conflict but I need it to configure my
> pins and to set a pull-up bias for my GPIOs.

Okay I think the right solution is to fix the ownership issue, and set
up bias using pin control/config but use the line through gpiolib for now.

> The main issue is that enabling the strict mode will
> break old DTBs.

Yeah we need to work around that.

> I was going to submit patches for this but, after using the
> sysfs which still show me a bad ownership, I decided that it should be fixed.

Yep :)

> So I did these patches. Unfortunately, there are several ways to lead to
> gpiod_request(). It does the trick only for the gpiod_get family. The issue is
> still present with legacy gpio_request and fwnode_get_named_gpiod.

fwnode_get_named_gpiod() must really be fixed too. You probably
want to have things like LEDs and GPIO keys working even if
your pin controller is strict.

I don't care so much about the old functions, I guess you just have
to make sure that the drivers for *your* pin controller all use descriptors
so that you can enable strict mode on *your* pin controller, right?

Restrict your task to this, I'd say.

> It seems
> that more and more drivers are converted to use GPIO descriptors so there is
> some hope.

Yeah I'm doing this when I have time. There is plenty of work...
Help appreciated.

Yours,
Linus Walleij
