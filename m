Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CAA33BED33
	for <linux-gpio@vger.kernel.org>; Mon, 15 Jun 2026 08:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781510506; cv=none; b=AYL1oCtIPT9sYcXyUHy1RERju9jz9HrLhaGcMtuIAl88Rry9KvvckYYL4otRIIlKa1J0Qsxm37gd5VYSBrKJoSp5A/dQhaHRzzVtv9xGI1MdIhpLxF162GOLLACCuhr4tDl3b6yRm/lrTv+X0lgeiCLKHe5vBxZVclTzMwYM7ZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781510506; c=relaxed/simple;
	bh=dio2YD2WRbBLjuc0JXrnAC2MHwLnPhYUdsE5jmwthaQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SoXNM12RRu8vSGHskDDXm5E8N2fnuRfdTIFpBH91uS1gQz6gEB3QyrQswGLGtipKkEvcRPNIvVLmQbLbjbdbdug6lS4RqBEogXJVLkrsGsRlmQC4fPzB17q4/hbjd9kw3ggtrEkDJM8bkWj++n+WswJze0xRgF0sW4eRdnTbIME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=kxUC0xZp; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="kxUC0xZp"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id BE3E74E42F22;
	Mon, 15 Jun 2026 08:01:40 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8A5C660015;
	Mon, 15 Jun 2026 08:01:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 652A8106C929D;
	Mon, 15 Jun 2026 10:01:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1781510493; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=IFrkftsCJkXAboWXq2P9paFEjGuUUbQSe8YFs1mbcyA=;
	b=kxUC0xZpAydStGi0AcRC7XY/6OBYa0JURrHxYo/hO5ZzKcD1LG/lgve6cqoZfNQrMsnpl4
	SFMPlicZxmG3b2MZj46JmHHH4E7xWb/gTdIHGZKAcoOMNVGayAtLYUn8j5Qua5Or/XFfUQ
	W3j46b59Wkm/bzC40ZMZunsvL8n5o+nYlGtVOP3JH/gChpkgWchlJEzdWEPyrlfpLq1r2y
	bInP+ToTLnRlZcoJF4bHQsvLSPlr10MCokpYFNyEy2K4wPGg0b9KISL8oRTJ8fHIFYLnxZ
	3GJe6Gtk0mxZen8PCxZWA4RZ8az4/2C9DO8YVsDF3Fhf2AYMfu5lxyESeubu2g==
Message-ID: <d6453a9c-d2f1-4aef-8caf-e351c210d6bb@bootlin.com>
Date: Mon, 15 Jun 2026 10:01:25 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] pinctrl: upboard: add device id INTC1055 based UP
 boards support
To: GaryWang <is0124@gmail.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: Daniele Cleri <danielecleri@aaeon.eu>,
 JunYingLai <junyinglai@aaeon.com.tw>, Louis Chen <louischen@aaeon.com.tw>,
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260612-upboard-pinctrl-add-upboard-intc1055-support-v2-0-4111b256c840@gmail.com>
 <20260612-upboard-pinctrl-add-upboard-intc1055-support-v2-2-4111b256c840@gmail.com>
Content-Language: en-US
From: Thomas Richard <thomas.richard@bootlin.com>
In-Reply-To: <20260612-upboard-pinctrl-add-upboard-intc1055-support-v2-2-4111b256c840@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

Hello Gary,

On 6/12/26 12:13 PM, GaryWang wrote:
> Add support "UP Xtreme i12", "UP Squared Pro 7000", "UP Squared i12",
>  "UP 7000" boards and I2C/PWM/UART/SPI pins mapping data.
> 
Reviewed-by: Thomas Richard <thomas.richard@bootlin.com>

Best Regards,
Thomas
