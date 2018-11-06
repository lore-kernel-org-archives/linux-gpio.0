From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [Ksummit-discuss] [TECH TOPIC] SoC maintainer group
Date: Wed, 07 Nov 2018 01:32:59 +0200
Message-ID: <3189677.9XQFCzzJyO@avalon>
References: <CAOesGMgVPsK9YsV2nGoBptWwtHYv=3yMytLx2_tF_ujS5c5p3Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAOesGMgVPsK9YsV2nGoBptWwtHYv=3yMytLx2_tF_ujS5c5p3Q@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: ksummit-discuss@lists.linuxfoundation.org
Cc: Olof Johansson <olof@lixom.net>, rmk@armlinux.org.uk, Kevin Hilman <khilman@kernel.org>, Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Palmer Dabbelt <palmer@sifive.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-gpio@vger.kernel.org, linux-riscv@lists.infradead.org, linux-clk <linux-clk@vger.kernel.org>, Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>
List-Id: linux-gpio@vger.kernel.org

Hi Olof,

On Wednesday, 7 November 2018 00:16:27 EET Olof Johansson wrote:
> Hi KS organizers (and others),
>=20
> This is a late topic proposal, hopefully there is still time on the agend=
a.
>=20
> We=E2=80=99ve recently been discussing some maintainer model changes as
> described below, and would like a slot to discuss the idea and solicit
> feedback/comments from the others there.
>=20
>=20
> This started with Arnd and I finally being in one place at the same
> time, and talking about how we want to evolve arm-soc maintainership
> moving forward. We've been independently thinking of ways to expand
> the group and making it more self-service for everybody, but there's a
> bunch of tooling needed to make it run smoothly beyond the smaller
> group we have now.
>=20
> In the end, we ended up looking at it from a slightly different angle:
> Right now, when contributors show up with new platform support, the
> first hill they need to climb is figuring out how they need to carve
> up their platform among all the various maintainers, how to make sure
> they're all handshaking on keeping things stable, and get code
> submitted. It's awkward, not well documented and one of the biggest
> overheads we have on our side as well.
>=20
> When we started talking to other maintainers, we're also realizing
> that we are currently duplicating a lot of work. In particular, we
> often all get cc:d on patch series, so we all need to read and filter,
> and assume that other maintainers spot the right patches, etc.
>=20
> We have discussed a few different options, and it seems like pooling
> more of the contribution flow to a group of co-maintainers is a useful
> approach. Initially, we're considering the arm-soc platforms, clock
> drivers and pinctrl drivers, which all tend to be affected by new
> platform contributions in this way, and often end up cross-cc:d on
> everything. Additionally, the flow for successfully merging a new
> platform or SoC needs to be documented and advertised. This is true
> whether or not we change the way that maintainers coordinate amongst
> themselves, or whether or not we change the current workflow used by
> platform contributors today.
>=20
> So, we're planning to change things up a bit. We're starting a new
> group that pools current arm-soc, clk and pinctrl drivers and
> maintainers into one funnel. We'll set up a new mail alias for the
> maintainer group, and one shared patchwork to collect contributions.
> We still expect developers to use existing mailing lists, and we still
> expect for example ARM platform maintainers to keep their workflow of
> collecting patches for their platform like they do today. Down the
> road it might make sense to incorporate other driver subsystems as
> well.
>=20
> Beyond this, we're going to keep a close eye on the drm-misc tree,
> which is exploring a move to gitlab (and working with gitlab on adding
> the features they need to move over). If they get a broad maintainer
> model working well in that environment it could be something we reuse
> for ourselves too.

gitlab is an umbrella term that covers many features proposed by the produc=
t.=20
Are there particular features that you already think you would be intereste=
d=20
in, or features that you already know you wouldn't want to use ?

> This group will also take on the responsibility of putting together
> the documentation and expected patch flow for new platform/SoC
> contributors. That documentation will need to evolve a bit over time
> as we try out this new collaboration between maintainers.
>=20
> To avoid an appearance of "ARM is taking over all architectures",
> we'll rename this to just the plain "SoC tree/group", and drop ARM
> from the name. As mentioned already initially we're anticipating
> covering ARM (32/64-bit like before) and RISC-V platform areas in a
> similar way. For other older/minor architectures that are
> semi-orphaned, we might pick up code as needed when it affects us,
> depending on maintainer status at the other end.
>=20
> We're doing the groundwork now, and will get trees/lists/patchworks
> setup for the next release cycle.
>=20
>=20
> People involved so far are:
>=20
> Olof Johansson (arm-soc)
> Arnd Bergmann (arm-soc)
> Kevin Hilman (arm-soc)
> Mike Turquette (clk)
> Stephen Boyd (clk)
> Linus Walleij (pinctrl + more)
> Mike Brown (gpio/regmap + more)
>=20
>=20
> Thanks!
>=20
> -Olof (on behalf of the group)

=2D-=20
Regards,

Laurent Pinchart
