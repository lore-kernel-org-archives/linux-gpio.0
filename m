Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 945F1388E55
	for <linux-gpio@vger.kernel.org>; Thu,  3 Sep 2026 05:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788411764; cv=none; b=rgv/p/qs1ekKkO9GVVVxSILAyVEaDqsVOTnw8ZhXL7WkaoVqog5eYHnKXFvMW1OTCiZJftvGO7ytA8hKd0T8d4uR8Ymiu0WphBcPjJ8Gh+IiPwSI4FGucTW2AU+MWQ53dX4I0GYrByBU2QePWlMMhNeqtxs3BRrLw8YoQAXwRHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788411764; c=relaxed/simple;
	bh=j8QMTNW8XDHV+BH8mGTNiSJbNMOrQ1E2SamlbJ3guog=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RqijMbP8sieiBS5dK3nqQOCjA/ldv43ttSDMvG7RE/z6FJic2TFdulR6s3bgjapmsUhLzEIvteStAPT1snqEPjVeFUzkh2n7iVMAB1HtZENkzaq61NCzRMoAM3qfV0hvevaP9k4hoVOn48MQn7zIjPNTWEvaD4OTgOWTiFpWxdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hS9TovMd; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hS9TovMd"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5b6036e9c70so1658632e87.1
        for <linux-gpio@vger.kernel.org>; Wed, 02 Sep 2026 22:02:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788411760; x=1789016560; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LwFiTvSfOdYmNglr5FoVqN597kWfjGSwy7pj4LDNId8=;
        b=hS9TovMd5QZKIZNyOpwAJtQ57wR6xsF0NLxpWkjJu4Exxer+y0BAmxudl2pCbJZXB0
         s8wHmZdgs62nqz5HLUL8CikyKRTmtWfxKYvHQpbvhMT4M9eLIt+xPStnUfjqImeyY8SJ
         6BfRq71N/EKv1qxb6BGEorOvJAVGsuoE20AcBf1vmIhTfDld8Du7XIA/k2Qfr/1v6CQ7
         fcg2ew6rq46UtaOg5tCt/aKdd75BMIzPLjM6FrbuTgenT7XvaTGqCYcjuul229whmLRU
         sjs8OSK2lBQzCpQLt7bziAF2kArm6eWxxTC+Rt+UXE/DgVU0c1XWAQcTmJi4ONiTSP/P
         tUMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788411760; x=1789016560;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LwFiTvSfOdYmNglr5FoVqN597kWfjGSwy7pj4LDNId8=;
        b=lL44p5V3qQlv61dtxwcK6EzFKvg0MO2iwSFbQSnTOyyAlVdpi4lgAE81u5TVLm2zPs
         74OXtnU/XMgGbeZmZ+tJRe2kNDA6zBaGSdk1/aPpsnIEckHId8t6kVT5dqGaPX4chvTn
         EJYnL1UqO3rBjyxsXh7j9tDAiMY4lCCHFPtIznx9TjcZ6TJpsx8lDyQ1tMYrjlMBO6HH
         bYv5JJbKXkFWgrGf9LwvArDfyWX6CnCBRi15dsrtnla7Az/qC+Sz55F8vu653HC3AIuq
         OxXL3hiMXqzHcLV9Acaae5QpxuFxXFaTPCXFJM0jCciX8GHaA2zH4k8Rl/cXr3kD8dHI
         Ku1A==
X-Forwarded-Encrypted: i=1; AKwUvByO+so2QE/AzkMYiVPZKbiq4LOCoYeai5u1U+f1Uro2zzvfBTLAzhGhyk+ZzqauT8LAQYG7pYGvJ6AO@vger.kernel.org
X-Gm-Message-State: AFuF++ngweQ/xBHZRKGLle0ZZxaQKBwr+oRS3/j5Tk39XkJmt0wtbhCp
	uV+fnxh21yKliOk89+c0jkn6OW3MhOJ0sjBF+iqT65Tt7j6TgCCchvw7
X-Gm-Gg: AYBFou3BYkYIt2RDcav2TcvxERZUQOVXEDMhMVtmw1/6gqXovEAFrVyNmhqCLaiaVGr
	3ZFctmaeDCU1uqbDalz+nleW4N0z7GXz3ynoJ9MKZk6/lghA1xOczpnVQySMoLRUmNCKsWBRBP9
	c6dU6nysNqeT7dDXOBEBKgmhzKC1SR8FJvUBXdVodh/U1lbe0luJZMEf77uiqFT/ofBQWxNQYXW
	Ek10CJJ7JMMjlxVwd9p3CAH6SJ2Sco9HBebvifaDPI+37mZ7WHZY2Fc2+sVPaqPh4D0Eu7Ozjag
	7nKatjtY3eMLvnK4aAF87AwrymAj6AbxiH7X3HURJHYMqDXpeExB3v6IP1b+vL6+CjU4i4HHLp9
	e6bB13DAA1hg9sDf/PC+Uk48863w0Gupdlbk/fDQuR/1qEBwTco4BpHYaRUZ7eUkl5ElLIiahxg
	aA9yMlHySPDJPK56fCuItirojboUIKVxvB5l6XC6nvchxVQySNYi8U0pffk+GawGvs611s+MUST
	3staD7Nf5SwgkYAPSaTYnMYpY9PdbF5MRdjORlvqL9K
X-Received: by 2002:a05:6512:110d:b0:5b5:fae5:b241 with SMTP id 2adb3069b0e04-5b608559ac7mr3146149e87.14.1788411760490;
        Wed, 02 Sep 2026 22:02:40 -0700 (PDT)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b606b1cd21sm1021897e87.29.2026.09.02.22.02.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 22:02:39 -0700 (PDT)
Message-ID: <c2d07f77-1fe1-4d5c-af6b-703d4d767a83@gmail.com>
Date: Thu, 3 Sep 2026 08:02:39 +0300
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 09/10] gpio: bd73800: Support ROHM BD73800 PMIC GPIOs
To: Linus Walleij <linusw@kernel.org>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 Matti Vaittinen <matti.vaittinen@linux.dev>, Lee Jones <lee@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>,
 Bartosz Golaszewski <brgl@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Michael Walle <mwalle@kernel.org>, mfd@lists.linux.dev,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-rtc@vger.kernel.org
References: <cover.1788346553.git.mazziesaccount@gmail.com>
 <5eb294e68b8d5d2c1d3a12b14a55dd2a9c075a09.1788346553.git.mazziesaccount@gmail.com>
 <CAD++jLkvELVwVD2B-OPF=mV8-F5xi7RZWJ7cvuyg2srnrJ2HLQ@mail.gmail.com>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <CAD++jLkvELVwVD2B-OPF=mV8-F5xi7RZWJ7cvuyg2srnrJ2HLQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 02/09/2026 15:39, Linus Walleij wrote:
> Hi Matti,
> 
> thanks for your patch!
> 
> On Wed, Sep 2, 2026 at 1:07 PM Matti Vaittinen
> <matti.vaittinen@linux.dev> wrote:
> 
>> From: Matti Vaittinen <mazziesaccount@gmail.com>
>>
>> The ROHM BD73800 PMIC has 4 pins (named GPIO1, CLKOUT, FAULT_B and
>> EXTEN_OUT) which might have been set to operate as a GPI or GPO when OTP
>> (One Time Programmable memory) is written at device manufacturing.
>> Support the GPI/GPO use-case via GPIO framework.
>>
>> The default OTP for these pins is to not use any of them as GPI or GPO.
>> (The GPIO1 defaults as an ADC input regardless the naming). Hence the
>> driver assumes none of these pins is a GPI/GPO unless explicitly pointed
>> as GPI or GPO via device tree.
>>
>> Furthermore, pin's direction can't be changed after OTP configuration is
>> done. Also the default drive type for a GPO (CMOS / Open Drain) is set
>> by the OTP configuration. The BD73800 has a set of undocumented test
>> registers which should allow changing the drive type. Access to the test
>> register area or the test registers aren't documented and so this driver
>> does not support configuring the drive type even though it might be
>> doable.
>>
>> Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
> 
> Pretty neat with gpio-regmap isn't it? :)

Yep. I like the added flexibility now that it has got those callbacks a 
driver can register... ;)

> Reviewed-by: Linus Walleij <linusw@kernel.org>

Thanks!

Yours,
	-- Matti

-- 
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~
