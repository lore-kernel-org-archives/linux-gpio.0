From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH 1/2] pinctrl: sh-pfc: r8a7795: Fix hscif2_clk_b and
 hscif4_ctrl
Date: Mon, 13 Mar 2017 19:57:02 +0300
Message-ID: <e5214bac-7bf9-1897-cf9f-f4735e6985e9@cogentembedded.com>
References: <1489423302-21296-1-git-send-email-geert+renesas@glider.be>
 <1489423302-21296-2-git-send-email-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f52.google.com ([209.85.215.52]:32930 "EHLO
        mail-lf0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754275AbdCMQ5H (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 13 Mar 2017 12:57:07 -0400
Received: by mail-lf0-f52.google.com with SMTP id a6so66309778lfa.0
        for <linux-gpio@vger.kernel.org>; Mon, 13 Mar 2017 09:57:05 -0700 (PDT)
In-Reply-To: <1489423302-21296-2-git-send-email-geert+renesas@glider.be>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij <linus.walleij@linaro.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org

On 03/13/2017 07:41 PM, Geert Uytterhoeven wrote:

> Fix typos in hscif2_clk_[bc]_mux[] and hscif4_ctrl_mux[].

    Only seeing hscif2_clk_b_mux[] fix...

> Fixes: a56069c46c102710 ("pinctrl: sh-pfc: r8a7795: Add HSCIF pins, groups, and functions")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  drivers/pinctrl/sh-pfc/pfc-r8a7795.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7795.c b/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
> index 504d0c3d7f741849..6ba7ed15a4610366 100644
> --- a/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
> +++ b/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
> @@ -2167,7 +2167,7 @@ static const unsigned int hscif2_clk_b_pins[] = {
>  	RCAR_GP_PIN(6, 21),
>  };
>  static const unsigned int hscif2_clk_b_mux[] = {
> -	HSCK1_B_MARK,
> +	HSCK2_B_MARK,
>  };
>  static const unsigned int hscif2_ctrl_b_pins[] = {
>  	/* RTS, CTS */
[...]

MBR, Sergei

