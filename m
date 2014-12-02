From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] gpio: fix deferred probe detection for legacy API
Date: Tue, 2 Dec 2014 15:48:42 +0100
Message-ID: <CACRpkdbF_KbH38Tv3pixcftB6V5sNXMFR3kDeRDXkDEZmz-ATA@mail.gmail.com>
References: <1417527724-24960-1-git-send-email-acourbot@nvidia.com>
	<1417529705-1515-1-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1417529705-1515-1-git-send-email-acourbot@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>
List-Id: linux-gpio@vger.kernel.org

On Tue, Dec 2, 2014 at 3:15 PM, Alexandre Courbot <acourbot@nvidia.com> wrote:

> Commit 14e85c0e69d5 ("gpio: remove gpio_descs global array") changed
> gpio_to_desc()'s behavior to return NULL not only for GPIOs numbers
> not in the valid range, but also for all GPIOs whose controller has not
> been probed yet. Although this behavior is more correct (nothing hints
> that these GPIO numbers will be populated later), this affects
> gpio_request() and gpio_request_one() which call gpiod_request() with a
> NULL descriptor, causing it to return -EINVAL instead of the expected
> -EPROBE_DEFER for a non-probed GPIO.
>
> gpiod_request() is only called with a descriptor obtained from
> gpio_to_desc() from these two functions, so address the issue there.
>
> Other ways to obtain GPIOs rely on well-defined mappings and can thus
> return -EPROBE_DEFER only for relevant GPIOs, and are thus not affected
> by this issue.
>
> Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---
> v2:

OK threw out v1 and applied this instead.

Yours,
Linus Walleij
