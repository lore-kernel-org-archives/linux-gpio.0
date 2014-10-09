From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH 1/2] DT: Add documentation for gpio-rt2880
Date: Fri, 10 Oct 2014 00:30:16 +0400
Message-ID: <5436F058.6010406@cogentembedded.com>
References: <1412885241-12476-1-git-send-email-blogic@openwrt.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f180.google.com ([209.85.217.180]:47862 "EHLO
	mail-lb0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751676AbaJIUaU (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 9 Oct 2014 16:30:20 -0400
Received: by mail-lb0-f180.google.com with SMTP id n15so1918169lbi.11
        for <linux-gpio@vger.kernel.org>; Thu, 09 Oct 2014 13:30:18 -0700 (PDT)
In-Reply-To: <1412885241-12476-1-git-send-email-blogic@openwrt.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: John Crispin <blogic@openwrt.org>, Ralf Baechle <ralf@linux-mips.org>, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-mips@linux-mips.org, linux-gpio@vger.kernel.org

Hello.

On 10/10/2014 12:07 AM, John Crispin wrote:

> Describe gpio-rt2880 binding.

> Signed-off-by: John Crispin <blogic@openwrt.org>
> Cc: linux-mips@linux-mips.org
> Cc: devicetree@vger.kernel.org
> Cc: linux-gpio@vger.kernel.org
> ---
>   .../devicetree/bindings/gpio/gpio-rt2880.txt       |   40 ++++++++++++++++++++
>   1 file changed, 40 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/gpio/gpio-rt2880.txt

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

    It's not a required property, it can be inherited from the nodes above.

> +- interrupts : Specify the INTC interrupt number
> +- ralink,num-gpios : Specify the number of GPIOs
> +- ralink,register-map : The register layout depends on the GPIO bank and actual
> +		SoC type. Register offsets need to be in this order.
> +		[ INT, EDGE, RENA, FENA, DATA, DIR, POL, SET, RESET, TOGGLE ]

    This should be determined by the "compatible" property alone, I think.

> +
> +Optional properties:
> +- ralink,gpio-base : Specify the GPIO chips base number

WBR, Sergei

