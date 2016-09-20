From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH 00/19] ARM: imx legacy: move peripheral initializations
 to .init_late
Date: Tue, 20 Sep 2016 22:43:51 +0800
Message-ID: <20160920144351.GH3744@tiger>
References: <1474248988-10626-1-git-send-email-vz@mleia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1474248988-10626-1-git-send-email-vz@mleia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Vladimir Zapolskiy <vz@mleia.com>
Cc: Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Guenter Roeck <linux@roeck-us.net>, Linus Walleij <linus.walleij@linaro.org>, Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

On Mon, Sep 19, 2016 at 04:36:28AM +0300, Vladimir Zapolskiy wrote:
> Vladimir Zapolskiy (19):
>   ARM: imx legacy: kzm: move peripheral initialization to .init_late
>   ARM: imx legacy: mx31lite: move peripheral initialization to .init_late
>   ARM: imx legacy: mx31ads: move peripheral initialization to .init_late
>   ARM: imx legacy: mx31lilly: move peripheral initialization to .init_late
>   ARM: imx legacy: pcm037: move peripheral initialization to .init_late
>   ARM: imx legacy: mx31-3ds: move peripheral initialization to .init_late
>   ARM: imx legacy: qong: move peripheral initialization to .init_late
>   ARM: imx legacy: armadillo5x0: move peripheral initialization to .init_late
>   ARM: imx legacy: mx31moboard: move peripheral initialization to .init_late
>   ARM: imx legacy: vpr200: move peripheral initialization to .init_late
>   ARM: imx legacy: imx27-visstrim-m10: move peripheral initialization to .init_late
>   ARM: imx legacy: mx27-3ds: move peripheral initialization to .init_late
>   ARM: imx legacy: mx35-3ds: move peripheral initialization to .init_late
>   ARM: imx legacy: apf9328: move peripheral initialization to .init_late
>   ARM: imx legacy: scb9328: move peripheral initialization to .init_late
>   ARM: imx legacy: pcm043: move peripheral initialization to .init_late
>   ARM: imx legacy: mx21ads: move peripheral initialization to .init_late
>   ARM: imx legacy: mx27ads: move peripheral initialization to .init_late
>   ARM: imx legacy: pca100: move peripheral initialization to .init_late

Applied all, except patch #14 (apf9328) and #15 (scb9328), which are
removed during this development cycle.

Shawn
