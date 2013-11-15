From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH 2/2] ARM: pxa: delete the custom GPIO header
Date: Fri, 15 Nov 2013 12:45:22 +0000
Message-ID: <20131115124522.GA1913@n2100.arm.linux.org.uk>
References: <1380183077-27407-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from caramon.arm.linux.org.uk ([78.32.30.218]:42895 "EHLO
	caramon.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751363Ab3KOMpk (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 15 Nov 2013 07:45:40 -0500
Content-Disposition: inline
In-Reply-To: <1380183077-27407-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, Haojian Zhuang <haojian.zhuang@marvell.com>, Alexandre Courbot <acourbot@nvidia.com>, linux-arm-kernel@lists.infradead.org, Eric Miao <eric.y.miao@gmail.com>

On Thu, Sep 26, 2013 at 10:11:17AM +0200, Linus Walleij wrote:
> The PXA sub-architecture appears to have a custom <mach/gpio.h>
> for no reason whatsoever. The file became completely empty
> after Haojian removed the remaining content in
> commit 157d2644cb0c1e71a18baaffca56d2b1d0ebf10f
> "ARM: pxa: change gpio to platform device".
> 
> That commit added these two lines:
> 
> However it seems like deleting the file has no effect
> whatsoever on the kernel compilation.

This has broken pxa25x_udc - it seems that it was using this path to get
hold of mach/hardware.h, and now that it doesn't have that, it gets lots
of build errors.
