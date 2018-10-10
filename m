From: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH 1/4] gpio: Assign gpio_irq_chip::parents to non-stack pointer
Date: Wed, 10 Oct 2018 10:02:27 -0700
Message-ID: <153919094779.119890.4753836996500844280@swboyd.mtv.corp.google.com>
References: <20181008163216.97436-1-swboyd@chromium.org>
 <20181008163216.97436-2-swboyd@chromium.org>
 <CACRpkdaVttmazoVofRn=egUtRRLE9xTz0jnCnTkf7sQWED0v3w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdaVttmazoVofRn=egUtRRLE9xTz0jnCnTkf7sQWED0v3w@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, evgreen@chromium.org, Thierry Reding <treding@nvidia.com>, Grygorii Strashko <grygorii.strashko@ti.com>
List-Id: linux-gpio@vger.kernel.org

Quoting Linus Walleij (2018-10-10 05:05:18)
> On Mon, Oct 8, 2018 at 6:32 PM Stephen Boyd <swboyd@chromium.org> wrote:
> =

> >
> > Let's leave around one unsigned int in the gpio_irq_chip struct for the
> > single parent irq case and repoint the 'parents' array at it. This way
> > code is left mostly intact to setup parents and we waste an extra few
> > bytes per structure of which there should be only a handful in a system.
> >
> > Cc: Evan Green <evgreen@chromium.org>
> > Cc: Thierry Reding <treding@nvidia.com>
> > Cc: Grygorii Strashko <grygorii.strashko@ti.com>
> > Fixes: e0d897289813 ("gpio: Implement tighter IRQ chip integration")
> > Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> =

> OMG critical fix. I fixed up the thing the kbuild robot was complaining
> about with some vanilla kerneldoc and applied for fixes since it's kind
> of urgent.
> =

> Please check the result.
> =


Looks good. Thanks!
