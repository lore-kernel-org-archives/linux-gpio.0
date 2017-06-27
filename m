From: Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [RFC] gpio: about the need to manage irq mapping dynamically.
Date: Tue, 27 Jun 2017 20:25:29 +0200
Message-ID: <1498587929.25567.12.camel@baylibre.com>
References: <1497543642.3086.35.camel@baylibre.com>
         <CACRpkdZWw_-joPT4CJ-RAJ31s4BxuE6vusjg5YnZWaHtkRg5+w@mail.gmail.com>
         <1497954416.7387.1.camel@baylibre.com>
         <CACRpkdZu74aAsu8hggxsfffQPMk0nqihCSfuMaMbf+-4EFSYYA@mail.gmail.com>
         <1497979438.7387.10.camel@baylibre.com>
         <CACRpkdZ2cqUgMwOFG+9JVyAOxYTfHYa3+yrUzUozLpYD87KdOQ@mail.gmail.com>
         <1498141515.7387.16.camel@baylibre.com>
         <0e12f9bd-4e0b-c602-5627-5dbda5371dee@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <0e12f9bd-4e0b-c602-5627-5dbda5371dee@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Grygorii Strashko <grygorii.strashko@ti.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Marc Zyngier <marc.zyngier@arm.com>, "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>, Kevin Hilman <khilman@baylibre.com>, Linux Kernel <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Tue, 2017-06-27 at 12:49 -0500, Grygorii Strashko wrote:
> 
> On 06/22/2017 09:25 AM, Jerome Brunet wrote:
> > On Wed, 2017-06-21 at 22:50 +0200, Linus Walleij wrote:
> > > On Tue, Jun 20, 2017 at 7:23 PM, Jerome Brunet <jbrunet@baylibre.com>
> > > wrote:
> > > > On Tue, 2017-06-20 at 18:37 +0200, Linus Walleij wrote:
> > > > > Eventually gpio_to_irq() should be DELETED and replaced in full with
> > > > > the prepare/unprepare calls.
> > > > 
> > > > Woahh, that's not what I meant. gpio_to_irq should stay. Getting rid of
> > > > it
> > > > would
> > > > be a mess and it is a useful call.
> > > > 
> > > > The gpio_irq_prepare is meant so that the consumer can tell the gpio
> > > > driver
> > > > it
> > > > will want to get irq from a particular gpio at some point.
> > > > 
> > > > IOW, it's the consumer saying to the gpio driver "please do whatever you
> > > > need to
> > > > do, if anything, so this gpio can generate an interrupt"
> > > > 
> > > > This is a much simpler change. Using devm, all we need is to put a
> > > > devm_gpio_irq_prepare(<gpio_num>) in the probe of the drivers using
> > > > gpio_to_irq.
> > > > 
> > > > Mandating call to gpio_irq_prepare before any call to gpio_to_irq will
> > > > be
> > > > fairly
> > > > easy.
> > > 
> > > So why can't we just return the IRQ from prepare() and be done with it
> > 
> > We can return it here as well, it's actually a good idea. New drivers could
> > just
> > use that one if they are keeping track of the irq number.
> > 
> > > instead of having two calls? (Plus a third eventual unprepare()).
> > > 
> > > Clocks, regulators and godknowswhat is managed by two symmetrical
> > > calls, so why shouldn't GPIO IRQs be?
> > 
> > The approach is exactly the same as what we trying to follow in the irq
> > framework:
> > 
> > framework     | irq                 | gpio
> > -----------------------------------------------------
> > index         | hwirq               | gpio_num
> > creation      | irq_create_mapping  | gpio_irq_prepare   ?
> > removal       | irq_dispose_mapping | gpio_irq_unprepare ?
> > (fast) lookup | irq_find_mapping    | gpio_to_irq
> > 
> > We are going to have at lookup function somehow, why not expose it ?
> > 
> > Another reason for keeping gpio_to_irq is that many existing drivers using
> > the
> > callback don't keep track of their irq number, just the gpio. For every irq
> > operation, they call gpio_to_irq. Things like this:
> > 
> > * irq_enable(gpio_to_irq(<gpio_num>))
> > * irq_release(gpio_to_irq(<gpio_num>))
> > * etc ...
> > 
> > It's a bit lazy maybe, but I don't think there is anything utterly wrong
> > with
> > it.
> > 
> > Getting rid of gpio_to_irq would mean reworking all those drivers so they
> > keep
> > track of their irq number. I think this would be a mess for a very little
> > gain.
> > 
> > Also, except for the 26 gpio drivers I have listed, the rest should already
> > be
> > implementing what qualify as a "lookup" function in gpio_to_irq. I don't
> > think
> > we should by modifying every single gpio driver when there is a solution to
> > 'surgically' address the matter.
> > 
> > The series would already affect a significant amount of drivers, I'm trying
> > to
> > keep it as simple an contained as possible.
> > 
> > If that is OK with you, I could send an RFC implementing the idea but fixing
> > only 1 gpio driver and 2 or 3 consumer. We would have actual code to discuss
> > on,
> > it might be easier.
> > 
> 
> I'd like to add my 5 cents here :)
> 1) "To create the mapping in the gpio_to_irq. Linus, you pointed out that this
> is not
>  allowed as gpio_to_irq is callable in irq context, therefore it should not
> sleep.
>  Actually 3 drivers [2] are calling gpio_to_irq in irq handlers."
> 
> It's not allowed to call gpio_to_irq() from IRQ handlers, as mappings should
> already exist at
> that time and It might require to do sleepable calls to crate IRQ mappings and
> configure HW. 
> 
> Drivers, pointed out in first e-mail, should use other APIs in their IRQ
> handlers:
> drivers/gpio/gpio-ep93xx.c 
> ^ direct call to ep93xx_gpio_to_irq()
> * drivers/gpio/gpio-pxa.c
>  ^ use irq_find_mapping()
> * drivers/gpio/gpio-tegra.c
>  ^ use irq_find_mapping()
> 
> Also note, IRQ mappings can be created as dynamically (each
> time  gpio_to_irq() is called)

Not according to a previous reply from Linus. Right or wrong, it would have made
my life a lot easier if it was OK :)

>  as
> statically (in probe). The last approach is widely used in gpio drivers due to
> compatibility and
> legacy reasons.

Agreed this is the current situation.

> 
> 2) As per above I do not really understand why gpio_irq_prepare() is required.

I'd like to point you the thread which initially triggered this rfc:
https://patchwork.ozlabs.org/patch/684208/

At the time Linus strongly rejected the idea of calling  irq_create_mapping (or
any sleeping functions) in gpio_to_irq: please see the reply from Oct 26, 2016
(sorry for quoting such an old discussion but this is really the starting point)

* Me: There is really a *lot* of gpio drivers which use irq_create_mapping in
the to_irq callback, are these all wrong ?
* Linus: Yes they are all wrong. They should all be using irq_find_mapping().

* Me: If this should not be used, what should we all do instead ?
* Linus: Call irq_create_mapping() in some other place.

gpio_prepare_irq is a proposition for this 'other place'.

> 
> 3) As per problem description irq_dispose_mapping() equivalent for GPIO IRQs
> might be required,
> but what is the real use-case? Modules reloading or unloading one module and
> loading another instead?
> Usually GPIO and IRQ configuration is static and defined in DT, so IRQ mapping
> created by first call to
> gpio_to_irq()/platform_get_irq()/of_irq_get() and any subsequent calls just
> re-use already created mapping.

Providing that you always create mapping for the same pins, yes
What happens when gpio irq (the pin) is different each time ? and you exhaust
the ressource ?

It is a corner case, but possible isn't it ? With the gpio char driver
interface  maybe. You would have to reboot to flush the old mappings and
continue, right ? 

You could also fail to set the trigger type (which you won't be able to set in
gpio_to_irq). If so, shouldn't you release the mapping ? (that's real use-case
we are having by the way).

Cheers
Jerome
