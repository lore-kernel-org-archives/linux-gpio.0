Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75B8A35294E;
	Sat,  5 Sep 2026 21:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788645479; cv=none; b=rtLPSP3bHX/lTmfBqK1zcCPBjIaumz/nMFUdV+EheUeil+kzPgUYEbhjMuW3OZBEt1BSuucCEI4TPQetTb2VlQzn4m95m7sthzFTeqIbgeKEcy4H3tbp0LWT4U2FQezII+ng2vA4EdKZzWMbsKjKj//tav/4TltIrIghNuH2Vjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788645479; c=relaxed/simple;
	bh=q84NEA3x0aDjpyI9li2uAbIa6NCpkDoqQonGXkAhVfs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Mv7fYPiIm8B+t1CI4CkCSkrW83T4zDtpGSuEy849KyA/Crv3rM9Ev/gh7O12thLQXUXMsEPr5eYgzR2tR0TT2hU4+yyHd8SZsb7O4Xvy0yopLd3dqCGjCuZFeIR/cvSD2tk0DAEoFuCWNgAGxkJOZLX5hBSjrFSZqkl0JavRi8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=oMhJ2eNG; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="oMhJ2eNG"
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4hcnJL33t7zMlFg;
	Sat, 05 Sep 2026 23:57:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1788645474;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=r4FnuHiiJl3eBze/EI5TJxRoHhPe4LExPSAHaJzB+hc=;
	b=oMhJ2eNGXkThbbPIQlvd4VIF+rmLfLgDRXbQNb6fLNbyMwY4YUPU3TCW0dQhUlTV2xV3Zr
	0JxM/52xHPVMqHuWi8afHM1WRuDheTYmrNdkyZd9JwZNaBTjp1yB1Ux4yUBUbqJEE33Bkz
	vVnHJEEx9wZjnnOm8FA6Lm8q9bRGOSt8EqYQD0bPrY1HC0UTYL3A83kOF/CsMNDYxvn+9t
	omN2uBIOQkBCh3szMxlMIC1KWiPWfI3babT/gqPoW7TXJpsBCP2W3Sa5dQwht3ZQ0JpNgI
	DFk5azKdd6zGRB2XA40LTQINugAvyR/9XnfNIccxlX5qgj9g9I+YAWgCAnLpvg==
Message-ID: <b516bf77-fb15-41f2-80ac-b80c621fedd1@mailbox.org>
Date: Sat, 5 Sep 2026 23:57:51 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 2/2] gpio: rcar: Add R-Car X5H (R8A78000) support
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20260704151521.211335-1-marek.vasut+renesas@mailbox.org>
 <20260704151521.211335-2-marek.vasut+renesas@mailbox.org>
 <CAMuHMdUapaP-8kkWT5cXtEO1h58aAzzm34XqO_mcrgbVSyXEwg@mail.gmail.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <CAMuHMdUapaP-8kkWT5cXtEO1h58aAzzm34XqO_mcrgbVSyXEwg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: 5pf37ffswu93kyg1478yni4fgjiewn91
X-MBO-RS-ID: bf66842bccc08fa0765

On 9/4/26 1:15 PM, Geert Uytterhoeven wrote:

Hello Geert,

>> +++ b/drivers/gpio/gpio-rcar.c
> 
>> @@ -65,14 +66,59 @@ struct gpio_rcar_priv {
>>
>>   #define RCAR_MAX_GPIO_PER_BANK         32
>>
>> +static inline int gpio_rcar_remap_offset(struct gpio_rcar_priv *p, int *offs)
> 
> IMO passing a pointer to offs complicates the code.  Perhaps pass offs
> by value, and return the adjusted offset or a negative error code?

I want to avoid that, since if I only return error value, I can then do 
simple:

ret = gpio_rcar_remap_offset(...);
if (ret)
   return ret;

in gpio_rcar_read() and gpio_rcar_write(), which are the only two call 
sites of this function.

>> +{
>> +       /* R-Car Gen4 and older do not need any offset remap. */
>> +       if (!p->info.has_layout_gen5)
>> +               return 0;
>> +
>> +       /*
>> +        * R-Car Gen5 register layout is slightly different and the offsets
>> +        * that have to be added to or subtracted from each register offset
>> +        * can be divided into five groups, listed below.
>> +        */
>> +       switch (*offs) {
>> +       case IOINTSEL...OUTDT:
>> +               return 0;
>> +       case INDT:
>> +               *offs += 0x10;
>> +               return 0;
>> +       case INTDT...EDGLEVEL:
>> +               fallthrough;
>> +       case BOTHEDGE:
>> +               *offs += 0x70;
>> +               return 0;
>> +       case OUTDTSEL:
>> +               *offs -= 0x34;
>> +               return 0;
>> +       case INEN:
>> +               *offs -= 0x38;
>> +               return 0;
>> +       default:
>> +               /*
>> +                * This here must never be reached, if this is reached, that
>> +                * means there is a catastrophic failure in the driver. Skip
>> +                * any IO read/write to prevent further damage.
>> +                */
>> +               WARN_ON(1);
> 
> A build-time failure would be better.  I tried BUILD_BUG() instead,
> but unfortunately gcc is not smart enough to notice this case is
> never reached.  __always_inline doesn't seem to help either.
I had one more idea -- how about we convert the driver to mmio regmap, 
use opaque register numbers throughout the driver to identify registers 
to the regmap (maybe not a great idea), and then implement .read/.write 
callbacks in the regmap_config which instead of doing plain 
readl()/writel() for register IO would instead do this remapping ? 
Regmap could validate that the opaque register numbers are only the 
expected register numbers and reject all the others. Maybe the opaque 
register numbers could instead of Gen4 register offsets. What do you think ?
