From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/2] drivers/gpio/gpio-adp5588.c: switch to events system
Date: Fri, 8 Feb 2019 14:43:00 +0100
Message-ID: <CACRpkdYUCyL6ZE=OgWQd5ps-1s8-Xzm8P-NMfiVCviOm3s3sAg@mail.gmail.com>
References: <c1638e5c06be365ad205e4717fd9f226cd1983a2.1549379326.git.nikolaus.voss@loewensteinmedical.de>
 <3230ace6f820fccadb51097ae9ba9f5ee247d79b.1549379326.git.nikolaus.voss@loewensteinmedical.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <3230ace6f820fccadb51097ae9ba9f5ee247d79b.1549379326.git.nikolaus.voss@loewensteinmedical.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Nikolaus Voss <nv@vosn.de>
Cc: Michael Hennerich <michael.hennerich@analog.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Nikolaus Voss <nikolaus.voss@loewensteinmedical.de>
List-Id: linux-gpio@vger.kernel.org

On Tue, Feb 5, 2019 at 4:17 PM Nikolaus Voss <nv@vosn.de> wrote:

> Interupts were generated using GPIN interrupts of
> ADP5588. These interrupts have two important limitations:
> 1. Interrupts can only be generated for either rising or
>    falling edges but not both.
> 2. Interrupts are reasserted as long as the interrupt condition
>    persists (i.e. high or low level on that GPIN). This generates
>    lots of interrupts unless the event is very short.
>
> To overcome this, ADP5588 provides an event system which queues
> up to 10 events in a buffer. GPIN events are queued whenever the
> GPIN is asserted or deasserted. This makes it possible to support
> generating GPIN interrupts for both edges and to generate only one
> interrupt per state change.
> Thus it is possible to chain the gpio-keys driver for some GPIOs.
>
> Signed-off-by: Nikolaus Voss <nikolaus.voss@loewensteinmedical.de>

Patch applied with Michael's ACK.

Yours,
Linus Walleij
