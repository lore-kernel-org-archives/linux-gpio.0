From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/3] pinctrl: sh-pfc: r8a7779: Add SCIF_CLK support
Date: Tue, 15 Dec 2015 09:36:06 +0100
Message-ID: <CACRpkdapAtyz18WZ9=9-=5yV5hLyQ-_Ka2OVyZosHEESUtTbgw@mail.gmail.com>
References: <1449841738-17490-1-git-send-email-geert+renesas@glider.be>
	<1449841738-17490-2-git-send-email-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <1449841738-17490-2-git-send-email-geert+renesas@glider.be>
Sender: linux-sh-owner@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Fri, Dec 11, 2015 at 2:48 PM, Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> Add pins, groups, and a function for SCIF_CLK, which is the external
> clock source for the Baud Rate Generator for External Clock (BRG) on
> SCIF.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

All looks OK to me, Acked-by.

BTW: Geert, what do you say as listing yourself as comaintainer for SH-PFC
below Laurent in MAINTAINERS? I think it's about time.

Yours,
Linus Walleij
