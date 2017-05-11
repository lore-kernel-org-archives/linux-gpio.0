From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v5 1/1] pinctrl: armada-37xx: Add irqchip support
Date: Thu, 11 May 2017 09:34:21 +0200
Message-ID: <CACRpkdb3iM4VUhwrH7GORtNRmQbaMCQ8s72VBWdghhXEXMtPsQ@mail.gmail.com>
References: <cover.5e6e6649efd7d0482a5df17fb7f94fde29a54210.1493387770.git-series.gregory.clement@free-electrons.com>
 <e7e0d7156844933efe5fdb997afa4cdca1ea6ec4.1493387770.git-series.gregory.clement@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <e7e0d7156844933efe5fdb997afa4cdca1ea6ec4.1493387770.git-series.gregory.clement@free-electrons.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Gregory CLEMENT <gregory.clement@free-electrons.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Nadav Haklai <nadavh@marvell.com>, Victor Gu <xigu@marvell.com>, Marcin Wojtas <mw@semihalf.com>, Wilson Ding <dingwei@marvell.com>, Hua Jing <jinghua@marvell.com>, Neta Zur Hershkovits <neta@marvell.com>
List-Id: linux-gpio@vger.kernel.org

On Fri, Apr 28, 2017 at 4:01 PM, Gregory CLEMENT
<gregory.clement@free-electrons.com> wrote:

> The Armada 37xx SoCs can handle interrupt through GPIO. However it can
> only manage the edge ones.
>
> The way the interrupt are managed is classical so we can use the generic
> interrupt chip model.
>
> The only unusual "feature" is that many interrupts are connected to the
> parent interrupt controller. But we do not take advantage of this and use
> the chained irq with all of them.
>
> Signed-off-by: Gregory CLEMENT <gregory.clement@free-electrons.com>

Patch applied for v4.13.

Yours,
Linus Walleij
