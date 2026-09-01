Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 553BF3D8100
	for <linux-gpio@vger.kernel.org>; Tue,  1 Sep 2026 15:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788276704; cv=none; b=PQZADmOZ8+PkbsLu8yez/5WEPb3rkdOwMywD5iYazs9jn6Py4ZOvV4gRqGtAIvnTnW3FeeqMmyLET2xfy+PbhXQZMEABUvxMBCA1VzyEF0Bd/gCzpSvoBcDU04K20SlN/hBoywp9m1XC8dKO0AeZ1Q8icBVeg3dH4Ay9lrqMMjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788276704; c=relaxed/simple;
	bh=J68dlioYUHx5umoc5mMjgxNsknqv72n8buUfiqnVP+s=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AkBkk5w2zND669wtq6CNiQrtMZyZnd9bYeFRYQYBGWYJWFD6W3sYQZin69/KAIGAETGrajPdzF/MECi8u/hFEgN4xw74NrvSldaW25+uI2+5jlz25Yq3n6EvSg/vb0KrJLdsTXD7i3Qcgq0KwIbY7gEvFLTbRLi+uDXcM/c8nMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mC+s3jFP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mC+s3jFP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E359E1F000E9
	for <linux-gpio@vger.kernel.org>; Tue,  1 Sep 2026 15:31:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788276702;
	bh=1PjMyQpcr3Brk1ZBUtD8hxDiG3e5qARaQTKb8ALdGUA=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=mC+s3jFP32Ie+TfrP7kEXDnFAdDN3vzZQ0ccqefp7ia38m1MMNrklT4eZFcgI0XxG
	 6ODdzobQe0rcXEHMmTWGxXh2cbo5S3GPeh2KZJXeM364t+oIZlKliPCJHM5j7DLf7W
	 q/bPS/2dP8WAwyiz2J1ybSZeMFiHjCrES2t2coYm1BkpNXM7oqcX4h+Ddhyc8PUO+l
	 9SRxo/4uFNEPqLR0q6jVRkj5hhcAdWXiutX6TXNhaYlbRZtl8ityax+EBz7bCtBPA/
	 04PuwT0dgYxX+gMnhpJNEnPW/r9gL+ht67MGtVgMR8GMf0kypEe2RsF2oon92NyVbr
	 5q2y/OzOqu6JQ==
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-39faa67fabaso7081961fa.3
        for <linux-gpio@vger.kernel.org>; Tue, 01 Sep 2026 08:31:42 -0700 (PDT)
X-Gm-Message-State: AFuF++mDoCpgD2GH6awvJiUj9nJldo5id34eagppRh4ddogSeRvC7eTx
	nJGee3vTT1AtBPB9fU/r3OkUJ4UrWuuJ0l6EZ8sot9EUqQ5itZ/+domSoegv1IntWNSCeMld7QH
	7NVTTUThkIL4CEUgHJu8CKDnf4KAjzawDZ3P3pw6svw==
X-Received: by 2002:a05:651c:3056:b0:3a3:a3:3560 with SMTP id
 38308e7fff4ca-3a301b1b926mr69982001fa.6.1788276701469; Tue, 01 Sep 2026
 08:31:41 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 1 Sep 2026 08:31:39 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 1 Sep 2026 08:31:39 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260827201259.3647152-1-mehmet.fide@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAMRc=MeCeGDEGbDMtHZXGuiPQV-QBYfNW50MmiJ0ke=De2_nVQ@mail.gmail.com>
 <20260827201259.3647152-1-mehmet.fide@gmail.com>
Date: Tue, 1 Sep 2026 08:31:39 -0700
X-Gmail-Original-Message-ID: <CAMRc=MckuSFypVeZMK-jxgbBjtvJFUbjaitNqmFxLrx+aB-7dg@mail.gmail.com>
X-Gm-Features: AcwNN1VtYu8fYisogm5JQwG4FHNNm5eDR4qBaxd2gNcaiMvNNtTbsrjjsYyXz8A
Message-ID: <CAMRc=MckuSFypVeZMK-jxgbBjtvJFUbjaitNqmFxLrx+aB-7dg@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: return quietly from gpiod_get_direction()
 without .get_direction()
To: Mehmet Fide <mehmet.fide@gmail.com>
Cc: linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 27 Aug 2026 22:12:59 +0200, Mehmet Fide <mehmet.fide@gmail.com> said:
> Hi Bartosz,
>
> On 26/08/2026 at 17:06, Bartosz Golaszewski wrote:
>
>> I would rather implement the missing callback in gpio-mmio. We already call
>> into pinctrl if needed when setting direction, could we call
>> pinctrl_gpio_get_config() here and read the direction from the underlying
>> pinctrl driver?
>
> I agree that is the better place, and I am happy to drop this patch in
> favour of it. One wrinkle I ran into while prototyping: for the config
> road to work, the pinctrl driver has to report the direction as a
> generic parameter, and pinctrl-imx (which serves vf610) does not - its
> pin_config_get() returns the raw pad register value, not
> pinconf-generic parameters, so gpio-mmio cannot decode it generically

That sounds like a bug in pinctrl-imx?

> (on vf610 the buffer enables are bits 1:0 of the shared mux/conf
> register).
>
> So my plan would be two small steps:
>
>  1. teach the vf610 pinconf side to report PIN_CONFIG_OUTPUT_ENABLE
>     (and PIN_CONFIG_INPUT_ENABLE) from the pad register;
>  2. give gpio-mmio a get_direction() that is only installed when the
>     chip has no direction registers, asking pinctrl for
>     PIN_CONFIG_OUTPUT_ENABLE, as you suggest.
>
> Does that match what you had in mind? If so I will send that series
> instead of this patch. Enjoy the rest of your time off - September is
> fine for me.
>

Yes, sounds good to me.

Bart
