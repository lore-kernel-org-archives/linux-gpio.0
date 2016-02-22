From: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Subject: Re: [PATCH 58/61] gpio: wm8350: Use devm_gpiochip_add_data() for
 gpio registration
Date: Mon, 22 Feb 2016 16:29:21 +0000
Message-ID: <20160222162921.GC1490@localhost.localdomain>
References: <1456150130-2668-1-git-send-email-ldewangan@nvidia.com>
 <1456150130-2668-59-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mx0a-001ae601.pphosted.com ([67.231.149.25]:44801 "EHLO
	mx0a-001ae601.pphosted.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751409AbcBVQ36 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>);
	Mon, 22 Feb 2016 11:29:58 -0500
Content-Disposition: inline
In-Reply-To: <1456150130-2668-59-git-send-email-ldewangan@nvidia.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: linus.walleij@linaro.org, gnurou@gmail.com, michael.hennerich@analog.com, corbet@lwn.net, albeu@free.fr, rjui@broadcom.com, shc_work@mail.ru, support.opensource@diasemi.com, swarren@wwwdotorg.org, thierry.reding@gmail.com, bjorn.andersson@sonymobile.com, a.kesavan@samsung.com, gregkh@linuxfoundation.org, catalin.marinas@arm.com, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, patches@opensource.wolfsonmicro.com, bcm-kernel-feedback-list@broadcom.com, linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org

On Mon, Feb 22, 2016 at 07:38:47PM +0530, Laxman Dewangan wrote:
> Use devm_gpiochip_add_data() for GPIO registration and remove the
> need of driver callback .remove.
> 
> Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
> Cc: patches@opensource.wolfsonmicro.com
> ---

Acked-by: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>

Thanks,
Charles
