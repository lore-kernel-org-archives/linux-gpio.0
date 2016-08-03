From: Jonas Gorski <jonas.gorski@gmail.com>
Subject: Re: [PATCH 2/2] gpio: dt-bindings: add brcm,bcm6345-gpio bindings
Date: Wed, 3 Aug 2016 13:19:12 +0200
Message-ID: <CAOiHx=nOqcaeVN1hHJtQ01BGSWKoWpVF4Er_eN-h=etCE9VBOQ@mail.gmail.com>
References: <1470222135-4731-2-git-send-email-noltari@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-vk0-f65.google.com ([209.85.213.65]:33718 "EHLO
	mail-vk0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753185AbcHCLWD convert rfc822-to-8bit (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 3 Aug 2016 07:22:03 -0400
In-Reply-To: <1470222135-4731-2-git-send-email-noltari@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6IFJvamFz?= <noltari@gmail.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, chunkeey@googlemail.com, Florian Fainelli <f.fainelli@gmail.com>

Hi,

On 3 August 2016 at 13:02, Álvaro Fernández Rojas <noltari@gmail.com> wrote:
> Subject: [PATCH 2/2] gpio: dt-bindings: add brcm,bcm6345-gpio bindings

Minor nitpick: I think the bindings should come first, then the
consumer. We shouldn't add support for it without having okayed the
binding.

> This patch adds the device tree bindings for the Broadcom's BCM6345
> memory-mapped GPIO controllers.
>
> The gpios will be supported by gpio-mmio code of the
> GPIO generic library.
>
> Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
> ---
>  .../devicetree/bindings/gpio/brcm,bcm6345-gpio.txt | 46 ++++++++++++++++++++++
>  1 file changed, 46 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpio/brcm,bcm6345-gpio.txt
>
> diff --git a/Documentation/devicetree/bindings/gpio/brcm,bcm6345-gpio.txt b/Documentation/devicetree/bindings/gpio/brcm,bcm6345-gpio.txt
> new file mode 100644
> index 0000000..48e35ec
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpio/brcm,bcm6345-gpio.txt
> @@ -0,0 +1,46 @@
> +Bindings for the Broadcom's brcm,bcm6345-gpio memory-mapped GPIO controllers.
> +
> +These bindings should only be used for BCM6338 and BCM6345 SoCs, since newer
> +ones need a proper pinctrl driver.

There's nothing wrong with using it on newer SoCs to have gpio now and
then later replacing it in the dts file with a pinctrl node once the
bindings/drivers are available. We won't/can't drop support for the
gpio-driver, as 6338/6345 don't have pinctrl anyway. So older dts's
with gpio nodes will continue to work, and newer dts's will use the
pinctrl drivers.

> +BCM6338 have 8-bit data and dirout registers, where GPIO state can be read
> +and/or written, and the direction changed from input to output.
> +BCM6345 have 16-bit data and dirout registers, where GPIO state can be read
> +and/or written, and the direction changed from input to output.
> +
> +Required properties:
> +       - compatible: should be "brcm,bcm6345-gpio"
> +       - reg-names: must contain
> +               "dat" - data register
> +               "dirout" - direction (output) register
> +       - reg: address + size pairs describing the GPIO register sets;
> +               order must correspond with the order of entries in reg-names
> +       - #gpio-cells: must be set to 2. The first cell is the pin number and
> +                       the second cell is used to specify the gpio polarity:
> +                       0 = active high
> +                       1 = active low
> +       - gpio-controller: Marks the device node as a gpio controller.
> +
> +Optional properties:
> +       - big-endian: Memory is big endian.

I think we want native-endian here.

> +
> +Examples:
> +       - BCM6338:
> +       gpio0: gpio-controller@fffe0407 {

Since both have only one bank, it might make sense to call it just
"gpio" instead of numbering it.

> +               compatible = "brcm,bcm6345-gpio";
> +               reg-names = "dirout", "dat";
> +               reg = <0xfffe0407 1>, <0xfffe040f 1>;
> +
> +               #gpio-cells = <2>;
> +               gpio-controller;
> +       };
> +
> +       - BCM6345:
> +       gpio0: gpio-controller@fffe0406 {
> +               compatible = "brcm,bcm6345-gpio";
> +               reg-names = "dirout", "dat";
> +               reg = <0xfffe0406 2>, <0xfffe040a 2>;
> +               big-endian;
> +
> +               #gpio-cells = <2>;
> +               gpio-controller;
> +       };

Apart from those (minor) nitpicks, it looks good to me.


Regards
Jonas
