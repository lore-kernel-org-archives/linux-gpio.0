From: Aaro Koskinen <aaro.koskinen@iki.fi>
Subject: Re: [PATCH 0/8] IOP GPIO refactoring take 2
Date: Fri, 20 Sep 2013 23:58:15 +0300
Message-ID: <20130920205815.GF30568@blackmetal.musicnaut.iki.fi>
References: <1379708226-7802-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from filtteri1.pp.htv.fi ([213.243.153.184]:48048 "EHLO
	filtteri1.pp.htv.fi" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754018Ab3ITU6W (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 20 Sep 2013 16:58:22 -0400
Content-Disposition: inline
In-Reply-To: <1379708226-7802-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, Lennert Buytenhek <kernel@wantstofly.org>, Dan Williams <dan.j.williams@intel.com>, Mikael Pettersson <mikpe@it.uu.se>, Alexandre Courbot <acourbot@nvidia.com>, linux-arm-kernel@lists.infradead.org

Hi,

On Fri, Sep 20, 2013 at 10:17:06PM +0200, Linus Walleij wrote:
> Testing and ACKing appreciated.

I think it looks good now. I applied the patches 1-8 on top of 3.12-rc1,
and Thecus N2100 boots fine and pressing the power button restarts the
system as expected. So for the whole series:

Tested-by: Aaro Koskinen <aaro.koskinen@iki.fi>

Thanks,

A.
