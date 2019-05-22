From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: stmfx: Fix compile issue when CONFIG_OF_GPIO is
 not defined
Date: Wed, 22 May 2019 23:48:45 +0200
Message-ID: <CACRpkdYmdpwEvCBrL6i1V+Zxd0OSpZmD8BJPSZu9jYNeJkoimQ@mail.gmail.com>
References: <1558338735-8444-1-git-send-email-amelie.delaunay@st.com>
 <20190522054833.GB4574@dell> <eb8425ec-989a-9701-7fee-61bd1d2b93c1@st.com>
 <20190522084133.GF4574@dell> <bc1b5f1d-23b0-141d-f58f-b54ac303fe20@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <bc1b5f1d-23b0-141d-f58f-b54ac303fe20@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Amelie DELAUNAY <amelie.delaunay@st.com>
Cc: Lee Jones <lee.jones@linaro.org>, Alexandre TORGUE <alexandre.torgue@st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-stm32@st-md-mailman.stormreply.com" <linux-stm32@st-md-mailman.stormreply.com>, "kbuild-all@01.org" <kbuild-all@01.org>, Randy Dunlap <rdunlap@infradead.org>
List-Id: linux-gpio@vger.kernel.org

On Wed, May 22, 2019 at 11:21 AM Amelie DELAUNAY <amelie.delaunay@st.com> w=
rote:

> ../drivers/pinctrl/pinctrl-stmfx.c:409:20: error:
> =E2=80=98pinconf_generic_dt_node_to_map_pin=E2=80=99 undeclared here (not=
 in a function)
>    .dt_node_to_map =3D pinconf_generic_dt_node_to_map_pin,
>
> OF_GPIO depends on OF.
>
> So either
>      depends on OF || (OF && COMPILE_TEST)
> or
>      depends on OF || (OF_GPIO && COMPILE_TEST)
>
> and
>
>      select OF_GPIO

I would use just:

depends on OF_GPIO

Because OF_GPIO already depends on OF, and
compile tests will not work without OF_GPIO which
require OF so...

Besides it is what most other GPIO drivers do.

So just keep that one line and drop the rest.

Yours,
Linus Walleij
