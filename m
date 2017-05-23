From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCHv3 00/14] mcp23s08 pinconf & cleanup
Date: Tue, 23 May 2017 09:55:23 +0200
Message-ID: <CACRpkdYUrLwgTw8LZu4d315XkoUQ7RPYmUS1ekGYxMDPcR-WBQ@mail.gmail.com>
References: <20170515092438.13076-1-sebastian.reichel@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170515092438.13076-1-sebastian.reichel@collabora.co.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Sebastian Reichel <sebastian.reichel@collabora.co.uk>
Cc: Sebastian Reichel <sre@kernel.org>, Steven Miao <realmz6@gmail.com>, Vladimir Zapolskiy <vz@mleia.com>, Sylvain Lemieux <slemieux.tyco@gmail.com>, Enric Balletbo i Serra <enric.balletbo@collabora.co.uk>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, adi-buildroot-devel@lists.sourceforge.net, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Mon, May 15, 2017 at 11:24 AM, Sebastian Reichel
<sebastian.reichel@collabora.co.uk> wrote:

> Here is a rebase of my PATCHv2 in combination with the second patchset, which
> migrates to regmap based register caching. I also added a few more patches, that
> do misc. cleanups in the driver and remove ~100 loc (that's 10%).
>
> The first patch and the 12th patch ("simplify spi_present_mask handling") needs
> Acked-by from Steven Miao for the blackfin architecture changes (defconfig, two
> boardfiles) and from Vladimir Zapolskiy or Sylvain Lemieux for the lpc32xx_defconfig
> changes.

I have applied all patches to the mcp23s08 branch in the pinctrl tree:
https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git/

I have also merged this branch to devel and into the GPIO devel
branch for testing in linux-next.

I assume the blackfin maintainers are not upset, else they can say
so, an explicit ACK would be nice :)

Hats off for this very nice patch set, please test it in linux-next as
it trickles in there.

Yours,
Linus Walleij
