From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 0/3] gpio: Fix VLA removal fallout
Date: Thu, 6 Sep 2018 15:01:02 +0200
Message-ID: <CACRpkdZMD-GJUtcSiP30Rb-XAR6OHXZvdmEgOY-CxgauDGvViQ@mail.gmail.com>
References: <20180905090555.9888-1-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180905090555.9888-1-geert+renesas@glider.be>
Sender: linux-kernel-owner@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>, Janusz Krzysztofik <jmkrzyszt@gmail.com>
Cc: Laura Abbott <labbott@redhat.com>, Jonathan Corbet <corbet@lwn.net>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, linux-doc@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

Hi Geert,

Thanks for the patches!

On Wed, Sep 5, 2018 at 11:23 AM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> This patch series fixes various (mostly harmless) issues introduced by
> commit 3027743f83f867d8 ("gpio: Remove VLA from gpiolib").
>
> As per the "one patch should fix one issue"-policy, this series contains 3
> patches, although they all have the same Fixes: tag.
>
> W.r.t. propagating errors: while gpiod_set_array_value_complex() and its
> callers can now return an error code, this is currently limited to -ENOMEM.
> Actual failures setting a GPIO output value cannot be propagated, as
> gpio_chip.set() still returns void.  Do you want to change that?
> E.g. gen_74x164_set_value() can fail.
>
> Feel free to fold patches if deemed appropriate.

What I want to know is if these patches drive a truck through Janusz patch
set augmenting the array functions that I definately also plan to merge for
this kernel cycle.

Issues should be fixed of course, but if some of them already disappear
if I apply Janusz patches, I'd rather postpone ... is it going to be hard
to redo the cleanups on top of his patches?

Yours,
Linus Walleij
