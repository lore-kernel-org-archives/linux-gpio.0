From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH V2 5/5] pinctrl: imx: add imx7ulp driver
Date: Sun, 21 May 2017 17:31:19 +0800
Message-ID: <20170521093118.GN26102@dragon>
References: <1495177545-23006-1-git-send-email-aisheng.dong@nxp.com>
 <1495177545-23006-6-git-send-email-aisheng.dong@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:59786 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750860AbdEUJb5 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sun, 21 May 2017 05:31:57 -0400
Content-Disposition: inline
In-Reply-To: <1495177545-23006-6-git-send-email-aisheng.dong@nxp.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Dong Aisheng <aisheng.dong@nxp.com>
Cc: linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linus.walleij@linaro.org, stefan@agner.ch, ping.bai@nxp.com, fugang.duan@nxp.com, kernel@pengutronix.de

On Fri, May 19, 2017 at 03:05:45PM +0800, Dong Aisheng wrote:
> i.MX 7ULP has three IOMUXC instances: IOMUXC0 for M4 ports,
> IOMUXC1 for A7 ports and IOMUXC DDR for DDR interface.
> 
> This patch adds the IOMUXC1 support for A7.
> It only supports generic pin config.
> 
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Bai Ping <ping.bai@nxp.com>
> Cc: Fugang Duan <fugang.duan@nxp.com>
> Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>

Acked-by: Shawn Guo <shawnguo@kernel.org>
