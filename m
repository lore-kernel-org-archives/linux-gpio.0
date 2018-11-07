From: Olof Johansson <olof@lixom.net>
Subject: Re: [TECH TOPIC] SoC maintainer group
Date: Wed, 7 Nov 2018 10:47:24 -0800
Message-ID: <CAOesGMg+jW7SN2+E_FYbwi8GdNhc8KrEsahB-Nn+AseO6kLGXA@mail.gmail.com>
References: <CAOesGMgVPsK9YsV2nGoBptWwtHYv=3yMytLx2_tF_ujS5c5p3Q@mail.gmail.com>
 <20181107171723.GI9919@thunk.org> <CAOesGMheCcvDQCd+7fyh4yOk4BYDfm2QRqsdawqA_fg8s9YYEQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAOesGMheCcvDQCd+7fyh4yOk4BYDfm2QRqsdawqA_fg8s9YYEQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Theodore Tso <tytso@mit.edu>, ksummit <ksummit-discuss@lists.linuxfoundation.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-riscv@lists.infradead.org, linux-clk <linux-clk@vger.kernel.org>, linux-gpio@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Palmer Dabbelt <palmer@sifive.com>, Russell King <rmk@armlinux.org.uk>, Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>, Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Kevin Hilman <khilman@kernel.org>, Stephen Boyd <sboyd@kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Wed, Nov 7, 2018 at 9:35 AM Olof Johansson <olof@lixom.net> wrote:
>
> On Wed, Nov 7, 2018 at 9:17 AM Theodore Y. Ts'o <tytso@mit.edu> wrote:
> >
> > On Tue, Nov 06, 2018 at 02:16:27PM -0800, Olof Johansson wrote:
> > >
> > > Olof Johansson (arm-soc)
> > > Arnd Bergmann (arm-soc)
> > > Kevin Hilman (arm-soc)
> > > Mike Turquette (clk)
> > > Stephen Boyd (clk)
> > > Linus Walleij (pinctrl + more)
> > > Mike Brown (gpio/regmap + more)
> >
> > Could the poeple listed on this list please list potential schedule conflicts?
> >
> > I'm going to assume we should avoid: Andriod uConf, RISC-V uConf,
> > Device Tree uConf.  What are other potential conflicts.  I'm going to
> > guess this might be "interesting" to schedule.  :-)
>
> Yeah, apologies for adding a bunch of cross-coordination this late too.
>
> It's likely going to be conflict-ridden no matter what we do. RISC-V
> and DT are the main conflicts, Android probably has a bit less.
>
> Tuesday afternoon looks least conflict-y when I squint at the
> schedule, or Thursday afternoon (but ideally not overlapping with
> Daniel's DRM/gitlab session).

Ted,

Can we have 3pm-3:30pm on Thursday? It seems relatively low on
embedded-related conflicts and at 3  people would have time to migrate
from Daniel Vetter's gitlab talk if needed.


-Olof
