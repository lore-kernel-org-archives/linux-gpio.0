Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795013811;
	b=u6RhrGn0/yGgGBU76f+zKiP6Bw8dE0mN/8vIKvPMX7OqNKk6P8SuLrr7JoAq7a0D3/lT
	 3zehAOS6AIVSv+TQ3BANmp6dmUSojdcKqGgHHQTYGNwPmcw48ftKQPE2SZQLOHjTph4kE
	 vKhkpO55MDZhQ0Vh34NSC/PwJq/4EsoEm+Ddj9k+sBOfxO3QPptnUyRTNVX6aLZOlWRSJ
	 Jv2GuxRGncnpETtu0Y5xhLXCsLuTEPfHAkZJKx8xxqEj6rChIz/H17yCPDAK12THf3mh3
	 GgHFzyqrT9et4Nyl9LwwZnOBJdHvDohS2W46EBdGnx+CHP5epxfRdX9WdOYx+YPtfkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795013811;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=AP66JK+9IZWV70ief0dIKlL0g1lFT7CpEkSpmNESw+A=;
	b=zTdCT4mirp4/RuJmWz+1k3eDvwVvYScoSDrCuTCgNZFZrkDWI7RhoqX3mbwISvMjEBtF
	 MFm/eUQzUCeRC4kYRT1nyV59ROeZWnZL9VAkPvOelOflKFTF0TnHLh80qEhiScToRSow5
	 p1tij5HDIP469sWKsHxV9D6tyt9kJxjEB12LCuN/LjSHvNo6u5EG0vTZyPwVUt3ZOYF3w
	 v5X9D+9hR0hX2/Mfsqqq/SiNblEwp5wRLGbi+gpHjbHZj6haQC6V8LClU1Z01/drujFVe
	 xTvwcG7dmzfm+h1ac6mln/LJNvryTG09oAl4DlcliV0GUjwSHIK9ef6Yrn17HZI4Y8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=IAUI4RVZ;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4F70606A32C
	for <linux-gpio@vger.kernel.org>; Wed, 18 Nov 2026 14:56:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A4F70606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=IAUI4RVZ
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a2d6d01ecbso6931735e9.0
        for <linux-gpio@vger.kernel.org>; Wed, 18 Nov 2026 06:56:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795013809; x=1795618609; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AP66JK+9IZWV70ief0dIKlL0g1lFT7CpEkSpmNESw+A=;
        b=IAUI4RVZtMpQLwPVKu7ZGS2ExjXvf7EWqWnG9HfQeLTRTAjhlxMVvi2PN3aXdhBe2W
         BBQo53aj+g+JI1u1xEEqhd2cseLlM0dRxVi+4OzMeMmDw0bwcQj1pRUDAGT3hjuHL4PW
         y3cKzHSkB1QiBkBF8xXnSdXxtXwsDnbvuUdj21FfPh/+AJX0XOV7XBynqN9dPS2KW7ko
         8u1NEDRwW0KGolVzv4eQVvXdZtRtt0pX0Ms2xU96FRyMGTHZRwImLZxedbl9cH5Mjtqg
         xJ6Z2MO1lrtZnALyauLnDn49ps2Un66F6uP1eq1C+ySeKQ+kdjX8sxZ6wtjmO0DmVP4s
         +XxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795013809; x=1795618609;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AP66JK+9IZWV70ief0dIKlL0g1lFT7CpEkSpmNESw+A=;
        b=dmcsOIwDlvMh+/DiXQKuTSDj5oZohDuFkjc6ui3vLRid/A6jM0g84E/N1e0K8D4KBy
         gylvjoDoJmZPFAQPKbX84j2vckdX74vaROEHjyeuPywmGpyc2WgUBJ7tYbPXHlQ/aE5v
         dQBICf5MCxPkt9Y5jHac9OyiicJPqwUELSzdnJcmkgA01QfLmLBbjkH96Xrg1ulgS8TI
         Yk+ud4UjMB/Bb51LjBnrzHnKuzsYz4vJNgqg0lET/MWo9b/xWSCFGAVwpIxsN91DfQ9p
         giQYQKTd4wZB+tD4rTBSSvQYDp4+K132udYF1KDy6bH2q6vafdIIC1Kui8rMUpkXTlFE
         V1uA==
X-Forwarded-Encrypted: i=1; AL+hErHXb3AwK926SbRgNMvk0+mebDKqBfLh+VoQFXL08EVHkQruYVMPhXZ5u5+h4uaNihX9yjs1wpYGsrmo@vger.kernel.org
X-Gm-Message-State: APuU4Z/pAgxMUcj0RvZtLScJOnSgp1XCq+9uCpiYiNk+alxLch/NYSit
	Ybt0LOcEBT0KRS4yIY5TABYJ7Sm4qZ0EcNYRUdxIT3Gqm/W04uCFz3OiKSgApjrOt3I=
X-Gm-Gg: AYBFou3DVYL59TVuSsw2s1O7NxBRHXOd2B6Xti7r1Yly34baQ7dDsax/raSnpi/tJZy
	HUEccJFlLiaNGX8WYPuK+0qgbfAPyxjeyH/IOEGQW+N+01H63DorQ/q9ntwlx72u4Rbe1jBcJY+
	xCwzeNbKSwwWyShuhSOIKdHLYu0KbyMnoEU3OX5z5J10Hqv1kCX9nTCjIGJJgSo3Abt1Hd942i9
	oJu3VAJKlfd9UjCs2hGMsKtDnawkDJvUnRGqsG78fX2qu7JYDAbldNfuquchcsRMn4q57YTj6HL
	UaY/0+i2au7ukFGNtw5bsarr/QMtXlUrB3/mNT/eiH/wAeBkz2R+BtsMjeOEJMmz4NphUEsmivC
	tpmqp9mSIGuh2FSyVV2peDdEKmL2iENsBaaUsZeoX6Yb26I9n64aOCNK8Duq/iYCH8ncc0Z6hsd
	Mlu1GsXU8qh1nxKuons3AHX29iYpDPmGGRjYo0W6aAwF9lxPT3kL8Ua7EnONhuyyB3sf8o6OhAX
	ar10ayKfwBSf8P9aJmlsP0F9T6/thqs61MQsFQ9cjjJvLb0cUaXaslnfVoy8yBOWfxu929ZXAlN
	f7SMU06rKQN+WH6e2TWaojyE8GPAlGl7sPSHdPlkX5D8Jkm07Bg8BFZi8qLN7Nqx5bPtq+nzIOp
	vnfkMN7Qia9o/lM4hdUzOX/0GQSyNmqwrF+kyZdl6NjRZ36dnI4cDZZBHHb4esTyKqsdDbKiHKE
	IftvKTeAGbsrMgpg==
X-Received: by 2002:a05:600c:3e07:b0:4bb:5de1:e90f with SMTP id 5b1f17b1804b1-4bb7da44cbdmr52983185e9.31.1795013808498;
        Wed, 18 Nov 2026 06:56:48 -0800 (PST)
Received: from ?IPV6:2a02:8440:7506:415f:b2ff:e89f:45f0:164b? (2a02-8440-7506-415f-b2ff-e89f-45f0-164b.rev.sfr.net. [2a02:8440:7506:415f:b2ff:e89f:45f0:164b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a655db6d45sm5131667f8f.33.2026.11.18.06.56.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 06:56:48 -0800 (PST)
Message-ID: <f837a7b5-7fce-4571-96b2-f3d307d203c2@baylibre.com>
Date: Wed, 18 Nov 2026 15:56:45 +0100
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
Subject: Re: [PATCH v2 01/11] pinctrl: scmi: send the drive strength in
 microamperes
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
 Cristian Marussi <cristian.marussi@arm.com>,
 Linus Walleij <linusw@kernel.org>, Peng Fan <peng.fan@nxp.com>,
 Oleksii Moisieiev <oleksii_moisieiev@epam.com>,
 Andy Shevchenko <andy@kernel.org>, Dhruva Gole <d-gole@ti.com>,
 Bartosz Golaszewski <brgl@kernel.org>, arm-scmi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261113-clegoffic-pinctrl-scmi-gpio-v2-0-faccb4685d88@baylibre.com>
 <20261113-clegoffic-pinctrl-scmi-gpio-v2-1-faccb4685d88@baylibre.com>
 <CAMuHMdWwp4RtKnBpFNJPHdigzrQ-wf3yt-pBZGG9QKs9tcd_Ow@mail.gmail.com>
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
In-Reply-To: <CAMuHMdWwp4RtKnBpFNJPHdigzrQ-wf3yt-pBZGG9QKs9tcd_Ow@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Geert,

On 11/17/26 3:35 PM, Geert Uytterhoeven wrote:
> Hi Clément,
>
> On Fri, 13 Nov 2026 at 16:02, Clément Le Goffic <clegoffic@baylibre.com> wrote:
>> SCMI gives the drive strength in microamperes, but
>> PIN_CONFIG_DRIVE_STRENGTH is in milliamperes and was sent unchanged.
>> Convert it on set and on get. It is the only unit that differs: the
>> debounce is in microseconds and the pull resistances in ohms on both
>> sides, and every other value is a flag or implementation defined.
>>
>> Fixes: eb524cb651b7 ("pinctrl: Implementation of the generic scmi-pinctrl driver")
>> Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>
>> Signed-off-by: Clément Le Goffic <clegoffic@baylibre.com>
>
> Thanks for your patch, which is now commit cc2f90768e971bcc ("pinctrl:
> scmi: send the drive strength in microamperes") in pinctrl/for-next.

Yes, Linus took it 1h before my v2 and I didn't see it.

[...]

>> +static u32 pinctrl_scmi_map_pinconf_arg_get(enum pin_config_param param, u32 value)
>> +{
>> +       if (param == PIN_CONFIG_DRIVE_STRENGTH)
>> +               return value / MILLI;
>
> Does this need rounding?

Rounding does not help I think: SCMI only talks µA, and 10800 µA has no exact mA form.
I will send a fix that returns -EINVAL on get when the value is not a whole mA.
PIN_CONFIG_DRIVE_STRENGTH_UA still gives the exact value.

> While MILLI = 1000UL is correct from a numerical point of view,
> it is not correct from a semantical point of view.
>
> <linux/units.h> has:
>
>     #define MICROWATT_PER_MILLIWATT 1000UL
>
> In the absence of a generic conversion value, "(MICRO / MILLI)" might
> be better.

Agreed, I will send a follow-up once Linus answers my question on v1 patch 7 about where to base v3 [1].

[...]

>> +               *arg *= MILLI;
>
> What happens if the result differs from the original value in µA,
> due to truncation or rounding?
>
> Likewise about the use of MILLI.

Multiplying a whole mA by 1000 gives an exact µA value, so it never differs, unless it overflows the u32.
The same fix will return -EINVAL for that case.
The platform refuses a value it does not support and the set fails with -EINVAL.

[1] https://lore.kernel.org/all/ce463c97-8fde-44b3-b3bd-c21a69ee61b9@baylibre.com/

Best regards,
Clément

