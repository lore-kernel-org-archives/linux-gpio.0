From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH V2 2/5] pinctrl: imx: add generic pin config core support
Date: Sun, 21 May 2017 17:27:45 +0800
Message-ID: <20170521092743.GK26102@dragon>
References: <1495177545-23006-1-git-send-email-aisheng.dong@nxp.com>
 <1495177545-23006-3-git-send-email-aisheng.dong@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:58000 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750961AbdEUJ2X (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sun, 21 May 2017 05:28:23 -0400
Content-Disposition: inline
In-Reply-To: <1495177545-23006-3-git-send-email-aisheng.dong@nxp.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Dong Aisheng <aisheng.dong@nxp.com>
Cc: linux-gpio@vger.kernel.org, fugang.duan@nxp.com, ping.bai@nxp.com, linus.walleij@linaro.org, stefan@agner.ch, kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org

On Fri, May 19, 2017 at 03:05:42PM +0800, Dong Aisheng wrote:
> The design is based on the exist architecture that the core will
> provide a uniformed way to decode the generic pin config into platform
> config register raw data according to the imx_cfg_params_decode maps
> registered by platform.
> 
> Two useful macros, IMX_CFG_PARAMS_DECODE and IMX_CFG_PARAMS_DECODE_INVERT,
> are created for platform to register decode map conveniently.
> 
> In order to cope with some special case, a platform specific fixup()
> function is also available to use.
> 
> Note that rather than fully utilizing the generic pinconf support
> provided by pinctrl core, IMX only adopts the device tree bindings
> of generic pinconf. The config used in .pin_config_get[set] are raw
> register data instead of generic one which makes us align the exist
> using. And that's also why we cannot set pinconf_ops.is_generic.
> 
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Bai Ping <ping.bai@nxp.com>
> Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>

Acked-by: Shawn Guo <shawnguo@kernel.org>
