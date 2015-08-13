From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/2] gpio: etraxfs: add interrupt support
Date: Thu, 13 Aug 2015 10:57:49 +0200
Message-ID: <CACRpkdYt0aEX+WZgNVecODZ69TiDwTeNR6d5dFg4LsiwK+oCTw@mail.gmail.com>
References: <1438346937-9020-1-git-send-email-rabin@rab.in>
	<1438346937-9020-2-git-send-email-rabin@rab.in>
	<CACRpkdZOztPHykq99bC0P9t0jQkAdYqrrbC2shwWa9d2O5DQXw@mail.gmail.com>
	<20150803173005.GA28817@debian>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150803173005.GA28817@debian>
Sender: linux-kernel-owner@vger.kernel.org
To: Rabin Vincent <rabin@rab.in>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Mon, Aug 3, 2015 at 7:30 PM, Rabin Vincent <rabin@rab.in> wrote:
> On Mon, Aug 03, 2015 at 11:34:23AM +0200, Linus Walleij wrote:
>> On Fri, Jul 31, 2015 at 2:48 PM, Rabin Vincent <rabin@rab.in> wrote:
>> > +static void etraxfs_gpio_irq_ack(struct irq_data *d)
>> > +{
>> > +       struct etraxfs_gpio_chip *chip = irq_data_get_irq_chip_data(d);
>>
>> I don't see how this works in the irqchip functions.
>
> The offset of the gpio_chip embedded in etraxfs_gpio_chip is zero.
> There are a couple of other gpio drivers doing it the same way, but
> container_of() would certainly be more robust.

Aha hehe yeah that seems a bit fragile, I should take a sweep and
fix them all I guess.

Yours,
Linus Walleij
