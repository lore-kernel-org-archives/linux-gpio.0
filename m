From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH] pinctrl: sh-pfc: r8a77990: Fix IOCTRL reg state after
 s2ram on R-Car E3
Date: Sat, 15 Dec 2018 16:23:38 +0100
Message-ID: <20181215152337.km3rr2sx36gkuc7b@verge.net.au>
References: <20181213162027.13137-1-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181213162027.13137-1-geert+renesas@glider.be>
Sender: linux-kernel-owner@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Linus Walleij <linus.walleij@linaro.org>, Marek Vasut <marek.vasut+renesas@gmail.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

On Thu, Dec 13, 2018 at 05:20:27PM +0100, Geert Uytterhoeven wrote:
> Due to an interaction with commit 9f2b76a2db3c4387 ("pinctrl: sh-pfc:
> r8a77990: Add R8A774C0 PFC support"), the state of the I/O Control
> Registers is saved/restored during s2ram on RZ/G2E, but not on R-Car E3.
> Hence on R-Car E3, SDHI voltage state is lost after system resume.
> 
> Fix this by registering the I/O Control Registers on R-Car E3, too.
> 
> Fixes: 33847a71373cd6ae ("pinctrl: sh-pfc: r8a77990: Add voltage switch operations for SDHI")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> To be queued as a fix in sh-pfc-for-v4.21.

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
