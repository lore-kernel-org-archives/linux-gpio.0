From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 1/3] pinctrl: sh-pfc: r8a7779: Add SCIF_CLK support
Date: Tue, 15 Dec 2015 19:24:29 +0200
Message-ID: <5734500.nIa6IDBXUp@avalon>
References: <1449841738-17490-1-git-send-email-geert+renesas@glider.be> <1449841738-17490-2-git-send-email-geert+renesas@glider.be> <CACRpkdapAtyz18WZ9=9-=5yV5hLyQ-_Ka2OVyZosHEESUtTbgw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <CACRpkdapAtyz18WZ9=9-=5yV5hLyQ-_Ka2OVyZosHEESUtTbgw@mail.gmail.com>
Sender: linux-sh-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Tuesday 15 December 2015 09:36:06 Linus Walleij wrote:
> On Fri, Dec 11, 2015 at 2:48 PM, Geert Uytterhoeven wrote:
> > Add pins, groups, and a function for SCIF_CLK, which is the external
> > clock source for the Baud Rate Generator for External Clock (BRG) on
> > SCIF.
> > 
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> All looks OK to me, Acked-by.
> 
> BTW: Geert, what do you say as listing yourself as comaintainer for SH-PFC
> below Laurent in MAINTAINERS? I think it's about time.

Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

-- 
Regards,

Laurent Pinchart

