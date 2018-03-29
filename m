From: Christian Lamparter <chunkeey@gmail.com>
Subject: Re: [PATCH] pinctrl: msm: fix gpio-hog related boot issues
Date: Thu, 29 Mar 2018 14:23:35 +0200
Message-ID: <5240033.8XEdSWCWGL@debian64>
References: <20180328180705.29147-1-chunkeey@gmail.com>
 <20180329002723.GD18510@minitux>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180329002723.GD18510@minitux>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, David Brown <david.brown@linaro.org>, Sven Eckelmann <sven.eckelmann@openmesh.com>, Andy Gross <andy.gross@linaro.org>, linux-arm-kernel@lists.infradead.org
List-Id: linux-gpio@vger.kernel.org

On Thu 29 Mar 2018 02:27:23 CEST Bjorn Andersson wrote:
> On Wed 28 Mar 11:07 PDT 2018, Christian Lamparter wrote:
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
> 
> It's quite clear that this is a generic issue with the msm pinctrl
> driver.
>From what I understand it's not only the msm-pinctrl. All pinctrl and gpio
drivers that support a DT binding but use gpiochip_add_pin_range as the 
sole way to add the ranges. I made a (probably incomplete) list in
the thread by Sven: <https://lkml.kernel.org/r/46130418.GjRpGRXmAF@debian64>

> For the cases where I've been in need of static configuration of
> certain pins I've simply made the pinctrl node itself have a pinctrl-0
> that refer to a state that I want to hold. This has worked well and I
> didn't even know about the gpio-hog property.
yes, that will work too.

One advantage of the gpio-hog is that it will also request the gpio properly.
So it cannot be exported (and changed) without getting rid of the gpio-hog
first. It also allows to specify a user-friendly line-name that shows up in
various places.

i.e.:
|root@mbl:/# cat /sys/kernel/debug/gpio 
|gpiochip1: GPIOs 472-479, parent: platform/4e0000000.gpio1, 4e0000000.gpio1:
| gpio-472 (                    |enable EMAC PHY     ) out hi    
| gpio-475 (                    |Power Drive Port 1  ) out hi  
|

> [..]
> > diff --git a/arch/arm/boot/dts/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom-apq8064.dtsi
> > index 3ca96e361878..17ad9cbd9f8c 100644
> > --- a/arch/arm/boot/dts/qcom-apq8064.dtsi
> > +++ b/arch/arm/boot/dts/qcom-apq8064.dtsi
> > @@ -327,6 +327,7 @@
> >  			reg = <0x800000 0x4000>;
> >  
> >  			gpio-controller;
> > +			gpio-ranges = <&tlmm_pinmux 0 0 90>;
> 
> This seems reasonable.
> 
> >  			#gpio-cells = <2>;
> >  			interrupt-controller;
> >  			#interrupt-cells = <2>;
> [..]
> > diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
> > index 495432f3341b..f2580bbba741 100644
> > --- a/drivers/pinctrl/qcom/pinctrl-msm.c
> > +++ b/drivers/pinctrl/qcom/pinctrl-msm.c
> > @@ -831,13 +831,6 @@ static int msm_gpio_init(struct msm_pinctrl *pctrl)
> >  		return ret;
> >  	}
> >  
> > -	ret = gpiochip_add_pin_range(&pctrl->chip, dev_name(pctrl->dev), 0, 0, chip->ngpio);
> > -	if (ret) {
> > -		dev_err(pctrl->dev, "Failed to add pin range\n");
> > -		gpiochip_remove(&pctrl->chip);
> > -		return ret;
> > -	}
> > -
> 
> But, this will break backwards compatibility with existing DTBs and I
> don't see how this would work with the ACPI based platforms using this
> driver.
Ok I see, I was aware of ACPI but not that a pinctrl-msm based driver is
using it. Well, I thinks is possible to use is_acpi_device_node() or 
!is_of_node() to detect whenever we are dealing with a OF or not:

would it be ok to do something like this?

|       if (!is_of_node(chip->of_node)) {
|					/*
|					 * (lengthy note about gpiochip_add_pin_range and OF with
|					 * reference to Documentation/devicetree/bindings/gpio/gpio.txt
|					 * - TBD)
|					 */
|					ret = gpiochip_add_pin_range(&pctrl->chip,
|					[...]
|		}


> Iirc this driver follows the same pattern as several other pinctrl
> drivers providing gpios, how are they handling this?
Well, my commit message was based on a similar patch done by
Geert Uytterhoeven <geert+renesas@glider.be> for the sh73a0:
<https://marc.info/?l=git-commits-head&m=144114029919118&w=2>

Another one was this patch from Linus:
<https://patches.linaro.org/patch/51382/>

and there are many more (basically git blame on every .dts* in
arch/ that already has a gpio-ranges property.) 

Regards,
Christian
