From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH V4 7/7] pinctrl: pinctrl-imx7ulp: add gpio_set_direction
 support
Date: Thu, 13 Jul 2017 16:46:02 +0800
Message-ID: <20170713084601.GW3172@dragon>
References: <1498046395-30001-1-git-send-email-aisheng.dong@nxp.com>
 <1498046395-30001-8-git-send-email-aisheng.dong@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:43704 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751029AbdGMIqU (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 13 Jul 2017 04:46:20 -0400
Content-Disposition: inline
In-Reply-To: <1498046395-30001-8-git-send-email-aisheng.dong@nxp.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Dong Aisheng <aisheng.dong@nxp.com>
Cc: linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linus.walleij@linaro.org, stefan@agner.ch, ping.bai@nxp.com, fugang.duan@nxp.com, kernel@pengutronix.de, Alexandre Courbot <gnurou@gmail.com>

On Wed, Jun 21, 2017 at 07:59:55PM +0800, Dong Aisheng wrote:
> Add gpio_set_direction support. This makes the driver support
> GPIO input/output dynamically change from userspace.
> 
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Alexandre Courbot <gnurou@gmail.com>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Stefan Agner <stefan@agner.ch>
> Cc: Fugang Duan <fugang.duan@nxp.com>
> Cc: Bai Ping <ping.bai@nxp.com>
> Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>

Acked-by: Shawn Guo <shawnguo@kernel.org>
