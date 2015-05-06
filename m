From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 05/10] pinctrl: berlin: use the regmap provided by syscon
Date: Wed, 6 May 2015 16:28:54 +0200
Message-ID: <CACRpkdYA2UmLJZ2iC9QJnQtZVq6b+B+HDSMErbVxdN-878Q_Bg@mail.gmail.com>
References: <1425654328-26298-1-git-send-email-antoine.tenart@free-electrons.com>
	<1425654328-26298-6-git-send-email-antoine.tenart@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1425654328-26298-6-git-send-email-antoine.tenart@free-electrons.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Antoine Tenart <antoine.tenart@free-electrons.com>
Cc: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Jisheng Zhang <jszhang@marvell.com>, zhiming Xu <zmxu@marvell.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Fri, Mar 6, 2015 at 4:05 PM, Antoine Tenart
<antoine.tenart@free-electrons.com> wrote:

> The Berlin pin controller nodes are now sub-nodes of the soc-controller
> and the system-controller nodes. The register bank is managed by syscon,
> which provides a regmap.
>
> Remove the regmap setup from the Berlin pinctrl driver and use the one
> provided by syscon.
>
> Signed-off-by: Antoine Tenart <antoine.tenart@free-electrons.com>

As requested by Sebastian:
Acked-by: Linus Walleij <linus.walleij@linaro.org>

If there are other substantial changes to this driver in this kernel
cycle they will also have to be ACKed and funneled through
Berlin and ARM SoC trees.

Yours,
Linus Walleij
