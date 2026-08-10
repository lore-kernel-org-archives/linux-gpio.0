Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F327E3C3428
	for <linux-gpio@vger.kernel.org>; Mon, 10 Aug 2026 11:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786361046; cv=none; b=OYri2x7EvORZu5u9YFvFL9BAPF9Lp8r7nd7bUdGAuh2pA/5j+pOowIrkMesut+5fuk9rW5sHX7+DRKY/dRMaud57jt6BV4DfNS6a+ydoXt5SfzCLwIVCtCHyLYZYWtMEk4x/CK2RXjSJsq79OKHkZBfhkCW3GF32tkIuOTCMjdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786361046; c=relaxed/simple;
	bh=kNKcpEsxDjfZLHc6s+Y45GOXx7jCtt7UQGsh6xp7mcA=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=irZ9XbpFVEjr+cSpuB7UqJQILsTisJ30fc/UeNiHc+Nw3R2kCQx669nZeFD/hGiawscN8ioMtvHWgas+Cih2liuojwcevaZz1gZ+QROCz8UF5ieFQFj3tZx8utUZj1XwcZ5WM0Gg1gbg92X7s/nCikPFU9xKrIE8yJQ7muAR+ZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Cr+O68X/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Cr+O68X/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D97F1F00ACA
	for <linux-gpio@vger.kernel.org>; Mon, 10 Aug 2026 11:24:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786361043;
	bh=kNKcpEsxDjfZLHc6s+Y45GOXx7jCtt7UQGsh6xp7mcA=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=Cr+O68X/0YJ4cF9M1950Sn/fjVqo+vrdqG2HoX/BrUFEpWrz/Hruwq41Dh88iazOk
	 U8j6HKNGxlFKcvQ1nDlZcpYkR55NGkryTop6FLmmB75UpoWlZ5s2TGpZXmhN24K/jt
	 7utgFg8MBPofYNns2sRBgaye79+l+5osdb2S0yeRrv3TkWLbIxL/ROI+roYuYmnYwg
	 tpACqUSIMAEd0wBMK5c4qZhIXQHrHeVBujs8xYK3IqfCBhpIZ4KJXmvjTbAUtymGGP
	 HqzOqiWZH14YfWnIe90hTNWcW6QNh7lo18+/1QSmRsJuzGM8WcLXFRCk3Jp0XLLzpf
	 SAOFbrpCN+vog==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5b29599b81cso2245200e87.1
        for <linux-gpio@vger.kernel.org>; Mon, 10 Aug 2026 04:24:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rp5UbyprrhuDyq09bvy6C412XHoUR2xe7HT8SDMQYjvWSPjhiPBq8pI3XWyk6/CBU3fF3LdKe57tUpM@vger.kernel.org
X-Gm-Message-State: AOJu0YwvGYztd0OecKF17bgpR5T6Em3ApvD2BGxcLt2j7dFbu9bACfZv
	LdxlzK/O8DYFVyyIswcOBinOvXjQ9jOeorbxPrpIqScbye8PFq2AhlO03R/5jSBQLxG59I6IMSi
	IttwIx2RRfDIQjqBZGu3+CqXdAH/+Za9qUZQYfFn4dQ==
X-Received: by 2002:a05:6512:688f:10b0:5b2:a4bf:a6d2 with SMTP id
 2adb3069b0e04-5b3181c8259mr117533e87.39.1786361042263; Mon, 10 Aug 2026
 04:24:02 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 10 Aug 2026 11:24:01 +0000
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 10 Aug 2026 11:24:01 +0000
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260802-sm8475-tlmm-v2-1-a93e1d1cb53b@proton.me>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260802-sm8475-tlmm-v2-0-a93e1d1cb53b@proton.me> <20260802-sm8475-tlmm-v2-1-a93e1d1cb53b@proton.me>
Date: Mon, 10 Aug 2026 11:24:01 +0000
X-Gmail-Original-Message-ID: <CAMRc=Mf+_3CYbcT79NhBPLz2FBs-xWKA5xZxY_hmHbvYvJxF9g@mail.gmail.com>
X-Gm-Features: AUfX_mywkhS-dFsDLxXis5hy2lIBxPJP1ka_J4nqpo7r0Qqplm7l3mc5qEJQZng
Message-ID: <CAMRc=Mf+_3CYbcT79NhBPLz2FBs-xWKA5xZxY_hmHbvYvJxF9g@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] pinctrl: qcom: sm8450: Remove duplicate reference
 to gpio81
To: esteuwu@proton.me
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	phone-devel@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
	Esteban Urrutia via B4 Relay <devnull+esteuwu.proton.me@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Sun, 2 Aug 2026 09:30:54 +0200, Esteban Urrutia via B4 Relay
<devnull+esteuwu.proton.me@kernel.org> said:
> From: Esteban Urrutia <esteuwu@proton.me>
>
> gpio81 is referenced twice in prng_rosc_groups.
> Remove the duplicate reference.
>
> Signed-off-by: Esteban Urrutia <esteuwu@proton.me>
> ---

Please add the Fixes: tag.

Bart
