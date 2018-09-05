From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: fix kernel-doc notation warning for 'request_key'
Date: Wed, 5 Sep 2018 14:01:24 +0200
Message-ID: <CACRpkdbhfsmpq28AcmbhswuvgYUvh+UQ5NUpsAyS2W+ROTHbNw@mail.gmail.com>
References: <e80a35c7-a9f4-46bf-7036-11375f368ba5@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <e80a35c7-a9f4-46bf-7036-11375f368ba5@infradead.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Randy Dunlap <rdunlap@infradead.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Andrew Lunn <andrew@lunn.ch>, Thomas Gleixner <tglx@linutronix.de>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Mon, Sep 3, 2018 at 9:55 PM Randy Dunlap <rdunlap@infradead.org> wrote:

> From: Randy Dunlap <rdunlap@infradead.org>
>
> Fix kernel-doc warning for missing struct member 'request_key':
>
> ../include/linux/gpio/driver.h:142: warning: Function parameter or member 'request_key' not described in 'gpio_irq_chip'
>
> Fixes: 39c3fd58952d ("kernel/irq: Extend lockdep class for request mutex")

Patch applied. Thanks for spending time with documentation!

Yours,
Linus Walleij
