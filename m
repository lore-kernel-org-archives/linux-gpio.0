From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 2/2] pinctrl: sh-pfc: IPSRx and MOD_SELx should be set before GPSRx
Date: Thu, 17 Mar 2016 08:58:45 +0200
Message-ID: <1532372.pY3qGGVVN1@avalon>
References: <8760wnfe3r.wl%kuninori.morimoto.gx@renesas.com> <8737rrfe1f.wl%kuninori.morimoto.gx@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <8737rrfe1f.wl%kuninori.morimoto.gx@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij <linus.walleij@linaro.org>, Magnus <magnus.damm@gmail.com>, Simon <horms@verge.net.au>, linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

Hi Morimoto-san,

Thank you for the patch.

On Wednesday 16 March 2016 00:48:11 Kuninori Morimoto wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> Gen2 / Gen3 datasheet will have below note in next version.
> This patch follows this note.
> 
> IPSRx and MOD_SELx registers shall be set before setting GPSRx
> registers in case that they need to be configured.
> MOD_SELx registers can be set either earlier or later than setting
> IPSRx registers.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/pinctrl/sh-pfc/sh_pfc.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/sh-pfc/sh_pfc.h
> b/drivers/pinctrl/sh-pfc/sh_pfc.h index 2b593fc..f174d61 100644
> --- a/drivers/pinctrl/sh-pfc/sh_pfc.h
> +++ b/drivers/pinctrl/sh-pfc/sh_pfc.h
> @@ -279,7 +279,7 @@ struct sh_pfc_soc_info {
>   *   - msel: Module selector
>   */
>  #define PINMUX_IPSR_MSEL(ipsr, fn, msel)				\
> -	PINMUX_DATA(fn##_MARK, FN_##msel, FN_##ipsr, FN_##fn)
> +	PINMUX_DATA(fn##_MARK, FN_##msel, FN_##fn, FN_##ipsr)
> 
>  /*
>   * Describe a pinmux configuration for a single-function pin with GPIO

-- 
Regards,

Laurent Pinchart
