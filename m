From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v3] gpio: add Intel WhiskeyCove GPIO driver
Date: Wed, 22 Jun 2016 11:27:06 +0300
Message-ID: <CAHp75VfynZr_4TvFBsy3zN0NZVbctTgz0rxp2YATGLjFw8=Vyw@mail.gmail.com>
References: <20160620180214.GA38668@worksta> <CAHp75VfGpfeBXJG_SN_nyu22Ex8WbABve1qZ+b6pOQimz5N2rA@mail.gmail.com>
 <20160621185446.GA83592@worksta>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160621185446.GA83592@worksta>
Sender: linux-kernel-owner@vger.kernel.org
To: Bin Gao <bin.gao@linux.intel.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>, Mathias Nyman <mathias.nyman@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Ajay Thomas <ajay.thomas.david.rajamanickam@intel.com>, Yegnesh S Iyer <yegnesh.s.iyer@intel.com>, Bin Gao <bin.gao@intel.com>
List-Id: linux-gpio@vger.kernel.org

On Tue, Jun 21, 2016 at 9:54 PM, Bin Gao <bin.gao@linux.intel.com> wrote:
> On Tue, Jun 21, 2016 at 02:19:57AM +0300, Andy Shevchenko wrote:

>> > +       help
>> > +         Support for GPIO pins on Whiskey Cove PMIC.
>> > +
>> > +         Say Yes if you have a Intel SoC based tablet with Whiskey Cove PMIC
>>
>> What if I have not a tablet with WC PMIC inside?
>
> This driver is for the GPIO controller in the WC PMIC. If there is no WC PMIC,
> this driver shouldn't be compiled.
> You question is more like:
> If a device doesn't exist, what will its driver do?

My comment regarding to 'tablet' word used wrongly in my opinion.

>> > +#include <linux/seq_file.h>
>> > +#include <linux/bitops.h>
>> > +#include <linux/regmap.h>
>> > +#include <linux/interrupt.h>
>> > +#include <linux/platform_device.h>
>> > +#include <linux/gpio/driver.h>
>> > +#include <linux/mfd/intel_soc_pmic.h>
>>
>> Alphabetical order?
>
> I checked Documentation/CodingStyle but didn't find any alphabetical order
> description. Is this newly enforced?

Not enforced, but it allows you not to duplicate headers and easily
find one in the list.

>
>> > +#define GROUP0_NR_IRQS         7
>> > +#define GROUP1_NR_IRQS         6
>> > +#define IRQ_MASK_BASE          0x4e19
>> > +#define IRQ_STATUS_BASE                0x4e0b
>>
>> Can you define all your bases as a) offsets by value, and b) with
>> _OFFSET suffix instead of _BASE, though second one is up to you.
>
> Strictly speaking, it's called "offset base". I'm really not sure
> it will be more readable to replace BASE with OFFSET here.

OK.

>> > +#define CTLI_INTCNT_DIS                (0)
>>
>> (0 << 1) or...
>>
>> > +#define CTLI_INTCNT_NE         (1 << 1)
>> > +#define CTLI_INTCNT_PE         (2 << 1)
>> > +#define CTLI_INTCNT_BE         (3 << 1)
>>
>> ...INTCNT(x)  ((x) << 1)
>> ...DIS 0
>> ...NE 1
>>
>> and so on.
>>
>> Same for all similar blocks of constants.
>
> Makes sense.

Please, choose variant that's more suitable and less verbose.

>> > +#define CTLO_DRV_MASK          (1 << 4)
>> > +#define CTLO_DRV_OD            (0)
>> > +#define CTLO_DRV_CMOS          CTLO_DRV_MASK
>> > +
>> > +#define CTLO_DRV_REN           (1 << 3)
>> > +
>> > +#define CTLO_RVAL_2KDW         (0)
>> > +#define CTLO_RVAL_2KUP         (1 << 1)
>> > +#define CTLO_RVAL_50KDW                (2 << 1)
>> > +#define CTLO_RVAL_50KUP                (3 << 1)
>>
>> Wait, are you sure that's is pure gpio and not a full pinctrl (pinconf) + gpio?
>
> No, we don't have pinctrl for this driver. Those bits are just for pure GPIO setting.

I noticed you are not using bias (yet?). For now I have no strong opinion.
I suppose Linus can share his thoughts.

>> > +static void wcove_bus_lock(struct irq_data *data)
>> > +{
>> > +       struct wcove_gpio *wg = gpiochip_get_data(
>> > +               irq_data_get_irq_chip_data(data));
>> > +
>> > +       mutex_lock(&wg->buslock);
>>
>> I suppose you have to add a hint to static analyzer here and below.
>
> I didn't quite get it. You meant to add some comments for these 2 functions?

One function takes lock, the other releases.
Is static analyzer happy with it?

>> > +}
>> > +
>> > +static void wcove_bus_sync_unlock(struct irq_data *data)
>> > +{
>> > +       struct wcove_gpio *wg = gpiochip_get_data(
>> > +               irq_data_get_irq_chip_data(data));

>> > +static struct platform_driver wcove_gpio_driver = {
>> > +       .driver = {
>> > +               .name = "bxt_wcove_gpio",
>>
>> No PM?
>
> Right, no PM for this driver.

Perhaps couple of words in the commit message that the WC GPIO IP is
a) power gated automaticaly, or b) AON, or c) actual case.

-- 
With Best Regards,
Andy Shevchenko
