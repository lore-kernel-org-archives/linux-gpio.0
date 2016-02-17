From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH 1/2] pinctrl: sh-pfc: r8a7794: add SSI pin groups
Date: Thu, 18 Feb 2016 01:08:33 +0300
Message-ID: <56C4EF61.4010505@cogentembedded.com>
References: <1501145.5ro9yfox2Z@wasted.cogentembedded.com>
 <2575141.vI43ObUTa0@wasted.cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <2575141.vI43ObUTa0@wasted.cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: linus.walleij@linaro.org, linux-renesas-soc@vger.kernel.org, laurent.pinchart@ideasonboard.com, linux-gpio@vger.kernel.org, geert+renesas@glider.be
List-Id: linux-gpio@vger.kernel.org

On 02/11/2016 01:38 AM, Sergei Shtylyov wrote:

> From: Ryo Kataoka <ryo.kataoka.wt@renesas.com>
>
> Add the SSI pin groups to the R8A7794 PFC driver.
>
> [Sergei: fixed inconsistent alternate pin group naming, split SSI5/6 pin
> groups into data/control ones, moved SSI7 data B group to its proper place,
> fixed  pin names in  the comments to *_pins[], extended Cogent Embedded's
> copyright, added the changelog, renamed the patch.]
>
> Signed-off-by: Ryo Kataoka <ryo.kataoka.wt@renesas.com>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
>
> ---
>   drivers/pinctrl/sh-pfc/pfc-r8a7794.c |  315 ++++++++++++++++++++++++++++++++++-
>   1 file changed, 313 insertions(+), 2 deletions(-)
>
> Index: linux-pinctrl/drivers/pinctrl/sh-pfc/pfc-r8a7794.c
> ===================================================================
> --- linux-pinctrl.orig/drivers/pinctrl/sh-pfc/pfc-r8a7794.c
> +++ linux-pinctrl/drivers/pinctrl/sh-pfc/pfc-r8a7794.c
> @@ -1,9 +1,9 @@
>   /*
>    * r8a7794 processor support - PFC hardware block.
>    *
> - * Copyright (C) 2014 Renesas Electronics Corporation
> + * Copyright (C) 2014-2015 Renesas Electronics Corporation
>    * Copyright (C) 2015 Renesas Solutions Corp.
> - * Copyright (C) 2015 Cogent  Embedded, Inc., <source@cogentembedded.com>
> + * Copyright (C) 2015-2016 Cogent  Embedded, Inc., <source@cogentembedded.com>

    Geert, could you turn the double space into single?

MBR, Sergei
