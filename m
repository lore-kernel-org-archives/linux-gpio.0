From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v5 4/4] ARM: dts: sun8i: Add leds and switch
 on Orangepi Plus boards
Date: Thu, 25 Feb 2016 11:38:09 -0800
Message-ID: <20160225193809.GO4736@lukather>
References: <1456146208-13890-1-git-send-email-k@japko.eu>
 <1456146208-13890-5-git-send-email-k@japko.eu>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="hXth9cGL35Nvpk4x"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRBXNQXW3AKGQEVAQW65Q-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1456146208-13890-5-git-send-email-k-P4rZei/IPtg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Krzysztof Adamski <k@japko.eu>
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jens Kuske <jenskuske-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Fabian Frederick <fabf-AgBVmzD5pcezQB+pC5nmwQ@public.gmane.org>, Vishnu Patekar <vishnupatekar0510-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: linux-gpio@vger.kernel.org

--hXth9cGL35Nvpk4x
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

Hi,

On Mon, Feb 22, 2016 at 02:03:28PM +0100, Krzysztof Adamski wrote:
> OrangePi Plus board has two leds - green ("pwr") and red ("status")
> and a switch ("sw4"). This patch describes them in a devicetree.
> 
> Signed-off-by: Krzysztof Adamski <k@japko.eu>
> ---
>  arch/arm/boot/dts/sun8i-h3-orangepi-plus.dts | 63 ++++++++++++++++++++++++++++
>  1 file changed, 63 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/sun8i-h3-orangepi-plus.dts b/arch/arm/boot/dts/sun8i-h3-orangepi-plus.dts
> index e67df59..5f159d0 100644
> --- a/arch/arm/boot/dts/sun8i-h3-orangepi-plus.dts
> +++ b/arch/arm/boot/dts/sun8i-h3-orangepi-plus.dts
> @@ -45,6 +45,7 @@
>  #include "sunxi-common-regulators.dtsi"
>  
>  #include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/input/input.h>
>  #include <dt-bindings/pinctrl/sun4i-a10.h>
>  
>  / {
> @@ -58,6 +59,68 @@
>  	chosen {
>  		stdout-path = "serial0:115200n8";
>  	};
> +
> +	leds {
> +		compatible = "gpio-leds";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&leds_opc>;
> +
> +		status_led {
> +			label = "status:red:user";
> +			gpios = <&pio 0 15 GPIO_ACTIVE_HIGH>;
> +		};
> +	};
> +
> +	r_leds {
> +		compatible = "gpio-leds";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&leds_r_opc>;
> +
> +		tx {
> +			label = "pwr:green:user";
> +			gpios = <&r_pio 0 10 GPIO_ACTIVE_HIGH>;
> +			default-state = "on";
> +		};
> +	};

You can merge the two gpio-leds nodes into a single one.

Plus, the label format is <board>:<colour>:<role>

In these case, it would be more "orangepi-plus:red:status" and
"orangepi-plus:green:pwr".

Thanks!
Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--hXth9cGL35Nvpk4x--
