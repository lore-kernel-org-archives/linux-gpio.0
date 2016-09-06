From: "Niklas =?iso-8859-1?Q?S=F6derlund?=" <niklas.soderlund@ragnatech.se>
Subject: Re: [PATCH] sh-pfc: return pinconf with arguments in packed format
Date: Tue, 6 Sep 2016 08:28:34 +0200
Message-ID: <20160906062833.GD27014@bigcity.dyn.berto.se>
References: <20160905141957.25982-1-niklas.soderlund+renesas@ragnatech.se>
 <CAMuHMdXu2CNyu_92MHOyVpL5wJWLm6zaojFhkk1c1joYLZ4K5A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAMuHMdXu2CNyu_92MHOyVpL5wJWLm6zaojFhkk1c1joYLZ4K5A@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij <linus.walleij@linaro.org>
List-Id: linux-gpio@vger.kernel.org

Hi Geert,

Thanks for your review.

On 2016-09-05 17:54:44 +0200, Geert Uytterhoeven wrote:
> Hi Niklas,
> 
> On Mon, Sep 5, 2016 at 4:19 PM, Niklas Söderlund
> <niklas.soderlund+renesas@ragnatech.se> wrote:
> > The pinconf-generic code expects configurations with arguments to be
> > returned in a packed format in order to be displayed properly by
> > pinconf_generic_dump_one().
> 
> Some more user-oriented explanation could be helpful, like saying that
> /sys/kernel/debug/pinctrl/e6060000.pfc/pinconf-pins on r8a7795/salvator-x now
> shows
> 
>     pin 96 (GP_3_0): input bias disabled, output drive strength (9
> mA), pin power source (3300 selector)
> 
> instead of
> 
>     pin 96 (GP_3_0): input bias disabled, output drive strength (0
> mA), pin power source (0 selector)

Good idea, I will send a v2 with a more user-oriented explanation.

> 
> > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> 
> Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks for testing.

> 
> P.S. It seems like we should get rid of the WARN_ON_ONCE() checks in our
>      pinctrl code, and return proper errors, as these are triggered by reading
>      the sysfs files.
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

-- 
Regards,
Niklas Söderlund
