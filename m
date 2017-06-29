From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/2] pinctrl: armada-37xx: Fix number of pin in sdio_sb
Date: Thu, 29 Jun 2017 11:45:10 +0200
Message-ID: <CACRpkdbCdpkz9JQRWdYj0qJ=9Qu4mfsCr+WswVb-D1R2dHJL8Q@mail.gmail.com>
References: <20170623122952.9871-1-gregory.clement@free-electrons.com> <20170623122952.9871-3-gregory.clement@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f172.google.com ([209.85.223.172]:36699 "EHLO
        mail-io0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752487AbdF2JpM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 29 Jun 2017 05:45:12 -0400
Received: by mail-io0-f172.google.com with SMTP id z62so3868215ioi.3
        for <linux-gpio@vger.kernel.org>; Thu, 29 Jun 2017 02:45:11 -0700 (PDT)
In-Reply-To: <20170623122952.9871-3-gregory.clement@free-electrons.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Gregory CLEMENT <gregory.clement@free-electrons.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Ken Ma <make@marvell.com>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Stefan Roese <sr@denx.de>, Nadav Haklai <nadavh@marvell.com>, Victor Gu <xigu@marvell.com>, Marcin Wojtas <mw@semihalf.com>, Wilson Ding <dingwei@marvell.com>, Hua Jing <jinghua@marvell.com>, Neta Zur Hershkovits <neta@marvell.com>

On Fri, Jun 23, 2017 at 2:29 PM, Gregory CLEMENT
<gregory.clement@free-electrons.com> wrote:

> The sdio_sb group is composed of 6 pins and not 5.
>
> Reported-by: Ken Ma <make@marvell.com>
> Signed-off-by: Gregory CLEMENT <gregory.clement@free-electrons.com>

Patch applied.

Yours,
Linus Walleij
