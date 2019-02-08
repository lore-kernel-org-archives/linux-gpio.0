From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2] drivers/gpio/gpio-adp5588.c: add device tree support
Date: Fri, 8 Feb 2019 14:41:03 +0100
Message-ID: <CACRpkdb0Dd_k-a_T94RcJwz89rN75+rGMA=p1yJ8_vwwZJjqQQ@mail.gmail.com>
References: <c1638e5c06be365ad205e4717fd9f226cd1983a2.1549379326.git.nikolaus.voss@loewensteinmedical.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <c1638e5c06be365ad205e4717fd9f226cd1983a2.1549379326.git.nikolaus.voss@loewensteinmedical.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Nikolaus Voss <nv@vosn.de>
Cc: Michael Hennerich <michael.hennerich@analog.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Nikolaus Voss <nikolaus.voss@loewensteinmedical.de>
List-Id: linux-gpio@vger.kernel.org

On Tue, Feb 5, 2019 at 4:17 PM Nikolaus Voss <nv@vosn.de> wrote:

> Make platform data optional and add DT id table.
> Switch to dynamically mapped GPIOs and IRQs if not provided
> via platform data.
>
> Signed-off-by: Nikolaus Voss <nikolaus.voss@loewensteinmedical.de>

Patch applied with Michael's ACK.

Yours,
Linus Walleij
