From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 6/6] ARM64: dts: marvell: armada37xx: add pinctrl definition
Date: Fri, 30 Dec 2016 10:00:16 +0100
Message-ID: <CACRpkdZwAY-1c+ZkDhrWn-pov6OX3idHNzC6Kq86oit9cL3SeQ@mail.gmail.com>
References: <20161222172501.16121-1-gregory.clement@free-electrons.com> <20161222172501.16121-7-gregory.clement@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qt0-f172.google.com ([209.85.216.172]:33488 "EHLO
        mail-qt0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752168AbcL3JAR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 30 Dec 2016 04:00:17 -0500
Received: by mail-qt0-f172.google.com with SMTP id p16so387803623qta.0
        for <linux-gpio@vger.kernel.org>; Fri, 30 Dec 2016 01:00:17 -0800 (PST)
In-Reply-To: <20161222172501.16121-7-gregory.clement@free-electrons.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Gregory CLEMENT <gregory.clement@free-electrons.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Nadav Haklai <nadavh@marvell.com>, Victor Gu <xigu@marvell.com>, Omri Itach <omrii@marvell.com>, Marcin Wojtas <mw@semihalf.com>, Wilson Ding <dingwei@marvell.com>, Hua Jing <jinghua@marvell.com>, Terry Zhou <bjzhou@marvell.com>

On Thu, Dec 22, 2016 at 6:25 PM, Gregory CLEMENT
<gregory.clement@free-electrons.com> wrote:

> Start to populate the device tree of the Armada 37xx with the pincontrol
> configuration used on the board providing a dts.
>
> Signed-off-by: Gregory CLEMENT <gregory.clement@free-electrons.com>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

>  arch/arm64/boot/dts/marvell/armada-3720-db.dts |  8 +++++++

Maybe you want to take this opportunity to add gpio-line-names = ...;
to the armada 3720 pinctrl/gpiochip nodes?

Yours,
Linus Walleij
