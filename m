From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [RFC 0/5] Renesas RZ series pinctrl driver
Date: Mon, 30 Jan 2017 20:59:58 +0200
Message-ID: <1834948.XJ6SzFDPBZ@avalon>
References: <1485367787-8109-1-git-send-email-jacopo+renesas@jmondi.org> <CACRpkdYzbquN_5eFepT6BhNgfM2FxwrjvYsMRD4o2NN4-O4kfw@mail.gmail.com> <CAMuHMdV=MAy5m99za=31k+81kGYmNyXuTPdYu0APcpj0SfCY_A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <CAMuHMdV=MAy5m99za=31k+81kGYmNyXuTPdYu0APcpj0SfCY_A@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Jacopo Mondi <jacopo+renesas@jmondi.org>, ext Tony Lindgren <tony@atomide.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

Hi Geert,

On Monday 30 Jan 2017 17:08:11 Geert Uytterhoeven wrote:
> On Mon, Jan 30, 2017 at 2:51 PM, Linus Walleij wrote:
> > On Wed, Jan 25, 2017 at 7:09 PM, Jacopo Mondi wrote:
> >> after having discussed in great detail the RZ series per-pin PFC
> >> hardware peculiarities, this is a proposal for a possible pin-based pin
> >> controller driver for SoC devices of Renesas RZ family.
> >> 
> >> This RFC series adds a minimal driver infrastructure which supports pin
> >> multiplexing via explicit per-pin settings performed in device tree
> >> sources.
> >
> > I think this is what Laurent had in mind when he said something about
> > that he should have taken the per-pin approach from day 1.
> > 
> > I would especially like to see Laurent's review and ACK on this series
> > for that reason so we don't create something less than what he is
> > expecting for the future of Renesas pin control.
> 
> It depends on the actual hardware: while per-pin settings are suitable for
> SoCs that have per-pin hardware configuration (e.g. RZ/A1), it's not
> suitable for SoCs where that's not the case, and where the hardware has
> group-wise configuration (e.g. on R-Car).
> 
> Hence IMHO "the future of Renesas pin control" will remain a split
> personality for a while ;-)
> 
> Laurent: please kick me if you disagree...

I unfortunately agree. Maybe we could try to speed up the process by providing 
feedback to the hardware engineers ?

-- 
Regards,

Laurent Pinchart
