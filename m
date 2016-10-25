From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: imx: reset group index on probe
Date: Tue, 25 Oct 2016 11:09:56 +0200
Message-ID: <CACRpkdaF8R7_cxNXf8DnEEPtCm=yCmgLti3NRWgzuV5tBbBphw@mail.gmail.com>
References: <20161018210915.31614-1-stefan@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20161018210915.31614-1-stefan@agner.ch>
Sender: linux-kernel-owner@vger.kernel.org
To: Stefan Agner <stefan@agner.ch>
Cc: Shawn Guo <shawnguo@kernel.org>, Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>, Markus Pargmann <mpa@pengutronix.de>, Adrian Alonso <aalonso@freescale.com>, Robin Gong <b38343@freescale.com>, Laxman Dewangan <ldewangan@nvidia.com>, Peng Fan <van.freenix@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Tue, Oct 18, 2016 at 11:09 PM, Stefan Agner <stefan@agner.ch> wrote:

> Group index is incremented on every new group parsed. Since the
> field is part of struct imx_pinctrl_soc_info, which is typically
> a global variable passed by the individual pinctrl-imx.c based
> driver, it does not get cleared automatically when re-probing the
> driver. This lead imx_pinctrl_parse_functions passing a group
> pointer which is outside of the allocated group space on second
> probe and onwards. Typically this ended up in a NULL pointer
> dereference when accessing the name field like this:
> Unable to handle kernel NULL pointer dereference at virtual address 00000000
> ...
> PC is at strcmp+0x18/0x44
> LR is at imx_dt_node_to_map+0xc4/0x290
>
> Avoid this by setting group_index to 0 on probe.
>
> This has been observed when using DEBUG_TEST_DRIVER_REMOVE.
>
> Signed-off-by: Stefan Agner <stefan@agner.ch>

Patch applied for fixes.

Should it be tagged for stable too?

Yours,
Linus Walleij
