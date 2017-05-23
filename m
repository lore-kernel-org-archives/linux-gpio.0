From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 4/6] gpio: mvebu: allow building driver for Armada 7K/8K
Date: Tue, 23 May 2017 11:21:54 +0200
Message-ID: <CACRpkdZ-gA7Zy0S3md=dO6uJrVpX27uzSKu1ze9YLzJwpNM-iQ@mail.gmail.com>
References: <cover.e10718b9c0f9fdd07327ae14e213be8da5b1f7ef.1495210061.git-series.gregory.clement@free-electrons.com>
 <ed816f275537bf4e0d4557ed53b685b4f3186605.1495210061.git-series.gregory.clement@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f51.google.com ([209.85.214.51]:36823 "EHLO
        mail-it0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1759853AbdEWJV4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 23 May 2017 05:21:56 -0400
Received: by mail-it0-f51.google.com with SMTP id o5so15668054ith.1
        for <linux-gpio@vger.kernel.org>; Tue, 23 May 2017 02:21:56 -0700 (PDT)
In-Reply-To: <ed816f275537bf4e0d4557ed53b685b4f3186605.1495210061.git-series.gregory.clement@free-electrons.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Gregory CLEMENT <gregory.clement@free-electrons.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Rob Herring <robh+dt@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Russell King <rmk+kernel@armlinux.org.uk>, Nadav Haklai <nadavh@marvell.com>, Kostya Porotchkin <kostap@marvell.com>, Neta Zur Hershkovits <neta@marvell.com>, Marcin Wojtas <mw@semihalf.com>, Omri Itach <omrii@marvell.com>, Shadi Ammouri <shadi@ma>

On Fri, May 19, 2017 at 6:09 PM, Gregory CLEMENT
<gregory.clement@free-electrons.com> wrote:

> The mvebu gpio driver can also be used on arm64 mvebu SoC such as the
> Armada 7K/8K. This commit allows to build the driver for them (when only
> ARCH_MVEBU is defined)
>
> Reviewed-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Signed-off-by: Gregory CLEMENT <gregory.clement@free-electrons.com>

Patch applied.

Yours,
Linus Walleij
