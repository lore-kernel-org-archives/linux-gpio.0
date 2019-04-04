From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/1] gpio: mmio: Fix bgpio_get_set & bgpio_get_set_multiple
Date: Thu, 4 Apr 2019 23:50:31 +0700
Message-ID: <CACRpkdbB16Rq2zok70QDUsNst-iZYFFrRy=cv+38fhz2+Vjbpw@mail.gmail.com>
References: <20190401090942.12408-1-jank@cadence.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190401090942.12408-1-jank@cadence.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jan Kotas <jank@cadence.com>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Mon, Apr 1, 2019 at 4:10 PM Jan Kotas <jank@cadence.com> wrote:

> During my regression testing I noticed the cadence GPIO driver
> fails on the latest gpio for-next tree.
>
> I think the reason is this patch:
> commit 96cd559817f2 ("Merge branch 'devel' into for-next")
>
> Here is a part of the test log:
>
> Loopback 8 -> 24
> TESTING: gpio: 488: output direction PASSED
> TESTING: gpio: 504: input direction PASSED
> TESTING: gpio: 488: 0 PASSED
> TESTING: gpio: 488 -> 504: 0 PASSED
> TESTING: gpio: 488: 1 FAILED
> TESTING: gpio: 488 -> 504: 1 FAILED
> TESTING: gpio: 488: 0 PASSED
> TESTING: gpio: 488 -> 504: 0 PASSED
>
> It looks like the issue is that gc->bgpio_dir has changed its meaning.
> It used to be set to the register value (so it was being inverted).
>
> Now it's always set to 1 for output and 0 for input.
> However the bgpio_get_set functions were not updated.
> So they invert the bit again, which means a wrong register
> is being accessed.
>
> This patch fixes that by removing the unnecessary inversion.
>
> Signed-off-by: Jan Kotas <jank@cadence.com>

Patch applied!

Yours,
Linus Walleij
