From: Vignesh R <vigneshr@ti.com>
Subject: Re: [PATCH] gpio: pca953x: Fix NBANK calculation for PCA9536
Date: Mon, 13 Jun 2016 14:34:04 +0530
Message-ID: <575E7704.5090503@ti.com>
References: <20160609053204.32398-1-vigneshr@ti.com>
 <CACRpkdYZEbefjr-iHT3yahkBovFuE2Ofvr8_Mr+X++pJSVwzfA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from comal.ext.ti.com ([198.47.26.152]:46686 "EHLO comal.ext.ti.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1161137AbcFMJEJ (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Mon, 13 Jun 2016 05:04:09 -0400
In-Reply-To: <CACRpkdYZEbefjr-iHT3yahkBovFuE2Ofvr8_Mr+X++pJSVwzfA@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>



On Monday 13 June 2016 12:52 PM, Linus Walleij wrote:
> On Thu, Jun 9, 2016 at 7:32 AM, Vignesh R <vigneshr@ti.com> wrote:
> 
>> NBANK() macro assumes that ngpios is a multiple of 8(BANK_SZ) and
>> hence results in 0 banks for PCA9536 which has just 4 gpios. This is
>> wrong as PCA9356 has 1 bank with 4 gpios. This results in uninitialized
>> PCA953X_INVERT register. Fix this by using DIV_ROUND_UP macro in
>> NBANK().
>>
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Vignesh R <vigneshr@ti.com>
> 
> Patch applied.
> 
> Is this really a regression or affecting systems in development?
> 
> Which machine/device tree makes this problematic?
> 

I observed this on am335x-icev2 evm which is system in development.
Basically, variable with uninitialized value (junk) gets written to
PCA953X_INVERT register(in device_pca953x_init()) causing driver to
report wrong gpio pin status. So, this bug will affect any platform with
PCA9536 chip. Quick grep on arch/*/boot/dts/ folder shows one platform
already using pca9536 chip. Hence, I added Cc to stable kernel.

-- 
Regards
Vignesh
