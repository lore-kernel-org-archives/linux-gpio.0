From: Julian Calaby <julian.calaby-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 4/5] ARM: dts: sun8i-h3: Add R_PIO
 controller node to the dtsi
Date: Wed, 3 Feb 2016 09:19:28 +1100
Message-ID: <CAGRGNgXZ2jVEFFP-Cf0ZtAa6-JbaGQwFX-+VBQe2M5f_K1mhKg@mail.gmail.com>
References: <1454448113-18810-1-git-send-email-k@japko.eu> <1454448113-18810-5-git-send-email-k@japko.eu>
Reply-To: julian.calaby-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBDQIP76OUQLBBBGXYS2QKGQE44H3JGQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <1454448113-18810-5-git-send-email-k-P4rZei/IPtg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: k@japko.eu
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Vishnu Patekar <vishnupatekar0510-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jens Kuske <jenskuske-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "Mailing List, Arm" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: linux-gpio@vger.kernel.org

Hi Krzysztof,

On Wed, Feb 3, 2016 at 8:21 AM, Krzysztof Adamski <k@japko.eu> wrote:
> Add the corresponding device node for R_PIO on H3 to the dtsi. Support
> for the controller was added in earlier commit.
>
> Signed-off-by: Krzysztof Adamski <k@japko.eu>
> ---
>  .../devicetree/bindings/pinctrl/allwinner,sunxi-pinctrl.txt  |  1 +
>  arch/arm/boot/dts/sun8i-h3.dtsi                              | 12 ++++++++++++
>  2 files changed, 13 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/pinctrl/allwinner,sunxi-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/allwinner,sunxi-pinctrl.txt
> index 9213b27..3e56b16 100644
> --- a/Documentation/devicetree/bindings/pinctrl/allwinner,sunxi-pinctrl.txt
> +++ b/Documentation/devicetree/bindings/pinctrl/allwinner,sunxi-pinctrl.txt
> @@ -21,6 +21,7 @@ Required properties:
>    "allwinner,sun9i-a80-r-pinctrl"
>    "allwinner,sun8i-a83t-pinctrl"
>    "allwinner,sun8i-h3-pinctrl"
> +  "allwinner,sun8i-h3-r-pinctrl"

Shouldn't this change go in the patch that introduces the driver for
this pinctl?

Thanks,

-- 
Julian Calaby

Email: julian.calaby-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Profile: http://www.google.com/profiles/julian.calaby/
