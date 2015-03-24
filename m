From: Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>
Subject: Re: [PATCH] IIO: Adds ACPI support for ST gyroscopes
Date: Tue, 24 Mar 2015 16:22:16 +0100
Message-ID: <55118128.10402@metafoo.de>
References: <1427118025-4380-1-git-send-email-robert.dolca@intel.com> <551155C3.2030403@metafoo.de> <CAFPB+YdwrPoob1CPdUfSt2uBJWPi=6_0-d0NChj2agD6-z-8qw@mail.gmail.com> <551168F0.1090901@metafoo.de> <CACRpkdaOQ-onkgQJSyoVEQNtkZ9nF_4z=9jNdU-tug-TwvAAkQ@mail.gmail.com> <20150324150630.GP1878@lahna.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150324150630.GP1878-3PARRvDOhMZrdx17CPfAsdBPR1lH4CV8@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mika Westerberg <mika.westerberg-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Robert Dolca <robert.dolca-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Robert Dolca <robert.dolca-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Peter Meerwald <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, Denis CIOCCA <denis.ciocca-qxv4g6HH51o@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-gpio@vger.kernel.org

Add Alexandre and linux-gpio to Cc.

On 03/24/2015 04:06 PM, Mika Westerberg wrote:
> On Tue, Mar 24, 2015 at 02:57:49PM +0100, Linus Walleij wrote:
>> On Tue, Mar 24, 2015 at 2:38 PM, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org> wrote:
>>> On 03/24/2015 02:26 PM, Robert Dolca wrote:
>>>> On Tue, Mar 24, 2015 at 2:17 PM, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>
>>>> wrote:
>>
>>>> In the ACPI description you specify one or more IRQ GPIO pins. In the
>>>> driver you request the GPIO pin using the index. In the ACPI 5.1
>>>> specification you can use named GPIOs instead of index.
>>>
>>>
>>> But is there a way to distinguish between IRQ GPIOs and non IRQ GPIOs? If it
>>> is clear that a certain GPIO is the IRQ for the device the I2C framework
>>> should take care of assigning the client->irq field, instead of doing it
>>> manually in each and every device driver.
>>
>> In the device tree case we have a mechanism where each
>> GPIO chip implements two API:s, one gpio_chip API and
>> one irqchip API.
>>
>> Then in the tree both the GPIO and IRQs can be assigned as
>> resources to clients, orthogonally. Usually this will only work
>> if there is a 1-to-1 correspondence between the GPIO lines
>> and available IRQ line triggers on the GPIO chip, but that is
>> indeed the most common. They will then usually also have
>> the same line offset numbers. In some odd cases I guess it
>> won't work this way.
>>
>> The I2C subsystem does this for the device tree case in
>> i2c_device_probe() like this:
>>
>>   if (!client->irq && dev->of_node) {
>>                  int irq = of_irq_get(dev->of_node, 0);
>>
>>                  if (irq == -EPROBE_DEFER)
>>                          return irq;
>>                  if (irq < 0)
>>                          irq = 0;
>>
>>                  client->irq = irq;
>>          }
>>
>> This is why the code does not contain any OF/DT
>> IRQ assignment code.
>>
>> However in the ACPI probe path I guess it doesn't
>> happen then?
>
> In ACPI we have two kind of GPIOs: GpioIo and GpioInt. The latter is
> used to describe GPIOs that can be used as interrupts.
>
> In order to translate a GpioInt to an interrupt number we would need to
> request the GPIO first here (in the I2C core), call gpiod_to_irq() to it
> and assign that to the client->irq.

Maybe the API can be extended to support to translate a GPIO to a IRQ 
without actually requesting the GPIO first.

>
> This has few problems that I have not yet figured out. Maybe someone
> here can suggest what to do:
>
>   1) Who is responsible in releasing the GPIO?
>   2) What if the driver wants to use that pin as a GPIO instead? The GPIO
>      is already requested by the I2C core.
>   3) We may have multiple GpioInts for devices like GPIO button array.
>      Which one we should pick, or should we let the driver to handle this
>      separetely?

Well, we have the same issue with devicetree already. I'd say use the first 
IRQ for client->irq and ignore the other ones for now.

>
> I recently did similar change to drivers/hid/i2c-hid/i2c-hid.c and would
> be happy if we can get this factored to some generic code.
>
