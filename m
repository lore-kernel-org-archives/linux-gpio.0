From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH -stable] pinctrl: sh-pfc: r8a77970: remove
 SH_PFC_PIN_CFG_DRIVE_STRENGTH flag
Date: Wed, 18 Jul 2018 11:16:09 +0200
Message-ID: <20180718091608.dywd72bkyf6gywo4@verge.net.au>
References: <20180717152417.8535-1-niklas.soderlund+renesas@ragnatech.se>
 <CAMuHMdVLmgYqf+Ms1NH-DGf+g_GOE-NfcVS1U5squ2zOPzE-tw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <stable-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAMuHMdVLmgYqf+Ms1NH-DGf+g_GOE-NfcVS1U5squ2zOPzE-tw@mail.gmail.com>
Sender: stable-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, stable <stable@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Wed, Jul 18, 2018 at 09:42:05AM +0200, Geert Uytterhoeven wrote:
> Hi Niklas,
> 
> Thanks for your backport!
> 
> On Tue, Jul 17, 2018 at 5:24 PM Niklas Söderlund
> <niklas.soderlund+renesas@ragnatech.se> wrote:
> 
> commit 550b6f7e8cf93fc2753aa01e655ed5471012ab5a upstream.
> 
> > The datasheet does not document any registers to control drive strength,
> > and no drive strength registers are for this reason described for this
> > SoC. The flags indicating that drive strength can be controlled are
> > however set for some pins in the driver.
> >
> > This leads to a NULL pointer dereference when the sh-pfc core tries to
> > access the struct describing the drive strength registers, for example
> > when reading the sysfs file pinconf-pins.
> >
> > Fix this by removing the SH_PFC_PIN_CFG_DRIVE_STRENGTH from all pins
> >
> > Fixes: b92ac66a1819602b ("pinctrl: sh-pfc: Add R8A77970 PFC support")
> > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

> 
> > ---
> 
> > This is a backport of commit 550b6f7e8cf93fc2753aa01e655ed5471012ab5a
> > from Linusw linux-pinctrl.git tree. It's applicable for v4.16 and v4.17.
> 
> Which is now upstream.
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
> 
