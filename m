Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792657115;
	b=gtAF30qe3M/wqhMgdhOKZcG+tgMquuGrM4tePeofrUiXeBcPgnN1gxXVMo3mxv4dq2xf
	 DIAffngLndmALr+W+Xa7BLJd7OQ9wLgDxYZ5QNhENKk935x2/DPLmZGuavwBrNAKbIK5N
	 MtmCrVqHDVHKaxZDj/SgC65BZxFrsARcdh1cSx+SBQG30mvB8ubTfVpr42PkmXxyfpJ1c
	 lTPhsmEXYw4yjsSmp3yer9xpgt5+pnf1vPS4jK9D9WeUh5eFfh4tH2KyRv9AKXW6l3dj+
	 kT9AxRqiwplBUizBx+S6awzxBAL8k0tZ+5xFaHE+AF+6wlCIdE0FkoPJGmu16Dn3Udw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792657115;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:Received:Received:From:In-Reply-To:
	 MIME-Version:References:Date:X-Gmail-Original-Message-ID:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=yhLXfbJ/1qVmAQNxqFqMtZacc2QMaokkAVZ8ZnC2ZjA=;
	b=z1/D+G443itTarfkyZZEmERsALbq/sFW6DCCDxCaePzauSrEiKJA7zSND01eCRkAnS3D
	 shR7tARoyz8MnWKBC2C+6du1dEQvZOKq2Hpg8RXJMx8bq9Gc+ytR6g2k1bjhFAn1sHJVI
	 3h8u/0uip3IBsFk88FV6WQJ1RYfwXl+E2CGlsvznkzJgXroLemiaWQZp2T9RyldIvdvBP
	 NVNDkhm0qS7NXdzfCDXRd8EioGhdDk4zHZhhKaWEko3nwPGjNfwyZTFRBltmW/UYnI0Hz
	 B6rpgl4DpvOe6/YqNsalxOFgaK9y3BemmVmaTJuh93iQbyCKMxsqJbJH/OlQfOswB9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Gx8BH5c9;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09312606A31D
	for <linux-gpio@vger.kernel.org>; Thu, 22 Oct 2026 08:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Gx8BH5c9
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 915DA1F000C1
	for <linux-gpio@vger.kernel.org>; Thu, 22 Oct 2026 08:18:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792657114;
	bh=yhLXfbJ/1qVmAQNxqFqMtZacc2QMaokkAVZ8ZnC2ZjA=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=Gx8BH5c9eUkcVVfP6j9T/o1OJIt97XjcTm7x3WqbR8ytYAkZGL6AKezpt8mGSAZaU
	 +1eBuNjzeRYsvfs509LoD5MQ7+NIAPg6R1eATHevxg7pj2vwqKEan30fiZF9RNRSBE
	 y64ONSVExEKVbVcPDp+/J0fHczO039auwfEFcEc81nWFadAH2sY2mCiKzrhPVjsaNa
	 kEw/kEXOvm+cCgwZ+D/xG7WuaIHWAvTukM1DuljfkPd4RRaBQoRUvYamWxS5LBZN4C
	 3FF15c2rZedVDEx/hwonbz+IEkA3bYoE1tTCEViMcfiDI4Jfj7W3imHq/LhveesV+x
	 oFtBvMTOcN+4g==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5ba3fba0080so60264e87.1
        for <linux-gpio@vger.kernel.org>; Thu, 22 Oct 2026 01:18:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzP6hG7POvnP5Q3mK6YETRyFW5ev2Q72jP3vGSlCAZ7oexVv7mBzRGGl7gZ9X2yLAEENqnatviy+qFg@vger.kernel.org
X-Gm-Message-State: AFq9FYIlV06SdqD2F2kjtx2cBNDw3HRHUmQhg6rEtOZulREY8qdMt7hL
	MMJMfj703Nm8e7kIcU6R3qyDX7dfspxqzNZykIH9v+5mAKEc3R55KQUmkPSo68I0bze0v096D8T
	8CTZEpSpBYkJxZJy92ZQiFgQBSAKZMFIt2FJEYlFz9A==
X-Received: by 2002:a05:6512:23a9:b0:5b8:f453:b0e with SMTP id
 2adb3069b0e04-5bfa1bfcd89mr1596728e87.35.1792657098927; Thu, 22 Oct 2026
 01:18:18 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 22 Oct 2026 01:18:17 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 22 Oct 2026 01:18:17 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20261021145543.567959-1-andriy.shevchenko@linux.intel.com>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261021145543.567959-1-andriy.shevchenko@linux.intel.com>
Date: Thu, 22 Oct 2026 01:18:17 -0700
X-Gmail-Original-Message-ID: <CAMRc=MfdxqmmV_rLbc2q5pFzR2527-+hVEuF00wJBT1V1mWNcg@mail.gmail.com>
X-Gm-Features: AclHuK-VWc-CgR9YOdeMtdh45PTw7D68pexvIikFGsCdBeBjT8WB_hOX_rsj-i8
Message-ID: <CAMRc=MfdxqmmV_rLbc2q5pFzR2527-+hVEuF00wJBT1V1mWNcg@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] gpiolib: Put stubs in order in linux/gpio/driver.h
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 21 Oct 2026 16:55:43 +0200, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> said:
> The stubs in linux/gpio/driver.h go in a slightly different order
> than declarations. Put stubs in the same order.
>

I see your OCD is worse than mine. :)

Though it doesn't apply on top of gpio/for-next.

Bart
