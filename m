From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: remove gpio_ensure_requested()
Date: Thu, 24 Jul 2014 18:21:12 +0200
Message-ID: <CACRpkdaLokvZwb_tPdj21iF25AOJ_K6gWA5QK_VVz2Z4U9stkA@mail.gmail.com>
References: <1406181062-29596-1-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1406181062-29596-1-git-send-email-acourbot@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>
List-Id: linux-gpio@vger.kernel.org

On Thu, Jul 24, 2014 at 7:51 AM, Alexandre Courbot <acourbot@nvidia.com> wrote:

> gpio_ensure_requested() has been introduced in Feb. 2008 by commit
> d2876d08d86f2 to force users of the GPIO API to explicitly request GPIOs
> before using them.
>
> Hopefully by now all GPIOs are correctly requested and this extra check
> can be omitted ; in any case the GPIO maintainers won't feel bad if
> machines start failing after 6 years of warnings.
>
> This patch removes that function from the dark ages.
>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>

Hm you took the opportunity to also refactor the debounce ops
to static inlines, I see why though so patch applied!

Yours,
Linus Walleij
