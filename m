From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH V4 3/7] pinctrl: imx: switch to use the generic pinmux
 property
Date: Thu, 13 Jul 2017 16:43:42 +0800
Message-ID: <20170713084341.GV3172@dragon>
References: <1498046395-30001-1-git-send-email-aisheng.dong@nxp.com>
 <1498046395-30001-4-git-send-email-aisheng.dong@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:43596 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751260AbdGMIoP (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 13 Jul 2017 04:44:15 -0400
Content-Disposition: inline
In-Reply-To: <1498046395-30001-4-git-send-email-aisheng.dong@nxp.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Dong Aisheng <aisheng.dong@nxp.com>
Cc: linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linus.walleij@linaro.org, stefan@agner.ch, ping.bai@nxp.com, fugang.duan@nxp.com, kernel@pengutronix.de

On Wed, Jun 21, 2017 at 07:59:51PM +0800, Dong Aisheng wrote:
> The generic pinmux property seems to be more suitable for IMX.
> So we change to use 'pinmux' instead of 'pins'.
> 
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Bai Ping <ping.bai@nxp.com>
> Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>

Acked-by: Shawn Guo <shawnguo@kernel.org>
