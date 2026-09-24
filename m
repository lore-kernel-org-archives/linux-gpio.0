Received: from smtpcmd03116.aruba.it (smtpcmd03116.aruba.it [62.149.158.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7058B1A6814
	for <linux-gpio@vger.kernel.org>; Thu, 24 Sep 2026 12:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.149.158.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790254742; cv=none; b=JkXGdhohgK7G6a2sgtsHTPxSxuUFn3L2AIuiSbcvgu8ArYpXXx7hIA9BnkWj0jE3oB9ngyw6LoOVTco2q9uLMwnyqc+S+20hIy5ZiNec/ErRqQQpWw3izYS5LZFq6j66E99L/81/YMoTi3a4Qg0uQKD9dGYTgpVZMbwuoMVgHbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790254742; c=relaxed/simple;
	bh=oKqWNiCAGi68iGIa6ZABsU0f7CyCCyg5I73uCxyeRgg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SZ3YgIRYG3INZLzd98q66xol/yFSxh5Hhly83V151395y3g1YG5laMNXiBI7AfK3fGS1NUrJYcA+T9iu4fos13dtxJTkovsGNXv2+cTXngiLgu6efiQ+2lDYId9WN9bhk+P+rNORnnwwMvWmxwVnePKMMjQqd7CMb0ysGC5+L6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=enneenne.com; spf=pass smtp.mailfrom=enneenne.com; dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it header.b=M8/q8rlc; arc=none smtp.client-ip=62.149.158.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=enneenne.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=enneenne.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it header.b="M8/q8rlc"
Received: from [192.168.0.186] ([101.57.122.26])
	by Aruba SMTP with ESMTPSA
	id 9j2RxBObRdVTC9j2RxSpmk; Thu, 24 Sep 2026 14:58:59 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
	t=1790254739; bh=oKqWNiCAGi68iGIa6ZABsU0f7CyCCyg5I73uCxyeRgg=;
	h=Date:MIME-Version:Subject:To:From:Content-Type;
	b=M8/q8rlcVNagf1VTchDdwNX+rXofo5UX/37OIWNTEs+w89BWzXkH0EdYpRzXP+XH6
	 U82O0lf+aJuYid+6xkD8gWkEDpXWYvW1iok5GWq0PmQ1apYiYccYU6uaMX0Ooo8PQk
	 S8ZHsIrVz00HWRU53OhZd5JNOL7v+A6ihReCikZfM3BHKhli4diL4HKpXehbwzrM87
	 nrshdjKZ1Wp854bc2YqRbLcBfKzui6nHcKb5pkpQa6GLLsPoHn8VayeKkDu7kWTaKK
	 FbEthKzNETNxa2WXFcNvJUHBHNEaeIKw9UOI6pe3Yv/mNE+bUJnFCZ8k6EBomPDBxb
	 p5CnBlMeNwkew==
Message-ID: <e9742c37-eb46-45bf-966f-b46e8cc30f74@enneenne.com>
Date: Thu, 24 Sep 2026 14:58:59 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/4] pps: clients: gpio: propagate probe error codes
Content-Language: en-US
To: Eliav Farber <farbere@amazon.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
 Fabio Estevam <festevam@gmail.com>, Andrew Morton
 <akpm@linux-foundation.org>, Takashi Sakamoto <o-takashi@sakamocchi.jp>,
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260922103051.5257-1-farbere@amazon.com>
 <20260923182243.41060-1-farbere@amazon.com>
 <20260923182243.41060-2-farbere@amazon.com>
From: Rodolfo Giometti <giometti@enneenne.com>
In-Reply-To: <20260923182243.41060-2-farbere@amazon.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfHbt/73vBQddwHW6HCyFNm+MI5Qb/NzWluREI23i3WVPWoCi2hFwtR3JYdZwiqju09x3+nbtq22SD8scNaM5ClCD2sQCTx1tVsLKc5mG582Xtmg9ZVvh
 kJq+I6UaWc9TUPW2sg0+BSDisJRXaRbLAdIzlPqBaIQieb1rkK2utxY7DQZK/eoeLR0yAhI2f/6hqtMii7wxsCxmXwgIldeAU7hJZtWpsFFIvqulqwV6iTuy
 dRW6eKTptWisZnFxluvNiqqpbN8vj7UGBWqK70HeVMf2+aUV8TxOfWtLI01v2VDZBrIyD01jRf0QbqoqztUIlJO9GWCH2Hla+IccpLKYL5+T13lTtbVT7n9w
 DXfxv3zz+teioVvY8EHEfTyz9cmTaM2wCthivNO53Kh+gBDOLNP6OmAeLxN3YhCrCMqMskOJ1/+uM5gKoxE1pxgn01dr/loFYPAjc52hlHO2mr6k2TMkLn1m
 7JC3Po4WsIuWMxfyYf+BNq9SNIzKTRQTT9c7MkN1CVagA5N69+xBp9t+isNROFdb+YGzxDZPgWhv3JU2i4T1uBvkv7h7owKYCUxhnQ==

On Wed, Sep 23, 2026 at 06:22:40PM +0000, Eliav Farber wrote:
> On the two probe error paths that map and request the interrupt, probe
> overwrote the error from gpiod_to_irq() and request_threaded_irq() with a
> hardcoded -EINVAL, hiding meaningful codes such as -EBUSY, -ENOMEM or
> -EPROBE_DEFER from the caller. The request_threaded_irq() failure message
> also logged the IRQ number but not the errno.

Acked-by: Rodolfo Giometti <giometti@enneenne.com>
