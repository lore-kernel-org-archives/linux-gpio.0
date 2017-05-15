From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH 5/5] pinctrl: imx: fix debug message for
 SHARE_MUX_CONF_REG case
Date: Mon, 15 May 2017 20:05:56 +0800
Message-ID: <20170515120555.GR8471@dragon>
References: <1494592686-30967-1-git-send-email-aisheng.dong@nxp.com>
 <1494592686-30967-7-git-send-email-aisheng.dong@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:45046 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1755042AbdEOMGa (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 15 May 2017 08:06:30 -0400
Content-Disposition: inline
In-Reply-To: <1494592686-30967-7-git-send-email-aisheng.dong@nxp.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Dong Aisheng <aisheng.dong@nxp.com>
Cc: linux-gpio@vger.kernel.org, fugang.duan@nxp.com, ping.bai@nxp.com, linus.walleij@linaro.org, stefan@agner.ch, kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org

On Fri, May 12, 2017 at 08:38:06PM +0800, Dong Aisheng wrote:
> The original implemented debug message does not work for
> SHARE_MUX_CONF_REG case. This patch fixes it.
> 
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Fixes: bf5a530971af ("pinctrl: imx: add VF610 support to imx pinctrl framework")
> Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>

Fixes should go first in a patch series.

Shawn
