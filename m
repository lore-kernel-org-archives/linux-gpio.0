From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH] pinctrl: freescale: imx: fix bogus check of of_iomap()
 return value
Date: Tue, 15 Mar 2016 17:00:04 +0800
Message-ID: <20160315090000.GA28207@tiger>
References: <1457484336-8928-1-git-send-email-vz@mleia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:38492 "EHLO mail.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932386AbcCOJAe (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Tue, 15 Mar 2016 05:00:34 -0400
Content-Disposition: inline
In-Reply-To: <1457484336-8928-1-git-send-email-vz@mleia.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Vladimir Zapolskiy <vz@mleia.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Adrian Alonso <aalonso@freescale.com>, linux-gpio@vger.kernel.org

On Wed, Mar 09, 2016 at 02:45:36AM +0200, Vladimir Zapolskiy wrote:
> On error path of_iomap() returns NULL, hence IS_ERR() check is invalid
> and may cause a NULL pointer dereference, the change fixes this
> problem.
> 
> While we are here invert a device node check to simplify the code.
> 
> Fixes: 26d8cde5260b ("pinctrl: freescale: imx: add shared input select reg support")
> Signed-off-by: Vladimir Zapolskiy <vz@mleia.com>

Acked-by: Shawn Guo <shawnguo@kernel.org>
