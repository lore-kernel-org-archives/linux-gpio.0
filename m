From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Subject: Re: [PATCH 15/50] pinctrl: mvebu: Use devm_pinctrl_register() for
 pinctrl registration
Date: Wed, 24 Feb 2016 15:07:16 +0100
Message-ID: <20160224150716.3a2781af@free-electrons.com>
References: <1456319775-3216-1-git-send-email-ldewangan@nvidia.com>
	<1456319775-3216-16-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1456319775-3216-16-git-send-email-ldewangan@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: linus.walleij@linaro.org, corbet@lwn.net, lee@kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com, linux-mediatek@lists.infradead.org, Hongzhou Yang <hongzhou.yang@mediatek.com>, Fabian Frederick <fabf@skynet.be>, Andrew Andrianov <andrew@ncrmnt.org>
List-Id: linux-gpio@vger.kernel.org

Dear Laxman Dewangan,

On Wed, 24 Feb 2016 18:45:40 +0530, Laxman Dewangan wrote:
> Use devm_pinctrl_register() for pin control registration and remove
> need of .remove callback.
> 
> Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Hongzhou Yang <hongzhou.yang@mediatek.com>
> Cc: Fabian Frederick <fabf@skynet.be>
> Cc: Andrew Andrianov <andrew@ncrmnt.org>
> ---
>  drivers/pinctrl/mvebu/pinctrl-armada-370.c | 6 ------
>  drivers/pinctrl/mvebu/pinctrl-armada-375.c | 6 ------
>  drivers/pinctrl/mvebu/pinctrl-armada-38x.c | 6 ------
>  drivers/pinctrl/mvebu/pinctrl-armada-39x.c | 6 ------
>  drivers/pinctrl/mvebu/pinctrl-armada-xp.c  | 6 ------
>  drivers/pinctrl/mvebu/pinctrl-dove.c       | 5 +----
>  drivers/pinctrl/mvebu/pinctrl-kirkwood.c   | 6 ------
>  drivers/pinctrl/mvebu/pinctrl-mvebu.c      | 9 +--------
>  8 files changed, 2 insertions(+), 48 deletions(-)

Reviewed-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
