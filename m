From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: Re: [PATCH] gpio: make any OF dependent driver depend on OF_GPIO
Date: Tue, 16 Aug 2016 16:40:54 +0530
Message-ID: <57B2F4BE.6030704@nvidia.com>
References: <1471343157-30076-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from hqemgate16.nvidia.com ([216.228.121.65]:16468 "EHLO
	hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751861AbcHPL1r (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 16 Aug 2016 07:27:47 -0400
In-Reply-To: <1471343157-30076-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
Cc: Rabin Vincent <rabin@rab.in>, Pramod Gurav <pramod.gurav@smartplayin.com>, Andreas Larsson <andreas@gaisler.com>, Gregory CLEMENT <gregory.clement@free-electrons.com>, Thierry Reding <treding@nvidia.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Phil Reid <preid@electromag.com.au>


On Tuesday 16 August 2016 03:55 PM, Linus Walleij wrote:
> The drivers that depend on OF but not OF_GPIO are wreaking havoc
> with the autobuilders for archs that have all requirements for
> OF but not for OF_GPIO, particularly the UM (Usermode) arch does
> not have iomem (NO_IOMEM) which result in configuring GPIOLIB but
> without OF_GPIO which is wrong if the driver is using the .of_node
> of the gpiochip, which only appears with OF_GPIO.
>
> After a brief look at the drivers just depending on OF it seems
> most if not all of them actually require stuff from gpiolib-of so
> the dependency is wrong in the first place.
>
> This simply patches the Kconfig so that all GPIO drivers using OF
> depend on OF_GPIO rather than just OF.
>
>

Acked-by: Laxman Dewangan <ldewangan@nvdia.com>

-----------------------------------------------------------------------------------
This email message is for the sole use of the intended recipient(s) and may contain
confidential information.  Any unauthorized review, use, disclosure or distribution
is prohibited.  If you are not the intended recipient, please contact the sender by
reply email and destroy all copies of the original message.
-----------------------------------------------------------------------------------
