Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 328AB369220
	for <linux-gpio@vger.kernel.org>; Tue, 24 Feb 2026 08:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771923453; cv=none; b=WPJ2yLQfAA8lpJXgmcOPqxfmnIl4s3aGZfaF3PUR0Ynwczna7/wuhyh5cnMlHHwaGMCGTaLUuezZnbQ/Mz2Bqz5128CHv6vbZSmhtWcgV4Minr1w4fv4+yB3Z8kobgImqhgFm2QWI7bsn0hIv/uRYFWtZq0kXd6XrK3S3GNuPL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771923453; c=relaxed/simple;
	bh=axytIEExTcTqa+jciqtynur/91WP8pJORO/oGHabf9c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hNWgulz6JYQHfYmE/ENezuhIlCYZaWa8Vzc5K1BCeE+JRmqU5VR8yqFpm/+EFccGlvemMc4xyhE+XekzFu16/8VIt+YQ2bMIHK4SRLnN7rSZhCQn07SsXU+VlVFHsJSwvqAi94slymD6EN7Zs8nNmafb48TeZvVc0W4oEZ62+go=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MzHbzvDn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MzHbzvDn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6B63C19424
	for <linux-gpio@vger.kernel.org>; Tue, 24 Feb 2026 08:57:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771923452;
	bh=axytIEExTcTqa+jciqtynur/91WP8pJORO/oGHabf9c=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=MzHbzvDnqNz+dOJ9JuJo1SjhLLYoFbNj1WwxWDzROJv6XPaoKq5AJBXcYM5pONhiN
	 9QQ0dqXIF6NulSXbvwvE13Mrdi3P6H9ZmWvkN095m7NPtGWTai4tA9uqXx1d5VYlmN
	 tvIBKW+mShjywTYTWUGwW/5PNV9Kza/FJLEmi8jY5sEYE4YhrGL1Naw6ovhsDpw73I
	 pqhpssOO/JhbgAVt3b2yuTsNVtdPdYErMM0lEbaonksugEVywmwri8l0ysJhKaYxPa
	 55p96hvh7v1BPLZb/fM+Q8h23dkRnnQJpCLBbBnyYT2VxKzIprTOSXzKv5exllGIGB
	 5WA0MABn4pWKw==
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-79800183233so65531477b3.1
        for <linux-gpio@vger.kernel.org>; Tue, 24 Feb 2026 00:57:32 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU0lLHZlp2J0S0s/jNSdBEzP8CGATq30/KIx67E8Y5bY8no6EFBYTUnv+LUETwbBTAgfZ2lCWphy/dv@vger.kernel.org
X-Gm-Message-State: AOJu0YyocFBZWDtt57SpzSDbnJI3EhjXM4LysBghccyOeoU+WJkkE0wy
	dReDdL4U9V4F4Ai0V9Oep/lRUT79iee6vWIz6BwD7bRh8R1zx3o0F5JWMHxroaZ+CKgoQCRM3Zq
	WviPzO089Gg6UnT19iUCMTU8kiRWZBA8=
X-Received: by 2002:a05:690c:6e8c:b0:796:203c:681c with SMTP id
 00721157ae682-79807c26827mr139228817b3.5.1771923452293; Tue, 24 Feb 2026
 00:57:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260217125735.280920-2-krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260217125735.280920-2-krzysztof.kozlowski@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 24 Feb 2026 09:57:21 +0100
X-Gmail-Original-Message-ID: <CAD++jLnNsO3G_j35Yw_k0F7Vcq2cThMeuBH=xZPP5Du=f97CUg@mail.gmail.com>
X-Gm-Features: AaiRm50EPhPixCJ87yA9FP32kbO_b00w6so8Px9YKoYkv7-ie3fIKbnA_48-o8c
Message-ID: <CAD++jLnNsO3G_j35Yw_k0F7Vcq2cThMeuBH=xZPP5Du=f97CUg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: qcom: De-acronymize Glymur SoC name
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 17, 2026 at 1:58=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:

> Glymur is a codename of Qualcomm SoC, not an acronym.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Patch applied!

Yours,
Linus Walleij
