From: Rajat Jain <rajatja@google.com>
Subject: Re: pinctrl-icelake: driver writes to wrong offsets?
Date: Mon, 17 Sep 2018 11:16:41 -0700
Message-ID: <CACK8Z6EpPCCGWRZX_FEewyoySLjBUUKDPzKZof4LvvKatU_NLg@mail.gmail.com>
References: <CACK8Z6ECjwWqDnaXKrmEbEXzmiX41Sbzys=FSCqMwh8eYLPH9A@mail.gmail.com>
 <20180917081249.GM14465@lahna.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180917081249.GM14465@lahna.fi.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, casey.g.bowman@intel.com, "Atwood, Matthew S" <matthew.s.atwood@intel.com>
List-Id: linux-gpio@vger.kernel.org

On Mon, Sep 17, 2018 at 1:13 AM Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
>
> On Fri, Sep 14, 2018 at 05:18:34PM -0700, Rajat Jain wrote:
> > This is to report what I think is a problem in the pinctrl-icelake
> > driver. It seems that when trying to control GPIO pins GPP_A* and
> > GPIO_B*, the driver ends up writing to incorrect PADCFG registers.
> > I've reached this conclusion by putting debug prints in the driver,
> > although this can be seen by the following commands too. Please let me
> > know if something is wrong in my experiments. For example, when trying
> > to control GPP_B8/ISH_I2C1_SCL, the driver ends up writing to
> > GPP_A6/ESPI_RESETB registers.
>
> Hmm, when you add debug prints to the driver and you access GPIO 224
> (GPP_B8/ISH_I2C1_SCL) from userspace you can see that the driver
> actually uses PADCFG registers of GPP_A6/ESPI_RESETB? So that it is not
> just a side-effect of how the pins are wired on your board.

Right, also I don't have to use put debug prints as it can be seen
from the following debug files. And it is not isolated to just this
pin. For instance, in this examples you can see that another pin 18
(GPP_B10/I2C5_SCL) that I'm trying to write , the value actually gets
written to the PADCFG for (GPP_A8/I2S2_SFRM) i.e. pin42. So there is
clearly a pattern:

static const struct pinctrl_pin_desc icllp_pins[] = {
 ...
        /* GPP_B */
..
        PINCTRL_PIN(18, "I2C5_SCL"),  <----- GPP_B10/I2C5_SCL = Pin 18
....
localhost /sys/class/gpio # cat
/sys/kernel/debug/pinctrl/INT3455\:00/gpio-ranges
GPIO ranges handled:
0: INT3455:00 GPIOS [184 - 191] PINS [0 - 7]
32: INT3455:00 GPIOS [216 - 241] PINS [8 - 33]  <---- pin 18 = gpio 226
....

localhost /sys/class/gpio # cat
/sys/kernel/debug/pinctrl/INT3455\:00/pins | grep
"I2C5_SCL\|(I2S2_SFRM)"
pin 18 (I2C5_SCL) mode 1 0x44000702 0x0000002a 0x00000000 [ACPI]
pin 42 (I2S2_SFRM) mode 2 0x44000b00 0x00000040 0x00000100 [ACPI]
localhost /sys/class/gpio #
localhost /sys/class/gpio # echo 226 > export
localhost /sys/class/gpio # cat
/sys/kernel/debug/pinctrl/INT3455\:00/pins | grep
"I2C5_SCL\|(I2S2_SFRM)"
pin 18 (I2C5_SCL) GPIO 0x44000102 0x0000002a 0x00000000 [ACPI]
pin 42 (I2S2_SFRM) mode 2 0x44000b00 0x00000040 0x00000100 [ACPI]
localhost /sys/class/gpio #
localhost /sys/class/gpio #
localhost /sys/class/gpio # cat gpio226/value
0
localhost /sys/class/gpio # cat gpio226/direction
in
localhost /sys/class/gpio # echo out > gpio226/direction
localhost /sys/class/gpio # cat gpio226/direction
out
localhost /sys/class/gpio # cat
/sys/kernel/debug/pinctrl/INT3455\:00/pins | grep
"I2C5_SCL\|(I2S2_SFRM)"
pin 18 (I2C5_SCL) GPIO 0x44000200 0x0000002a 0x00000000 [ACPI]
pin 42 (I2S2_SFRM) mode 2 0x44000b00 0x00000040 0x00000100 [ACPI]
localhost /sys/class/gpio #
localhost /sys/class/gpio #
localhost /sys/class/gpio # cat gpio226/value
0
localhost /sys/class/gpio # echo 1 > gpio226/value
localhost /sys/class/gpio # cat gpio226/value
0
localhost /sys/class/gpio # cat
/sys/kernel/debug/pinctrl/INT3455\:00/pins | grep
"I2C5_SCL\|(I2S2_SFRM)"
pin 18 (I2C5_SCL) GPIO 0x44000200 0x0000002a 0x00000000 [ACPI]
pin 42 (I2S2_SFRM) mode 2 0x44000b01 0x00000040 0x00000100 [ACPI]
localhost /sys/class/gpio #

As you can see in the above example, when I export the pins and change
the directions from "in" to "out" PADCFG get updated correctly for pin
18, but when writing the value, it is the PADCFG for pin 42 that gets
updated which is incorrect.

So this looks like a driver issue to me. Please let me know if I need
to file a bug on bugzilla for this.

Thanks,

Rajat
