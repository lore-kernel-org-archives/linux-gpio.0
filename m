From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [PATCH v2 1/2] pinctrl: sunxi: add a missing
 function of A10/A20 pinctrl driver
Date: Tue, 18 Jul 2017 15:57:28 +0800
Message-ID: <CAGb2v67JzOW7-SevwcAbDBeQ7Y1aRS5dhpQYsxqwWbOnJka=iQ@mail.gmail.com>
References: <20170718074254.20732-1-icenowy@aosc.io> <20170718074254.20732-2-icenowy@aosc.io>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBCMILY6JWQBBBAH7W3FQKGQESXT76VA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20170718074254.20732-2-icenowy-h8G6r0blFSE@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: linux-gpio@vger.kernel.org

On Tue, Jul 18, 2017 at 3:42 PM, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org> wrote:
> The PH16 pin has a function with mux id 0x5, which is the DET pin of the
> "sim" (smart card reader) IP block.
>
> This function is missing in old versions of A10/A20 SoCs' datasheets and
> user manuals, so it's also missing in the old drivers. The newest A10
> Datasheet V1.70 and A20 Datasheet V1.41 contain this pin function, and
> it's discovered during implementing R40 pinctrl driver.
>
> Add it to the driver. As we now merged A20 pinctrl driver to the A10
> one, we need to only fix the A10 driver now.
>
> Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>

Fixes: f2821b1ca3a2 ("pinctrl: sunxi: Move Allwinner A10 pinctrl
driver to a driver of its own")
Reviewed-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>

Not sure if Ccing stable is needed. There aren't likely to be any users,
as there is no driver for the smart card reader.

Also this wouldn't apply directly to old kernels anyway, due to the
newly merged in A20 driver.

ChenYu

> ---
> Changes in v2:
> - Commit message changes. (mentioning the datasheet versions which are
>   used to discover this pin function.)
>
>  drivers/pinctrl/sunxi/pinctrl-sun4i-a10.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/pinctrl/sunxi/pinctrl-sun4i-a10.c b/drivers/pinctrl/sunxi/pinctrl-sun4i-a10.c
> index 159580c04b14..47a392bc73c8 100644
> --- a/drivers/pinctrl/sunxi/pinctrl-sun4i-a10.c
> +++ b/drivers/pinctrl/sunxi/pinctrl-sun4i-a10.c
> @@ -918,6 +918,7 @@ static const struct sunxi_desc_pin sun4i_a10_pins[] = {
>                   SUNXI_FUNCTION_VARIANT(0x3, "emac",   /* ETXD1 */
>                                          PINCTRL_SUN7I_A20),
>                   SUNXI_FUNCTION(0x4, "keypad"),        /* IN6 */
> +                 SUNXI_FUNCTION(0x5, "sim"),           /* DET */
>                   SUNXI_FUNCTION_IRQ(0x6, 16),          /* EINT16 */
>                   SUNXI_FUNCTION(0x7, "csi1")),         /* D16 */
>         SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 17),
> --
> 2.13.0
>
> --
> You received this message because you are subscribed to the Google Groups "linux-sunxi" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
> For more options, visit https://groups.google.com/d/optout.
