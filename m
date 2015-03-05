From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 06/11] pinctrl: berlin: use the regmap provided by syscon
Date: Thu, 5 Mar 2015 10:38:42 +0100
Message-ID: <CACRpkdbb2R9855MybiN5rJUGtfbJsjhBuRZ4tQ9dkCBD0Ockxg@mail.gmail.com>
References: <1423671332-24580-1-git-send-email-antoine.tenart@free-electrons.com>
	<1423671332-24580-7-git-send-email-antoine.tenart@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1423671332-24580-7-git-send-email-antoine.tenart@free-electrons.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Antoine Tenart <antoine.tenart@free-electrons.com>
Cc: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Jisheng Zhang <jszhang@marvell.com>, zhiming Xu <zmxu@marvell.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Wed, Feb 11, 2015 at 5:15 PM, Antoine Tenart
<antoine.tenart@free-electrons.com> wrote:

> The Berlin pin controller nodes are now sub-nodes of the soc-controller
> and the system-controller nodes. The register bank is managed by syscon,
> which provides a regmap.
>
> Remove the regmap setup from the Berlin pinctrl driver and use the one
> provided by syscon.
>
> Signed-off-by: Antoine Tenart <antoine.tenart@free-electrons.com>

Sweet:
Acked-by: Linus Walleij <linus.walleij@linaro.org>

I guess you'll merge this through ARM SoC?

Else tell me if you prefer that I merge it into the pinctrl tree.

Yours,
Linus Walleij
