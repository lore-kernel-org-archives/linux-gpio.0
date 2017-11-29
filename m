From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: armada-37xx: Fix direction_output() callback behavior
Date: Wed, 29 Nov 2017 14:10:08 +0100
Message-ID: <CACRpkdYKOLi=Z0oKiS-9Wq_WvVLTLYbTbY4sYfDEy770pvAqKA@mail.gmail.com>
References: <20171114165150.19599-1-gregory.clement@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f194.google.com ([209.85.223.194]:38736 "EHLO
        mail-io0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752559AbdK2NKJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 29 Nov 2017 08:10:09 -0500
Received: by mail-io0-f194.google.com with SMTP id d14so3599506ioc.5
        for <linux-gpio@vger.kernel.org>; Wed, 29 Nov 2017 05:10:09 -0800 (PST)
In-Reply-To: <20171114165150.19599-1-gregory.clement@free-electrons.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Gregory CLEMENT <gregory.clement@free-electrons.com>
Cc: linux-gpio@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Antoine Tenart <antoine.tenart@free-electrons.com>, =?UTF-8?Q?Miqu=C3=A8l_Raynal?= <miquel.raynal@free-electrons.com>, Nadav Haklai <nadavh@marvell.com>, Victor Gu <xigu@marvell.com>, Marcin Wojtas <mw@semihalf.com>, Wilson Ding <dingwei@marvell.com>, Hua Jing <jinghua@marvell.com>, Neta Zur Hershkovits <neta@marvell.com>, stable <stable@vger.kernel.org>

On Tue, Nov 14, 2017 at 5:51 PM, Gregory CLEMENT
<gregory.clement@free-electrons.com> wrote:

> The direction_output callback of the gpio_chip structure is supposed to
> set the output direction but also to set the value of the gpio. For the
> armada-37xx driver this callback acted as the gpio_set_direction callback
> for the pinctrl.
>
> This patch fixes the behavior of the direction_output callback by also
> applying the value received as parameter.
>
> Cc: stable@vger.kernel.org
> Fixes: 5715092a458c ("pinctrl: armada-37xx: Add gpio support")
> Reported-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
> Signed-off-by: Gregory CLEMENT <gregory.clement@free-electrons.com>

Patch applied for fixes.

Sorry for taking so long, merge window you know.

Yours,
Linus Walleij
