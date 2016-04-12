From: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Subject: Re: [PATCH 1/2] gpio: wm831x: use the new open drain callback
Date: Tue, 12 Apr 2016 08:59:50 +0100
Message-ID: <20160412075950.GQ31814@localhost.localdomain>
References: <1460446180-16397-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mx0a-001ae601.pphosted.com ([67.231.149.25]:58577 "EHLO
	mx0a-001ae601.pphosted.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S932223AbcDLH7u (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>);
	Tue, 12 Apr 2016 03:59:50 -0400
Content-Disposition: inline
In-Reply-To: <1460446180-16397-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>, patches@opensource.wolfsonmicro.com, Mark Brown <broonie@kernel.org>

On Tue, Apr 12, 2016 at 09:29:40AM +0200, Linus Walleij wrote:
> The WM831x GPIOs clearly have a dedicated open drain control
> register. Implement support for controlling this from GPIO
> descriptor tables or other hardware descriptions such as
> device tree by implementing the .set_single_ended() callback.
> 
> Before this patch, lines requesting open drain will just be
> switched to input mode by the framework, thus emulating open
> drain. But the hardware can do the real thing, so let's
> support that.
> 
> As part of this, rename the debugfs string for output mode
> from "CMOS" to "push-pull" because it is the term used in
> the framework to signify a tomem-pole CMOS output.
> 
> Cc: patches@opensource.wolfsonmicro.com
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---

Acked-by: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>

Thanks,
Charles
