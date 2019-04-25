From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [RFC PATCH 2/3] irqchip/exiu: implement ACPI gpiolib/irqchip
 support
Date: Thu, 25 Apr 2019 15:14:48 +0200
Message-ID: <CACRpkdbTRi3U0rrcO=MJsTk9tBYhm7E5wyyqDaj-aiUy0JXgqw@mail.gmail.com>
References: <20190425102020.21533-1-ard.biesheuvel@linaro.org>
 <20190425102020.21533-3-ard.biesheuvel@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190425102020.21533-3-ard.biesheuvel@linaro.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Ard Biesheuvel <ard.biesheuvel@linaro.org>, Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Marc Zyngier <marc.zyngier@arm.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Graeme Gregory <graeme.gregory@linaro.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Masahisa Kojima <masahisa.kojima@linaro.org>
List-Id: linux-gpio@vger.kernel.org

Hi Ard!

Thanks for your patch!

As it involves ACPI I suggest to include Mika Westerberg on review since
he's doing the core gpiolib ACPI stuff.

On Thu, Apr 25, 2019 at 12:20 PM Ard Biesheuvel
<ard.biesheuvel@linaro.org> wrote:

> Expose the existing EXIU hierarchical irqchip domain code to permit
> the interrupt controller to be used as the irqchip component of a
> GPIO controller on ACPI systems.
>
> Signed-off-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>

(...)

> +#include <linux/gpio/driver.h>

So now this is starting to go from being a pure irqchip driver
to a combined irq+gpio driver.

> +       gc->irq.domain = domain;
> +       gc->to_irq = exiu_acpi_gpio_to_irq;

And there is some gpiochip involved.

> +EXPORT_SYMBOL(exiu_acpi_init);

Including exporting functions.

What about we just move this driver over to drivers/gpio and
start working out a combined GPIO+irqchip driver there? I am
working on adding generic hierarchical irqchip helpers in the
gpiolib core and then it's gonna be nice to have all combined
drivers under the drivers/gpio folder.

Yours,
Linus Walleij
