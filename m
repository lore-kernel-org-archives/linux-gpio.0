From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: stm32: add lock mechanism for irqmux selection
Date: Fri, 24 May 2019 17:22:09 +0200
Message-ID: <CACRpkdbJKAGyeBU1tX77-wSYzGXDBqRYR1gQyzOZ_XT4RGFbsw@mail.gmail.com>
References: <1557474183-19719-1-git-send-email-alexandre.torgue@st.com>
 <CACRpkdZ4P=PSCu86p48nBPeVk-h5T0Ytc1CYV3XZGd4fLuJLGw@mail.gmail.com> <ae00fd9c-d25e-c401-4d21-d526a63538f2@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <ae00fd9c-d25e-c401-4d21-d526a63538f2@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandre Torgue <alexandre.torgue@st.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-stm32@st-md-mailman.stormreply.com, Lina Iyer <ilina@codeaurora.org>
List-Id: linux-gpio@vger.kernel.org

On Fri, May 24, 2019 at 2:27 PM Alexandre Torgue
<alexandre.torgue@st.com> wrote:
> On 5/24/19 1:26 PM, Linus Walleij wrote:

> > Patch applied, can't say I fully understand it but you know what
> > you're doing!
>
> Thanks :). Do you need a better explanation ?

What I need to understand for hierarchical interrupt controllers
on GPIO is what I can pull into the gpio library. I am working
to extract some code from drivers/gpio/gpio-ixp4xx.c
to make generic simple hierarchical domain support available,
and Lina is working on generalizing some stuff.

But these complex domain operations in the STM32 seem
to be some special beast.

Yours,
Linus Walleij
