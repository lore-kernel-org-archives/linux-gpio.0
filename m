From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/5] DT: Add documentation for gpio-rt2880
Date: Mon, 27 Oct 2014 17:41:23 +0100
Message-ID: <CACRpkdYR=ha+Q9-cRdtXVtuLvQnAEA8h9fgeQ8SpcNrXX-QO+A@mail.gmail.com>
References: <1412972930-16777-1-git-send-email-blogic@openwrt.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ie0-f173.google.com ([209.85.223.173]:52684 "EHLO
	mail-ie0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752490AbaJ0QlY (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 27 Oct 2014 12:41:24 -0400
Received: by mail-ie0-f173.google.com with SMTP id tr6so4760503ieb.32
        for <linux-gpio@vger.kernel.org>; Mon, 27 Oct 2014 09:41:23 -0700 (PDT)
In-Reply-To: <1412972930-16777-1-git-send-email-blogic@openwrt.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: John Crispin <blogic@openwrt.org>
Cc: Ralf Baechle <ralf@linux-mips.org>, Linux MIPS <linux-mips@linux-mips.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Fri, Oct 10, 2014 at 10:28 PM, John Crispin <blogic@openwrt.org> wrote:

> Describe gpio-rt2880 binding.
>
> Signed-off-by: John Crispin <blogic@openwrt.org>
> Cc: linux-mips@linux-mips.org
> Cc: devicetree@vger.kernel.org
> Cc: linux-gpio@vger.kernel.org
> ---
>  .../devicetree/bindings/gpio/gpio-rt2880.txt       |   40 ++++++++++++++++++++
>  1 file changed, 40 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpio/gpio-rt2880.txt
>
> diff --git a/Documentation/devicetree/bindings/gpio/gpio-rt2880.txt b/Documentation/devicetree/bindings/gpio/gpio-rt2880.txt
> new file mode 100644
> index 0000000..b4acf02
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpio/gpio-rt2880.txt
> @@ -0,0 +1,40 @@
> +Ralink SoC GPIO controller bindings
> +
> +Required properties:
> +- compatible:
> +  - "ralink,rt2880-gpio" for Ralink controllers
> +- #gpio-cells : Should be two.
> +  - first cell is the pin number
> +  - second cell is used to specify optional parameters (unused)
> +- gpio-controller : Marks the device node as a GPIO controller
> +- reg : Physical base address and length of the controller's registers
> +- interrupt-parent: phandle to the INTC device node
> +- interrupts : Specify the INTC interrupt number
> +- ralink,num-gpios : Specify the number of GPIOs
> +- ralink,register-map : The register layout depends on the GPIO bank and actual
> +               SoC type. Register offsets need to be in this order.
> +               [ INT, EDGE, RENA, FENA, DATA, DIR, POL, SET, RESET, TOGGLE ]
> +
> +Optional properties:
> +- ralink,gpio-base : Specify the GPIO chips base number

NAK. This is a Linux-internal number. It is not OS-neutral.

Yours,
Linus Walleij
