From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2] pinctrl: imx: use generic pinctrl helpers for
 managing groups
Date: Mon, 2 Jan 2017 22:41:27 +0100
Message-ID: <CACRpkdbVj-ZpWGzyLU=L0mknhZ0q7qX+sOdcU1pKSgaKKZeVGQ@mail.gmail.com>
References: <20170102182022.2047-1-gary.bisson@boundarydevices.com> <20170102182022.2047-2-gary.bisson@boundarydevices.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170102182022.2047-2-gary.bisson@boundarydevices.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Gary Bisson <gary.bisson@boundarydevices.com>
Cc: Fabio Estevam <fabio.estevam@nxp.com>, ext Tony Lindgren <tony@atomide.com>, Shawn Guo <shawnguo@kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Mon, Jan 2, 2017 at 7:20 PM, Gary Bisson
<gary.bisson@boundarydevices.com> wrote:

> Now using group_desc structure instead of imx_pin_group.
>
> Also leveraging generic functions to retrieve groups count/name/pins.
>
> The imx_free_pingroups function can be removed since it is now handled by
> the core driver during unregister.
>
> Finally the device tree parsing is moved after the pinctrl driver registration
> since this latter initializes the radix trees.
>
> Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>

Patch applied.

Yours,
Linus Walleij
