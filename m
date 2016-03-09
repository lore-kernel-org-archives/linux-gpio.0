From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: sh-pfc: core: only call pinctrl_provide_dummies()
 on SuperH
Date: Wed, 9 Mar 2016 18:09:00 +0700
Message-ID: <CACRpkdYGaAVz=Njykq9FhEdxLM62bP-G6vxPDH74vX61NEva7A@mail.gmail.com>
References: <1501145.5ro9yfox2Z@wasted.cogentembedded.com>
	<14300712.5chtEzsjIN@wasted.cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <14300712.5chtEzsjIN@wasted.cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: linux-renesas-soc@vger.kernel.org, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: linux-gpio@vger.kernel.org

On Sat, Mar 5, 2016 at 5:58 AM, Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:

> The 'ravb' Ethernet driver couldn't connect to  the PHY as the MDIO bus
> appeared empty on the Renesas R-Car boards. The bug hunt finally pointed
> at  the commit adding the "init" pintcrl state: it tries to switch to non-
> default state before the driver probe which should fail but doesn't as the
> PFC pinctrl driver happens to call pinctrl_provide_dummies()  which makes
> all state lookups succeed, even though the state doesn't really exist.
> That feature is only relevant to non-DT systems and all the ARM boards
> that use the PFC driver  have been converted to the DT boot, so limiting
> it to the SuperH architecture seems The Right Thing...
>
> Fixes: ef0eebc05130 ("drivers/pinctrl: Add the concept of an "init" state")
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> CC: stable@vger.kernel.org

Putting this on hold because another patch is being discussed as a
more proper fix.

Yours,
Linus Walleij
