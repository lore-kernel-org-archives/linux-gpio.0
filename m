From: Alexander Stein <alexander.stein@systec-electronic.com>
Subject: Re: [PATCH] gpiolib: handle probe deferrals better
Date: Mon, 11 Apr 2016 08:10:14 +0200
Message-ID: <2011375.YUICgDcM4E@ws-stein>
References: <1459511048-24084-1-git-send-email-linus.walleij@linaro.org> <57052E67.4050206@ti.com> <CACRpkdZYyZG9=mXdWi3bnfvOqc6LFE1FykTU-QirQOJLv=Z2=A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-input-owner@vger.kernel.org>
In-Reply-To: <CACRpkdZYyZG9=mXdWi3bnfvOqc6LFE1FykTU-QirQOJLv=Z2=A@mail.gmail.com>
Sender: linux-input-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Grygorii Strashko <grygorii.strashko@ti.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Linux Input <linux-input@vger.kernel.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, Guenter Roeck <linux@roeck-us.net>, Bjorn Andersson <bjorn.andersson@linaro.org>
List-Id: linux-gpio@vger.kernel.org

On Thursday 07 April 2016 19:09:06, Linus Walleij wrote:
> >>> 4) irq_ready access synchronization on SMP? atomic?
> >> 
> >> Uhhh.... I don't even understand the question.
> > 
> > in my patch the irq_ready is set from _gpiochip_irqchip_add() and
> > read from gpiod_request() without any kind of protection and those
> > two functions can be executed in parallel.
> 
> Aha. Well I don't know if that is really a big problem?
> Does that really happen in practice?

I guess this is what actually happens in my case. The gpio controller has 
already been registred and the companion irq chip is about to be registered.
Meanwhile gpio-keys requests a GPIO from that recently registred gpio 
controller and the following gpio_to_irq or irq_request returns 0 or fails as 
the irq chip has not been registred yet (without Grygorii's patch). So this 
calling situation might actually happen.

Best regards,
Alexander

