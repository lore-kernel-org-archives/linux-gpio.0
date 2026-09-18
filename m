Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8801C2FBDE0
	for <linux-gpio@vger.kernel.org>; Fri, 18 Sep 2026 08:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789718734; cv=none; b=tWpMb5RJu4dJ6szUORtf2+pUR+pA68AxWo2xqk0ywJMViu6An+scURe5xQ3F5+KKdRIkwANwmeZrYepvRmZhK9/eROld4NJ1OW6Lce+iKv9RF2PxMmMjgHq+WYk91iFFDR0K0DAkgXMyhbE5M57sWm/QadQA1HMF6d1Wmvmu114=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789718734; c=relaxed/simple;
	bh=zeUe3eo1GoklWPIUxo4YT9pFQt1O8xr63Nmkn6q3zaI=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tz/erKzpnPezu1RqNcGfCDhXvOGBRjlCzpL1YOaFn4uvggY5Lfvb291IrlWCSS2Pp3eDUMap4+/QRwfuyRvpJEaXpHXDyA+4q2FX/Uo4OBbtn+6GZtBXL/xXM8KG/US+5iV2EzAc16+KHb7Yv7XCr9JFjPSUQiPjQFz1bZVEnVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n5R5nV/Y; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n5R5nV/Y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D2071F0089C
	for <linux-gpio@vger.kernel.org>; Fri, 18 Sep 2026 08:05:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789718733;
	bh=zeUe3eo1GoklWPIUxo4YT9pFQt1O8xr63Nmkn6q3zaI=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=n5R5nV/YxPjHdtd6FrR1GmX51JNtUOWhuSeGGTUVThVozJbgKfQfkmhRmMHiXjbcD
	 xsNnHEBLnvvyI5gJ0RL0xYALExDVqm5frTypQm9zZHlTHVXdHFxLic1OXaUHeUf75k
	 Ll7ERskMhmWtTSOUyh9gzS4plS3P8WHVbYgiOtMvTzeBMLo6LyXRVYXnTX1KuLMCEe
	 R9GL0/GoC1RmCjOunFmFQwTntHnriS04oMZQkBigJ4dpTOGGfw5BOc29ST3jZkutTU
	 oxffLydpFWHU0uJiH5jgZrg9wOryq0ziN+jlIIwRxRIDHM5IiE3btjjsCb8qIaLf0j
	 J3OU8Qazgzm6g==
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b8c1b8d7b5so334741e87.0
        for <linux-gpio@vger.kernel.org>; Fri, 18 Sep 2026 01:05:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxzPWZyUhF65UBjc9vD7Her1xnBBUMaF0NoEVRmyyBvWMvt23CBL08tzkViOLCu5O26nd5nFoKnS3+B@vger.kernel.org
X-Gm-Message-State: AFuF++n4+Moyqp1IB/rXnPyR0Vd60hw81mvLrrFWLT3BfNtSYbEJnhqF
	o4kI45I9kuJyv+BZtELK8h9D+XkKIKmPVF409XnffCBzpjwpNFFUt8Erqg/RuDgLPJqAM+JvU8Z
	Z92rCs1b11A8NcH+YhcAVVJlF26jUDoMd7sIO1Pem9A==
X-Received: by 2002:a05:6512:2348:b0:5b0:113d:8ae5 with SMTP id
 2adb3069b0e04-5b8c181f532mr469072e87.10.1789718731959; Fri, 18 Sep 2026
 01:05:31 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 18 Sep 2026 03:05:30 -0500
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 18 Sep 2026 03:05:30 -0500
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <aqyPs5d72s80G6b8@QCOM-aGQu4IUr3Y>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915014447.282121-1-shengchao.guo@oss.qualcomm.com>
 <20260915014447.282121-3-shengchao.guo@oss.qualcomm.com> <0d0ee38b-8ded-480d-a586-d26b3c292427@linaro.org>
 <aqyPs5d72s80G6b8@QCOM-aGQu4IUr3Y>
Date: Fri, 18 Sep 2026 03:05:30 -0500
X-Gmail-Original-Message-ID: <CAMRc=MeB75OeOLeO8nqLXQJMHcny-fN-0J7QGQaSbof++TqFmg@mail.gmail.com>
X-Gm-Features: AcwNN1VMwnU0XUPvXYqgB07GC6-_9-ydwdfjzqt_HuRis4BNTrvb-EaOoN0gg4Y
Message-ID: <CAMRc=MeB75OeOLeO8nqLXQJMHcny-fN-0J7QGQaSbof++TqFmg@mail.gmail.com>
Subject: Re: [PATCH 2/2] pinctrl: qcom: spmi-gpio: make direction changes exclusive
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Yu Zhang <yu.zhang@oss.qualcomm.com>, 
	linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, 18 Sep 2026 03:11:15 +0200, Shawn Guo
<shengchao.guo@oss.qualcomm.com> said:
>>
>> Personally I would prefer patch 1 instead of this change.
>
> As I mentioned in the cover letter, both patches are fixing real bugs
> existing at different level. So I prefer to merge both. But it's a call
> up to Bartosz.
>

I'd take both but I'm not sure if the ASIS case for shared proxy can be
addressed without reading back the direction.

Bart
