Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=159.69.201.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795594454;
	b=eLf5TAlKEFJFaZJTjxj8c0YTRzmS2CBdDaCZ8Yfr2Fe64iNCBV49PNW9E58IhvZBYFha
	 5rFvPbFodOpu73u1iMUvw3aRnhBUX60z+Z2csr2W5aXpVH++/eRiTWM2E+nx7mnsl4P2n
	 miQhc2CIAacLRAu2fTXycO8GXrM7Jqo7h6vy150CWRE2NYU+UbSS8JGYUaZz7+ZF1i2kz
	 z193mSG7c1d3eZ2Ax+KOOGdK7cFaOFYhHzmrxq+A0f99OPmhFg587UTv8jlPN8Uz9Kx03
	 PQVRSm17IENYwWtbfWMp+yrfZuetL8IsMTtnsgU361LjPADXqJoFbYFKoOQoY1vxTDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795594454;
	h=DMARC-Filter:Received:Mime-Version:Content-Transfer-Encoding:
	 Content-Type:Date:Message-Id:Cc:From:To:Subject:X-Mailer:References:
	 In-Reply-To;
	bh=EcqOpoZatxmW1uxCThM7KQ+CZVKjaTQRsigUe2wLhAY=;
	b=F5wLru7PtuXNkeEX5hoPZpvxaGRSKBJ9eQc2nXHdtg0VduH+kng18LnaSpQ6ImDwPErB
	 XN6GALre7/Gy0gPhe1zVotNpZ16Pyy5jsQ9BAMxt0vw+OsTQluWyoTKntpr27Da5EVEgl
	 s/A/B/rlT85ZcpxUMmq7OsSteVsSNPlCstdVisHgyzvWHpYE4u4Ip7rqLj0MY5OWbSRxY
	 rDIfyOgF3oXz57bt2OnGMfQYHp+FRKAjTTZf36X8CJq8LsGPCpnvRcZ2H91F9i+HC8s/A
	 /iZZ/2310mR5aeDi8JkmQoT45XPmcx2dpVshSEjJ8yttKo6Xb9haU6JY+fjjtLpdh1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=kernel.org;
	spf=pass smtp.mailfrom=walle.cc;
	arc=none smtp.remote-ip=159.69.201.130
Received: from 0001.3ffe.de (0001.3ffe.de [159.69.201.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7DF5606A321;
	Wed, 25 Nov 2026 08:14:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7DF5606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=walle.cc
Received: from localhost (unknown [IPv6:2a02:810b:4320:1000:4685:ff:fe12:5967])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 5910D111;
	Wed, 25 Nov 2026 09:14:05 +0100 (CET)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 25 Nov 2026 09:14:05 +0100
Message-Id: <DN453WE8YY5K.3STDH1FZM2FFO@kernel.org>
Cc: <linux-gpio@vger.kernel.org>, "Linus Walleij" <linusw@kernel.org>, "Andy
 Shevchenko" <andriy.shevchenko@linux.intel.com>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Krzysztof Kozlowski"
 <krzysztof.kozlowski@oss.qualcomm.com>, "Conor Dooley"
 <conor+dt@kernel.org>, "Mika Westerberg" <westeri@kernel.org>,
 <devicetree@vger.kernel.org>, "Long Zhao" <zl020895@163.com>,
 <linux-kernel@vger.kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Bartosz Golaszewski" <brgl@kernel.org>, <longzhao@ambarella.com>
Subject: Re: [PATCH v15 02/14] gpio: regmap: add
 GPIO_REGMAP_QUIRK_SET_AFTER_DIR
X-Mailer: aerc 0.20.0
References: <20261118-cv75-gpio-v15-0-e3c563673fe1@ambarella.com>
 <20261118-cv75-gpio-v15-2-e3c563673fe1@ambarella.com>
 <rjxlen54cxvhlbiq6uh5ytts6kyoz3v4hczh7bhjoxfsode2se@hesqdhe2vczl>
In-Reply-To: <rjxlen54cxvhlbiq6uh5ytts6kyoz3v4hczh7bhjoxfsode2se@hesqdhe2vczl>

On Tue Nov 24, 2026 at 2:14 PM CET, Bartosz Golaszewski wrote:
> On Wed, Nov 18, 2026 at 03:42:19PM +0800, Long Zhao via B4 Relay wrote:
>> From: Long Zhao <longzhao@ambarella.com>
>>=20
>> Some controllers ignore output writes while a line is still an
>> input. Add a behaviour flag so the output value is written after
>> the direction change. This is a legacy quirk. New hardware must not
>> use it.
>>=20
>> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>> Reviewed-by: Michael Walle <mwalle@kernel.org>
>> Reviewed-by: Linus Walleij <linusw@kernel.org>
>> Signed-off-by: Long Zhao <longzhao@ambarella.com>
>> ---
>
> Hi! Sashiko's comment on the return value of gpio_regmap_set() is valid.
> You never know what the underlying regmap actually is, it may not be an
> mmio regmap.

Agreed, but it should be a separate patch because it was missing
since day one. Not something this patch introduced. I tried to find
out why I did it that way, but couldn't find anyting. Probably
because back then gpiolib did it the same, not sure.

Btw. is it on purpose that sashiko is only answering the patch
author and the list? FWIW I'm usually not subscribed to the lists
and thus I didn't get the feedback.

-michael
