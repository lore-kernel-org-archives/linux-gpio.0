Received: from smtpcmd01-sp1.aruba.it (smtpcmd01-sp1.aruba.it [62.149.158.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 077C95448A2
	for <linux-gpio@vger.kernel.org>; Tue, 22 Sep 2026 12:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.149.158.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790081394; cv=none; b=KuZYnApgUofFWPk3LasZv8Rnco1YEl9oL39vv6RYGly966RiZNyubqvdl1bh6ao7D+HRFbsOicFJYVlnShYiHR7Zs/GacIPXghqsSWW4Ur6RPlS69nED4D7pb9mS6Sh23S+wvJlxpV+Wolw8p2P4nSxZehlJpwK3kHwKe83EVNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790081394; c=relaxed/simple;
	bh=peexCizzEDnRFo3mJoZxvwuBaoNpCS5sk/iv3dr75+c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hEh8kMjCQ1bpOM1cCVVB8/GGglV6woHjWxv3vzuKAJWidhcDcGo4ZatcSscG5LDMaZdSqc4G8t0hcgcms18RJf2pRj9DBoay02wqimc0xVH8XTZ3Wh4CbAyUbukHrp/kRxz25HjYJgVe38dNotxiy3G2D7nXtNX08ZUkCG6+Nf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=enneenne.com; spf=pass smtp.mailfrom=enneenne.com; dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it header.b=HeZGZqpG; arc=none smtp.client-ip=62.149.158.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=enneenne.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=enneenne.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it header.b="HeZGZqpG"
Received: from [172.18.100.99] ([109.238.20.116])
	by Aruba SMTP with ESMTPSA
	id 8ztQxxvaCXmot8ztQxj4ZX; Tue, 22 Sep 2026 14:46:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
	t=1790081202; bh=peexCizzEDnRFo3mJoZxvwuBaoNpCS5sk/iv3dr75+c=;
	h=Date:MIME-Version:Subject:To:From:Content-Type;
	b=HeZGZqpGjmztoi596IWNDAP5/plw+f87WsYJKtgjB+L3PRfm9Tf7H4UivpCkgetRY
	 psiceuBl1cczYE+wUoZub6UjUixk2qyferzrtxENrbHraLjvAN1m1xHIY63lmCpXZd
	 yHiGTxosB8sS6h8bJoXrCrIqkAxL/ldCLtrEoMDGUb9RTtHzteVCme0tf1Rq8QnGJC
	 9LihtwLu4OgiulMtPCN8f2Fta0FB2Sj38gBcGDPuNiKaK7ZDmpyymFsZWHxQGXu0bK
	 T0mlenZxlgQEkdvnbMNUGXpMjhMxKZO9AsCwdNXXEB+xwP32RMhq3I7QILC+2AfeI7
	 SuRsDIRU3pIRA==
Message-ID: <67e6d618-f94e-426f-aabc-304078fda5c2@enneenne.com>
Date: Tue, 22 Sep 2026 14:46:40 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/4] dt-bindings: pps: pps-gpio: document optional
 pinctrl states
Content-Language: en-US
To: Eliav Farber <farbere@amazon.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
 Fabio Estevam <festevam@gmail.com>, Andrew Morton
 <akpm@linux-foundation.org>, Takashi Sakamoto <o-takashi@sakamocchi.jp>,
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260919171157.5502-1-farbere@amazon.com>
 <20260922103051.5257-1-farbere@amazon.com>
 <20260922103051.5257-4-farbere@amazon.com>
From: Rodolfo Giometti <giometti@enneenne.com>
In-Reply-To: <20260922103051.5257-4-farbere@amazon.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfDYfg9wMoK/6hYkm8HWbB4xHvmBTPDQuAMVUX8FEy+27rJG4a2qRvfgor/zDkE7svENyEU49ob5NFFiKV+6OcERvTDaPR5JjTCo77ELUzX/7uiXqvLER
 agMulmnKn/UYutfLUHntqooy9ezpA4U7UthRaxMiObJKD8sO55sPImCZO6JwwKe4VMGLIy2Ye/XXk3MmG8vxT1aQzgo2D/I1xPEQ7qqGDJWYNWVPcsytoGDZ
 tmYQzEUwxcejyVrcC1ZD9ETldETaK+R8ZJyub0ighOrsX182PgsPOZWUXC+xhWr5QwZYmYQo5WUKXrnaTeit0tMRmxTOqd4dr23EYs5jfg7yKbYnNbigCXPH
 FSK3HA1E3OppDn3LDAqypYif297+5U4M5WMB1ivGQiM/BYJpJx5qOLKj74SZrQGjIrgXLyUwq+7o4JWbwy/LVLIVhRPJtwwCTFilvCwigWRIltZQqe0tJ8Cb
 doX4dB+c1287wpX89jfGtWMcR+dtNCZLwfm6Al4ZFHsHc0rOZyfh5xyUAJJQYVngI1MQ5VEUsZAgB6g5E6k9h3ji/KUFFUyJmj2g5w==

On Tue, Sep 22, 2026 at 10:30:50AM +0000, Eliav Farber wrote:
> +    minItems: 1
> +    items:
> +      - const: default
> +      - const: inactive

One observation while testing the series, entirely a devicetree call:
dtschema derives maxItems from the items list, so this also caps
pinctrl-names at two and fixes the order --

   "default", "inactive", "sleep"   ->  'is too long'
   "default", "sleep"               ->  'inactive' was expected

I have no opinion on whether that matters for this binding, I just
wanted it on the record.

Ciao,

Rodolfo
