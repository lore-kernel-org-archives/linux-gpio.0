Received: from mx.adeep.su (mx.adeep.su [185.250.0.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D96D3E715E;
	Tue, 30 Jun 2026 09:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.250.0.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782811243; cv=none; b=l8/vFidYr9SjDtlGZ6Snux4UWtU7vGrDvqzJkUA0hZ6nKY3yZK6XrTuqeDkaWseS98CIITk9YBShJJj9EA3EqfzHGdCEbI2OowORkwYvcNOUuxVU35TQIX1LbXKfa/VEfiUm+u2VlcTjQi48ySj0DWjARSIF8gNAAh+7Q2HQ4vo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782811243; c=relaxed/simple;
	bh=uMWyAXqP3phmmOTg+BKzpsMTXJ5dnVuzUfHOfIBTI+Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PlDIxlmYOJs76UjPBQJrXSrx28k/oexETw15RVyjC/4Bayi1gzwLUJMrgDN9uCuFr62wi5hkacOezTk86I181LY+j8IwSRYr3GlptL5ZJhqfXPXN2J7G9FCAGNSFDXqwBNtlxXJisdnAdBsrzm6eMhlBV+ybvjuTm0WSyfvZw04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=baodeep.com; spf=pass smtp.mailfrom=baodeep.com; dkim=fail (2048-bit key) header.d=baodeep.com header.i=@baodeep.com header.b=c41trpg9 reason="signature verification failed"; arc=none smtp.client-ip=185.250.0.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=baodeep.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baodeep.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baodeep.com header.i=@baodeep.com header.b="c41trpg9"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0200C1CB1C0;
	Tue, 30 Jun 2026 12:20:24 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=baodeep.com; s=dkim;
	t=1782811230; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=+b12GfQ8In3o4ovjul5sBZbhYkFtSmsBEzRp61e6vmg=;
	b=c41trpg9FwCyH/Bhr0WpgflKpMSuo4ZMhShALqn7X/iaJeIVZ25Pee4Mgph7HO8HwfXQ0o
	OpVm+We7kMtlm6TX2Bvg8cenRxUXl/daSYdhhas7CmpED9goK6paeKeiCiCAkO2T/gk+Bx
	9/W/mOfO/EuqEn3DYSuxFOhoojF+MPldKOyiL3d98bn2j5Ll353kIFNY2qmjpjlHzj0oBb
	9raO6C0WxXUdWFf1Fh127vdvGLBPOLVMkjRuqvi8d5W4nZPZlu7TG7Tu0oca3W5r+LM+9E
	Mhs0G7LCI+zG5UwKJ7TFp9ynjIC9ewBN5n/fTb3GWuMWoQfGelD2XnSN1h3DIg==
Message-ID: <1877bda5-8724-4de8-8898-a7730344bdc9@baodeep.com>
Date: Tue, 30 Jun 2026 12:20:08 +0300
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] gpio: shared-proxy: always serialize with a
 sleeping mutex
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Diederik de Haas <diederik@cknow-tech.com>, linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, Linus Walleij <linusw@kernel.org>
References: <20260625115718.1678991-1-v@baodeep.com>
 <20260625115718.1678991-2-v@baodeep.com>
 <CAMRc=McgB0gYfvE1KMXkNFnMgx6ahKoMFb2pi0_AF03m4BDk_g@mail.gmail.com>
Content-Language: ru
From: Viacheslav <v@baodeep.com>
In-Reply-To: <CAMRc=McgB0gYfvE1KMXkNFnMgx6ahKoMFb2pi0_AF03m4BDk_g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

Hi!

29.06.2026 20:06, Bartosz Golaszewski wrote:
> On Thu, 25 Jun 2026 13:57:17 +0200, Viacheslav Bocharov <v@baodeep.com> said:
>> The shared GPIO descriptor used either a mutex or a spinlock, chosen at
>> runtime from the underlying chip's can_sleep:
>>

... snip ...

>>
>> @@ -32,7 +34,7 @@ gpio_shared_proxy_set_unlocked(struct gpio_shared_proxy_data *proxy,
> 
> I was about to apply it but then realized that it can be simplified further.
> The set_func() argument in gpio_shared_proxy_set_unlocked() is no longer
> needed and can be replaced with a direct call to gpiod_set_value_cansleep().

Good catch! This would even remove the extra fuss with the GPIO state.

> Would you mind sending a v3 with that included?

Yes, I'll prepare the updates and send v3.

> 
> Thanks,
> Bartosz


Best regards,
Viacheslav
