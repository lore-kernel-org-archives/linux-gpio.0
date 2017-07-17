From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH] pinctrl: zte: fix 'functions' allocation in
 zx_pinctrl_build_state()
Date: Mon, 17 Jul 2017 17:46:24 +0800
Message-ID: <20170717094622.GE3172@dragon>
References: <1500212008-29321-1-git-send-email-shawnguo@kernel.org>
 <20170717080221.gqf7xgeo2zqgigdq@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:50978 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751265AbdGQJqs (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 17 Jul 2017 05:46:48 -0400
Content-Disposition: inline
In-Reply-To: <20170717080221.gqf7xgeo2zqgigdq@mwanda>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Baoyou Xie <xie.baoyou@sanechips.com.cn>, Xin Zhou <zhou.xin8@sanechips.com.cn>, Jun Nie <jun.nie@linaro.org>, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Shawn Guo <shawn.guo@linaro.org>

On Mon, Jul 17, 2017 at 11:02:21AM +0300, Dan Carpenter wrote:
> Shouldn't there be a free if the remove function?  I'm not even sure
> where the remove function is so I don't know.

As the pinctrl driver is essential for the platform, it's always a
builtin_platform_driver which we do not even have a remove function.

Shawn
