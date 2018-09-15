From: Rajat Jain <rajatja@google.com>
Subject: pinctrl-icelake: driver writes to wrong offsets?
Date: Fri, 14 Sep 2018 17:18:34 -0700
Message-ID: <CACK8Z6ECjwWqDnaXKrmEbEXzmiX41Sbzys=FSCqMwh8eYLPH9A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Cc: casey.g.bowman@intel.com, "Atwood, Matthew S" <matthew.s.atwood@intel.com>
List-Id: linux-gpio@vger.kernel.org

Hi,

This is to report what I think is a problem in the pinctrl-icelake
driver. It seems that when trying to control GPIO pins GPP_A* and
GPIO_B*, the driver ends up writing to incorrect PADCFG registers.
I've reached this conclusion by putting debug prints in the driver,
although this can be seen by the following commands too. Please let me
know if something is wrong in my experiments. For example, when trying
to control GPP_B8/ISH_I2C1_SCL, the driver ends up writing to
GPP_A6/ESPI_RESETB registers.

I want to control the pin GPP_B8 i.e. ISH_I2C1_SCL and drive it low or
high. I looked at the driver code, and it tells me that I need to use
pin number 16:

static const struct pinctrl_pin_desc icllp_pins[] = {
       ....
        /* GPP_B */
       ....
        PINCTRL_PIN(16, "ISH_I2C1_SCL"),
       .....

The pin number 16 is mapped to GPIO 224 as per the below output:

localhost /sys/class/gpio # cat
/sys/kernel/debug/pinctrl/INT3455\:00/gpio-ranges
GPIO ranges handled:
0: INT3455:00 GPIOS [184 - 191] PINS [0 - 7]
32: INT3455:00 GPIOS [216 - 241] PINS [8 - 33]
64: INT3455:00 GPIOS [248 - 272] PINS [34 - 58]
96: INT3455:00 GPIOS [280 - 303] PINS [59 - 82]
128: INT3455:00 GPIOS [312 - 332] PINS [83 - 103]
160: INT3455:00 GPIOS [344 - 363] PINS [104 - 123]
192: INT3455:00 GPIOS [376 - 404] PINS [124 - 152]
224: INT3455:00 GPIOS [408 - 431] PINS [153 - 176]
256: INT3455:00 GPIOS [440 - 463] PINS [183 - 206]
288: INT3455:00 GPIOS [472 - 479] PINS [216 - 223]
320: INT3455:00 GPIOS [504 - 511] PINS [224 - 231]
localhost /sys/class/gpio #

So I did this:

localhost /sys/class/gpio # ls
export  gpiochip184  unexport
localhost /sys/class/gpio # cat gpiochip184/label
INT3455:00
localhost /sys/class/gpio # cat gpiochip184/ngpio
328
localhost /sys/class/gpio # echo 224 > export
localhost /sys/class/gpio # ls
export  gpio224  gpiochip184  unexport
localhost /sys/class/gpio #

Before trying to change the value, I decided to take a dump of the
PADCFG of the pins before and after I tried to change it. Here is the
dump I took before changing:

localhost /sys/class/gpio # cat gpio224/active_low
0
localhost /sys/class/gpio # cat gpio224/direction
in
localhost /sys/class/gpio # cat gpio224/edge
none
localhost /sys/class/gpio # cat gpio224/value
0
localhost /sys/class/gpio #
localhost /sys/class/gpio # cat
/sys/kernel/debug/pinctrl/INT3455\:00/pins | grep
"ISH_I2C1_SCL\|ESPI_RESETB"
pin 16 (ISH_I2C1_SCL) GPIO 0x44000102 0x00000028 0x00000000 [ACPI]
pin 40 (ESPI_RESETB) mode 1 0x44000700 0x0000003e 0x00000100 [ACPI]
localhost /sys/class/gpio #

Here is when I tried to change it and then dump the values again:

localhost /sys/class/gpio # echo out > gpio224/direction
localhost /sys/class/gpio # cat
/sys/kernel/debug/pinctrl/INT3455\:00/pins | grep
"ISH_I2C1_SCL\|ESPI_RESETB"
pin 16 (ISH_I2C1_SCL) GPIO 0x44000200 0x00000028 0x00000000 [ACPI]
pin 40 (ESPI_RESETB) mode 1 0x44000700 0x0000003e 0x00000100 [ACPI]
localhost /sys/class/gpio #

Note that things look good so far (the PADCFG DW0 for pin 16 is
corrrectly changed).
But now when I try to write the value, it is the PADCFG DW0 for pin 40
that gets written to, while the pin16 value does not change:

localhost /sys/class/gpio #
localhost /sys/class/gpio # echo 1 > gpio224/value
localhost /sys/class/gpio # cat
/sys/kernel/debug/pinctrl/INT3455\:00/pins | grep
"ISH_I2C1_SCL\|ESPI_RESETB"
pin 16 (ISH_I2C1_SCL) GPIO 0x44000200 0x00000028 0x00000000 [ACPI]
pin 40 (ESPI_RESETB) mode 1 0x44000701 0x0000003e 0x00000100 [ACPI]
localhost /sys/class/gpio #
localhost /sys/class/gpio #
localhost /sys/class/gpio # echo 0 > gpio224/value
localhost /sys/class/gpio # cat
/sys/kernel/debug/pinctrl/INT3455\:00/pins | grep
"ISH_I2C1_SCL\|ESPI_RESETB"
pin 16 (ISH_I2C1_SCL) GPIO 0x44000200 0x00000028 0x00000000 [ACPI]
pin 40 (ESPI_RESETB) mode 1 0x44000700 0x0000003e 0x00000100 [ACPI]
localhost /sys/class/gpio #
localhost /sys/class/gpio # echo 1 > gpio224/value
localhost /sys/class/gpio # cat
/sys/kernel/debug/pinctrl/INT3455\:00/pins | grep
"ISH_I2C1_SCL\|ESPI_RESETB"
pin 16 (ISH_I2C1_SCL) GPIO 0x44000200 0x00000028 0x00000000 [ACPI]
pin 40 (ESPI_RESETB) mode 1 0x44000701 0x0000003e 0x00000100 [ACPI]
localhost /sys/class/gpio #
localhost /sys/class/gpio #

I have also verified this using an oscilloscope on the external pin
that the ISH_I2C1_SCL does not change. Also the gpio224/value stays
stuck at 0.

localhost /sys/class/gpio # cat gpio224/value
0
localhost /sys/class/gpio #

I failed to understand how could it be that the correct pin (16) is
picked up when setting direction but incorrect pin (40) is picked up
when setting value. I suspect some mux related call is being missed
out while setting the value, may be? Can you please check this at your
end?

Thanks,

Rajat
