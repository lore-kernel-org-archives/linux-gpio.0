From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: winbond: add driver
Date: Wed, 20 Dec 2017 13:06:30 +0100
Message-ID: <CACRpkdbOdKJnSookBnnrSzhgM8zACEXG0CEa-C1tmXCsJcxhfg@mail.gmail.com>
References: <f105bdb7-9b29-517f-1fb6-935ee9e2045c@maciej.szmigiero.name>
 <CACRpkdZAmUtPrh0Ku+vHbY-gYsCr4+3ORYuygtOaC6X0FNPVYA@mail.gmail.com> <73983ef2-ab7e-cc31-042e-d7831bb6fee0@maciej.szmigiero.name>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <73983ef2-ab7e-cc31-042e-d7831bb6fee0@maciej.szmigiero.name>
Sender: linux-kernel-owner@vger.kernel.org
To: "Maciej S. Szmigiero" <mail@maciej.szmigiero.name>
Cc: William Breathitt Gray <vilhelm.gray@gmail.com>, linux-kernel <linux-kernel@vger.kernel.org>, linux-gpio@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

On Tue, Dec 19, 2017 at 12:07 AM, Maciej S. Szmigiero
<mail@maciej.szmigiero.name> wrote:
> On 18.12.2017 22:22, Linus Walleij wrote:

>>> +static struct gpio_chip winbond_gpio_chip = {
>>> +       .label                  = WB_GPIO_DRIVER_NAME,
>>> +       .owner                  = THIS_MODULE,
>>> +       .can_sleep              = true,
>>
>> Why can this ioport driver sleep?
>
> This driver shares a I/O port with other drivers accessing a Super I/O
> chip via request_muxed_region().
> This function can sleep.

OK

>>> +static void winbond_gpio_warn_conflict(unsigned int idx, const char *otherdev)
>>> +{
>>> +       pr_warn(WB_GPIO_DRIVER_NAME
>>> +               ": enabled GPIO%u share pins with active %s\n", idx + 1,
>>> +               otherdev);
>>> +}
>>
>> I don't understand this otherdev business, is it pin multiplexing?
>
> Yes, some GPIO pins are shared with some other devices and functions.
>
> But this is a x86 Super I/O chip so we don't really have a general
> ability to detect which should be configured how (and a BIOS might not
> have configured pins that it didn't care about correctly).

I see. That is unfortunate, users having to provide module parameters
for this is just so 1990ies, not your fault.

I'm just wondering if there is something, anything you can grab onto
to detect the type of system you're running on and configure accordingly.
Like SMBIOS magic. Or subsystem type on the PCI devices. It's
scary to have to insert by hand.

Am I guessing right when assuming this is not really a slot-in card
but more a, say, internal bridge om some misc machines?

I'm just thinking that somewhere on this machine there must be some
entity that knows what we're running on.

> So the only practical way is to have an user tell us which GPIO devices
> he wants to use and then enable only these (maybe stealing pins from
> other devices).

That is fine, it's the system as a whole that counts.

Maybe I misunderstand the usecase: is this an off-the-shelf product
support thing (like, to get LEDs on the case of a laptop or read magic
switches on a workstation or so) or is it intended for random hacking and
special-purpose machines?

>>> +       else
>>> +               pr_notice(WB_GPIO_DRIVER_NAME ": GPIO%u pins are %s\n", idx + 1,
>>> +                         winbond_sio_reg_btest(base, output_reg,
>>> +                                               output_pp_bit) ?
>>> +                         "push-pull" :
>>> +                         "open drain");
>>
>> If your hardware supports open drain then implement .set_config() for
>> it in the gpio_chip so you can use the hardware open drain with the driver.
>
> The problem here is that the device doesn't support per-pin
> output driver configuration, only per-GPIO device (8 pins)
> configuration.

Hm. That is well supported by pin control while GPIO does not support
it since it is line-oriented. Pin control on the other hand, supports
group-wise multiplexing and config.

I don't know how much you looked into pin control. It might be a bit
heavy for an ISA-type device as this appears to be.

>> winbond_gpio_configure_uartb()?
>
> UARTB is a device that the first GPIO device conflicts with.
> Should it give a name to this GPIO device configuration function?
>
> Datasheet calls this device just "GPIO1" (the driver uses zero-based
> index internally, however).

Hm I don't know really. Up to you, at least it should be evident
from code and comments what is going on.

>> winbond_gpio_configure_i2cgpio()?
>
> Same issue, should a fact that I2C conflicts with two pins of this GPIO
> device give its configuration function a "I2C" name?

I see. Well whatever makes most sense I guess.

>> So figure out some way to not have 6 similar functions but parameterize
>> the functions somehow with some struct or so?
>
> Please note that all these 6 functions share only 3 lines of a
> boilerplate code:
>>> +       if (!(gpios & BIT(x)))
>>> +               return;
>
> and:
>>> +       winbond_gpio_configure_common(base, x, WB_SIO_DEV_FOO,
>>> +                                     WB_SIO_BAR,
>>> +                                     WB_SIO_XXX,
>>> +                                     WB_SIO_YYY,
>>> +                                     WB_SIO_ZZZ);
>
> (Okay, that's technically a more than one line, but only due to line
> wrapping).


You might not see the forest because a lot of trees standing in your way :)

I mean a deeper type of table:

struct winbond_gpio_port {
    const char *conflicts;
    u8 selector;
    u8 testreg;
    u8 testval;
    ...
};

static const struct winbond_gpio_port ports[] = {
    {
        .conflicts = "UARTB",
        .selector = WB_SIO_DEV_UARTB,
        .testreg = WB_SIO_UARTB_REG_ENABLE,
        .testval = WB_SIO_UARTB_ENABLE_ON,
        ...
    },
};

(...)
for (i = 0; i < ARRAY_SIZE(ports); i++) {
   struct winbond_gpio_port *port = &ports[i];

   winbond_sio_select_logical(bas, port->selector);
   if (winbond_sio_reg_btest(bas, port->testreg, port->testval))
      winbond_gpio_warn_conflict(i, port->conflicts);
};

Just follow this pattern and also include the registers and values etc
for winbond_gpio_config_common() etc and I am pretty sure you can
cut it down to a neat table.

> Rest of the code is unique for a particular GPIO device and
> the code common for all these devices is already in
> winbond_gpio_configure_common().
>
> Naturally, it can be made into a one, parametrized function, but at a
> cost of adding a few additional "if" blocks inside - won't that make it
> less readable than separate ones?

I'm not sure you see the option of encoding all magic values and register
offsets into the table?

>>> +module_param(gpios, byte, 0444);
>>> +MODULE_PARM_DESC(gpios,
>>> +                "bitmask of GPIO ports to enable (bit 0 - GPIO1, bit 1 - GPIO2, etc.");
>>> +
>
> This sets which GPIO devices (ports) we enable.
>
>>> +module_param(ppgpios, byte, 0444);
>>> +MODULE_PARM_DESC(ppgpios,
>>> +                "bitmask of GPIO ports to set to push-pull mode (bit 0 - GPIO1, bit 1 - GPIO2, etc.");
>>> +
>>> +module_param(odgpios, byte, 0444);
>>> +MODULE_PARM_DESC(odgpios,
>>> +                "bitmask of GPIO ports to set to open drain mode (bit 0 - GPIO1, bit 1 - GPIO2, etc.");
>
> These two above configure which GPIO devices (ports) we enable.
> It can't be a one bitmask since we need three values per port: push-pull,
> open-drain and keep as-is.
>
>>> +module_param(pledgpio, bool, 0644);
>>> +MODULE_PARM_DESC(pledgpio,
>>> +                "enable changing value of GPIO2.0 bit (Power LED), default no.");
>>> +
>>> +module_param(beepgpio, bool, 0644);
>>> +MODULE_PARM_DESC(beepgpio,
>>> +                "enable changing value of GPIO2.1 bit (BEEP), default no.");
>
> These two control a basic PC functionality that I don't think we should
> allow tinkering with by default (it is very likely that the firmware
> owns these pins).

At least all the text above should be comments in the code so it is
crystal clear how to use the parameters for anyone daring enough?

But it falls back to the question of autodetect, naturally. This set of
parameters is OK if hacking around like this is necessary.

Yours,
Linus Walleij
