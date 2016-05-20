From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH] arm64: vulcan: enable GPIOLIB in Kconfig
Date: Fri, 20 May 2016 11:11:20 -0700
Message-ID: <573F5348.6040907@gmail.com>
References: <1461819767-17539-1-git-send-email-kamlakant.patel@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pa0-f65.google.com ([209.85.220.65]:33247 "EHLO
	mail-pa0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750759AbcETSLX (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 20 May 2016 14:11:23 -0400
Received: by mail-pa0-f65.google.com with SMTP id gh9so11650852pac.0
        for <linux-gpio@vger.kernel.org>; Fri, 20 May 2016 11:11:23 -0700 (PDT)
In-Reply-To: <1461819767-17539-1-git-send-email-kamlakant.patel@broadcom.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: kamlakant.patel@broadcom.com, Will Deacon <will.deacon@arm.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, "Jayachandran C ." <jchandra@broadcom.com>, linux-arm-kernel@lists.infradead.org

On 04/27/2016 10:02 PM, kamlakant.patel@broadcom.com wrote:
> From: Kamlakant Patel <kamlakant.patel@broadcom.com>
> 
> Add select GPIOLIB in Kconfig for Broadcom Vulcan ARM64 GPIO driver.
> 
> Signed-off-by: Kamlakant Patel <kamlakant.patel@broadcom.com>

Applied to soc-arm64/next, thanks!
-- 
Florian
