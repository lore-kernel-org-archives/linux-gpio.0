From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpiolib: avoid uninitialized data in gpio kfifo
Date: Thu, 16 Jun 2016 12:00:53 +0200
Message-ID: <CACRpkdbQLb-wgm2JXKnxQ4+nPZhgAu+Mh78a=P4zj1NcdLQmUw@mail.gmail.com>
References: <20160616090254.964288-1-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160616090254.964288-1-arnd@arndb.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Thu, Jun 16, 2016 at 11:02 AM, Arnd Bergmann <arnd@arndb.de> wrote:

> gcc reports a theoretical case for returning uninitialized data in
> the kfifo when a GPIO interrupt happens and neither
> GPIOEVENT_REQUEST_RISING_EDGE nor GPIOEVENT_REQUEST_FALLING_EDGE
> are set:
>
> drivers/gpio/gpiolib.c: In function 'lineevent_irq_thread':
> drivers/gpio/gpiolib.c:683:87: error: 'ge.id' may be used uninitialized in this function [-Werror=maybe-uninitialized]
>
> This case should not happen, but to be on the safe side, let's
> return from the irq handler without adding data to the FIFO
> to ensure we can never leak stack data to user space.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> Fixes: 61f922db7221 ("gpio: userspace ABI for reading GPIO line events")

Patch applied, good catch, thanks!

Yours,
Linus Walleij
