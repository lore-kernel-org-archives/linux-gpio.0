From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 0/3] gpio: Fix VLA removal fallout
Date: Mon, 1 Oct 2018 12:24:18 +0200
Message-ID: <CACRpkdYgX6aMACDdE6yMkur9txQq1hKCMfaLj_+FTg4vg-+Mzw@mail.gmail.com>
References: <20180927113810.30721-1-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180927113810.30721-1-geert+renesas@glider.be>
Sender: linux-kernel-owner@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Laura Abbott <labbott@redhat.com>, Jonathan Corbet <corbet@lwn.net>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, linux-doc@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Thu, Sep 27, 2018 at 1:38 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> This patch series fixes various (mostly harmless) issues introduced by
> commit 3027743f83f867d8 ("gpio: Remove VLA from gpiolib").
>
> As per the "one patch should fix one issue"-policy, this series contains 3
> patches, although they all have the same Fixes: tag.
>
> Changes compared to v1:
>   - Rebase on top of gpio array rework.

Patches applied, thanks Geert!

> W.r.t. propagating errors: while gpiod_set_array_value_complex() and its
> callers can now return an error code, this is currently limited to -ENOMEM.
> Actual failures setting a GPIO output value cannot be propagated, as
> gpio_chip.set() still returns void.  Do you want to change that?
> E.g. gen_74x164_set_value() can fail.

I think we discussed it at one point and said that it's something
we should fix some day, just nobody has got around to do it.

Yours,
Linus Walleij
