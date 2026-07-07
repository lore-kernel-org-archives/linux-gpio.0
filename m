Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D5412FB969
	for <linux-gpio@vger.kernel.org>; Tue,  7 Jul 2026 11:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783425037; cv=none; b=UoE5ccy0r5jBYjNvG5AmC0Z6d1E3hzRoWIC3X+xvr+gte7gSRqoPuUbXkoXvBTr9+KDNM2ayP9Xs2AwJT7y4AQCkjU3n2yxfoCTAWjEuUGkGh923LfUXrMqX2rDcpzDqCQn4bly/f9Qjexj+XEvOtqC6CfSjdDnrYPmsyqiNfVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783425037; c=relaxed/simple;
	bh=yQi707ZRaSUeL6SHRWhShbHNkEbYALBGCHIrW3FFnYU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l4Y6Q4/JWL4UMX4Jw9AcDqjHrPxPUZK0CTpssjH/IGZHWcLqoG0Hq6dUl/1BsCUxrYI8+30rKt7cVXEclpuBloDaWVaziNbIVMXsbFDMSBdDA0C9IZhQNOQC26WrZ0dwmv7hDduK4OF+Oa3ZLA32rQwGVe7uzDPscN0PUHPjZRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=ulrEKnsb; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="ulrEKnsb"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id C9C464E40CCB;
	Tue,  7 Jul 2026 11:50:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9DC77601A3;
	Tue,  7 Jul 2026 11:50:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CC26511BC0DA0;
	Tue,  7 Jul 2026 13:50:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783425033; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=yQi707ZRaSUeL6SHRWhShbHNkEbYALBGCHIrW3FFnYU=;
	b=ulrEKnsb8Xf5D6beSCNJe84/3pEUNHjETl08B+x9WEOVV3HgBX3yAJSlFmN7kQf6AmYIJT
	7ZrWqvT/b05XroZbmckynKtco632gQVNxm/il/aFpDh8ucbSVQlHS98OUY4OwLokRdYuF0
	cB3r9sYZILNHln1EuHdc+cIIYhZqrdt4dfTll2koBf/ZXpgos+U3SYWOxWcOvBvDU8HnFd
	SnmDiv/GMvHNsPUakrjLN7nkAjxMUBfNjdFwLdtLO7MIYGUJ5l+6f0dezW1iihbsmy067J
	D/UNghpWH/8FdaXoy2xNW0WG3j9N0nviGyIrBh1e2UjbxNQt8rm39+a96/Ystw==
Message-ID: <65fef790-0e8d-4c29-bbd6-ed6b9dc65fc3@bootlin.com>
Date: Tue, 7 Jul 2026 13:50:26 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] pinctrl: upboard: add device id INTC1055 based UP
 boards support
To: Gary Wang <is0124@gmail.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: Daniele Cleri <danielecleri@aaeon.eu>,
 JunYingLai <junyinglai@aaeon.com.tw>, Louis Chen <louischen@aaeon.com.tw>,
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260706-upboard-pinctrl-add-upboard-intc1055-support-v4-0-cedce0802d3d@gmail.com>
 <20260706-upboard-pinctrl-add-upboard-intc1055-support-v4-2-cedce0802d3d@gmail.com>
Content-Language: en-US
From: Thomas Richard <thomas.richard@bootlin.com>
In-Reply-To: <20260706-upboard-pinctrl-add-upboard-intc1055-support-v4-2-cedce0802d3d@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

Hello Gary,

On 7/6/26 12:36 PM, Gary Wang wrote:
> Add support "UP Xtreme i12" and I2C/PWM/UART/SPI pins mapping data.

Driver probes successfully on UP Xtreme i12.

I tested the IOs:
- pwm0 does not work.
- uart1 partially works: TX is okay, but loopback doesn't work. Signal
is bad when I add a loopback. Looks like pinctrl misconfig on SoC side.
- i2c busses are okay.
- for SPI, MOSI and CLK are okay, but not CS.
- all GPIOs are okay.

Could you have a look please.

Best Regards,
Thomas

