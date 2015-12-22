From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH 37/54] mips: ar7/gpio: Be sure to clamp return value
Date: Tue, 22 Dec 2015 14:05:03 -0800
Message-ID: <5679C90F.7070401@gmail.com>
References: <1450795227-27411-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pa0-f45.google.com ([209.85.220.45]:34410 "EHLO
	mail-pa0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933994AbbLVWFX (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 22 Dec 2015 17:05:23 -0500
Received: by mail-pa0-f45.google.com with SMTP id uo6so18114704pac.1
        for <linux-gpio@vger.kernel.org>; Tue, 22 Dec 2015 14:05:23 -0800 (PST)
In-Reply-To: <1450795227-27411-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, linux-mips@linux-mips.org, Ralf Baechle <ralf@linux-mips.org>
Cc: Alban Bedel <albeu@free.fr>

On 22/12/15 06:40, Linus Walleij wrote:
> As we want gpio_chip .get() calls to be able to return negative
> error codes and propagate to drivers, we need to go over all
> drivers and make sure their return values are clamped to [0,1].
> We do this by using the ret = !!(val) design pattern.
> 
> Cc: linux-mips@linux-mips.org
> Cc: Alban Bedel <albeu@free.fr>
> Cc: Ralf Baechle <ralf@linux-mips.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Acked-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian
