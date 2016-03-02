From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH 44/50] pinctrl: rockchip: Use devm_pinctrl_register() for pinctrl registration
Date: Wed, 02 Mar 2016 22:48:57 +0100
Message-ID: <5977786.QpJVyEjgAu@diego>
References: <1456319775-3216-1-git-send-email-ldewangan@nvidia.com> <1456319775-3216-45-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1456319775-3216-45-git-send-email-ldewangan@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: linus.walleij@linaro.org, corbet@lwn.net, lee@kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com, linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org
List-Id: linux-gpio@vger.kernel.org

Am Mittwoch, 24. Februar 2016, 18:46:09 schrieb Laxman Dewangan:
> Use devm_pinctrl_register() for pin control registration.
> 
> Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
> Cc: Heiko Stuebner <heiko@sntech.de>
> Cc: linux-rockchip@lists.infradead.org

looks good to me

Reviewed-by: Heiko Stuebner <heiko@sntech.de>
