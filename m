From: Phil Reid <preid@electromag.com.au>
Subject: Re: [PATCH] dt-bindings: gpio: altera: Fix altr,interrupt-type
 property
Date: Tue, 1 Mar 2016 09:22:49 +0800
Message-ID: <56D4EEE9.3060308@electromag.com.au>
References: <1456762997-7607-1-git-send-email-marex@denx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from anchovy3.45ru.net.au ([203.30.46.155]:59144 "EHLO
	anchovy.45ru.net.au" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1750699AbcCABWz (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 29 Feb 2016 20:22:55 -0500
In-Reply-To: <1456762997-7607-1-git-send-email-marex@denx.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Marek Vasut <marex@denx.de>, linux-gpio@vger.kernel.org
Cc: Tien Hock Loh <thloh@altera.com>, Linus Walleij <linus.walleij@linaro.org>

On 1/03/2016 12:23 AM, Marek Vasut wrote:
> The altr,interrupt-trigger property is not used by the driver.
> Instead, altr,interrupt-type is used by the driver and the driver
> does not probe if this property is not specified. Therefore, it
> is expected that there are no users of the -trigger property in
> the wild and that this is a typo in the documentation for the
> altera-pio controller. This patch fixes the typo.
>

On a related note. The Altera QSYS 15.0 device tree tools generate this label this as altr,interrupt_type
Note: '_' instead of '-'.
I've locally patch the driver to look for both names.
Not sure if this is something that should be fixed in the driver or require user to to post process the generated dts.

I haven't reported the issue to Altera either.


-- 
Regards
Phil Reid

