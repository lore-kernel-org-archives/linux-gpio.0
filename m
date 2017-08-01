From: Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [RFT PATCH v2] gpiolib: allow gpio irqchip to map irqs
 dynamically
Date: Tue, 01 Aug 2017 10:03:34 +0200
Message-ID: <1501574614.2759.9.camel@baylibre.com>
References: <20170721164900.7070-1-grygorii.strashko@ti.com>
         <CACRpkdbFVV669PxGDXO9Xzf-jj0sEKyQTvhdLMA_of16wBp7PQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdbFVV669PxGDXO9Xzf-jj0sEKyQTvhdLMA_of16wBp7PQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Grygorii Strashko <grygorii.strashko@ti.com>, Bartosz Golaszewski <brgl@bgdev.pl>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Tue, 2017-08-01 at 09:52 +0200, Linus Walleij wrote:
> On Fri, Jul 21, 2017 at 6:49 PM, Grygorii Strashko
> <grygorii.strashko@ti.com> wrote:
> 
> > Now IRQ mappings are always created for all (allowed) GPIOs in gpiochip in
> > gpiochip_irqchip_add_key() which goes against the idea of SPARSE_IRQ and,
> > as result, leads to:
> >  - increasing of memory consumption for IRQ descriptors most of which will
> > never ever be used (espessially on platform with a high number of GPIOs).
> > (sizeof(struct irq_desc) == 256 on my tested platforms)
> >  - imposibility to use GPIO irqchip APIs by gpio drivers when HW implements
> > GPIO IRQ functionality as IRQ crossbar/router which has only limited
> > number of IRQ outputs (example from [1], all GPIOs can be mapped on only 8
> > IRQs).

Sorry, I forgot to reply to this thread until now.
This patch is generalization of create mapping in the gpio_to_irq, right ?

So the issue of mapping left lying around until the gpio driver is unloaded is
still there ?

Having gpio_irq_prepare/gpio_irq_unprepare would solve that, I suppose
(Again, sorry I could not send an RFC for this yet ...)

> > 
> > Hence, remove static IRQ mapping code from gpiochip_irqchip_add_key() and
> > instead replace irq_find_mapping() with irq_create_mapping() in
> > gpiochip_to_irq(). Also add additional gpiochip_irqchip_irq_valid() calls
> > in gpiochip_to_irq() and gpiochip_irq_map().
> > 
> > After this change gpio2irq mapping will happen the following way when GPIO
> > irqchip APIs are used by gpio driver:
> >  - IRQ mappings will be created statically if driver passes first_irq>0
> > vlaue in gpiochip_irqchip_add_key().
> >  - IRQ mappings will be created dynamically from gpio_to_irq() or
> > of_irq_get().
> > 
> > Tested on am335x-evm and dra72-evm-revc.
> > - dra72-evm-revc: number of created irq mappings decreased from 402 -> 135
> >   Mem savings 267*256 = 68352 (66kB)
> > - am335x-evm: number of created irq mappings decreased from 188 -> 63
> >   Mem savings 125*256 = 32000 (31kB)
> > 
> > [1] https://lkml.org/lkml/2017/6/15/428
> > Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>
> > ---
> > Changes in v2:
> > - restored struct gpio_chip->irq_base to fix buld of gpio-mockup.c
> 
> Applied this rather than v1.
> 
> But maybe we should get rid of ->irq_base from gpio-mockup.c
> and delete it, as the base is irqchip-internal.
> 
> Bartosz what do you say? Do we need this in the mockup?
> 
> Yours,
> Linus Walleij
