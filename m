From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH] MAINTAINERS: Add git repository to Renesas pinctrl
 driver section
Date: Thu, 5 Oct 2017 11:11:00 +0200
Message-ID: <20171005091058.GH26369@verge.net.au>
References: <1507116912-17362-1-git-send-email-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1507116912-17362-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Linus Walleij <linus.walleij@linaro.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

On Wed, Oct 04, 2017 at 01:35:12PM +0200, Geert Uytterhoeven wrote:
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 6e018e720152c98c..61d77c8037a1faf9 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -10675,6 +10675,7 @@ PIN CONTROLLER - RENESAS
>  M:	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>  M:	Geert Uytterhoeven <geert+renesas@glider.be>
>  L:	linux-renesas-soc@vger.kernel.org
> +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git sh-pfc
>  S:	Maintained
>  F:	drivers/pinctrl/sh-pfc/
>  
> -- 
> 2.7.4
> 
