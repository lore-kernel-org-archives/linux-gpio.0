From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: protected pins and debugfs
Date: Wed, 17 Oct 2018 00:28:18 -0700
Message-ID: <153976129822.5275.14566790707614483813@swboyd.mtv.corp.google.com>
References: <9aec322678417753fe4022691f4bfdbe@codeaurora.org>
 <153897864285.119890.13024399324598460044@swboyd.mtv.corp.google.com>
 <5848ff92c1388b7d6904e88b57bbfec8@codeaurora.org>
 <91594b8e6578d542dc7cbebf34458b0c@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <91594b8e6578d542dc7cbebf34458b0c@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Sodagudi Prasad <psodagud@codeaurora.org>
Cc: bjorn.andersson@linaro.org, linus.walleij@linaro.org, linux-gpio@vger.kernel.org, sboyd@codeaurora.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

Quoting Sodagudi Prasad (2018-10-16 19:00:45)
> On 2018-10-10 12:40, Sodagudi Prasad wrote:
> > On 2018-10-07 23:04, Stephen Boyd wrote:
> >> Quoting Sodagudi Prasad (2018-10-03 05:38:24)
> >>> =

> >>>          for (i =3D 0; i < chip->ngpio; i++, gpio++) {
> >>> +               label =3D gpiochip_is_requested(chip, i);
> >>> +               if (!label)
> >>> +                       continue;
> >>>                  msm_gpio_dbg_show_one(s, NULL, chip, i, gpio);
> >>> -               seq_puts(s, "\n");
> >>>          }
> >>>   }
> >>> =

> >> =

> >> Does something not work with the following code in
> >> msm_gpio_dbg_show_one()?
> >> =

> >> =

> >>         if (!gpiochip_line_is_valid(chip, offset))
> >>              return;
> > =

> > Hi Stephen,
> > I didnt realize that these changes are merged on tip. I was testing on
> > 4.14 kernel.
> > =

> > https://lore.kernel.org/patchwork/patch/878107/
> > https://lore.kernel.org/patchwork/patch/878106/
> > https://lore.kernel.org/patchwork/patch/878109/
> =

> =

> Hi Stephen,
> =

> After checking this further, adding "gpio-reserved-ranges" in not good =

> option. Because of the following reasons.
> 1) These gpio information changes from platform to platform. So need to =

> maintain reserved-range properly for each platform.

This was known. The best approach was to populate this based on what the
firmware chooses to lock down, which didn't seem to change very often
from what I recall being told.

> 2) Also some of the gpio can be changed to secure/protected gpio =

> dynamically based on the use case.

This is new information. How exactly do these pins change dynamically?
Perhaps gpiolib needs to gain more support for the mask to change at
runtime instead of being populated once at boot time from DT.  Seems
like a patch could be written for gpiolib to handle that if it really is
something that needs to be done.

> =

> It looks adding the "gpio-reserved-ranges" ranges is not good option for =

> most of the platforms.
> =

> Can you please check the initial patch suggested in this thread? Please =

> let me know if you have any other options for the above points.
> =


The initial patch in this thread takes a Qualcomm centric approach to
the problem, which probably works just fine, but we would like to push
the solution to problem into the core framework so that other SoCs can
benefit from common code. Please look into handling the runtime swapping
in the gpiolib core so that we don't have a one-off solution for
Qualcomm here.
