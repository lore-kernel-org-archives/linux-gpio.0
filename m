From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Subject: Re: [RFC PATCH 3/3] gpio: mb86s70: enable ACPI and irqchip support
Date: Thu, 25 Apr 2019 15:35:45 +0200
Message-ID: <CAKv+Gu9+NqrtOrdkxcwPz63EW9gGnHLADTR9K2EPRsm0nHOS4g@mail.gmail.com>
References: <20190425102020.21533-1-ard.biesheuvel@linaro.org>
 <20190425102020.21533-4-ard.biesheuvel@linaro.org>
 <CACRpkdacwYder5e0ik2T32heSBQhKvmbem8XMpUF0iShsw3D3w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CACRpkdacwYder5e0ik2T32heSBQhKvmbem8XMpUF0iShsw3D3w@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Graeme Gregory <graeme.gregory@linaro.org>, Marc Zyngier <marc.zyngier@arm.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Masahisa Kojima <masahisa.kojima@linaro.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>
List-Id: linux-gpio@vger.kernel.org

On Thu, 25 Apr 2019 at 15:24, Linus Walleij <linus.walleij@linaro.org> wrote:
>
> Hi Ard, thanks for your patch!
>
> Including Mika here as well, he knows how ACPI is supposed to
> be wired up with GPIOs.
>
> On Thu, Apr 25, 2019 at 12:20 PM Ard Biesheuvel
> <ard.biesheuvel@linaro.org> wrote:
>
> > In order to support this GPIO block in combination with an EXIU
> > interrupt controller on ACPI systems such as Socionext SynQuacer,
> > add the enumeration boilerplate, and add the EXIU irqchip handling
> > to the probe path. Also, make the clock handling conditonal on
> > non-ACPI enumeration, since ACPI handles this internally.
> >
> > Signed-off-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>
> (...)
>
> > +config GPIO_MB86S7X_ACPI
> > +       def_bool y
> > +       depends on ACPI && ARCH_SYNQUACER
>
> I would say
>
> depends on ACPI
> depends on (ARCH_SYNQUACER || COMPILE_TEST)
>
> so we get some compiler coverage.
>
> > +#include <linux/acpi.h>
> >  #include <linux/io.h>
> >  #include <linux/init.h>
> >  #include <linux/clk.h>
> > @@ -27,6 +28,8 @@
> >  #include <linux/spinlock.h>
> >  #include <linux/slab.h>
> >
> > +#include "gpiolib.h"
>
> Normally not a good sign to dereference gpiolib internals,
> but there are some few exceptions. Why do you do this?
>

I needed this for acpi_gpiochip_request_interrupts() et al

> > +int exiu_acpi_init(struct platform_device *pdev, struct gpio_chip *gc);
>
> Just merge it all into one file instead of having these crisscrossy calls.
> I prefer some minor #ifdef or straight C if (IS_ENABLED()) around
> specific code.
>

Fair enough, but please see below.

> > -       return ret;
> > +       if (mb86s70_gpio_have_acpi(pdev))
> > +               acpi_gpiochip_request_interrupts(&gchip->gc);
> > +
> > +       return 0;
>
> I guess this is right...
>
> >         struct mb86s70_gpio_chip *gchip = platform_get_drvdata(pdev);
> >
> > +       if (gchip->gc.irq.domain) {
> > +               acpi_gpiochip_free_interrupts(&gchip->gc);
> > +               irq_domain_remove(gchip->gc.irq.domain);
> > +       }
>
> Mika can possibly comment on the right way to do ACPI bring-up
> and take-down.
>
> Overall it looks pretty straightforward to me, but I'd prefer to just
> merge the irqchip driver over into the gpio driver, I can't see why
> not.
>
> Or is the irqchip used without the GPIO driver sometimes?
>

This is where it becomes a bit nasty: the GPIO controller and the EXIU
interrupt controller are two separate IP blocks, but they are
obviously complimentary. *However*, on SynQuacer, the first 4 physical
lines are not shared between the two, and so you could have 4
interrupt lines handled through the EXIU and 4 different GPIO lines
through the GPIO unit.

On DT, we don't care since we model them as two different units. On
ACPI, however, we cannot model interrupt controllers in the same way,
and so I decided to merge them.

Perhaps the solution is to model the EXIU as a pseudo-GPIO block that
only supports interrupts and not ordinary GPIO?
