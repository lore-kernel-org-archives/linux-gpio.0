From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 2/2] Documentation: gpio: Update description for X-Gene standby GPIO controller DTS binding
Date: Fri, 11 Sep 2015 11:35:29 +0200
Message-ID: <11539535.sS04eUgSdg@wuerfel>
References: <1441963332-13329-1-git-send-email-yvo@apm.com> <1441963332-13329-3-git-send-email-yvo@apm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.126.187]:52092 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750847AbbIKJfe (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 11 Sep 2015 05:35:34 -0400
In-Reply-To: <1441963332-13329-3-git-send-email-yvo@apm.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Y Vo <yvo@apm.com>
Cc: linus.walleij@linaro.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Phong Vo <pvo@apm.com>, Toan Le <toanle@apm.com>, Loc Ho <lho@apm.com>, Feng Kan <fkan@apm.com>, Quan Nguyen <qnguyen@apm.com>, Duc Dang <dhdang@apm.com>, patches@apm.com

On Friday 11 September 2015 16:22:12 Y Vo wrote:
>  There are 20 GPIO pins from 0..21. There is no GPIO_DS14 or GPIO_DS15,
> -only GPIO_DS8..GPIO_DS13 support interrupts. The IRQ mapping
> +only GPIO_DS8..GPIO_DS13 support external interrupts. The IRQ mapping
>  is currently 1-to-1 on interrupts 0x28 thru 0x2d.
> +GPIO pins from GPIO_DS8 to GPIO_DS13 are configured as external interrupt
> +by default. If one wish not to use any of these pins as external interrupts,
> +the corresponding interrupt resource for those pins should be removed.

According to this description, I fail to see how one would specify
a missing interrupt for one of the pins that is not the last one in
the list.

	Arnd
