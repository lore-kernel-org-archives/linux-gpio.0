From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [PATCH v3 4/5] ARM: dts: sun8i-h3: Add R_PIO
 controller node to the dtsi
Date: Fri, 5 Feb 2016 17:46:32 +0800
Message-ID: <CAGb2v67ftGhjPHjHKQ0iYnOeRbi5qcqyT2P1gePW=UoMm5QRig@mail.gmail.com>
References: <1454542430-16572-1-git-send-email-k@japko.eu> <1454542430-16572-5-git-send-email-k@japko.eu>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCMILY6JWQBBBDW72G2QKGQEOCVQNEI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <1454542430-16572-5-git-send-email-k-P4rZei/IPtg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Krzysztof Adamski <k@japko.eu>
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jens Kuske <jenskuske-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Fabian Frederick <fabf-AgBVmzD5pcezQB+pC5nmwQ@public.gmane.org>, Vishnu Patekar <vishnupatekar0510-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: linux-gpio@vger.kernel.org

On Thu, Feb 4, 2016 at 7:33 AM, Krzysztof Adamski <k@japko.eu> wrote:
> Add the corresponding device node for R_PIO on H3 to the dtsi. Support
> for the controller was added in earlier commit.
>
> Signed-off-by: Krzysztof Adamski <k@japko.eu>
> ---
>  arch/arm/boot/dts/sun8i-h3.dtsi | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/arch/arm/boot/dts/sun8i-h3.dtsi b/arch/arm/boot/dts/sun8i-h3.dtsi
> index bb37f52..f618a95 100644
> --- a/arch/arm/boot/dts/sun8i-h3.dtsi
> +++ b/arch/arm/boot/dts/sun8i-h3.dtsi
> @@ -517,5 +517,17 @@
>                         compatible = "allwinner,sun6i-a31-clock-reset";
>                         #reset-cells = <1>;
>                 };
> +
> +               r_pio: pinctrl@01f02c00 {
> +                       compatible = "allwinner,sun8i-h3-r-pinctrl";
> +                       reg = <0x01f02c00 0x400>;
> +                       interrupts = <GIC_SPI 45 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks = <&apb0_gates 0>;
> +                       resets = <&apb0_reset 0>;
> +                       gpio-controller;
> +                       #gpio-cells = <3>;
> +                       interrupt-controller;
> +                       #interrupt-cells = <2>;

This should be 3: bank number + pin number + flags.
The rest looks good.

(resent as my mail setup failed to deliver)

> +               };
>         };
>  };
> --
> 2.1.4
>
