From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 0/2] pinctrl: sh-pfc: r8a7791/r8a7795: Add SCIF_CLK support
Date: Mon, 30 Nov 2015 09:48:34 +0100
Message-ID: <CACRpkdbZSJXVZrgyJZyoaVxarPbq0D4ezZdo53kQz+ANDFb9=g@mail.gmail.com>
References: <1447957827-32637-1-git-send-email-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <1447957827-32637-1-git-send-email-geert+renesas@glider.be>
Sender: linux-sh-owner@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Thu, Nov 19, 2015 at 7:30 PM, Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

>         Hi Linus, Laurent,
>
> This patch series add pins, groups, and a function for SCIF_CLK on R-Car
> M2 and R-Car H3. SCIF_CLK is the external clock source for the Baud Rate
> Generator for External Clock (BRG) on (H)SCIF.

Acked-by from my side, expect that you queue these and send me
a pull request.

Yours,
Linus Walleij
