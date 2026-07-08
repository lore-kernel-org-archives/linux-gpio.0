Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A1E4451056
	for <linux-gpio@vger.kernel.org>; Wed,  8 Jul 2026 12:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783515334; cv=none; b=nyE72aAaNzl+hXl7M+RblrYoL8cDzpjqmAUo6YgWOhFX8Rik8Bh3450pher5Hm79TngtKv1Siz0sacWEd9joJJBZ0o4Qs2oNcfDhostxRtjLFFmX5u8xwRt8YdrvP2M/+dDkGRQTlVdOpAeypFQmgV9IYfFOdIjFmvN8cKRUkv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783515334; c=relaxed/simple;
	bh=/bFAwiYMv47HhoNWDuEpWJB1RYkUKPdZeomTyJf2lJ0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=muduNsytZpYeOdurmvOkJPfdCZDabe7owXdbrue+s/xKz3bQOt1K5Jg2C/+ykbEtz3C/RJwU0hGIg2YIXaA7+pHpi7n1SmfUeiiB0D4tyvNOHGsoxk/k8zq043TT9MsU4WabW1mr/SOlzyWTO6wZ2y3h6SKUkNqEfILy1vJ4oKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Xyawtce3; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Xyawtce3"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 923314E40CF0;
	Wed,  8 Jul 2026 12:55:30 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5D5BE60339;
	Wed,  8 Jul 2026 12:55:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 72C3A11BC0D0F;
	Wed,  8 Jul 2026 14:55:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783515329; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=faXxrEjfq2X82uM2/vw2iMOqXtkhpsgI4P+WkebPOv0=;
	b=Xyawtce3FWKXPOVvaUJ1fn5Rgxi//nHizIA11+PM3VStSZUDBOIqeY3KFkyGFzhEzJsnEk
	ifO1Wkeg15mu7fy9rcjln/5hPnXExwp/aPY5dbLWIfDjJEkByvGLOFocQ+zVqwaNQFfZgx
	M308QC/fi0OZR456TYCr+5d35nRPGdjy45mhVl1mtea4T+LSuLXU4ibSAlI8Kdk1AAAsUF
	XCrkkn/qtFMqme01CNPObPsNX9IjW9lDp1r0aUS6dznKmMHDKvNhtH0Vbc1ELkf7ML+/O+
	TjZ1Xo1k2jcCOwNFYzdPELdE3T9jwoWW2l/d/f5eqeTazkIE8WlMcBzkFpmjkQ==
Message-ID: <269d40d1-7783-4eca-8cee-3e2001cc6ccc@bootlin.com>
Date: Wed, 8 Jul 2026 14:55:24 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] pinctrl: upboard: add device id INTC1055 based UP
 boards support
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: GaryWang <is0124@gmail.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Daniele Cleri <danielecleri@aaeon.eu>, JunYingLai <junyinglai@aaeon.com.tw>,
 Louis Chen <louischen@aaeon.com.tw>, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260706-upboard-pinctrl-add-upboard-intc1055-support-v4-0-cedce0802d3d@gmail.com>
 <20260706-upboard-pinctrl-add-upboard-intc1055-support-v4-2-cedce0802d3d@gmail.com>
 <65fef790-0e8d-4c29-bbd6-ed6b9dc65fc3@bootlin.com>
 <CANYHO6qfRL-5rJevKrYySai5MoWjNm9xvVOkMVAmt8YN-cZPnQ@mail.gmail.com>
 <b2ee8bf9-de42-441a-97fb-2e42ad882b5e@bootlin.com>
 <CAHp75VcGGC8Z5vGN+RQtSA2N+s9ViH-tHi_BjT-_SWPVVoLQxA@mail.gmail.com>
Content-Language: en-US
From: Thomas Richard <thomas.richard@bootlin.com>
In-Reply-To: <CAHp75VcGGC8Z5vGN+RQtSA2N+s9ViH-tHi_BjT-_SWPVVoLQxA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

On 7/8/26 11:21 AM, Andy Shevchenko wrote:
> On Wed, Jul 8, 2026 at 10:49 AM Thomas Richard
> <thomas.richard@bootlin.com> wrote:
>> On 7/7/26 5:55 PM, GaryWang wrote:
>>> On Tue, Jul 7, 2026 at 7:50 PM Thomas Richard
>>> <thomas.richard@bootlin.com> wrote:
>>>> On 7/6/26 12:36 PM, Gary Wang wrote:
> 
> ...
> 
>>>> I tested the IOs:
>>>> - pwm0 does not work.
>>> you have to use our pwm kernel module for pwm test, I'll provide later.
>>
>> Ack
> 
> Can you, folks, elaborate why this is a requirement and what exactly
> is not working?
> 
>>>> - uart1 partially works: TX is okay, but loopback doesn't work. Signal
>>>> is bad when I add a loopback. Looks like pinctrl misconfig on SoC side.
>>> uart1 tested ok on our side, if you loop TX/RX do not forget to turn off
>>> hardware flow control. and we have executed cmd as below to make sure
>>> direction is set all right.
>>> echo "uart1_grp uart1" >
>>> /sys/kernel/debug/pinctrl/upboard-pinctrl/pinmux-select
>>
>> I did some tests with/without flow control using linux-serial-test tool.
> 
> I'm sorry it's not so clear to me, does it mean the serial interface
> is (still) not properly working or you have done that pinmux
> configuration and everything becomes fine (as Tested-by tag suggests)?
> 
> ...
> 
>>>> - for SPI, MOSI and CLK are okay, but not CS.
>>> Do you have enabled spi in BIOS HAT configuration?
>>> CS0 should be ok, it's SOC defined, CS1 is optional, users can activate low by
>>> himself before read/write, actually all gpio can be manually used as CS pin.
>>
>> I applied an ACPI overlay. I'll test it again.
> 
> I suppose this part is not as critical and I just wonder what the test
> results are.
> 
> ...
> 
>> Anyway these are not related to this patch series.
>> Thanks for the clarification.
>>
>> Tested-by: Thomas Richard <thomas.richard@bootlin.com>
> 
> So, after all, are they all good to go?

Yes,

I tested all functions and it is okay.

It was my fault, my test script did not select pingroup and function
correctly, so FPGA pins were misconfigured.

You can pick my TB tag.

Best Regards,
Thomas

