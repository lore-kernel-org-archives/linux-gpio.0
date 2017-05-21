From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH V2 1/5] pinctrl: imx: fix debug message for
 SHARE_MUX_CONF_REG case
Date: Sun, 21 May 2017 17:27:06 +0800
Message-ID: <20170521092704.GJ26102@dragon>
References: <1495177545-23006-1-git-send-email-aisheng.dong@nxp.com>
 <1495177545-23006-2-git-send-email-aisheng.dong@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:57660 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750961AbdEUJ1o (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sun, 21 May 2017 05:27:44 -0400
Content-Disposition: inline
In-Reply-To: <1495177545-23006-2-git-send-email-aisheng.dong@nxp.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Dong Aisheng <aisheng.dong@nxp.com>
Cc: linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linus.walleij@linaro.org, stefan@agner.ch, ping.bai@nxp.com, fugang.duan@nxp.com, kernel@pengutronix.de

On Fri, May 19, 2017 at 03:05:41PM +0800, Dong Aisheng wrote:
> The original implemented debug message does not work for
> SHARE_MUX_CONF_REG case. This patch fixes it.
> 
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Fixes: bf5a530971af ("pinctrl: imx: add VF610 support to imx pinctrl framework")
> Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>

Acked-by: Shawn Guo <shawnguo@kernel.org>
