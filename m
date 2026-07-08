Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A56113F8EAB;
	Wed,  8 Jul 2026 07:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783496973; cv=none; b=iTMPCw58SD6ftssk+BKnsXLW+ZU6J3wEUZIRTO07lQywe3NCmiJW6CbM5FA9C+0VCGO2cVxXElSZTaRA4ZBxXVRMkJp1SdwGGjmAC5bZ2a/2sit4AsGhRegPj/ASJsdgzz32ekwKAWRiyqQDneh+soeHSmfoeAOMWGdt25v/UjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783496973; c=relaxed/simple;
	bh=Mk083OPOAAfd08lOviDsFpuit5RlNZwp80hUPUoNoMk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QR9zYOIxctu96G0ZAp50lDGm5ZnvA3Vw9hZ3YbkSfuI82CIYp7IVguOaKY6CFeKNWuE97ZsE40ckG+iPWVtWx69WjoaXBcfRLrFhSD7MTEo24CYGn6jOBn0aa+gBdzLymkIOIWGOyKqwtHKBLF8TR8wu3jnrhh8znoTkKlr1vEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=DaFL18/h; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="DaFL18/h"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 4E0154E40CF0;
	Wed,  8 Jul 2026 07:49:12 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 20E8660337;
	Wed,  8 Jul 2026 07:49:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id F3A0A11BC3233;
	Wed,  8 Jul 2026 09:49:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783496951; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=Mk083OPOAAfd08lOviDsFpuit5RlNZwp80hUPUoNoMk=;
	b=DaFL18/hjvSbR+iPd4tEOw8m+VKTK9tluCu18F++DB5/T4entFAyyG7NR/Ha2/ipUU09LN
	PzNww64s3Wcx4fCrRGMcF3PaV5cnhLjplw0mfIJajymRc1VfZZyL82xUBGQFbjxGtHPcde
	8ANkIJ28fcQP/1Z+KZB3NcG7FiutuXkbjEY30We1HMbVpIsbi5twMkGGQkpejb//XbHDUE
	LTCy9YQV5pS8Iy/+h9U9V9Hbjf0WltclcymDqZnP6yNc7k7eJrvKPorHC28/as0D8WEATW
	PhcO1WpElpmyBl/dgcWu9P7JLloCGKH+UY/3YWxanz+zeYjWQfE66SCEE2kRrw==
Message-ID: <b2ee8bf9-de42-441a-97fb-2e42ad882b5e@bootlin.com>
Date: Wed, 8 Jul 2026 09:49:04 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] pinctrl: upboard: add device id INTC1055 based UP
 boards support
To: GaryWang <is0124@gmail.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Daniele Cleri <danielecleri@aaeon.eu>, JunYingLai <junyinglai@aaeon.com.tw>,
 Louis Chen <louischen@aaeon.com.tw>, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260706-upboard-pinctrl-add-upboard-intc1055-support-v4-0-cedce0802d3d@gmail.com>
 <20260706-upboard-pinctrl-add-upboard-intc1055-support-v4-2-cedce0802d3d@gmail.com>
 <65fef790-0e8d-4c29-bbd6-ed6b9dc65fc3@bootlin.com>
 <CANYHO6qfRL-5rJevKrYySai5MoWjNm9xvVOkMVAmt8YN-cZPnQ@mail.gmail.com>
Content-Language: en-US
From: Thomas Richard <thomas.richard@bootlin.com>
In-Reply-To: <CANYHO6qfRL-5rJevKrYySai5MoWjNm9xvVOkMVAmt8YN-cZPnQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Hello Gary,

On 7/7/26 5:55 PM, GaryWang wrote:
> On Tue, Jul 7, 2026 at 7:50 PM Thomas Richard
> <thomas.richard@bootlin.com> wrote:
>>
>> Hello Gary,
>>
>> On 7/6/26 12:36 PM, Gary Wang wrote:
>>> Add support "UP Xtreme i12" and I2C/PWM/UART/SPI pins mapping data.
>>
>> Driver probes successfully on UP Xtreme i12.
>>
>> I tested the IOs:
>> - pwm0 does not work.
> you have to use our pwm kernel module for pwm test, I'll provide later.

Ack

>> - uart1 partially works: TX is okay, but loopback doesn't work. Signal
>> is bad when I add a loopback. Looks like pinctrl misconfig on SoC side.
> uart1 tested ok on our side, if you loop TX/RX do not forget to turn off
> hardware flow control. and we have executed cmd as below to make sure
> direction is set all right.
> echo "uart1_grp uart1" >
> /sys/kernel/debug/pinctrl/upboard-pinctrl/pinmux-select

I did some tests with/without flow control using linux-serial-test tool.

>> - i2c busses are okay.
>> - for SPI, MOSI and CLK are okay, but not CS.
> Do you have enabled spi in BIOS HAT configuration?
> CS0 should be ok, it's SOC defined, CS1 is optional, users can activate low by
> himself before read/write, actually all gpio can be manually used as CS pin.

I applied an ACPI overlay. I'll test it again.

>> - all GPIOs are okay.
>>
>> Could you have a look please.

Anyway these are not related to this patch series.
Thanks for the clarification.

Tested-by: Thomas Richard <thomas.richard@bootlin.com>

Best Regards,
Thomas
