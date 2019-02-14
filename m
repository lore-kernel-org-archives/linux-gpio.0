From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH -next 2/3] mfd: pm8xxx: select IRQ_DOMAIN_HIERARCHY in Kconfig
Date: Thu, 14 Feb 2019 10:02:24 +0100
Message-ID: <CACRpkda3HxVqNdmk7iRrhvafvkCX=JtxqVyNGO5kmo05MSDN+g@mail.gmail.com>
References: <20190214013641.9740-1-masneyb@onstation.org> <20190214013641.9740-2-masneyb@onstation.org>
 <CACRpkdbYiwu6Bbd6uMaWUc2AzDZPve5_bq=_9RwRhadaMBf+dQ@mail.gmail.com> <20190214085106.GJ1863@dell>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190214085106.GJ1863@dell>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: Brian Masney <masneyb@onstation.org>, Stephen Boyd <sboyd@kernel.org>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, linux-arm-msm@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Thu, Feb 14, 2019 at 9:51 AM Lee Jones <lee.jones@linaro.org> wrote:
> On Thu, 14 Feb 2019, Linus Walleij wrote:
> > On Thu, Feb 14, 2019 at 2:36 AM Brian Masney <masneyb@onstation.org> wrote:
> >
> > > Select IRQ_DOMAIN_HIERARCHY for pm8xxx in Kconfig since this driver uses
> > > the version 2 IRQ interfaces. IRQ_DOMAIN_HIERARCHY selects IRQ_DOMAIN,
> > > so it can be removed from here.
> > >
> > > Signed-off-by: Brian Masney <masneyb@onstation.org>
> > > ---
> > > Linus: For your ib-qcom-ssbi branch.
> >
> > OK applied it there (might fold it in with the original patch, let's see).
>
> Ah, we're applying patches from different SS without Acks now? ;)

Yeah when fixing onelined bugs I tend to do that sometimes,
usually better to ask forgiveness than permission if -next is broken.

> FWIW:
>
>   Acked-by: Lee Jones <lee.jones@linaro.org>

OK folding it in!

Yours,
Linus Walleij
