From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [PATCH] clk: sunxi: Add missing H3 apb0 clock documentation
Date: Thu, 18 Feb 2016 09:07:16 -0800
Message-ID: <CAGb2v67PiQHVQfhbsk2f3aQFOaDXHy3P+NJDoTw-+GshubWaYQ@mail.gmail.com>
References: <CACRpkdbfNeh7_=3ReQtJc7OxkkQEn+BUhZ0O0SKnFsRD=WZiUQ@mail.gmail.com>
 <1455807809-30827-1-git-send-email-k@japko.eu>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCMILY6JWQBBBXPUS63AKGQEJWJLUXA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <1455807809-30827-1-git-send-email-k-P4rZei/IPtg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Krzysztof Adamski <krzysztof.adamski-++hxYGjEMp0AvxtiuMwx3w@public.gmane.org>
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Vishnu Patekar <vishnupatekar0510-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jens Kuske <jenskuske-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, Krzysztof Adamski <k@japko.eu>
List-Id: linux-gpio@vger.kernel.org

On Thu, Feb 18, 2016 at 7:03 AM, Krzysztof Adamski
<krzysztof.adamski-++hxYGjEMp0AvxtiuMwx3w@public.gmane.org> wrote:
> allwinner,sun8i-h3-apb0-gates-clk was added by
> commit ba83a11104ae ("pinctrl: sunxi: Add H3 R_PIO controller support")
> but the patch was missing proper binding documentation. This patch fixes
> this issue.

What are you talking about? The commit you mentioned only adds the pinctrl
driver. Your H3 PRCM related clock and reset patches are still pending.
No need for this patch as your earlier patches includes this.

ChenYu

>
> Signed-off-by: Krzysztof Adamski <k@japko.eu>
> ---
>  Documentation/devicetree/bindings/clock/sunxi.txt | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/clock/sunxi.txt b/Documentation/devicetree/bindings/clock/sunxi.txt
> index c09f59b..37d0fd6 100644
> --- a/Documentation/devicetree/bindings/clock/sunxi.txt
> +++ b/Documentation/devicetree/bindings/clock/sunxi.txt
> @@ -38,6 +38,7 @@ Required properties:
>         "allwinner,sun4i-a10-apb0-clk" - for the APB0 clock
>         "allwinner,sun6i-a31-apb0-clk" - for the APB0 clock on A31
>         "allwinner,sun8i-a23-apb0-clk" - for the APB0 clock on A23
> +       "allwinner,sun8i-h3-apb0-gates-clk" - for the APB0 gates on H3
>         "allwinner,sun9i-a80-apb0-clk" - for the APB0 bus clock on A80
>         "allwinner,sun8i-a83t-apb0-gates-clk" - for the APB0 gates on A83T
>         "allwinner,sun4i-a10-apb0-gates-clk" - for the APB0 gates on A10
> --
> 2.1.4
>
