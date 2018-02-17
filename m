From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [RFC PATCH v1] pinctrl: meson: meson8b: fix requesting GPIOs
 greater than GPIOZ_3
Date: Sat, 17 Feb 2018 20:44:32 +0100
Message-ID: <CAFBinCC=Oo0BOvSzp59xriTse3ViLd24RiGNSF0uKEwHnrXj+g@mail.gmail.com>
References: <20180124002738.32338-1-martin.blumenstingl@googlemail.com>
 <1516782493.2344.48.camel@baylibre.com> <CAFBinCCBHcjMRJ5sd9qWnL3FDEcHxp96rahgcYmSS3q-af-9Pw@mail.gmail.com>
 <1516805576.2344.86.camel@baylibre.com> <CAFBinCAC8d=qEf-DSkp8bjwRJCwCjuHfhVO-9h+mY3zHEy0fcg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="001a113962d8d6d6b705656db132"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f194.google.com ([209.85.223.194]:34489 "EHLO
        mail-io0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751131AbeBQToy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 17 Feb 2018 14:44:54 -0500
Received: by mail-io0-f194.google.com with SMTP id e7so7534829ioj.1
        for <linux-gpio@vger.kernel.org>; Sat, 17 Feb 2018 11:44:53 -0800 (PST)
In-Reply-To: <CAFBinCAC8d=qEf-DSkp8bjwRJCwCjuHfhVO-9h+mY3zHEy0fcg@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: khilman@baylibre.com, linux-gpio@vger.kernel.org, linux-amlogic@lists.infradead.org, carlo@caione.org, linus.walleij@linaro.org, linus.luessing@c0d3.blue

--001a113962d8d6d6b705656db132
Content-Type: text/plain; charset="UTF-8"

Hi Jerome,

On Wed, Jan 24, 2018 at 6:54 PM, Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
> Hi Jerome,
>
> On Wed, Jan 24, 2018 at 3:52 PM, Jerome Brunet <jbrunet@baylibre.com> wrote:
>> On Wed, 2018-01-24 at 11:10 +0100, Martin Blumenstingl wrote:
>>> Hi Jerome,
>>>
>>> On Wed, Jan 24, 2018 at 9:28 AM, Jerome Brunet <jbrunet@baylibre.com> wrote:
>>> > On Wed, 2018-01-24 at 01:27 +0100, Martin Blumenstingl wrote:
>>> > > Meson8b is a cost reduced variant of the Meson8 SoC. It's package size
>>> > > is smaller than Meson8.
>>> > > Unfortunately there are a few key differences which cannot be seen
>>> > > without close inspection of the code and the public S805 data-sheet:
>>> > > - the GPIOX bank is missing the GPIOX_12, GPIOX_13, GPIOX_14 and
>>> > >   GPIOX_15 GPIOs
>>> > > - the GPIOY bank is missing the GPIOY_2, GPIOY_4, GPIOY_5, GPIOY_15 and
>>> > >   GPIOY_16 GPIOs
>>> > > - the GPIODV bank is missing all GPIOs except GPIODV_9, GPIODV_24,
>>> > >   GPIODV_25, GPIODV_26, GPIODV_27, GPIODV_28 and GPIODV_29
>>> > > - the GPIOZ bank is missing completely
>>> > > - there is a new GPIO bank called "DIF"
>>> > > - (all other pads exist on both, Meson8 and Meson8b)
>>> > >
>>> > > The pinctrl-meson driver internally uses struct meson_bank, which
>>> > > assumes that the GPIOs are continuous, without any holes in between.
>>> > > This also matches with how the registers work:
>>> > > - GPIOX_0 for example uses bit 0 for switching this pad between
>>> > >   input/output, configuring pull-up/down, etc.
>>> > > - GPIOX_16 uses bit 16 for switching this pad between input/output,
>>> > >   configuring pull-up/down/, etc
>>> > > GPIOX_16 uses bit 16 even though GPIOX12..15 don't exist. (This is
>>> > > probably the reason why Meson8b inherits the dt-bindings - with all GPIO
>>> > > IDs - from Meson8)
>>> > > This means that Meson8b only has 83 actual GPIO lines. Without any holes
>>> > > there would be 130 GPIO lines in total (120 are inherited from Meson8
>>> > > plus 10 new from the DIF bank).
>>> > >
>>> > > The pinctrl framework handles holes in the pin list fine, which can be
>>> > > seen in debugfs:
>>> > > $ cat /sys/kernel/debug/pinctrl/c1109880.pinctrl/pins
>>> > > pin 9 (GPIOX_9)  c1109880.pinctrl
>>> > > pin 10 (GPIOX_10)  c1109880.pinctrl
>>> > > pin 11 (GPIOX_11)  c1109880.pinctrl
>>> > > pin 16 (GPIOX_16)  c1109880.pinctrl
>>> > > pin 17 (GPIOX_17)  c1109880.pinctrl
>>> >
>>> > Hi Martin,
>>> >
>>> > While working on this controller a few weeks ago, I have seen that our current
>>> > design does not tolerate having holes in the declared PINS. This is something
>>> > that predate the changes mentioned here.
>>> >
>>> > I'm not a big fan of the this overrides_ngpio here, I'm sure it fixes your
>>> > problem but it seems a bit hacky, don't you think ?
>>>
>>> this is the reason why I sent it as RFC - I'm open to better solutions!
>>>
>>> > I would prefer either of these 2 approach:
>>> >
>>> > * Update the binding and kill the necessary pins. We are still figuring out
>>> > those chips, which is why the bindings are marked as un-stable. If sharing the
>>> > binding with meson8 was a mistake, now is the time to fix it.
>>>
>>> let's say we produce a header file which does not contain GPIOX_12:
>>> this would be nice since it gives compile errors if non-existent GPIOs
>>> are used (instead of failing only at run-time)
>>>
>>> however, the problem is meson8b_cbus_banks (annotated here to make it
>>> easier to read):
>>> BANK("X", /* name */
>>>           GPIOX_0, GPIOX_21, /* first and last GPIO */
>>>           97, 118, /* first and last IRQ */
>>>           4,  0, /* pull-up/down enable register and bit offset */
>>>           4,  0, /* pull-up/down configuration register and bit offset */
>>>           0,  0, /* input/output direction register and bit offset */
>>>           1,  0, /* output value register and bit offset */
>>>           2,  0), /* input value register and bit offset */
>>>
>>> let's say we want to configure GPIOX_0 as an input:
>>> - we need to find the "offset" of this pad within the bank -> 0
>>> - find the input/output direction register -> 0
>>> - find the bit in that register: bit 0 + pad offset 0 = 0
>>> - we clear bit 0 in register 0
>>>
>>> with the current code configuring GPIOX_16 as input works like this:
>>> - we need to find the "offset" of this pad within the bank -> 16
>>> - find the input/output direction register -> 0
>>> - find the bit in that register: bit 0 + pad offset 16 = 16
>>> - we clear bit 16 in register 0
>>
>> If offset calculation is really the problem, nothing is stopping you from the
>> splitting BANK in two. With your example of GPIOX_12...15 missing:
>>
>> BANK("X1", /* name */
>>            GPIOX_0, GPIOX_11, /* first and last GPIO */
>>            97, 108, /* first and last IRQ */
>>            4,  0, /* pull-up/down enable register and bit offset */
>>            4,  0, /* pull-up/down configuration register and bit offset */
>>            0,  0, /* input/output direction register and bit offset */
>>            1,  0, /* output value register and bit offset */
>>            2,  0), /* input value register and bit offset */
>>
>> BANK("X2", /* name */
>>            GPIOX_16, GPIOX_21, /* first and last GPIO */
>>            113, 118, /* first and last IRQ */
>>            X,  Y, /* pull-up/down enable register and bit offset */
>>            X,  Y, /* pull-up/down configuration register and bit offset */
>>            Z,  XX, /* input/output direction register and bit offset */
>>            FOO,  0, /* output value register and bit offset */
>>            BAR,  0), /* input value register and bit offset */
> nice thinking :)
> the only solution I could come up with was to change the MESON_PIN
> definition to something like:
> #define MESON_PIN(pad, pullen_bit, pull_bit, direction_bit,
> output_bit, input_bit, irq_num)
>
> that however means that we would have to change a lot of code in all
> pinctrl drivers
>
>>>
>>> let's assume that we removed GPIOX_12...15 from Meson8b
>>> GPIOX_16 could now have the same value that was assigned to GPIOX_12
>>> before (= 12)
>>> but how do we now know the offset of GPIOX_16?
>>> if we don't consider it in the calculation above we would end up
>>> writing to bit 12 (instead of bit 16).
>>>
>>> we could still cleanup the header file but leave the IDs of the
>>> existing GPIOs untouched (so GPIOX_16 would still be 16).
>>
>> I don't really get the point of doing so, especially is this patch is still
>> needed in the end.
>>
>>> however, that means that this patch is still needed because our last
>>> ID would be DIF_4_N (= value 129) again (so with holes our total count
>>> is still 130).
>>> with that we wouldn't even break the DT ABI
>>
>> While I prefer changing the bindings over the 'over_ngpio' tweak, it is not my
>> favorite solution.
>>
>>>
>>> > * If meson8b is indeed a cost reduction, it is likely to be same the approach as
>>> > s905x vs s905d: The D version is the same SoC with less ball pad but, as far as
>>> > we know, the logic is still there on the silicium (same die), it is just not
>>> > routed to the outside world. Both version share the same pinctrl driver (gxl).
>>> > The pad not routed to the outside world can just be considered "internal pads"
>>>
>>> there are a few differences between Meson8 and Meson8b, see also [0]:
>>> - Meson8 (and Meson8m2) CPU cores: 4x Cortex-A9
>>> - Meson8b CPU cores: 4x Cortex-A5
>>> - Meson8 (and Meson8m2) GPU: Mali-450MP8
>>> - Meson8b GPU: Mali-450MP4
>>> - Meson8 (and Meson8m2) package size: 19mm x 19 mm, LFBGA
>>> - Meson8b package size: 12mm x 12 mm, LFBGA
>>>
>>> the pinctrl register layout seems to be *mostly* compatible between
>>> Meson8 and Meson8b.
>>> unfortunately it's not entirely compatible, here is one example:
>>> - Meson8: GROUP(uart_tx_b1, 6, 23),
>>> - Meson8b: GROUP(uart_tx_b1, 6, 19),
>>> - Meson8: GROUP(eth_mdc, 6, 5),
>>> - Meson8b: GROUP(eth_mdc, 6, 9),
>>>
>>> > Long story short, if meson8 and meson8b share the same bindings, maybe they
>>> > should also share the driver. If they can't share the driver because they are
>>> > definitely incompatible, maybe they should not share the same bindings
>>>
>>> based on what I have seen so far I believe that they should not share
>>> the same bindings
>>
>> It looks to me to be same gpio/pinconf IP with a few pads not exposed to the
>> outside world, so I think they could share the bindings, and apparently fair
>> part of the driver data.
>>
>> Apparently amlogic tweaked a bit the pinmux. With the current architecture of
>> our pinctrl driver, it should be fairly easy to register 2  drivers sharing
>> everything but the GROUP table (and maybe the FUNCS if necessary)
>>
>> If possible, I would be more in favor of this last solution, as we could kill
>> one the pinctrl-meson8.c file, which are mostly a copy/paste of one another.
>> While fixing you issue, we would end up with less code to maintain and save a
>> bit of memory.
>>
>> Do you see any other big issue with this approach ?
> I would have to go through the whole list of pads to see what the
> actual differences are
I tried to automate this as far as possible with the attached script
you can use it like this:
- first get the gpio.c files from the Amlogic 3.10 kernel for Meson8
and Meson8b: [0] and [1]
- ./list-meson8-pinmux-reg-bits.sh path/to/meson8/gpio.c | sort -u > meson8.txt
- ./list-meson8-pinmux-reg-bits.sh path/to/meson8b/gpio.c | sort -u >
meson8b.txt
- diff -Naur meson8.txt meson8b.txt > diff.patch
- (the resulting diff is attached)
- compare the Meson8 documentation (found in a .csv file, see [2])
with the public Meson8b datasheet (see [3])

the major differences are:
- DIF_TTL bank only exists on Meson8b
- GPIOZ bank only exists on Meson8
- HDMI_TTL bank only exists on Meson8b (not supported by our mainline driver)
- some of the Ethernet pins are using the GPIOH bank on Meson8b while
Meson8 has these in the GPIOZ bank
- Meson8b has various SPI pins in the GPIOH bank while Meson8 has them
in the GPIOZ bank
- Meson8 only has pins for one TSin interface, Meson8b seems to
support two TSin interfaces

smaller differences are:
- the LCD_* pins (maybe even all of the LCD support) in GPIODV only
exists on Meson8
- Meson8b has the I2C_A pins on GPIODV_24 and GPIODV_25 (Meson8 has
multiple pins for this in the GPIOZ bank)
- Meson8b has the I2C_B pins on GPIODV_26 and GPIODV_27 (Meson8 has
these on GPIOZ_2 and GPIOZ_3)
- Meson8b has the I2C_C pins on GPIODV_28 and GPIODV_29 (Meson8 two
chices: either GPIOY_0 and GPIOY_1 or GPIOZ_4 and GPIOZ_5)
- the XTAL_24M_OUT signal uses GPIODV_29 on Meson8b but GPIOX_11 on Meson8
- Meson8b can output UART_CTS_B on GPIOX_10 - Meson8 supports GPIODV_26 instead
- Meson8b can output UART_RTS_B on GPIOX_20 - Meson8 supports GPIODV_27 instead
- Meson8b can output SPI_SS0 on GPIOX_20 - Meson8 supports GPIOZ_9 instead

not checked yet:
- Meson8b seems to have a few more bits in BOOT_8 BOOT_10 and BOOT_18
- Meson8b seems to have a few more bits in GPIOAO_2, GPIOAO_3,
GPIOAO_6, GPIOAO_7, GPIOAO_9, GPIOAO_10 and GPIOAO_13
- GPIOY_0, GPIOX_4, GPIOX_5, GPIOX_6, GPIOX_7, GPIOX_8, GPIOX_9
- the changes (there are quite a few) in the GPIOY bank

notes for other pins I have randomly checked:
- Meson8b's gpio.c has a function for GPIOX_0 at reg9[24] - this seems
undocumented
- Meson8b's gpio.c has a function for GPIOX_1 at reg9[23] - this seems
undocumented
- Meson8b's gpio.c has a function for GPIOX_2 at reg9[22] - this seems
undocumented
- Meson8b's gpio.c has a function for GPIOX_3 at reg9[21] - this seems
undocumented

I'm not sure if we should try to create a unified pinctrl driver for
Meson8 and Meson8b
so far we have:
- meson_pmx_group are roughly 67% identical (meson_pmx_func depend on
meson_pmx_group)
- different pinctrl_pin_desc (due to different GPIO banks)
- different IRQ numbering

so I wonder how much we would actually save by creating a unified
Meson8/Meson8b pinctrl driver.

as a side-note: I found out that Meson8m2 has 10 pins which each add
one function compared to Meson8, see: [4]
I would integrate these into the Meson8 driver (if we keep separate
drivers for Meson8 and Meson8b) when needed, because these definitely
don't justify adding a new pinctrl driver


Regards
Martin


[0] https://github.com/endlessm/linux-meson/blob/5cb4882cdda584878a29132aeb9a90497a121df9/arch/arm/mach-meson8/gpio.c
[1] https://github.com/endlessm/linux-meson/blob/5cb4882cdda584878a29132aeb9a90497a121df9/arch/arm/mach-meson8b/gpio.c
[2] https://github.com/endlessm/linux-meson/blob/5cb4882cdda584878a29132aeb9a90497a121df9/arch/arm/mach-meson8/tool/m8_gpio.csv
[3] https://dn.odroid.com/S805/Datasheet/S805_Datasheet%20V0.8%2020150126.pdf
[4] https://github.com/endlessm/linux-meson/blob/5cb4882cdda584878a29132aeb9a90497a121df9/arch/arm/mach-meson8/gpio.c#L242

--001a113962d8d6d6b705656db132
Content-Type: application/x-sh; name="list-meson8-pinmux-reg-bits.sh"
Content-Disposition: attachment; filename="list-meson8-pinmux-reg-bits.sh"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_jdrq6qwf0

IyEvYmluL2Jhc2gKCmdyZXAgLUUgIl5bWzpibGFuazpdXStcWy4qXF09LioiICIkezF9IiB8IHdo
aWxlIHJlYWQgLXIgTElORQpkbwoJUElOPSIkKGVjaG8gIiR7TElORX0iIHwgc2VkIC1FICdzLy4q
XFsoW0EtWjAtOV9dKylcXS4qL1wxLycpIgoJRlVOQ1RJT05TPSIkKGVjaG8gIiR7TElORX0iIHwg
c2VkIC1FICdzLy4qXHsoLiopXH0uKi9cMS8nIHwgc2VkIC1FICdzL1BfUElOX01VWF9SRUdcKChb
MC05XSt8QU8pLChbMC05XSspXCkvUF9QSU5fTVVYX1JFRyhcMkBcMSkvZycgfCBzZWQgLUUgInMv
QEFPL0AxMC9nIikiCgoJZm9yIGkgaW4gJChzZXEgMSA2KQoJZG8KCQlGVU5DVElPTj0iJChlY2hv
ICIke0ZVTkNUSU9OU30iIHwgY3V0IC1kJywnIC1mJHtpfSkiCgkJaWYgW1sgLW4gIiR7RlVOQ1RJ
T059IiAmJiAiJHtGVU5DVElPTn0iICE9ICJOT05FIiBdXQoJCXRoZW4KCQkJZWNobyAiJHtQSU59
ICR7RlVOQ1RJT059IgoJCWZpCglkb25lCmRvbmUK
--001a113962d8d6d6b705656db132
Content-Type: text/x-patch; charset="US-ASCII"; name="diff.patch"
Content-Disposition: attachment; filename="diff.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_jdrq9q2g1

LS0tIG1lc29uOC1wcm9jZXNzZWQudHh0CTIwMTgtMDItMTcgMTg6MDE6MzUuNjE3NzM4MDYwICsw
MTAwCisrKyBtZXNvbjhiLXByb2Nlc3NlZC50eHQJMjAxOC0wMi0xNyAxODowMTo0My43NzI4Njky
NTAgKzAxMDAKQEAgLTIsNiArMiw4IEBACiBCT09UXzAgUF9QSU5fTVVYX1JFRygyOUA2KQogQk9P
VF8wIFBfUElOX01VWF9SRUcoMzBANCkKIEJPT1RfMTAgUF9QSU5fTVVYX1JFRygxN0AyKQorQk9P
VF8xMCBQX1BJTl9NVVhfUkVHKDE4QDcpCitCT09UXzEwIFBfUElOX01VWF9SRUcoMzBANikKIEJP
T1RfMTEgUF9QSU5fTVVYX1JFRygxQDUpCiBCT09UXzExIFBfUElOX01VWF9SRUcoMjFAMikKIEJP
T1RfMTIgUF9QSU5fTVVYX1JFRygyMEAyKQpAQCAtMTcsNiArMTksNyBAQAogQk9PVF8xNyBQX1BJ
Tl9NVVhfUkVHKDI0QDYpCiBCT09UXzE3IFBfUElOX01VWF9SRUcoMjZANCkKIEJPT1RfMTggUF9Q
SU5fTVVYX1JFRygwQDUpCitCT09UXzE4IFBfUElOX01VWF9SRUcoMjhAMikKIEJPT1RfMSBQX1BJ
Tl9NVVhfUkVHKDI2QDIpCiBCT09UXzEgUF9QSU5fTVVYX1JFRygyOEA2KQogQk9PVF8xIFBfUElO
X01VWF9SRUcoMjlANCkKQEAgLTM0LDcgKzM3LDkgQEAKIEJPT1RfNiBQX1BJTl9NVVhfUkVHKDI4
QDQpCiBCT09UXzcgUF9QSU5fTVVYX1JFRygyNkAyKQogQk9PVF83IFBfUElOX01VWF9SRUcoMjhA
NCkKK0JPT1RfOCBQX1BJTl9NVVhfUkVHKDE5QDcpCiBCT09UXzggUF9QSU5fTVVYX1JFRygyNUAy
KQorQk9PVF84IFBfUElOX01VWF9SRUcoMzFANikKIEJPT1RfOSBQX1BJTl9NVVhfUkVHKDI0QDIp
CiBDQVJEXzAgUF9QSU5fTVVYX1JFRygxNEAyKQogQ0FSRF8wIFBfUElOX01VWF9SRUcoNkAyKQpA
QCAtNTIsMTUgKzU3LDQyIEBACiBDQVJEXzUgUF9QSU5fTVVYX1JFRyg2QDIpCiBDQVJEXzUgUF9Q
SU5fTVVYX1JFRyg3QDgpCiBDQVJEXzUgUF9QSU5fTVVYX1JFRyg5QDgpCitESUZfVFRMXzBfTiBQ
X1BJTl9NVVhfUkVHKDFANikKK0RJRl9UVExfMF9OIFBfUElOX01VWF9SRUcoMjRAMCkKK0RJRl9U
VExfMF9QIFBfUElOX01VWF9SRUcoMEA2KQorRElGX1RUTF8wX1AgUF9QSU5fTVVYX1JFRygyNEAw
KQorRElGX1RUTF8xX04gUF9QSU5fTVVYX1JFRygyNEAwKQorRElGX1RUTF8xX04gUF9QSU5fTVVY
X1JFRygzQDYpCitESUZfVFRMXzFfUCBQX1BJTl9NVVhfUkVHKDI0QDApCitESUZfVFRMXzFfUCBQ
X1BJTl9NVVhfUkVHKDJANikKK0RJRl9UVExfMl9OIFBfUElOX01VWF9SRUcoMjNANykKK0RJRl9U
VExfMl9OIFBfUElOX01VWF9SRUcoMjVAMCkKK0RJRl9UVExfMl9OIFBfUElOX01VWF9SRUcoNUA2
KQorRElGX1RUTF8yX1AgUF9QSU5fTVVYX1JFRygyMkA3KQorRElGX1RUTF8yX1AgUF9QSU5fTVVY
X1JFRygyNUAwKQorRElGX1RUTF8yX1AgUF9QSU5fTVVYX1JFRyg0QDYpCitESUZfVFRMXzNfTiBQ
X1BJTl9NVVhfUkVHKDI1QDApCitESUZfVFRMXzNfTiBQX1BJTl9NVVhfUkVHKDhANikKK0RJRl9U
VExfM19QIFBfUElOX01VWF9SRUcoMjVAMCkKK0RJRl9UVExfM19QIFBfUElOX01VWF9SRUcoNkA2
KQorRElGX1RUTF80X04gUF9QSU5fTVVYX1JFRygxMEA2KQorRElGX1RUTF80X04gUF9QSU5fTVVY
X1JFRygyNUAwKQorRElGX1RUTF80X1AgUF9QSU5fTVVYX1JFRygyNUAwKQorRElGX1RUTF80X1Ag
UF9QSU5fTVVYX1JFRyg5QDYpCiBHUElPQU9fMCBQX1BJTl9NVVhfUkVHKDEyQDEwKQogR1BJT0FP
XzAgUF9QSU5fTVVYX1JFRygyNkAxMCkKK0dQSU9BT18xMCBQX1BJTl9NVVhfUkVHKDE0QDEpCiBH
UElPQU9fMTAgUF9QSU5fTVVYX1JFRygyOEAxMCkKIEdQSU9BT18xMSBQX1BJTl9NVVhfUkVHKDI3
QDEwKQogR1BJT0FPXzEyIFBfUElOX01VWF9SRUcoMTdAMTApCitHUElPQU9fMTMgUF9QSU5fTVVY
X1JFRygxOUAxMCkKIEdQSU9BT18xMyBQX1BJTl9NVVhfUkVHKDMxQDEwKQogR1BJT0FPXzEgUF9Q
SU5fTVVYX1JFRygxMUAxMCkKIEdQSU9BT18xIFBfUElOX01VWF9SRUcoMjVAMTApCiBHUElPQU9f
MiBQX1BJTl9NVVhfUkVHKDEwQDEwKQorR1BJT0FPXzIgUF9QSU5fTVVYX1JFRyg4QDEwKQorR1BJ
T0FPXzMgUF9QSU5fTVVYX1JFRygyMkAxMCkKK0dQSU9BT18zIFBfUElOX01VWF9SRUcoN0AxMCkK
IEdQSU9BT18zIFBfUElOX01VWF9SRUcoOUAxMCkKIEdQSU9BT180IFBfUElOX01VWF9SRUcoMkAx
MCkKIEdQSU9BT180IFBfUElOX01VWF9SRUcoMjRAMTApCkBAIC02OCwzMSArMTAwLDI5IEBACiBH
UElPQU9fNSBQX1BJTl9NVVhfUkVHKDFAMTApCiBHUElPQU9fNSBQX1BJTl9NVVhfUkVHKDIzQDEw
KQogR1BJT0FPXzUgUF9QSU5fTVVYX1JFRyg1QDEwKQorR1BJT0FPXzYgUF9QSU5fTVVYX1JFRygx
M0AxKQorR1BJT0FPXzYgUF9QSU5fTVVYX1JFRygxNkAxMCkKIEdQSU9BT182IFBfUElOX01VWF9S
RUcoMThAMTApCiBHUElPQU9fNyBQX1BJTl9NVVhfUkVHKDBAMTApCitHUElPQU9fNyBQX1BJTl9N
VVhfUkVHKDIxQDEwKQogR1BJT0FPXzggUF9QSU5fTVVYX1JFRygzMEAxMCkKK0dQSU9BT185IFBf
UElOX01VWF9SRUcoMTVAMSkKIEdQSU9BT185IFBfUElOX01VWF9SRUcoMjlAMTApCiBHUElPRFZf
MCBQX1BJTl9NVVhfUkVHKDBANykKIEdQSU9EVl8wIFBfUElOX01VWF9SRUcoMUAwKQogR1BJT0RW
XzAgUF9QSU5fTVVYX1JFRygyN0A4KQogR1BJT0RWXzAgUF9QSU5fTVVYX1JFRyg2QDApCiBHUElP
RFZfMTAgUF9QSU5fTVVYX1JFRygxMEA3KQotR1BJT0RWXzEwIFBfUElOX01VWF9SRUcoMkAwKQog
R1BJT0RWXzEwIFBfUElOX01VWF9SRUcoNkAwKQogR1BJT0RWXzExIFBfUElOX01VWF9SRUcoMTFA
NykKLUdQSU9EVl8xMSBQX1BJTl9NVVhfUkVHKDJAMCkKIEdQSU9EVl8xMSBQX1BJTl9NVVhfUkVH
KDZAMCkKIEdQSU9EVl8xMiBQX1BJTl9NVVhfUkVHKDEyQDcpCi1HUElPRFZfMTIgUF9QSU5fTVVY
X1JFRygyQDApCiBHUElPRFZfMTIgUF9QSU5fTVVYX1JFRyg2QDApCiBHUElPRFZfMTMgUF9QSU5f
TVVYX1JFRygxM0A3KQotR1BJT0RWXzEzIFBfUElOX01VWF9SRUcoMkAwKQogR1BJT0RWXzEzIFBf
UElOX01VWF9SRUcoNkAwKQogR1BJT0RWXzE0IFBfUElOX01VWF9SRUcoMTRANykKLUdQSU9EVl8x
NCBQX1BJTl9NVVhfUkVHKDJAMCkKIEdQSU9EVl8xNCBQX1BJTl9NVVhfUkVHKDZAMCkKIEdQSU9E
Vl8xNSBQX1BJTl9NVVhfUkVHKDE1QDcpCi1HUElPRFZfMTUgUF9QSU5fTVVYX1JFRygyQDApCiBH
UElPRFZfMTUgUF9QSU5fTVVYX1JFRyg2QDApCiBHUElPRFZfMTYgUF9QSU5fTVVYX1JFRygxNkA3
KQogR1BJT0RWXzE2IFBfUElOX01VWF9SRUcoMjVAOCkKQEAgLTEwMSw2MCArMTMxLDU1IEBACiBH
UElPRFZfMTcgUF9QSU5fTVVYX1JFRygxN0A3KQogR1BJT0RWXzE3IFBfUElOX01VWF9SRUcoNUAw
KQogR1BJT0RWXzE3IFBfUElOX01VWF9SRUcoNkAwKQotR1BJT0RWXzE4IFBfUElOX01VWF9SRUco
NEAwKQogR1BJT0RWXzE4IFBfUElOX01VWF9SRUcoNkAwKQotR1BJT0RWXzE5IFBfUElOX01VWF9S
RUcoNEAwKQogR1BJT0RWXzE5IFBfUElOX01VWF9SRUcoNkAwKQogR1BJT0RWXzEgUF9QSU5fTVVY
X1JFRygxQDApCiBHUElPRFZfMSBQX1BJTl9NVVhfUkVHKDFANykKIEdQSU9EVl8xIFBfUElOX01V
WF9SRUcoNkAwKQotR1BJT0RWXzIwIFBfUElOX01VWF9SRUcoNEAwKQogR1BJT0RWXzIwIFBfUElO
X01VWF9SRUcoNkAwKQotR1BJT0RWXzIxIFBfUElOX01VWF9SRUcoNEAwKQogR1BJT0RWXzIxIFBf
UElOX01VWF9SRUcoNkAwKQotR1BJT0RWXzIyIFBfUElOX01VWF9SRUcoNEAwKQogR1BJT0RWXzIy
IFBfUElOX01VWF9SRUcoNkAwKQotR1BJT0RWXzIzIFBfUElOX01VWF9SRUcoNEAwKQogR1BJT0RW
XzIzIFBfUElOX01VWF9SRUcoNkAwKQogR1BJT0RWXzI0IFBfUElOX01VWF9SRUcoMTlAMCkKIEdQ
SU9EVl8yNCBQX1BJTl9NVVhfUkVHKDIxQDApCiBHUElPRFZfMjQgUF9QSU5fTVVYX1JFRygyM0A2
KQogR1BJT0RWXzI0IFBfUElOX01VWF9SRUcoMjRAOCkKK0dQSU9EVl8yNCBQX1BJTl9NVVhfUkVH
KDMxQDkpCiBHUElPRFZfMjQgUF9QSU5fTVVYX1JFRyg5QDApCiBHUElPRFZfMjUgUF9QSU5fTVVY
X1JFRygxOEAwKQogR1BJT0RWXzI1IFBfUElOX01VWF9SRUcoMjBAMCkKIEdQSU9EVl8yNSBQX1BJ
Tl9NVVhfUkVHKDIyQDYpCiBHUElPRFZfMjUgUF9QSU5fTVVYX1JFRygyM0A4KQorR1BJT0RWXzI1
IFBfUElOX01VWF9SRUcoMzBAOSkKIEdQSU9EVl8yNSBQX1BJTl9NVVhfUkVHKDhAMCkKIEdQSU9E
Vl8yNiBQX1BJTl9NVVhfUkVHKDIwQDgpCiBHUElPRFZfMjYgUF9QSU5fTVVYX1JFRygyMUA2KQog
R1BJT0RWXzI2IFBfUElOX01VWF9SRUcoMjFAOCkKIEdQSU9EVl8yNiBQX1BJTl9NVVhfUkVHKDIy
QDgpCitHUElPRFZfMjYgUF9QSU5fTVVYX1JFRygyOUA5KQogR1BJT0RWXzI2IFBfUElOX01VWF9S
RUcoN0AwKQogR1BJT0RWXzI3IFBfUElOX01VWF9SRUcoMTBAMCkKIEdQSU9EVl8yNyBQX1BJTl9N
VVhfUkVHKDE5QDgpCiBHUElPRFZfMjcgUF9QSU5fTVVYX1JFRygyMEA2KQogR1BJT0RWXzI3IFBf
UElOX01VWF9SRUcoMjhAOCkKK0dQSU9EVl8yNyBQX1BJTl9NVVhfUkVHKDI4QDkpCiBHUElPRFZf
MjggUF9QSU5fTVVYX1JFRygyNkAzKQogR1BJT0RWXzI4IFBfUElOX01VWF9SRUcoMjdANykKK0dQ
SU9EVl8yOCBQX1BJTl9NVVhfUkVHKDI3QDkpCiBHUElPRFZfMjkgUF9QSU5fTVVYX1JFRygyNUAz
KQorR1BJT0RWXzI5IFBfUElOX01VWF9SRUcoMjVANykKIEdQSU9EVl8yOSBQX1BJTl9NVVhfUkVH
KDI2QDcpCi1HUElPRFZfMiBQX1BJTl9NVVhfUkVHKDBAMCkKK0dQSU9EVl8yOSBQX1BJTl9NVVhf
UkVHKDI2QDkpCiBHUElPRFZfMiBQX1BJTl9NVVhfUkVHKDJANykKIEdQSU9EVl8yIFBfUElOX01V
WF9SRUcoNkAwKQotR1BJT0RWXzMgUF9QSU5fTVVYX1JFRygwQDApCiBHUElPRFZfMyBQX1BJTl9N
VVhfUkVHKDNANykKIEdQSU9EVl8zIFBfUElOX01VWF9SRUcoNkAwKQotR1BJT0RWXzQgUF9QSU5f
TVVYX1JFRygwQDApCiBHUElPRFZfNCBQX1BJTl9NVVhfUkVHKDRANykKIEdQSU9EVl80IFBfUElO
X01VWF9SRUcoNkAwKQotR1BJT0RWXzUgUF9QSU5fTVVYX1JFRygwQDApCiBHUElPRFZfNSBQX1BJ
Tl9NVVhfUkVHKDVANykKIEdQSU9EVl81IFBfUElOX01VWF9SRUcoNkAwKQotR1BJT0RWXzYgUF9Q
SU5fTVVYX1JFRygwQDApCiBHUElPRFZfNiBQX1BJTl9NVVhfUkVHKDZAMCkKIEdQSU9EVl82IFBf
UElOX01VWF9SRUcoNkA3KQotR1BJT0RWXzcgUF9QSU5fTVVYX1JFRygwQDApCiBHUElPRFZfNyBQ
X1BJTl9NVVhfUkVHKDZAMCkKIEdQSU9EVl83IFBfUElOX01VWF9SRUcoN0A3KQogR1BJT0RWXzgg
UF9QSU5fTVVYX1JFRygyNkA4KQpAQCAtMTY2LDI2ICsxOTEsNTMgQEAKIEdQSU9EVl85IFBfUElO
X01VWF9SRUcoM0AwKQogR1BJT0RWXzkgUF9QSU5fTVVYX1JFRyg2QDApCiBHUElPRFZfOSBQX1BJ
Tl9NVVhfUkVHKDlANykKK0dQSU9IXzAgUF9QSU5fTVVYX1JFRygxMUA4KQogR1BJT0hfMCBQX1BJ
Tl9NVVhfUkVHKDI2QDEpCitHUElPSF8wIFBfUElOX01VWF9SRUcoNEAxKQorR1BJT0hfMSBQX1BJ
Tl9NVVhfUkVHKDEyQDgpCitHUElPSF8xIFBfUElOX01VWF9SRUcoMkAxKQogR1BJT0hfMSBQX1BJ
Tl9NVVhfUkVHKDI1QDEpCitHUElPSF8xIFBfUElOX01VWF9SRUcoM0AxKQorR1BJT0hfMiBQX1BJ
Tl9NVVhfUkVHKDFAMSkKIEdQSU9IXzIgUF9QSU5fTVVYX1JFRygyNEAxKQorR1BJT0hfMyBQX1BJ
Tl9NVVhfUkVHKDBAMSkKIEdQSU9IXzMgUF9QSU5fTVVYX1JFRygxM0A5KQogR1BJT0hfMyBQX1BJ
Tl9NVVhfUkVHKDIzQDEpCitHUElPSF8zIFBfUElOX01VWF9SRUcoMjdANSkKIEdQSU9IXzQgUF9Q
SU5fTVVYX1JFRygxMkA5KQorR1BJT0hfNCBQX1BJTl9NVVhfUkVHKDE4QDgpCitHUElPSF80IFBf
UElOX01VWF9SRUcoMjZANSkKIEdQSU9IXzUgUF9QSU5fTVVYX1JFRygxMUA5KQorR1BJT0hfNSBQ
X1BJTl9NVVhfUkVHKDE1QDYpCitHUElPSF81IFBfUElOX01VWF9SRUcoMThAOCkKK0dQSU9IXzUg
UF9QSU5fTVVYX1JFRygyMUA3KQorR1BJT0hfNSBQX1BJTl9NVVhfUkVHKDI1QDUpCiBHUElPSF82
IFBfUElOX01VWF9SRUcoMTBAOSkKK0dQSU9IXzYgUF9QSU5fTVVYX1JFRygxNEA2KQorR1BJT0hf
NiBQX1BJTl9NVVhfUkVHKDE3QDgpCitHUElPSF82IFBfUElOX01VWF9SRUcoMjBANykKK0dQSU9I
XzYgUF9QSU5fTVVYX1JFRygyNEA1KQorR1BJT0hfNyBQX1BJTl9NVVhfUkVHKDEzQDYpCitHUElP
SF83IFBfUElOX01VWF9SRUcoMTdAOCkKIEdQSU9IXzcgUF9QSU5fTVVYX1JFRygzQDQpCitHUElP
SF84IFBfUElOX01VWF9SRUcoMTJANikKK0dQSU9IXzggUF9QSU5fTVVYX1JFRygxNkA4KQogR1BJ
T0hfOCBQX1BJTl9NVVhfUkVHKDJANCkKK0dQSU9IXzkgUF9QSU5fTVVYX1JFRygxMUA2KQogR1BJ
T0hfOSBQX1BJTl9NVVhfUkVHKDFANCkKLUdQSU9IXzkgUF9QSU5fTVVYX1JFRygxOUAzKQorR1BJ
T0hfOSBQX1BJTl9NVVhfUkVHKDE2QDgpCiBHUElPX1RFU1RfTiBQX1BJTl9NVVhfUkVHKDE5QDEw
KQogR1BJT1hfMCBQX1BJTl9NVVhfUkVHKDE0QDUpCitHUElPWF8wIFBfUElOX01VWF9SRUcoMjRA
OSkKIEdQSU9YXzAgUF9QSU5fTVVYX1JFRyg1QDgpCitHUElPWF8xMCBQX1BJTl9NVVhfUkVHKDE3
QDYpCiBHUElPWF8xMCBQX1BJTl9NVVhfUkVHKDE5QDkpCiBHUElPWF8xMCBQX1BJTl9NVVhfUkVH
KDIyQDMpCitHUElPWF8xMCBQX1BJTl9NVVhfUkVHKDIzQDQpCiBHUElPWF8xMCBQX1BJTl9NVVhf
UkVHKDMxQDcpCitHUElPWF8xMCBQX1BJTl9NVVhfUkVHKDhAMykKIEdQSU9YXzExIFBfUElOX01V
WF9SRUcoMTRAMykKLUdQSU9YXzExIFBfUElOX01VWF9SRUcoMjNAMykKK0dQSU9YXzExIFBfUElO
X01VWF9SRUcoMjBAMykKIEdQSU9YXzExIFBfUElOX01VWF9SRUcoMzBANykKIEdQSU9YXzExIFBf
UElOX01VWF9SRUcoM0AyKQogR1BJT1hfMTIgUF9QSU5fTVVYX1JFRygxM0AzKQpAQCAtMjExLDMw
ICsyNjMsNDUgQEAKIEdQSU9YXzE5IFBfUElOX01VWF9SRUcoMThANCkKIEdQSU9YXzE5IFBfUElO
X01VWF9SRUcoNkA0KQogR1BJT1hfMSBQX1BJTl9NVVhfUkVHKDEzQDUpCitHUElPWF8xIFBfUElO
X01VWF9SRUcoMjNAOSkKIEdQSU9YXzEgUF9QSU5fTVVYX1JFRyg0QDgpCitHUElPWF8yMCBQX1BJ
Tl9NVVhfUkVHKDE2QDYpCitHUElPWF8yMCBQX1BJTl9NVVhfUkVHKDI1QDQpCitHUElPWF8yMCBQ
X1BJTl9NVVhfUkVHKDlAMykKIEdQSU9YXzIgUF9QSU5fTVVYX1JFRygxM0A1KQorR1BJT1hfMiBQ
X1BJTl9NVVhfUkVHKDIyQDkpCiBHUElPWF8yIFBfUElOX01VWF9SRUcoM0A4KQogR1BJT1hfMyBQ
X1BJTl9NVVhfUkVHKDEzQDUpCitHUElPWF8zIFBfUElOX01VWF9SRUcoMjFAOSkKIEdQSU9YXzMg
UF9QSU5fTVVYX1JFRygyQDgpCiBHUElPWF80IFBfUElOX01VWF9SRUcoMTJANSkKIEdQSU9YXzQg
UF9QSU5fTVVYX1JFRygxN0A0KQorR1BJT1hfNCBQX1BJTl9NVVhfUkVHKDI5QDUpCiBHUElPWF80
IFBfUElOX01VWF9SRUcoMzBAMykKIEdQSU9YXzUgUF9QSU5fTVVYX1JFRygxMkA1KQogR1BJT1hf
NSBQX1BJTl9NVVhfUkVHKDE2QDQpCitHUElPWF81IFBfUElOX01VWF9SRUcoMjhANSkKIEdQSU9Y
XzUgUF9QSU5fTVVYX1JFRygyOUAzKQogR1BJT1hfNiBQX1BJTl9NVVhfUkVHKDEyQDUpCiBHUElP
WF82IFBfUElOX01VWF9SRUcoMTVANCkKIEdQSU9YXzYgUF9QSU5fTVVYX1JFRygyOEAzKQorR1BJ
T1hfNiBQX1BJTl9NVVhfUkVHKDI4QDUpCitHUElPWF82IFBfUElOX01VWF9SRUcoOUA1KQogR1BJ
T1hfNyBQX1BJTl9NVVhfUkVHKDEyQDUpCiBHUElPWF83IFBfUElOX01VWF9SRUcoMTRANCkKIEdQ
SU9YXzcgUF9QSU5fTVVYX1JFRygyN0AzKQorR1BJT1hfNyBQX1BJTl9NVVhfUkVHKDI4QDUpCitH
UElPWF83IFBfUElOX01VWF9SRUcoOEA1KQogR1BJT1hfOCBQX1BJTl9NVVhfUkVHKDExQDUpCiBH
UElPWF84IFBfUElOX01VWF9SRUcoMUA4KQorR1BJT1hfOCBQX1BJTl9NVVhfUkVHKDE5QDYpCitH
UElPWF84IFBfUElOX01VWF9SRUcoMjJANCkKK0dQSU9YXzggUF9QSU5fTVVYX1JFRyg2QDMpCiBH
UElPWF85IFBfUElOX01VWF9SRUcoMEA4KQogR1BJT1hfOSBQX1BJTl9NVVhfUkVHKDEwQDUpCi1H
UElPWV8wIFBfUElOX01VWF9SRUcoMTBAMSkKLUdQSU9ZXzAgUF9QSU5fTVVYX1JFRygxNUAxKQot
R1BJT1lfMCBQX1BJTl9NVVhfUkVHKDE5QDEpCitHUElPWF85IFBfUElOX01VWF9SRUcoMThANikK
K0dQSU9YXzkgUF9QSU5fTVVYX1JFRygyNEA0KQorR1BJT1hfOSBQX1BJTl9NVVhfUkVHKDdAMykK
IEdQSU9ZXzAgUF9QSU5fTVVYX1JFRygyQDMpCiBHUElPWV8wIFBfUElOX01VWF9SRUcoOUA5KQog
R1BJT1lfMTAgUF9QSU5fTVVYX1JFRygzQDkpCkBAIC0yNDUsODcgKzMxMiw0MCBAQAogR1BJT1lf
MTIgUF9QSU5fTVVYX1JFRyg1QDMpCiBHUElPWV8xMyBQX1BJTl9NVVhfUkVHKDNAOSkKIEdQSU9Z
XzEzIFBfUElOX01VWF9SRUcoNUAzKQorR1BJT1lfMTMgUF9QSU5fTVVYX1JFRyg3QDUpCiBHUElP
WV8xNCBQX1BJTl9NVVhfUkVHKDJAOSkKIEdQSU9ZXzE0IFBfUElOX01VWF9SRUcoNUAzKQotR1BJ
T1lfMTUgUF9QSU5fTVVYX1JFRygxQDkpCi1HUElPWV8xNSBQX1BJTl9NVVhfUkVHKDVAMykKLUdQ
SU9ZXzE2IFBfUElOX01VWF9SRUcoMEA5KQorR1BJT1lfMTQgUF9QSU5fTVVYX1JFRyg2QDUpCitH
UElPWV8xNSBQX1BJTl9NVVhfUkVHKDE1QDkpCiBHUElPWV8xNiBQX1BJTl9NVVhfUkVHKDE0QDkp
CiBHUElPWV8xNiBQX1BJTl9NVVhfUkVHKDI5QDcpCi1HUElPWV8xNiBQX1BJTl9NVVhfUkVHKDVA
MykKIEdQSU9ZXzEgUF9QSU5fTVVYX1JFRygxQDMpCi1HUElPWV8xIFBfUElOX01VWF9SRUcoMTRA
MSkKLUdQSU9ZXzEgUF9QSU5fTVVYX1JFRygxOEAxKQotR1BJT1lfMSBQX1BJTl9NVVhfUkVHKDE5
QDEpCiBHUElPWV8xIFBfUElOX01VWF9SRUcoOEA5KQogR1BJT1lfMiBQX1BJTl9NVVhfUkVHKDE3
QDEpCi1HUElPWV8yIFBfUElOX01VWF9SRUcoMThAMykKIEdQSU9ZXzIgUF9QSU5fTVVYX1JFRyg4
QDEpCi1HUElPWV8zIFBfUElOX01VWF9SRUcoMTFAMykKK0dQSU9ZXzIgUF9QSU5fTVVYX1JFRyg5
QDEpCiBHUElPWV8zIFBfUElOX01VWF9SRUcoMTZAMSkKK0dQSU9ZXzMgUF9QSU5fTVVYX1JFRygx
OEAzKQogR1BJT1lfMyBQX1BJTl9NVVhfUkVHKDdAMSkKLUdQSU9ZXzQgUF9QSU5fTVVYX1JFRygy
NUA0KQorR1BJT1lfNCBQX1BJTl9NVVhfUkVHKDEwQDEpCitHUElPWV80IFBfUElOX01VWF9SRUco
MTlAMSkKIEdQSU9ZXzQgUF9QSU5fTVVYX1JFRygzQDMpCi1HUElPWV80IFBfUElOX01VWF9SRUco
NkAxKQotR1BJT1lfNSBQX1BJTl9NVVhfUkVHKDE1QDMpCi1HUElPWV81IFBfUElOX01VWF9SRUco
MjRANCkKK0dQSU9ZXzUgUF9QSU5fTVVYX1JFRygxMUAxKQorR1BJT1lfNSBQX1BJTl9NVVhfUkVH
KDE4QDEpCiBHUElPWV81IFBfUElOX01VWF9SRUcoNUAxKQotR1BJT1lfNSBQX1BJTl9NVVhfUkVH
KDdAOSkKLUdQSU9ZXzYgUF9QSU5fTVVYX1JFRygxNkAzKQotR1BJT1lfNiBQX1BJTl9NVVhfUkVH
KDIzQDQpCi1HUElPWV82IFBfUElOX01VWF9SRUcoM0AxKQotR1BJT1lfNiBQX1BJTl9NVVhfUkVH
KDRAMSkKK0dQSU9ZXzYgUF9QSU5fTVVYX1JFRyg1QDMpCiBHUElPWV82IFBfUElOX01VWF9SRUco
NkA5KQotR1BJT1lfNyBQX1BJTl9NVVhfUkVHKDFAMSkKLUdQSU9ZXzcgUF9QSU5fTVVYX1JFRygx
N0AzKQotR1BJT1lfNyBQX1BJTl9NVVhfUkVHKDJAMSkKLUdQSU9ZXzcgUF9QSU5fTVVYX1JFRygy
MkA0KQorR1BJT1lfNyBQX1BJTl9NVVhfUkVHKDVAMykKIEdQSU9ZXzcgUF9QSU5fTVVYX1JFRyg1
QDkpCi1HUElPWV84IFBfUElOX01VWF9SRUcoMEAxKQogR1BJT1lfOCBQX1BJTl9NVVhfUkVHKDBA
MykKIEdQSU9ZXzggUF9QSU5fTVVYX1JFRyg0QDkpCi1HUElPWV85IFBfUElOX01VWF9SRUcoMTFA
MSkKIEdQSU9ZXzkgUF9QSU5fTVVYX1JFRygzQDkpCiBHUElPWV85IFBfUElOX01VWF9SRUcoNEAz
KQotR1BJT1pfMCBQX1BJTl9NVVhfUkVHKDBANikKLUdQSU9aXzAgUF9QSU5fTVVYX1JFRygxNkA5
KQotR1BJT1pfMCBQX1BJTl9NVVhfUkVHKDE4QDkpCi1HUElPWl8wIFBfUElOX01VWF9SRUcoMjVA
NykKLUdQSU9aXzAgUF9QSU5fTVVYX1JFRygzMUA1KQotR1BJT1pfMTAgUF9QSU5fTVVYX1JFRygx
MkA4KQotR1BJT1pfMTAgUF9QSU5fTVVYX1JFRyg4QDUpCi1HUElPWl8xMCBQX1BJTl9NVVhfUkVH
KDhANikKLUdQSU9aXzExIFBfUElOX01VWF9SRUcoMTVAOCkKLUdQSU9aXzExIFBfUElOX01VWF9S
RUcoN0A1KQotR1BJT1pfMTEgUF9QSU5fTVVYX1JFRyg3QDYpCi1HUElPWl8xMiBQX1BJTl9NVVhf
UkVHKDE0QDgpCi1HUElPWl8xMiBQX1BJTl9NVVhfUkVHKDZANSkKLUdQSU9aXzEyIFBfUElOX01V
WF9SRUcoNkA2KQotR1BJT1pfMTMgUF9QSU5fTVVYX1JFRygxM0A4KQotR1BJT1pfMTMgUF9QSU5f
TVVYX1JFRyg1QDYpCi1HUElPWl8xNCBQX1BJTl9NVVhfUkVHKDE3QDgpCi1HUElPWl8xNCBQX1BJ
Tl9NVVhfUkVHKDE3QDkpCi1HUElPWl8xIFBfUElOX01VWF9SRUcoMTVAOSkKLUdQSU9aXzEgUF9Q
SU5fTVVYX1JFRygxQDYpCi1HUElPWl8xIFBfUElOX01VWF9SRUcoMjRANykKLUdQSU9aXzEgUF9Q
SU5fTVVYX1JFRygzMEA1KQotR1BJT1pfMiBQX1BJTl9NVVhfUkVHKDJANikKLUdQSU9aXzIgUF9Q
SU5fTVVYX1JFRygyN0A1KQotR1BJT1pfMyBQX1BJTl9NVVhfUkVHKDI2QDUpCi1HUElPWl8zIFBf
UElOX01VWF9SRUcoM0A2KQotR1BJT1pfNCBQX1BJTl9NVVhfUkVHKDE1QDYpCi1HUElPWl80IFBf
UElOX01VWF9SRUcoMjVANSkKLUdQSU9aXzUgUF9QSU5fTVVYX1JFRygxNEA2KQotR1BJT1pfNSBQ
X1BJTl9NVVhfUkVHKDI0QDUpCi1HUElPWl82IFBfUElOX01VWF9SRUcoMTNANikKLUdQSU9aXzYg
UF9QSU5fTVVYX1JFRygyMUAzKQotR1BJT1pfNyBQX1BJTl9NVVhfUkVHKDBAMikKLUdQSU9aXzcg
UF9QSU5fTVVYX1JFRygxMkA2KQotR1BJT1pfNyBQX1BJTl9NVVhfUkVHKDIzQDcpCi1HUElPWl84
IFBfUElOX01VWF9SRUcoMTBANikKLUdQSU9aXzggUF9QSU5fTVVYX1JFRygxQDIpCi1HUElPWl84
IFBfUElOX01VWF9SRUcoMjJANykKLUdQSU9aXzggUF9QSU5fTVVYX1JFRyg5QDYpCi1HUElPWl85
IFBfUElOX01VWF9SRUcoMTFANikKLUdQSU9aXzkgUF9QSU5fTVVYX1JFRygxNkA4KQotR1BJT1pf
OSBQX1BJTl9NVVhfUkVHKDlANSkKK0hETUlfVFRMXzBfTiBQX1BJTl9NVVhfUkVHKDIyQDApCitI
RE1JX1RUTF8wX1AgUF9QSU5fTVVYX1JFRygyMkAwKQorSERNSV9UVExfMV9OIFBfUElOX01VWF9S
RUcoMjJAMCkKK0hETUlfVFRMXzFfUCBQX1BJTl9NVVhfUkVHKDIyQDApCitIRE1JX1RUTF8yX04g
UF9QSU5fTVVYX1JFRygyMkAwKQorSERNSV9UVExfMl9QIFBfUElOX01VWF9SRUcoMjJAMCkKK0hE
TUlfVFRMX0NLX04gUF9QSU5fTVVYX1JFRygyM0AwKQorSERNSV9UVExfQ0tfUCBQX1BJTl9NVVhf
UkVHKDIzQDApCg==
--001a113962d8d6d6b705656db132--
