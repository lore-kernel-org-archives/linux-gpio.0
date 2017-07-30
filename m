From: icenowy@aosc.io
Subject: Re: [PATCH v3 0/2] Last step to working Allwinner R40 pinctrl
Date: Sun, 30 Jul 2017 13:26:46 +0800
Message-ID: <57922ac75d55aef45ae8d09df76418ea@aosc.io>
References: <20170722025054.32645-1-icenowy@aosc.io>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from hermes.aosc.io ([199.195.250.187]:33282 "EHLO hermes.aosc.io"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750738AbdG3F0s (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sun, 30 Jul 2017 01:26:48 -0400
In-Reply-To: <20170722025054.32645-1-icenowy@aosc.io>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Maxime Ripard <maxime.ripard@free-electrons.com>, Chen-Yu Tsai <wens@csie.org>, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-sunxi@googlegroups.com, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org

在 2017-07-22 10:50，Icenowy Zheng 写道：
> This patchset contains only two patches.
> 
> The first one is a minor fix for the A10 pinctrl driver, add a function
> of a pin, which used to be missing in A10/A20 pinctrl driver. Thanks 
> for
> Chen-Yu for discovering it when reviewing my R40 pinctrl patchset.
> 
> The second one is the real R40 pinctrl part, with fixes suggested by
> Chen-Yu and Maxime.
> 
> Icenowy Zheng (2):
>   pinctrl: sunxi: add a missing function of A10/A20 pinctrl driver
>   pinctrl: sunxi: add support of R40 to A10 pinctrl driver

Ping...

Can anyone process this patchset?

> 
>  drivers/pinctrl/sunxi/Kconfig             |   2 +-
>  drivers/pinctrl/sunxi/pinctrl-sun4i-a10.c | 274 
> +++++++++++++++++++++---------
>  2 files changed, 197 insertions(+), 79 deletions(-)
