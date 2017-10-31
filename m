From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: armada-37xx: Add edge both type gpio irq support
Date: Tue, 31 Oct 2017 13:07:56 +0100
Message-ID: <CACRpkdbqjh5U5QoE_B+7GfSyDdHW-NCAvogGq-2n8j6L6nG-Gw@mail.gmail.com>
References: <20171019131003.9684-1-gregory.clement@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f194.google.com ([209.85.223.194]:52196 "EHLO
        mail-io0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751095AbdJaMH6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 31 Oct 2017 08:07:58 -0400
Received: by mail-io0-f194.google.com with SMTP id b186so34508563iof.8
        for <linux-gpio@vger.kernel.org>; Tue, 31 Oct 2017 05:07:58 -0700 (PDT)
In-Reply-To: <20171019131003.9684-1-gregory.clement@free-electrons.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Gregory CLEMENT <gregory.clement@free-electrons.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Antoine Tenart <antoine.tenart@free-electrons.com>, =?UTF-8?Q?Miqu=C3=A8l_Raynal?= <miquel.raynal@free-electrons.com>, Nadav Haklai <nadavh@marvell.com>, Victor Gu <xigu@marvell.com>, Marcin Wojtas <mw@semihalf.com>, Wilson Ding <dingwei@marvell.com>, Hua Jing <jinghua@marvell.com>, Neta Zur Hershkovits <neta@marvell.com>, Ken Ma <make@marvell.com>

On Thu, Oct 19, 2017 at 3:10 PM, Gregory CLEMENT
<gregory.clement@free-electrons.com> wrote:

> From: Ken Ma <make@marvell.com>
>
> Current edge both type gpio irqs which need to swap polarity in each
> interrupt are not supported, this patch adds edge both type gpio irq
> support.
>
> Signed-off-by: Ken Ma <make@marvell.com>
> Signed-off-by: Gregory CLEMENT <gregory.clement@free-electrons.com>

Patch applied.

The discussion here is interesting, it is customary for GPIO drivers
to implement double-edge detection emulation by swapping the
edge detector around like this.

It might be possible to collect some generic information about
this in the Documentation/gpio/driver.txt document.

Yours,
Linus Walleij
