From: John Crispin <blogic@openwrt.org>
Subject: Re: [PATCH 1/2] DT: Add documentation for gpio-rt2880
Date: Fri, 10 Oct 2014 15:31:48 +0200
Message-ID: <5437DFC4.3000808@openwrt.org>
References: <1412885241-12476-1-git-send-email-blogic@openwrt.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from arrakis.dune.hu ([78.24.191.176]:40834 "EHLO arrakis.dune.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751621AbaJJNbz (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Fri, 10 Oct 2014 09:31:55 -0400
In-Reply-To: <1412885241-12476-1-git-send-email-blogic@openwrt.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Ralf Baechle <ralf@linux-mips.org>, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-mips@linux-mips.org, linux-gpio@vger.kernel.org

hi linus, ralf

please ignore these 2 patches, i sent an old version. i will resend in
a bit with the 2nd gpio driver and the ARCH_REQUIRE_GPIOLIB patch added.

	John

On 09/10/2014 22:07, John Crispin wrote:
> Describe gpio-rt2880 binding.
> 
> Signed-off-by: John Crispin <blogic@openwrt.org> Cc:
> linux-mips@linux-mips.org Cc: devicetree@vger.kernel.org Cc:
> linux-gpio@vger.kernel.org --- 
> .../devicetree/bindings/gpio/gpio-rt2880.txt       |   40
> ++++++++++++++++++++ 1 file changed, 40 insertions(+) create mode
> 100644 Documentation/devicetree/bindings/gpio/gpio-rt2880.txt
> 
> diff --git a/Documentation/devicetree/bindings/gpio/gpio-rt2880.txt
> b/Documentation/devicetree/bindings/gpio/gpio-rt2880.txt new file
> mode 100644 index 0000000..b4acf02 --- /dev/null +++
> b/Documentation/devicetree/bindings/gpio/gpio-rt2880.txt @@ -0,0
> +1,40 @@ +Ralink SoC GPIO controller bindings + +Required
> properties: +- compatible: +  - "ralink,rt2880-gpio" for Ralink
> controllers +- #gpio-cells : Should be two. +  - first cell is the
> pin number +  - second cell is used to specify optional parameters
> (unused) +- gpio-controller : Marks the device node as a GPIO
> controller +- reg : Physical base address and length of the
> controller's registers +- interrupt-parent: phandle to the INTC
> device node +- interrupts : Specify the INTC interrupt number +-
> ralink,num-gpios : Specify the number of GPIOs +-
> ralink,register-map : The register layout depends on the GPIO bank
> and actual +		SoC type. Register offsets need to be in this order. 
> +		[ INT, EDGE, RENA, FENA, DATA, DIR, POL, SET, RESET, TOGGLE ] + 
> +Optional properties: +- ralink,gpio-base : Specify the GPIO chips
> base number + +Example: + +	gpio0: gpio@600 { +		compatible =
> "ralink,rt5350-gpio", "ralink,rt2880-gpio"; + +		#gpio-cells =
> <2>; +		gpio-controller; + +		reg = <0x600 0x34>; + +
> interrupt-parent = <&intc>; +		interrupts = <6>; + +
> ralink,gpio-base = <0>; +		ralink,num-gpios = <24>; +
> ralink,register-map = [ 00 04 08 0c +				20 24 28 2c +				30 34 ]; 
> + +	};
> 
