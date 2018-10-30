From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2] gpio: gpio-mmio: Allow volatile shadow regs
Date: Tue, 30 Oct 2018 13:06:27 +0100
Message-ID: <CACRpkdbzhRMB1gr6CUVdref15v1S5DjHaUxi6=BOYoc3f_ZCrQ@mail.gmail.com>
References: <20181017213012.233957-1-kunyi@google.com> <20181017213012.233957-2-kunyi@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181017213012.233957-2-kunyi@google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: kunyi@google.com
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Tomer Maimon <tmaimon77@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, avifishman70@gmail.com, OpenBMC Maillist <openbmc@lists.ozlabs.org>, Mark Brown <broonie@kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Wed, Oct 17, 2018 at 11:30 PM Kun Yi <kunyi@google.com> wrote:

> Currently the generic GPIO driver stores the direction and data shadow register
> when the driver probes. However, in embedded SOCs the GPIO pins are often
> interleaved with pins muxed to other functions, and pinctrl driver might
> toggle the direction/data register values for these pins. With GPIO
> driver being not the only owner, it should read the shadow registers
> before updating them, otherwise some pin states would be overwritten.
>
> This patch adds a flag BGPIOF_VOLATILE_REG to allow a pinctrl driver that uses
> the generic GPIO interface to indicate the need of read-before-update.
>
> Signed-off-by: Kun Yi <kunyi@google.com>

Hi Kun,

as you see the build robot has problems with the patch, please look
into it.

Architecturally I'm not so sure about this, we are introducing more
and more "shadow registers" and I feel what happens at the end
of the day is that we end up reimplementing regmap-mmio.

Please look into switching gpio-mmio.c to use regmap-mmio
and add more registers based on that.

It might be a bit complex but is a way better way forward for
everyone.

Yours,
Linus Walleij
