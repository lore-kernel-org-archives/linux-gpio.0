Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792576828;
	b=Fr/97dp1Kg+K+z9wQSaY2tDUMxLgT43d82IVhLTe1dmgRouyyyy19+OWa0CTmpzcJf1C
	 sih+NpnUQAUfv5+yYUNqW6bnE09iUebIyTDzjl7Wu8XAecxyCZG+7L8klkgzkycktp6hc
	 ovGVnQWFqv8gqzpbIRm0p35X+mnWIrQAm9nR0TGWUfbgF1sD0q5JBVXcm6hcJ4vZlzqVm
	 yBVIo6pNbwxnb1NDCP5HUqR9fIa8HBVQXyd2krQEf5NRj7s/2yxh+vLctuVRBhIV1MfDO
	 4UzlLOWnZMc4r5ggjxpoYgAIqcxIold9r71h34eF4qnH+sDiLs/tSQ2d5KORNtLUl7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792576828;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:Received:Received:From:In-Reply-To:
	 MIME-Version:References:Date:X-Gmail-Original-Message-ID:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=AvKotJeRTYmx13C9lmxu70vA0AtCenNU0r6DrwCYPMY=;
	b=Ow3sr28VPo75HqJHFTpeOf4ov56oct6eaWfragHoExwq9kRRD0wjsKvyS51q0p8SNoA2
	 dej5b3RWQjR2eyQrFfjplXoccsWv/eZecRJmJP036roPt87g3u25bjxnA1ug1nqAqoqxE
	 XOzkGp8pGf/hJneRG9IqB3gEA4aZl2nZ4UW6ijleW5QdeCmmMh8m1v89uZWDP4wKllRCk
	 EIDDlC4suEuxLbjW2ymauk6RWAbXVNTaX978OQsYVHSmHl53YHDSw8mlbiB9CcReq5Cws
	 KiM52phAoaZrkl15wXighq3t7naNwN78RY2qjP9zx73TpHZzB+m4Y6ogM2ZjCY2j2Xw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TALd5yl+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 554F6606A31D
	for <linux-gpio@vger.kernel.org>; Wed, 21 Oct 2026 10:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TALd5yl+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF0511F000CA
	for <linux-gpio@vger.kernel.org>; Wed, 21 Oct 2026 10:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792576828;
	bh=AvKotJeRTYmx13C9lmxu70vA0AtCenNU0r6DrwCYPMY=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=TALd5yl+7wDWdF/zQ4FNqnx1ld2xAOUnCFuMBWgkKiEKUpdnvn/iOZuG1PUdyn9rt
	 36Vyp3gMSnp4Mq52wjGnCpyV2iR+QWi33rCv1Q2bprM8z6tsuaTt02wKp2J1OdfWxv
	 2npe715UQtnOycoPq1jMt6LGKsvTOMjzb/XEjC9wOSEJSLsyK6Q746oDKVtNSQFAUh
	 gY+W6x4vXTCTXcRwuecLTmXL0nuaLRbKPm1Bo0x9UvdtQD/gDF3/aRam01ky5ajxzS
	 j4X5J+G/qgL2zfENn91EKl/VblNSQmpTo8oBEGSkNglV1yV1UmCMhDx/uJFe4ymD07
	 Q3iH3EOQfTrNw==
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-3a1f628b1d1so5449921fa.0
        for <linux-gpio@vger.kernel.org>; Wed, 21 Oct 2026 03:00:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBw7uAI4ZqgpDKbQVGyc6Y0b9Cuc7r+JM4Ii/u8HYbaOIVdUU1aX4ACFuNOe4wxYG/15vdAahpBRNc8a@vger.kernel.org
X-Gm-Message-State: AFq9FYILP0cuUHZWp0g7u6mTMQhTZWzch0VMK9/HvuBFnZIfY1Lz5hfL
	xYLEMsX9mcd2cn75J6mfZvn5Zt9kLImiwqUMdhRI0GGL6pcU+FOouXt+n9TB8hNtV36BwFtMypv
	HAe1U+/eVBtl8dZlrBFgf1F99uThI4COQQOMbbFcZsA==
X-Received: by 2002:a05:651c:199f:b0:3ab:41c8:fc15 with SMTP id
 38308e7fff4ca-3ac44164462mr4097361fa.12.1792576826700; Wed, 21 Oct 2026
 03:00:26 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 21 Oct 2026 05:00:25 -0500
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 21 Oct 2026 05:00:25 -0500
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <CAMuHMdUWPXK3eBQu+49ZURg8u01hmOSgv9e1KNYZwbYxjXFNWA@mail.gmail.com>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260630-gpio-shared-dynamic-voting-v3-1-8ecf0542953b@oss.qualcomm.com>
 <CAMuHMdUWPXK3eBQu+49ZURg8u01hmOSgv9e1KNYZwbYxjXFNWA@mail.gmail.com>
Date: Wed, 21 Oct 2026 05:00:25 -0500
X-Gmail-Original-Message-ID: <CAMRc=Me5M37wMq0U1VRrcjC0o3-9JxmDVCLLqcNkiCnLTzktog@mail.gmail.com>
X-Gm-Features: AclHuK_O-lCDmZ2aqHgju7aX9jfKFteLFchT47cIg4oN5MqCAmkooApYQocjM0o
Message-ID: <CAMRc=Me5M37wMq0U1VRrcjC0o3-9JxmDVCLLqcNkiCnLTzktog@mail.gmail.com>
Subject: Re: [PATCH v3] gpio: shared: make the voting mechanism adaptable
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Marek Vasut <marex@nabladev.com>, Arnd Bergmann <arnd@arndb.de>, 
	Bartosz Golaszewski <brgl@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Linus Walleij <linusw@kernel.org>, 
	Viacheslav Bocharov <v@baodeep.com>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 20 Oct 2026 16:30:24 +0200, Geert Uytterhoeven
<geert@linux-m68k.org> said:
> Hi Bartosz,
>
> Thanks for your patch, which is now commit b30973e8c3920ddf ("gpio:
> shared: make the voting mechanism adaptable") in v7.2. I only
> noticed this now, thanks to commit f918e38044988082 ("arm64: enable
> HAVE_SHARED_GPIOS for all ARM64 platforms") in soc/for-next.
> So far I haven't seen any ill behavior due to that yet.
>

This has been tested quite extensively on Qualcomm platforms and is being
currently used upstream, but if you ever notice any issue, please do report
it, I'll do my best to fix it ASAP.

> However, shouldn't the default state depend on GPIO_ACTIVE_{HIGH,LOW}
> and/or GPIO_OPEN_{DRAIN,SOURCE}?
>

It does though, doesn't it? If you have:

	node0 {
		foo-gpios = <&xyz 0 GPIO_ACTIVE_LOW>;
	};

	node1 {
		foo-gpios = <&xyz 0 GPIO_ACTIVE_LOW>;
	};

And the driver that requests this shared pin over the proxy goes:

	desc = gpiod_get(dev, "foo", GPIOD_OUT_HIGH);

The actual value written to hardware will be "low". The value in the shared
proxy's memory may as well be 1/high but it doesn't matter because the proxy
tracks the logical value.

> Apparently Marek asked the same question[1], to which you replied[2]:
>
>    "We could but that would require DT changes, you probably don't want
>     this?"
>
> Can you please elaborate why this would require DT changes?
>

Sure, and my response was actually a bit longer:

    "We could but that would require DT changes, you probably don't want
    this? That's a different thing though too. Here's it's purely logical
    - either we default to high and vote for low or default to low and
    vote for high with at least one vote needed to switch."

We were talking about the specific case of a write-protect pin, which is held
high by default and pulled low for writing. This logic is the same irrespective
of the ACTIVE_LOW setting.

Bart
