Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794321948;
	b=zPZxrx8Fdff4IojUbWj7tQcxQ7EcITQHp/lLGCevHaLxBg5XbyHzYSQaLnSqImzKJihS
	 RlwUlVCREjDdFyzqZ4habHSDqkmhRlWR/+egFyDxINaSikS448Fcowq7my6HZqgbdF0QH
	 Lz+yP3Vcz7rUoOC1nLsJ5m3TAYfdpBuQ0Wp1VTwLKynnWjA03MvM083jarNavdBDpk4TP
	 Eka+X87TaJXOWzzLsu4DlbjavriwJZQQIwszvf2wSf/2GkyW4jwlWM1WnQXYhyyca7tgb
	 1qbgyT12GQMchUxLORWJw0wb/iNwd0oRQ+8Kx8W99iJuf7/1mvtEBvpWJyJS0xLth+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794321948;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=L9jyp2wuPUVlelOs6NqY1BezFPyW+K5DLWLSt8XZey4=;
	b=zVSoc8daEr7avcacy72Jnmz3mMDomyKDst2MJad8DXIrlaUhESqwDK++42w7Vq4bzlWm
	 ZGAfcU5A9DvOB/wbRZyx9yFmIfjvy3BWXdY7gtGpKohbc27jOGZMcSo2vFLldnZowPdY7
	 xDxz6qp7AseW67ZkceCxrzilp+zWHm0UQaBbVMXu+qHw7ZFQyPtPS35d85S3pzKE72xht
	 u1nybIzkZDrnVxutuneTsgtfTSayPVKHBXZ2x6CO2YA2CSaPxLqmgTSRVp1OjiWYW6nYn
	 IkWuqDmjfusKjuLIA53NeNF+85W5XHiZq9N9zWwrMfd7gyxIfLCFvslLHcvNteyCrmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=A4QYkVdj;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 191A660A380F
	for <linux-gpio@vger.kernel.org>; Tue, 10 Nov 2026 14:45:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 191A660A380F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=A4QYkVdj
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-4918c2d727fso1133011f8f.3
        for <linux-gpio@vger.kernel.org>; Tue, 10 Nov 2026 06:45:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794321946; x=1794926746; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L9jyp2wuPUVlelOs6NqY1BezFPyW+K5DLWLSt8XZey4=;
        b=A4QYkVdj6QsIg6y/7whUfEp3RADSoFj6acoAjkv5/Rv/06V5aFl8cgx+A4lxCYl3zC
         nyQ+EygbyNm5Eke+OqXnuDHC/AebKcULAHM7a29PxkGKhrYyr3y+7FrGAFjrdZUkIwEB
         CbrdWO0TgYxHeLr7cNb7OryBNKlFKV3Mq+vRH2thgFjhI2DdA0CBxEx2JfwNIWVhAPpS
         9dvpAEvJM7IP9rPNQEfQj0YLGr6H9LRSOG2o3dPmfkPWDu7+2GtB0wmmF0nOJmZ6hd4L
         Sn6HbGEKqL6LIa9xhb56o6znkK58IY4F+YYdlUelrlUNY6px5YaKBLTwclLm3h62fV5m
         Grxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794321946; x=1794926746;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L9jyp2wuPUVlelOs6NqY1BezFPyW+K5DLWLSt8XZey4=;
        b=SmpCSI/ioA8rcZkN5G8mMOUS1A+wfrOis4MLZr9UR2+7KqhEXvy3etTtmL+6uYoGyr
         80nhbOtHzt9L8oJ9DL/zFniSzlfZevgXdG9EwHvxGidvNgq5MvP8dgF4iAkyJcoalI7k
         hLn+hMAyJOCJNc31axVToafeelUSPxKSanBjiSd/RhwVdsf7uoMBvJv7fCKmqXxuBQe0
         eknF3EWpZDLL2JLNKRML76qQyZHkMMozcCVObYt3Cl7McyLZyKjuP34qAQEhHwebV8FI
         boy+xKjqNTzl9r/TyjIsbN16q9w3YNpkmfBibDdEtRgi+KxG6LvdSMZ5ZYSL+9Rp8au6
         CBqQ==
X-Forwarded-Encrypted: i=1; AL+hErG9KL7nnoJ9VL56P6XizSkiRviJAu2tSjzmWA9y2NH2inTdgtrqNVKe5oDBQlVOoKx1vW9JKICuNhMO@vger.kernel.org
X-Gm-Message-State: APuU4Z/6qJ6xMqK88feqjp//kF1Ehp3Cjw8dJbjTobXjlsrNOen2MbKQ
	6L7cBVXOw9FUOsNarAugZsjM8CdVSwmHQV8ZvGHWgDhrkXElpj7bFULEBenW9bNnllM=
X-Gm-Gg: AYBFou3fPKeIgmS52ESPq8dj1ix/z+Zzvjl6uueRERp71jgVWNEg7AvBP81ur8+Mz9w
	v5DUIXMwsCBvbUin68bpLdNOQT/AiXg4tdCzv5oJ749i5lIftQI9HMSIZvAV66VjxWrtkrNlB+5
	2wDiEptQH01twRkXKgjYUDhmzpAS3q15hwacyAZIwGEEuM+ApjgnelCblc8mrEDF52aOh0RTwZR
	7c9rDxxkC2yg8pF8QOEeM47wYwFZSC+B2Kp9iRdDClpFVdB9OSHwIcCIQuuBM12V40ag3mWjvYC
	Fj6J19RMUk4nlJ/l1YCRzVH1uQCn7kk8pEACFEv3pJL50uuahfDCRaTy+ETr3zQciZ7Vify2q+T
	JsZzGFupID2eVY05F9ptgKSuXvz0aIBvWxZnJeMHvbEPmo8ltZFjEooC46M3WeYdL+KsBT8TrkR
	nssxxbUb28LBsvLPf/5zTYTYPwVCThKyVtXjJTIKq0ki4rrNqMZtQVw3X0IktV+lOSTQXahYQ6l
	VTK2OAs73VivJx8Ldw5zMp3IDWpePVVW+v7vBExpRzQ8KPae4gne34p2eCliU3cfwrBHYYGOo9T
	ovqVBeLsy68wlUrFr3qVagBOFtSG+xJMBrMcYNaW8R44ULnSwg/5xjkfY32yATVNZJ25cWv8K6+
	4Tu8=
X-Received: by 2002:a05:6000:46c6:b0:48e:68d5:818d with SMTP id ffacd0b85a97d-4982e82c2d8mr3373380f8f.16.1794321946400;
        Tue, 10 Nov 2026 06:45:46 -0800 (PST)
Received: from [192.168.1.62] (140.30.66.37.rev.sfr.net. [37.66.30.140])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4988f5b1ce3sm3848234f8f.14.2026.11.10.06.45.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 06:45:45 -0800 (PST)
Message-ID: <1300fdd4-b4b3-4a89-a37b-ea0d18e3c055@baylibre.com>
Date: Tue, 10 Nov 2026 15:45:45 +0100
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/11] pinctrl: scmi: select the GPIO function on GPIO
 requests
To: Andy Shevchenko <andriy.shevchenko@intel.com>,
 Cristian Marussi <cristian.marussi@arm.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>, Linus Walleij
 <linusw@kernel.org>, Peng Fan <peng.fan@nxp.com>,
 Oleksii Moisieiev <oleksii_moisieiev@epam.com>,
 Andy Shevchenko <andy@kernel.org>, Dhruva Gole <d-gole@ti.com>,
 Bartosz Golaszewski <brgl@kernel.org>, arm-scmi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261030-clegoffic-pinctrl-scmi-gpio-v1-0-52d92843ad97@baylibre.com>
 <20261030-clegoffic-pinctrl-scmi-gpio-v1-11-52d92843ad97@baylibre.com>
 <avMg5XmU8uSzPR4s@pluto> <avMlrXeemXOSR3ng@ashevche-desk.local>
Content-Language: en-US, fr
From: =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Autocrypt: addr=clegoffic@baylibre.com; keydata=
 xjMEafx9bxYJKwYBBAHaRw8BAQdAtc85GIwDXLz0rh9thWXC80Lji0otVDVncXT4qaS4j1fN
 K0Nsw6ltZW50IExlIEdvZmZpYyA8Y2xlZ29mZmljQGJheWxpYnJlLmNvbT7ClgQTFgoAPhYh
 BJjMiHuM4ZUwFqUPr36EW4KtCh6TBQJp/H1vAhsDBQkJZgGABQsJCAcCBhUKCQgLAgQWAgMB
 Ah4BAheAAAoJEH6EW4KtCh6Tt+sA/jVC35rY1npFlOy7YnncTdrID8Qf855JA78IzXgvzpGp
 AP9FkuuT80m66PP3DvgYX9kVnG17mSDKO0+v2W18v6ZgCM44BGn8fW8SCisGAQQBl1UBBQEB
 B0DMwF4u//aQyzsFlO8rPJ/cqsAuPH80IeIA3HOEo5mlVgMBCAfCfgQYFgoAJhYhBJjMiHuM
 4ZUwFqUPr36EW4KtCh6TBQJp/H1vAhsMBQkJZgGAAAoJEH6EW4KtCh6TdSgBAMDS0MiWCivt
 LjzZc9bs+P/xdXywUjDKq3lpQGJ6vZ0GAP9vI6DnN7vwVK6jt6/+0aBGkog5Ura9+WwRFEdM
 vLfPDQ==
In-Reply-To: <avMlrXeemXOSR3ng@ashevche-desk.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Andy,

On 11/10/26 3:09 PM, Andy Shevchenko wrote:
> On Tue, Nov 10, 2026 at 01:49:25PM +0000, Cristian Marussi wrote:
>> On Fri, Oct 30, 2026 at 04:58:42PM +0100, Clément Le Goffic wrote:
> 
> ...
> 
>>> +static int pinctrl_scmi_gpio_mux_set(struct scmi_pinctrl *pmx, unsigned int pin)
>>> +{
>>> +	const unsigned int *elems, *pins;
>>> +	unsigned int nr_elems, nr_pins, i;
>>> +	bool pin_only, gpio;
>>> +	int nr_functions, func, ret;
> 
>> Beside nr_functions, cannot all of these variable definitions be moved
>> inside the scope in which they are exclusively used, i.e. down inside
>> the for-loop ?
> 
> While it can be done, it's not most recommended style. Is it already in use in
> this driver elsewhere? If not, don't do it in a single function. Same if it's
> used in like one or two out of dozens of cases. TL;DR: be consistent in the
> first place.

I'll try to be consistent in the v2

Best regards,
Clément
