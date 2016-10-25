From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: imx: reset group index on probe
Date: Tue, 25 Oct 2016 11:11:43 +0200
Message-ID: <CACRpkdYcndxqMjTd=z8BpnAh-9AQc46Xg8FzewL423vazigquQ@mail.gmail.com>
References: <20161018210915.31614-1-stefan@agner.ch> <0c13caa8-4966-8cba-3d8b-93166fe2156d@mleia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <0c13caa8-4966-8cba-3d8b-93166fe2156d@mleia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Vladimir Zapolskiy <vz@mleia.com>
Cc: Stefan Agner <stefan@agner.ch>, Shawn Guo <shawnguo@kernel.org>, Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>, Markus Pargmann <mpa@pengutronix.de>, Adrian Alonso <aalonso@freescale.com>, Robin Gong <b38343@freescale.com>, Laxman Dewangan <ldewangan@nvidia.com>, Peng Fan <van.freenix@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Wed, Oct 19, 2016 at 12:40 AM, Vladimir Zapolskiy <vz@mleia.com> wrote:

> I've recently developed a pinctrl driver for the last remaining
> i.MX31 platform from the SoC series (not published yet), it does
> not fit well under any of the 3 existing drivers, and instead
> of adding 1.5K lines of code with half of them almost copy-pasted
> from the rest drivers I started to work on generalization of the
> i.MX/Vybrid pinctrl/pinmux drivers.

That is a noble task.

> This task is large and I'm not sure when I complete and share
> the results, but your change conflicts with one of the changes
> in my backlog... Let me share it with you right now, because it
> deals with info->group_index from another point of view and it
> (unlikely) may have an impact on Vybrid platform, which I can not
> test.

I have to merge this patch to fix an upstream regression
(I guess? No response from mantainers) so I guee you'll have
to rebase your series onto whatever release candidate has it.

Shouldn't be too hard I guess.

Yours,
Linus Walleij
