Received: from mail-24416.protonmail.ch (mail-24416.protonmail.ch [109.224.244.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1328235C691;
	Mon, 10 Aug 2026 16:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786377721; cv=none; b=qBqpRLQYCi8vjIWusSDKq+5FLSqp5fZ3cpUziulZ1U2DMSudup5Ejq0ykunjesBCirI12lxCDThqiGujj32qZah12GV4E8krenbb/GbjAG8JXWOtmQRhLgbJ2F2tW0rwT/eNNLRwXYH7ZSfVqc6sGQg+k5NkRaTvNf0L6LuL9Yg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786377721; c=relaxed/simple;
	bh=w8GpxvOfnNWl/89U7nAsBbyft4xeXumCz/7z5Ozk8dI=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LhfKq/iXM51COGPhYp7tzOLojpY4qgtcgFIJbFT7srnIWx9467C8MKdl0aObZ0CK9azeuiQWyUXZE3N5bjBGegoBhUJ4dwYikB6mqhb29TKuSUUbEuvwAWCuKcZtqKDIPHIe4F++OWjhxHw5PC7X6Wlkybe8hLg3o7rvsglxb7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=i42OvVfc; arc=none smtp.client-ip=109.224.244.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="i42OvVfc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1786377707; x=1786636907;
	bh=w8GpxvOfnNWl/89U7nAsBbyft4xeXumCz/7z5Ozk8dI=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=i42OvVfcWkJaVbh38NeQ/nUsmoBLXDhSnTh4Zloy+MkSnGPGdgTjz40NoFLB6EYAk
	 bxkwghzhKWtn+ZCA2+a/YvzCKE4lP/V0Ut8UJ7klTV1/dYCCB3G3G3jYDo7ac+rTKb
	 YL/Mz7a1hj1bTbDBER45fS76sT+RwRFijRdCHfFgWODXAoocgBx3uENB0OA+T3GFnQ
	 k4hipyjZ+FbCM3eT1nCtTTBdzh0VfWilOdw9JVLma791H5OVy11ivYpfrJay7pxbqN
	 tYhBjr/ZBs6wEP4ZEks7QyEy3fcUb2jzcfJfFw8NzJb6sa5gI2QyBAs15ikTi1vYWD
	 RZnMrqdYaaW5g==
Date: Mon, 10 Aug 2026 16:01:42 +0000
To: Bartosz Golaszewski <brgl@kernel.org>
From: Esteban Urrutia <esteuwu@proton.me>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, phone-devel@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>, Esteban Urrutia via B4 Relay <devnull+esteuwu.proton.me@kernel.org>
Subject: Re: [PATCH v2 1/4] pinctrl: qcom: sm8450: Remove duplicate reference to gpio81
Message-ID: <c5eb8d0e-39ed-4211-bdfe-7902f6ee7f99@proton.me>
In-Reply-To: <CAMRc=Mf+_3CYbcT79NhBPLz2FBs-xWKA5xZxY_hmHbvYvJxF9g@mail.gmail.com>
References: <20260802-sm8475-tlmm-v2-0-a93e1d1cb53b@proton.me> <20260802-sm8475-tlmm-v2-1-a93e1d1cb53b@proton.me> <CAMRc=Mf+_3CYbcT79NhBPLz2FBs-xWKA5xZxY_hmHbvYvJxF9g@mail.gmail.com>
Feedback-ID: 147889766:user:proton
X-Pm-Message-ID: 4c610df17f9ce1bf854bc4ad21a6e95e77dc4e3f
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 8/10/26 7:24 AM, Bartosz Golaszewski wrote:
> On Sun, 2 Aug 2026 09:30:54 +0200, Esteban Urrutia via B4 Relay
> <devnull+esteuwu.proton.me@kernel.org> said:
>> From: Esteban Urrutia <esteuwu@proton.me>
>>
>> gpio81 is referenced twice in prng_rosc_groups.
>> Remove the duplicate reference.
>>
>> Signed-off-by: Esteban Urrutia <esteuwu@proton.me>
>> ---
>=20
> Please add the Fixes: tag.
Is it actually needed? No bugs occur with it.

Regards,
Esteban

