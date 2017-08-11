From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] pinctrl: intel: Disable GPIO pin interrupts in suspend
Date: Fri, 11 Aug 2017 12:57:26 +0300
Message-ID: <CAHp75VeGHJ2+8EPqjKDg+K4F+VqxQ0K=aAeyQ-EaLDqHUcic6Q@mail.gmail.com>
References: <1502439824-18733-1-git-send-email-rushikesh.s.kadam@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1502439824-18733-1-git-send-email-rushikesh.s.kadam@intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rushikesh S Kadam <rushikesh.s.kadam@intel.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>, "Krogerus, Heikki" <heikki.krogerus@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>, Andy Shevchenko <andy@infradead.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>
List-Id: linux-gpio@vger.kernel.org

On Fri, Aug 11, 2017 at 11:23 AM, Rushikesh S Kadam
<rushikesh.s.kadam@intel.com> wrote:
> The fix prevents unintended wakes from second level GPIO pin interrupts.
>
> On some Intel Kabylake platforms, it is observed that GPIO pin interrupts
> can wake the platform from suspend-to-idle, even though the IRQ is not
> configured as IRQF_NO_SUSPEND or enable_irq_wake().
>
> This can cause undesired wakes on Mobile devices such as Laptops and
> Chromebook devices. For example a headset jack insertion is not a desired
> wake source on Chromebook devices.
>
> The pinctrl-intel (GPIO controller) driver implements a "Shared IRQ" model.
> All GPIO pin interrupts are OR'ed and mapped to a first level IRQ14 (or
> IRQ15). The driver registers an irq_chip struct and maps an irq_domain for
> the GPIO pin interrupts. The IRQ14 handler demuxes and calls the second
> level IRQ for the respective pin.
>
> In the suspend entry flow, at suspend_noirq stage, the kernel disables IRQs
> that are not marked for wake. The pinctrl-intel driver does not implement a
> irq_disable()  callback (to take advantage of lazy disabling). The
> pinctrl-intel GPIO interrupts are not disabled in hardware during suspend
> entry, and thus are able to wake the SoC out of suspend-to-idle.
>
> This patch sets the IRQCHIP_MASK_ON_SUSPEND flag for the GPIO irq_chip, to
> disable the second level interrupts at suspend_noirq stage via the irq_mask
> callbacks. The irq_mask callback disables the IRQs in hardware by
> programming the corresponding GPIO pad registers. Only IRQs that are not
> marked for wake are disabled.
>
> Signed-off-by: Rushikesh S Kadam <rushikesh.s.kadam@intel.com>

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> ---
>  drivers/pinctrl/intel/pinctrl-intel.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/pinctrl/intel/pinctrl-intel.c b/drivers/pinctrl/intel/pinctrl-intel.c
> index 6dc1096..8f87215 100644
> --- a/drivers/pinctrl/intel/pinctrl-intel.c
> +++ b/drivers/pinctrl/intel/pinctrl-intel.c
> @@ -1035,6 +1035,7 @@ static irqreturn_t intel_gpio_irq(int irq, void *data)
>         .irq_unmask = intel_gpio_irq_unmask,
>         .irq_set_type = intel_gpio_irq_type,
>         .irq_set_wake = intel_gpio_irq_wake,
> +       .flags = IRQCHIP_MASK_ON_SUSPEND,
>  };
>
>  static int intel_gpio_probe(struct intel_pinctrl *pctrl, int irq)
> --
> 1.9.1
>



-- 
With Best Regards,
Andy Shevchenko
