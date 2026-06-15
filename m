Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41F0C3DA5B7;
	Mon, 15 Jun 2026 09:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781516275; cv=none; b=PlZ3hKswzm2KNPEkSKrFxzOVJ1oyygSayT4Im7ZuRRwA134TNmN9q9AeFCgRupCxBEbmrUHau/btNLorF8CWyRH/cG6kdTfgTOndJKDuQrAqcBXxJvoGXKxMsy91yDYchqqdGQ0I0LsNVTuShYzcQvd2/EafBJFYdj3qyQe8Ixc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781516275; c=relaxed/simple;
	bh=7NLGKZJ4ibNQziV+KGRwZz3+lAlEW5aI4YGoryqgWVI=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=HfUjJCtkC9BJapwupliyoVfgLRgz0VGOBEHktdeRrvgaBYXU1hrnCpOZNxn1Fp2IL1/P4fGQYKiMNfSYO9y98iQNREUI/yvCG3KUNGcbD+zuy25CbFUA9gOEe9iwiatzmrb3HPTiBgRa4Pg+bWT7X9GA0ff8a9cS3qVyNieBivM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=RzpWtyhq; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="RzpWtyhq"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 93507C2BB2A;
	Mon, 15 Jun 2026 09:37:54 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 70DDC60015;
	Mon, 15 Jun 2026 09:37:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7E44B106C9443;
	Mon, 15 Jun 2026 11:37:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1781516269; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=3kV7JAYiWEBu8X3hZc5VxgMGHyRgZSWQ4SqGl4X9pLk=;
	b=RzpWtyhqwjaPCkD70ywDEG80OdYTy8ldkLPWJ399L/T/Fn8fzMIO0sk6Qrj8vH3NenOuQO
	BdX8PhJYKR/3WRGdSabiKMwq12tpsOl2nwxPcNOZp4yUWuxxYQkG7x1mHFwMrWXE78Gwg9
	ehBz5t7adjZ7ZxqjfNICxp6mYuJ8XzmsL+Snfvo1asKpEcpKytJD2IUJ9M5C4kUfVjc4N4
	rhm+onMRs/EJb+2+bWhXQuyLZDFK3whl6zM1qNmKJGobr6Ik3Ko8LM4wpm5ZirZWdLzuJb
	C19D714BcS7HYC3FvoE3lDarrz/m+xx6X7Svs/R4jQONyQpC65Vj7zSmYhdGMw==
Message-ID: <cb694725-b3f3-40a3-94c7-0c1606aaea94@bootlin.com>
Date: Mon, 15 Jun 2026 11:37:45 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] pinctrl: upboard: add device id INTC1055 based UP
 boards support
From: Thomas Richard <thomas.richard@bootlin.com>
To: GaryWang <is0124@gmail.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: Daniele Cleri <danielecleri@aaeon.eu>,
 JunYingLai <junyinglai@aaeon.com.tw>, Louis Chen <louischen@aaeon.com.tw>,
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260612-upboard-pinctrl-add-upboard-intc1055-support-v2-0-4111b256c840@gmail.com>
 <20260612-upboard-pinctrl-add-upboard-intc1055-support-v2-2-4111b256c840@gmail.com>
 <d6453a9c-d2f1-4aef-8caf-e351c210d6bb@bootlin.com>
Content-Language: en-US
In-Reply-To: <d6453a9c-d2f1-4aef-8caf-e351c210d6bb@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

Gary,

On 6/15/26 10:01 AM, Thomas Richard wrote:
> Hello Gary,
> 
> On 6/12/26 12:13 PM, GaryWang wrote:
>> Add support "UP Xtreme i12", "UP Squared Pro 7000", "UP Squared i12",
>>  "UP 7000" boards and I2C/PWM/UART/SPI pins mapping data.
>>
> Reviewed-by: Thomas Richard <thomas.richard@bootlin.com>
> 
> Best Regards,
> Thomas

I did test your series on UP Squared Pro 7000 and pinctrl driver does
not probe. Pinctrl device INTC1055:00 does not exist on this board.

[   12.818773] upboard-pinctrl upboard-pinctrl: unknown pinctrl device
INTC1055:00 in map entry, deferring probe
[   12.818795] upboard-pinctrl upboard-pinctrl: error -EPROBE_DEFER:
Failed to select pinctrl
[   12.818801] upboard-pinctrl upboard-pinctrl: Driver upboard-pinctrl
requests probe deferral
[   12.818834] platform upboard-pinctrl: Added to deferred list
[   12.818894] platform upboard-pinctrl: deferred probe pending:
upboard-pinctrl: Failed to select pinctrl

Did you test your series on all boards?

Best Regards,
Thomas
