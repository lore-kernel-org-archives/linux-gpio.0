From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH V2 3/5] pinctrl: imx: add soc specific mux_mode mask and
 shift property
Date: Sun, 21 May 2017 17:28:05 +0800
Message-ID: <20170521092804.GL26102@dragon>
References: <1495177545-23006-1-git-send-email-aisheng.dong@nxp.com>
 <1495177545-23006-4-git-send-email-aisheng.dong@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:58204 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750961AbdEUJ2n (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sun, 21 May 2017 05:28:43 -0400
Content-Disposition: inline
In-Reply-To: <1495177545-23006-4-git-send-email-aisheng.dong@nxp.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Dong Aisheng <aisheng.dong@nxp.com>
Cc: linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linus.walleij@linaro.org, stefan@agner.ch, ping.bai@nxp.com, fugang.duan@nxp.com, kernel@pengutronix.de

On Fri, May 19, 2017 at 03:05:43PM +0800, Dong Aisheng wrote:
> MX7ULP MUX mode mask and shift bit is different from VF610.
> Let's make it a platform specific property for the later easy of
> adding MX7ULP support.
> 
> One trick in exist code that Vybrid hardcoded the config part
> as 0xffff because its mux_config register BIT[15-0] are all configs
> part. But it's not true in ULP, so use mux_mask instead to address
> the difference.
> 
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Stefan Agner <stefan@agner.ch>
> Cc: Bai Ping <ping.bai@nxp.com>
> Signed-off-by: Fugang Duan <fugang.duan@nxp.com>
> Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>

Acked-by: Shawn Guo <shawnguo@kernel.org>
