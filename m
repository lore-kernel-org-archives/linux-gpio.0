From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: mvebu: Select REGMAP_MMIO now that regmap is used
Date: Mon, 29 May 2017 10:10:28 +0200
Message-ID: <CACRpkdYCbTp3YiHvxWrFsA49orywb1cMFcaDEew1AwjRG61Tpw@mail.gmail.com>
References: <20170524143206.9727-1-gregory.clement@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f181.google.com ([209.85.223.181]:33728 "EHLO
        mail-io0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750880AbdE2IKa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 29 May 2017 04:10:30 -0400
Received: by mail-io0-f181.google.com with SMTP id p24so37410698ioi.0
        for <linux-gpio@vger.kernel.org>; Mon, 29 May 2017 01:10:29 -0700 (PDT)
In-Reply-To: <20170524143206.9727-1-gregory.clement@free-electrons.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Gregory CLEMENT <gregory.clement@free-electrons.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Nadav Haklai <nadavh@marvell.com>, Kostya Porotchkin <kostap@marvell.com>, Neta Zur Hershkovits <neta@marvell.com>, Marcin Wojtas <mw@semihalf.com>, Omri Itach <omrii@marvell.com>, Shadi Ammouri <shadi@marvell.com>

On Wed, May 24, 2017 at 4:32 PM, Gregory CLEMENT
<gregory.clement@free-electrons.com> wrote:

> Since the commit "gpio: mvebu: switch to regmap for register access" the
> driver use the regmap. Explicitly select the REGMAP_MMIO symbol to fix
> build error.
>
> Reported-by: kbuild test robot <fengguang.wu@intel.com>
> Signed-off-by: Gregory CLEMENT <gregory.clement@free-electrons.com>

Patch applied.

Yours,
Linus Walleij
