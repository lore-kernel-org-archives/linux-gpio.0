From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v4] pinctrl: msm: fix gpio-hog related boot issues
Date: Wed, 16 May 2018 08:31:16 -0700
Message-ID: <152648467672.210890.17814748620132622851@swboyd.mtv.corp.google.com>
References: <20180412190138.12372-1-chunkeey@gmail.com>
 <CACRpkdZPEHvnQdwh5Uu5kwqK7yVGTaw_cZR+GOzsG9pg4oEktA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CACRpkdZPEHvnQdwh5Uu5kwqK7yVGTaw_cZR+GOzsG9pg4oEktA@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Andy Gross <andy.gross@linaro.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Christian Lamparter <chunkeey@gmail.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: David Brown <david.brown@linaro.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Sven Eckelmann <sven.eckelmann@openmesh.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-arm-msm@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

Quoting Linus Walleij (2018-04-26 05:03:45)
> On Thu, Apr 12, 2018 at 9:01 PM, Christian Lamparter <chunkeey@gmail.com> wrote:
> 
> > Sven Eckelmann reported an issue with the current IPQ4019 pinctrl.
> > Setting up any gpio-hog in the device-tree for his device would
> > "kill the bootup completely":
> >
> > | [    0.477838] msm_serial 78af000.serial: could not find pctldev for node /soc/pinctrl@1000000/serial_pinmux, deferring probe
> > | [    0.499828] spi_qup 78b5000.spi: could not find pctldev for node /soc/pinctrl@1000000/spi_0_pinmux, deferring probe
> > | [    1.298883] requesting hog GPIO enable USB2 power (chip 1000000.pinctrl, offset 58) failed, -517
> > | [    1.299609] gpiochip_add_data: GPIOs 0..99 (1000000.pinctrl) failed to register
> > | [    1.308589] ipq4019-pinctrl 1000000.pinctrl: Failed register gpiochip
> > | [    1.316586] msm_serial 78af000.serial: could not find pctldev for node /soc/pinctrl@1000000/serial_pinmux, deferring probe
> > | [    1.322415] spi_qup 78b5000.spi: could not find pctldev for node /soc/pinctrl@1000000/spi_0_pinmux, deferri
> >
> > This was also verified on a RT-AC58U (IPQ4018) which would
> > no longer boot, if a gpio-hog was specified. (Tried forcing
> > the USB LED PIN (GPIO0) to high.).
> >
> > The problem is that Pinctrl+GPIO registration is currently
> > peformed in the following order in pinctrl-msm.c:
> >         1. pinctrl_register()
> >         2. gpiochip_add()
> >         3. gpiochip_add_pin_range()
> >
> > The actual error code -517 == -EPROBE_DEFER is coming from
> > pinctrl_get_device_gpio_range(), which is called through:
> >         gpiochip_add
> >             of_gpiochip_add
> >                 of_gpiochip_scan_gpios
> >                     gpiod_hog
> >                         gpiochip_request_own_desc
> >                             __gpiod_request
> >                                 chip->request
> >                                     gpiochip_generic_request
> >                                        pinctrl_gpio_request
> >                                           pinctrl_get_device_gpio_range
> >
> > pinctrl_get_device_gpio_range() is unable to find any valid
> > pin ranges, since nothing has been added to the pinctrldev_list yet.
> > so the range can't be found, and the operation fails with -EPROBE_DEFER.
> >
> > This patch fixes the issue by adding the "gpio-ranges" property to
> > the pinctrl device node of all upstream Qcom SoC. The pin ranges are
> > then added by the gpio core.
> >
> > In order to remain compatible with older, existing DTs (and ACPI)
> > a check for the "gpio-ranges" property has been added to
> > msm_gpio_init(). This prevents the driver of adding the same entry
> > to the pinctrldev_list twice.
> >
> > Reported-by: Sven Eckelmann <sven.eckelmann@openmesh.com>
> > Signed-off-by: Christian Lamparter <chunkeey@gmail.com>
> 
> This patch looks VERY good to me.
> 

Why can't we register the gpiochip and tell it about the pin ranges in
one API call instead of adding the chip and then adding the ranges? It
doesn't look right to have to go and update all the DT nodes to list
this information that is already known in the driver because the kernel
implementation can't handle the order of operations correctly.

Furthermore, it looks like this becomes a silent requirement to add the
gpio-ranges property into the DT so that hogs work, but none of the
bindings have been updated in this patch to indicate that.
