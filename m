From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [RFC] pinctrl: sh-pfc: only use dummy states for non-DT platforms
Date: Tue, 29 Mar 2016 13:48:01 +0800
Message-ID: <20160329054801.GB28207@tiger>
References: <1457376072-755-1-git-send-email-wsa@the-dreams.de>
 <CAMuHMdXPH0+YE=cRk7pjvoVEYtEGNcb_83-z5taXSLHRhtgMQA@mail.gmail.com>
 <56DDDE6E.6090908@cogentembedded.com>
 <CAMuHMdWis_knSv0Lgw+8O3LXp9thEX3SdGX6qo_4UyFrxFVuHA@mail.gmail.com>
 <56DDE5CB.60204@cogentembedded.com>
 <CAMuHMdUVFk47u+LPdfh+fq8vvPQAULyM8X_DrizCtrgf-1YwaA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAMuHMdUVFk47u+LPdfh+fq8vvPQAULyM8X_DrizCtrgf-1YwaA@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Wolfram Sang <wsa@the-dreams.de>, linux-renesas-soc@vger.kernel.org, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Kuninori Morimoto <kuninori.morimoto.gx@gmail.com>, Magnus Damm <magnus.damm@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Sascha Hauer <kernel@pengutronix.de>
List-Id: linux-gpio@vger.kernel.org

On Mon, Mar 07, 2016 at 10:00:37PM +0100, Geert Uytterhoeven wrote:
> CC Shawn, Sascha for imx1

Sorry for the late response.

> 
> On Mon, Mar 7, 2016 at 9:34 PM, Sergei Shtylyov
> <sergei.shtylyov@cogentembedded.com> wrote:
> > On 03/07/2016 11:29 PM, Geert Uytterhoeven wrote:
> >
> >>>>> --- a/drivers/pinctrl/sh-pfc/core.c
> >>>>> +++ b/drivers/pinctrl/sh-pfc/core.c
> >>>>> @@ -545,7 +545,9 @@ static int sh_pfc_probe(struct platform_device
> >>>>> *pdev)
> >>>>>                           return ret;
> >>>>>           }
> >>>>>
> >>>>> -       pinctrl_provide_dummies();
> >>>>> +       /* Enable dummy states for those platforms without pinctrl
> >>>>> support */
> >>>>> +       if (!of_have_populated_dt())
> >>>
> >>>
> >>>     I'd considered this condition -- it won't fly on SH where
> >>> CONFIG_OF=n,
> >>> the kernel just won't build IIUC...
> >>
> >>
> >> I haven't tried to compile it yet, but <linux/of.h> does provide a dummy
> >> that
> >> returns false.
> >
> >
> >    Oops, indeed. I missed it. :-(
> >    This approach is better then, won't have to fix again whenever SH gets DT
> > support.
> 
> Perhaps the of_have_populated_dt() check should be moved inside
> pinctrl_provide_dummies()?
> 
> Besides omap2, which has its own check, the only other user is imx1.
> Does imx1 (still) needs this on DT-based platforms?
> 
> (Context for Shawn and Sascha:
>  http://article.gmane.org/gmane.linux.kernel.renesas-soc/1639)

pinctrl_provide_dummies() is only used on a few legacy i.MX platforms
for non-DT boot, so it should be safe to move the check inside the
function from i.MX view.

Shawn
