From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpiolib: Fix potential Spectre v1 vulnerabilities
Date: Fri, 11 Jan 2019 09:39:13 +0100
Message-ID: <CACRpkdbttVUV50oAOO=v6Nw+PQTEqufP+53pZMOPYwX6fmXEiQ@mail.gmail.com>
References: <20181217213430.GA28450@embeddedor>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181217213430.GA28450@embeddedor>
Sender: linux-kernel-owner@vger.kernel.org
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Mon, Dec 17, 2018 at 10:34 PM Gustavo A. R. Silva
<gustavo@embeddedor.com> wrote:

> offset and lineinfo.line_offset are indirectly controlled by user-space,
> hence leading to a potential exploitation of the Spectre variant 1
> vulnerability.
>
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

I don't know what to do with this patch and I am also worried that
it is dangerous and irresponsible to drop it.

I am worried because I simply don't understand the conditions under which
this can be exploited, to what extent, and I am worried that I am sacrificing
performance for security that is not needed on this
performance-critical path, which is why I am asking for performance
effects: I really would like it if someone could take this for a ride
on some x86 system with the mockdev and libgpiod.

It's not like gdev->descs is a secret or contain anything sensitive,
the typical info is just electronic set-up. I get the idea from the commit
message that this is all that may be exposed?

If this can be exploited to expose the whole of kernel memory on the
other hand ("speculation windows are large"), I would be an idiot if I
don't apply it. But then the commit message would say that the entire
memory is at risk?

Yours,
Linus Walleij
