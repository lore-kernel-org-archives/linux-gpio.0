From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpiolib: Fix potential Spectre v1 vulnerabilities
Date: Mon, 17 Dec 2018 23:09:47 +0100
Message-ID: <CACRpkdYTKZo8jvwMFKh_j17KXNetz=-qHmLd+Y380rNMV6VMeg@mail.gmail.com>
References: <20181217213430.GA28450@embeddedor>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181217213430.GA28450@embeddedor>
Sender: linux-kernel-owner@vger.kernel.org
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>, Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Mon, Dec 17, 2018 at 10:34 PM Gustavo A. R. Silva
<gustavo@embeddedor.com> wrote:

> offset and lineinfo.line_offset are indirectly controlled by user-space,
> hence leading to a potential exploitation of the Spectre variant 1
> vulnerability.

Goodness gracious me!

> This issue was detected with the help of Smatch:
>
> drivers/gpio/gpiolib.c:580 linehandle_create() warn: potential spectre issue 'gdev->descs' [r] (local cap)
> drivers/gpio/gpiolib.c:927 lineevent_create() warn: potential spectre issue 'gdev->descs' [r] (local cap)
> drivers/gpio/gpiolib.c:1053 gpio_ioctl() warn: potential spectre issue 'gdev->descs' [r] (local cap)
>
> Fix this by sanitizing both offset and lineinfo.line_offset before
> using them to index gdev->descs.
>
> Notice that given that speculation windows are large, the policy is
> to kill the speculation on the first load and not worry if it can be
> completed with a dependent load/store [1].
>
> [1] https://marc.info/?l=linux-kernel&m=152449131114778&w=2
>
> Cc: stable@vger.kernel.org
> Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>

Bartosz can you take this for a ride with libgpiod and see if we get
performance regressions from this speculation killing?

If you get some data on that I would like to include it with
the changelog.

Yours,
Linus Walleij
