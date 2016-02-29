From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH 09/50] pinctrl: imx: Use devm_pinctrl_register() for
 pinctrl registration
Date: Mon, 29 Feb 2016 11:04:25 +0800
Message-ID: <20160229030425.GQ22051@tiger>
References: <1456319775-3216-1-git-send-email-ldewangan@nvidia.com>
 <1456319775-3216-10-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1456319775-3216-10-git-send-email-ldewangan@nvidia.com>
Sender: linux-doc-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: linus.walleij@linaro.org, corbet@lwn.net, lee@kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com, linux-mediatek@lists.infradead.org, Stefan Agner <stefan@agner.ch>, Adrian Alonso <aalonso@freescale.com>, Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
List-Id: linux-gpio@vger.kernel.org

On Wed, Feb 24, 2016 at 06:45:34PM +0530, Laxman Dewangan wrote:
> Use devm_pinctrl_register() for pin control registration and remove
> need of .remove callback.
> 
> Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
> Cc: Shawn Guo <shawnguo@kernel.org>

Acked-by: Shawn Guo <shawnguo@kernel.org>
