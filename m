From: Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH 1/2] pinctrl: sunxi: Increase size of regulator array
Date: Fri, 11 Jan 2019 21:46:21 +0800
Message-ID: <CAGb2v67h3W9-aeN+Y62af=g+RjZiKwi_pw-VYstTds7R13ox4g@mail.gmail.com>
References: <20190110082633.6321-1-wens@csie.org> <20190110152632.hdlo3h4e7yzzjtug@flea>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190110152632.hdlo3h4e7yzzjtug@flea>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-gpio@vger.kernel.org, linux-kernel <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Thu, Jan 10, 2019 at 11:26 PM Maxime Ripard
<maxime.ripard@bootlin.com> wrote:
>
> Hi,
>
> On Thu, Jan 10, 2019 at 04:26:32PM +0800, Chen-Yu Tsai wrote:
> > On the A80, the pin banks go up to PN, which translates to the 14th
> > entry in the regulator array. The array is only 12 entries long, which
> > causes the sunxi_pmx_{request,free} functions to access beyond the
> > array on the A80 and the A31 (which has pin bank PM). While the
> > accessed data is still valid allocated data within the same driver
> > data structure, it is likely not a pointer.
> >
> > Increase the size of the regulator array from 12 to 14. This is a simple
> > fix. While we could have the code take into account the fact that R_PIO
> > pin banks start from PL, or maybe even dynamically allocate the array
> > based on the last pin of the pin controller, the size reduction probably
> > isn't worth the additional code complexity.
> >
> > Fixes: 9a2a566adb00 ("pinctrl: sunxi: Deal with per-bank regulators")
> > Signed-off-by: Chen-Yu Tsai <wens@csie.org>
>
> I definitely overlooked the R_PIO case, sorry. I guess the proper fix
> would be the first alternative one you suggested, and we should take
> the pin_base into account. There's no need to store twice such a large
> array for this case.

OK.

I wonder if we should try to get rid of pin_base though, at least as far
as the pinctrl core is concerned. In other words, in our description we'd
still have PL0 == 352, but when the pin is registered, PL0 == 0. This is
OK since each pinctrl device has its own numbering space. And it would
match up with what we use for GPIO.

It would also be better to nail this down one way or the other if we want
to use the gpio-ranges property.

Either way this would be a separate patch.

ChenYu
