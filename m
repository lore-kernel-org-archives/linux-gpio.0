From: Shawn Guo <shawn.guo@linaro.org>
Subject: Re: [PATCH] gpio: gpio-mxs: Remove unneeded dt checks
Date: Wed, 6 Nov 2013 16:30:21 +0800
Message-ID: <20131106083019.GT19770@S2101-09.ap.freescale.net>
References: <1383679282-4599-1-git-send-email-festevam@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-db9lp0251.outbound.messaging.microsoft.com ([213.199.154.251]:8978
	"EHLO db9outboundpool.messaging.microsoft.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753440Ab3KFI3k (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 6 Nov 2013 03:29:40 -0500
Content-Disposition: inline
In-Reply-To: <1383679282-4599-1-git-send-email-festevam@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Fabio Estevam <festevam@gmail.com>
Cc: linus.walleij@linaro.org, linux-gpio@vger.kernel.org, Fabio Estevam <fabio.estevam@freescale.com>

On Tue, Nov 05, 2013 at 05:21:22PM -0200, Fabio Estevam wrote:
> From: Fabio Estevam <fabio.estevam@freescale.com>
> 
> mxs is a devicetree only platform, so there is no need to check whether we
> are in dt or platform data case.
> 
> Signed-off-by: Fabio Estevam <fabio.estevam@freescale.com>

Acked-by: Shawn Guo <shawn.guo@linaro.org>

