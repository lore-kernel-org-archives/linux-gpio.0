From: Rabin Vincent <rabin@rab.in>
Subject: Re: [PATCH 2/2] gpio: etraxfs: add interrupt support
Date: Mon, 3 Aug 2015 19:30:40 +0200
Message-ID: <20150803173005.GA28817@debian>
References: <1438346937-9020-1-git-send-email-rabin@rab.in>
 <1438346937-9020-2-git-send-email-rabin@rab.in>
 <CACRpkdZOztPHykq99bC0P9t0jQkAdYqrrbC2shwWa9d2O5DQXw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdZOztPHykq99bC0P9t0jQkAdYqrrbC2shwWa9d2O5DQXw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Mon, Aug 03, 2015 at 11:34:23AM +0200, Linus Walleij wrote:
> On Fri, Jul 31, 2015 at 2:48 PM, Rabin Vincent <rabin@rab.in> wrote:
> > +static void etraxfs_gpio_irq_ack(struct irq_data *d)
> > +{
> > +       struct etraxfs_gpio_chip *chip = irq_data_get_irq_chip_data(d);
> 
> I don't see how this works in the irqchip functions.

The offset of the gpio_chip embedded in etraxfs_gpio_chip is zero.
There are a couple of other gpio drivers doing it the same way, but
container_of() would certainly be more robust.
