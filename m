From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH] gpio: rcar: reinstate generic compat string
Date: Thu, 10 Aug 2017 10:06:25 +0200
Message-ID: <20170810080624.GF16647@verge.net.au>
References: <1502266866-11277-1-git-send-email-horms+renesas@verge.net.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:57421 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750909AbdHJIGb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Aug 2017 04:06:31 -0400
Content-Disposition: inline
In-Reply-To: <1502266866-11277-1-git-send-email-horms+renesas@verge.net.au>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Linus Walleij <linus.walleij@linaro.org>, Magnus Damm <magnus.damm@gmail.com>, linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org

On Wed, Aug 09, 2017 at 10:21:06AM +0200, Simon Horman wrote:
> commit d10bbd156926 ("gpio: rcar: add gen[123] fallback compatibility
> strings") deprecated the generic compat string, renesas,gpio-rcar. After
> further discussion this appears not to have been desirable as that compat
> string is compatible with all R-Car SoCs supported in upstream.
> 
> This commit partially reverts that commit, and updates related
> documentation and examples.
> 
> Fixes: d10bbd156926 ("gpio: rcar: add gen[123] fallback compatibility strings")
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>

Hi Linus,

I believe Geert is on holidays at the moment (maybe you are to‽).
I'd like to wait for feedback from him on this as I feel that
its not at all urgent and it would be best to try to avoid further
churn in this area.

> ---
>  .../devicetree/bindings/gpio/renesas,gpio-rcar.txt     | 18 ++++++++++++------
>  1 file changed, 12 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/gpio/renesas,gpio-rcar.txt b/Documentation/devicetree/bindings/gpio/renesas,gpio-rcar.txt
> index 48634b01f1bf..347d8ede2982 100644
> --- a/Documentation/devicetree/bindings/gpio/renesas,gpio-rcar.txt
> +++ b/Documentation/devicetree/bindings/gpio/renesas,gpio-rcar.txt
> @@ -16,11 +16,13 @@ Required Properties:
>      - "renesas,rcar-gen1-gpio": for a generic R-Car Gen1 GPIO controller.
>      - "renesas,rcar-gen2-gpio": for a generic R-Car Gen2 or RZ/G1 GPIO controller.
>      - "renesas,rcar-gen3-gpio": for a generic R-Car Gen3 GPIO controller.
> -    - "renesas,gpio-rcar": deprecated.
> +    - "renesas,gpio-rcar": for generic R-Car GPIO controller.
>  
> -    When compatible with the generic version nodes must list the
> -    SoC-specific version corresponding to the platform first followed by
> -    the generic version.
> +    Nodes should list all of the following that are compatible
> +    in this order:
> +    - A SoC-specific version
> +    - A generic R-Car generation version
> +    - The generic R-Car version
>  
>    - reg: Base address and length of each memory resource used by the GPIO
>      controller hardware module.
> @@ -50,7 +52,9 @@ interrupt-controller/interrupts.txt.
>  Example: R8A7779 (R-Car H1) GPIO controller nodes
>  
>  	gpio0: gpio@ffc40000 {
> -		compatible = "renesas,gpio-r8a7779", "renesas,rcar-gen1-gpio";
> +		compatible = "renesas,gpio-r8a7779",
> +			     "renesas,rcar-gen1-gpio",
> +			     "renesas,gpio-rcar";
>  		reg = <0xffc40000 0x2c>;
>  		interrupt-parent = <&gic>;
>  		interrupts = <0 141 0x4>;
> @@ -62,7 +66,9 @@ Example: R8A7779 (R-Car H1) GPIO controller nodes
>  	};
>  	...
>  	gpio6: gpio@ffc46000 {
> -		compatible = "renesas,gpio-r8a7779", "renesas,rcar-gen1-gpio";
> +		compatible = "renesas,gpio-r8a7779",
> +			     "renesas,rcar-gen1-gpio",
> +			     "renesas,gpio-rcar";
>  		reg = <0xffc46000 0x2c>;
>  		interrupt-parent = <&gic>;
>  		interrupts = <0 147 0x4>;
> -- 
> 2.1.4
> 
