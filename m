Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.175
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794050144;
	b=TU+kVtr9s/TmPVo7b+HztrYwVvt1AjJ1oDWWHBw9cT1hEI+Elg4OibIGRGSjvRU8Fjx5
	 wl3ntBJDnOse3bcWt1zhqMqL6ud14FQ6sG+OaHmg69E29LbpzaQd0Na02SCXSyIcTc8/U
	 ddSWdwkwZJOYyaowi8J9mfrthKvaIdgslVginlzpp9kfypqzaqdUMn79hN6l+t8/5UhlP
	 MnjR0pmwwqe00emqn+3Cl86KhnkR9Sq30WbrOpqCqKnDKRMEnSLnli4St1xaU8C1llrM8
	 iMMwFQhIw5M8yk7zRjmLT28W4Z8z0OmzRECT5zl+JfRrEeHjlgsa6cTkPX4wzUS109g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794050144;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=3HSmB0DZjHvws5cEwelRodlMTqP7Ejl6doLTNQjKzKA=;
	b=G/XGpYoXxR90UedYsNQq0j0l4p2OTSWgqPWQy4D3hVdhK0mkPmKGl57jdr2F/LvtQIXw
	 KGH99Xv9qMPjz1Ic/H0ansjrMP8U9lgD2hATy4eH5ouvnuVlkyM4dsbQ83ZAudEHpXInM
	 jiQ8w3xFbtzo/wt5YW3dJrqZjqwV94lbA+t4gqG/S3lNKUO1V1J44xLI73GOY5ls1rlH8
	 nbSSQHGivB4Dvj/VnBw8li0YI3GVzwFKuWfW39JpzsGj1OkTJenLEEznUXjxh9AEqg7Qj
	 qgZPCjbb6Y8ZaoOAgHeyk0/RCoGvyIEbgkJE1WllG0ciHHZsWGi/+NHsnhWu8JEGTMA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XGAZmRWQ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.175
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F801606A32C
	for <linux-gpio@vger.kernel.org>; Sat,  7 Nov 2026 11:15:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F801606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XGAZmRWQ
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-8b31ca7e0bcso12665207b3.0
        for <linux-gpio@vger.kernel.org>; Sat, 07 Nov 2026 03:15:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794050143; cv=none;
        d=google.com; s=arc-20260327;
        b=Is3DONm24QZypodffQ4FKLYKYO+vEuKoZjgD9xRCPuNoyPlUf9vw3ZM0JMpKDse+vS
         4kjXN0rrfH780s1Yep0FjVwRDZwA1wkTYC+bDMN1rzzzwoXqq9s+odV5BEMnzUiQdR3N
         TSztQiyw4NCeqJREhqaaLFJTeOgsS0IhiY2FjXWgy1l/SKQChboZ6oTIJdRYQkPdHsLV
         mJd3fxl9X3CB/nkcCU83yD2m8fq3ZAg23Z8Pktv6tFjnZf/yk2eATA0Wcc9bGQjTpONy
         G5xq+6NjmXeSFP18E+kZc8Dzm6HHe9qVPBYTfQlo5HRGt79mhsuWKX4ZQ0ti69xisyXr
         L/UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3HSmB0DZjHvws5cEwelRodlMTqP7Ejl6doLTNQjKzKA=;
        fh=sfocTYlB1H6LvaFzwKoT32NO9n7QYfVlNdityKV9Lr8=;
        b=Ga9QLEi0J0WUBPzuNtEFVvF698z/4ZglKCn2QJ8/lFEVdFiKoSBSt8SxnuaCT5WSeA
         tLKrq5PlCywfXzJk0AK9Zq8edVCUlBB+6LIM8AkJChDUI9XzgATFLUVrwtOyK65l9N3W
         2EZSpaoOQurZPiVT0d3zOQcMgnRlJLH3TfteUQ0dzdzy38LA90Fr8dFS4knOKWy8Cthb
         A3rq0Fy8IIRaGOWNuIQCDMBtCGhVVEq+IWGN5FohjRDTiCsZBNA9x1iF3vTz+nFM4Lal
         5jWKUskjlMbvE93fJ78GAtzYj6vXhXvv5TRHJ8NQw/jT5S3llsljOw23lQsYhik4OKXZ
         jv3w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794050143; x=1794654943; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3HSmB0DZjHvws5cEwelRodlMTqP7Ejl6doLTNQjKzKA=;
        b=XGAZmRWQx6mLwFv8/yCKATDy5MtBDRhngwjAjXpXlZPMTz9crPtxgiDQ6ic8RkYx+Q
         b3zaal0mwySuURptH4A/DMPx1BERxU/LFOxcBe8eMt+QwcSRtPXr/3OQxGp4iPtcAmNg
         Rb/U2egfEzii3F7w6W2d6ltigRz8qaDb2FiXnuzhNLI35IheNKXeRH0xMzKxRqjSX1sT
         V8qSsh7xUeuc7jkkeYsIhOXTybHi1D6gURy69AD/dta1ZKZvLKbzgisWVIWunwB+vZ2p
         oyVfGYWf6GfLJmMePpIZk5moatKyXBJxzQF7vLATfefuNH8SCFJCgz3x2vg7BuIIXOLH
         o98w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794050143; x=1794654943;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3HSmB0DZjHvws5cEwelRodlMTqP7Ejl6doLTNQjKzKA=;
        b=diCG2ctnHSfzGApoYE4sxmT9Ki/2Mp3xH550pV6Yq9R7VFOk2w1CK0iXKGttnXGk86
         XIGoj7a2XLVmLsLVzAnk8Ug0T+I5NkmteL7JHJYESk4QR8w8zSUCk19V4kNQQpDT+ydh
         8I8DrQVKa4dDsxd7pY2vhsyJ453LR5cebvMkSn0WbLopD8j/lvp66+7UiJngwlJ3VngE
         fUeDw7PzhS/cY9DHPY8TZ5bUzSq/16qrYzHVJ7W03SvI6BISVHuvZTdmU5B/O6nzQjEC
         aXk0jEIGTzf35uk9l/9ChP6WZx09xceWkWg/KlDz6iWcEsD+fwQAx8e7jdtvVIdhGAsq
         2ZvQ==
X-Forwarded-Encrypted: i=1; AL+hErHqJtBABuvC+JpECkMr58ohA0QzYTsdp+B1pYiDZE1M+LT/yLeR2IM4ajAAeuKD/2w/UBSNUWbjXycN@vger.kernel.org
X-Gm-Message-State: APuU4Z8Ej/y0alOczcTISb03699FDZr+zlzZwHDTt17c9eQsKkAR+1OE
	P4vrPjenP8WcfvHWOn4iv3B7I6qPgSZ8Y/D2zV8V3+QuWLKQ+2wTNhn2dJuXwwwkvwTV+COzTBu
	268wR8FeD26L6b9HSGyhXPzdsMbY8JZo=
X-Gm-Gg: AYBFou1RjDvTATZvUJkNtMwM+jvKI/2wIHOdYmutiwGzg1jagaToVEI8m7E6cpy/0rl
	ojiFfvC//LPA3rZON0vRrYALHAMs4iggSQLYzQNqJLkweMNflDBNIsCWf9vbJbHI11Rq0ymm0yN
	a/ZeEYnQrivFGS7WWHAqrS9Sz3cqEwmsk/Ks9Z3Zw2Elx4YiJnJjNyRIyUC5eMWKzs4V5U7450o
	7iLtUCZroY2Z042AxU4Awspfn0C375IJWvC859lh9iG/KWX9vYekTwPZOhnuMzfBJSsgskaFJaG
	2HR3ov+iFHPDAu7ZRczBJhmnfdTGxOJ+MrK2FHBHVqhvzPhusoflE1tzAfElOwy61Tup9mflzDg
	kxbyX09wkGYn3FMCDZYjKD+zTFYge0icw4v6XDgNDQDxyIOVLaFjeTjOmxmuYGmXPVp457xmXg/
	6qPxBfgJutb7o4gKEQoPvnwt/ifDiVMpGpXOEScn16EYCkI2UM+udj9XsAyAiQ7z4K+G/w1bZPA
	DBJpXCU9s58Oj3HvjnUqUfK4mSCGs7XTziq75AfTP5BlR4O41V8NQarzmm33g==
X-Received: by 2002:a05:690c:f8b:b0:8af:1843:a9e5 with SMTP id
 00721157ae682-8b341947fcemr31396197b3.23.1794050143143; Sat, 07 Nov 2026
 03:15:43 -0800 (PST)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105-b4-gpiolib-free-v3-0-bb47ad58642d@gmail.com> <20261105-b4-gpiolib-free-v3-8-bb47ad58642d@gmail.com>
In-Reply-To: <20261105-b4-gpiolib-free-v3-8-bb47ad58642d@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 7 Nov 2026 13:15:06 +0200
X-Gm-Features: AclHuK-AuhNYR5_8OMU43ye9BksXkryOCBq9XAGKYISL53Li5pqA0n8BIGvcR4U
Message-ID: <CAHp75Vfu8vtRXj04Z4+AW9tkK6e8p7hFyatJ=PO7X1M29TE9OA@mail.gmail.com>
Subject: Re: [PATCH v3 8/8] gpiolib: use %*pb format specifier when printing
 array masks
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, Janusz Krzysztofik <jmkrzyszt@gmail.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Andy Shevchenko <andriy.shevchenko@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 6, 2026 at 8:30=E2=80=AFAM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> In gpiod_get_array(), the dev_dbg() statement prints get_mask, set_mask,
> and invert_mask using %lx after dereferencing them as raw unsigned long
> pointers. This truncates masks wider than BITS_PER_LONG to their first
> word and relies on the raw unsigned long pointer representation of
> bitmaps.
>
> Switch to the %*pb format specifier, passing the mask size and pointer
> for each mask.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

--=20
With Best Regards,
Andy Shevchenko
