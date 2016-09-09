From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH] pinctrl: sh-pfc: r8a7796: Add voltage switch operations
 for SDHI
Date: Fri, 9 Sep 2016 17:06:42 +0200
Message-ID: <20160909150641.GA13747@verge.net.au>
References: <1473335853-32102-1-git-send-email-horms+renesas@verge.net.au>
 <CAMuHMdUM4B0KQMS127VGTSV8DkDGaUAy_vfK1XK6EnVd5p9DPQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAMuHMdUM4B0KQMS127VGTSV8DkDGaUAy_vfK1XK6EnVd5p9DPQ@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, Linus Walleij <linus.walleij@linaro.org>, Magnus Damm <magnus.damm@gmail.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>
List-Id: linux-gpio@vger.kernel.org

On Fri, Sep 09, 2016 at 10:24:55AM +0200, Geert Uytterhoeven wrote:
> On Thu, Sep 8, 2016 at 1:57 PM, Simon Horman <horms+renesas@verge.net.au> wrote:
> > This patch supports the {get,set}_io_voltage operations of SDHI.
> >
> > This operates the POCCTRL0 register on R8A7796 SoC and makes 1.8v/3.3v
> > voltage switch.
> >
> > Based on work by Takeshi Kihara and Wolfram Sang.
> >
> > Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
> > Cc: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> > Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks, will you queue this up?
