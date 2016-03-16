From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 2/2] pinctrl: sh-pfc: IPSRx and MOD_SELx should be set
 before GPSRx
Date: Wed, 16 Mar 2016 09:32:28 +0100
Message-ID: <CAMuHMdVLt=aVJfUU5wKi5Zmo2TxdL9V8Spk7mpRmvKmTG3W0jA@mail.gmail.com>
References: <8760wnfe3r.wl%kuninori.morimoto.gx@renesas.com>
	<8737rrfe1f.wl%kuninori.morimoto.gx@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ig0-f182.google.com ([209.85.213.182]:34853 "EHLO
	mail-ig0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S966198AbcCPIca (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 16 Mar 2016 04:32:30 -0400
In-Reply-To: <8737rrfe1f.wl%kuninori.morimoto.gx@renesas.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij <linus.walleij@linaro.org>, Magnus <magnus.damm@gmail.com>, Simon <horms@verge.net.au>, linux-renesas-soc@vger.kernel.org, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

Hi Morimoto-san,

On Wed, Mar 16, 2016 at 1:48 AM, Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>
> Gen2 / Gen3 datasheet will have below note in next version.
> This patch follows this note.
>
> IPSRx and MOD_SELx registers shall be set before setting GPSRx
> registers in case that they need to be configured.
> MOD_SELx registers can be set either earlier or later than setting
> IPSRx registers.

Does this note apply to R-Car Gen1 and SH7734, too?
Both use the PINMUX_IPSR_MSEL() macro.

> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  drivers/pinctrl/sh-pfc/sh_pfc.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/pinctrl/sh-pfc/sh_pfc.h b/drivers/pinctrl/sh-pfc/sh_pfc.h
> index 2b593fc..f174d61 100644
> --- a/drivers/pinctrl/sh-pfc/sh_pfc.h
> +++ b/drivers/pinctrl/sh-pfc/sh_pfc.h
> @@ -279,7 +279,7 @@ struct sh_pfc_soc_info {
>   *   - msel: Module selector
>   */
>  #define PINMUX_IPSR_MSEL(ipsr, fn, msel)                               \
> -       PINMUX_DATA(fn##_MARK, FN_##msel, FN_##ipsr, FN_##fn)
> +       PINMUX_DATA(fn##_MARK, FN_##msel, FN_##fn, FN_##ipsr)

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
