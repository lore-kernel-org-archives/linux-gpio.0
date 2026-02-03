Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF1E818DB01
	for <linux-gpio@vger.kernel.org>; Tue,  3 Feb 2026 00:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770078572; cv=none; b=bGkdLFgRB77kA7kxPaLOdhUEGBlUCx072N62DuFW808eyVZ8xC378x2Vqy2vB9GWOR6CUZNNF4ulzQ1YNhLeU7IJPrl5p9aNPdT4jluN/KbZ1wWfWUIx/ZBX2lC+i58Q8i+3or6OQT0GH2eOoV8NQ59hY7O7qEE6EurrA9U4CdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770078572; c=relaxed/simple;
	bh=3vm/kv9zRIpvGnIGccp1SO6U/rqiZ7lbmB29xc3r2O4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iBkTzHxJLz9mh8swlrkFXEZktewG2DNwqqKcatEGpThFK5PTL8agsIPBdON9XyYQnHzpGjR9ufvSZyrw6h22Oi7NOv7cMA0ha+nHJTq7iqw/R9KoAY2GYMzDouZUNdiTQyvAYydcPdbdlwwKsNEAQrj8yM9WaBHjtTVExnaS8FM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XaBK/mOz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XaBK/mOz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F907C19421
	for <linux-gpio@vger.kernel.org>; Tue,  3 Feb 2026 00:29:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770078572;
	bh=3vm/kv9zRIpvGnIGccp1SO6U/rqiZ7lbmB29xc3r2O4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=XaBK/mOzkTYhQZqO6JQWlHL58yajICAJIZdpNOopAfmbFcGDwrpEXkaLY7hGkwgpu
	 98KmUDhA3PGE30WGhYR/m5Nj05a2nOAQparfCW1gB1QHr067PweZRjQdd5DVEARIYy
	 hVIPQzyqLmDDgY4FpE0JQbyaQJfWE1wnEgw6UBXwJcx4jtP07Z8eQCNmNJSwjghdFW
	 tYyZ+pfLtTkcKIJs6o21BRPBEThMXpSy29xuJ4DwQnjwsLYnLCW7Q9P9pJpjSvZj13
	 ffS+I+PvSQnhlZsqXSBvLQs03ZEaR+6g0t4RVrH941qOhS/SMkDX+9QcaJnTYem8ah
	 KJ0EbO3mfNYWA==
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-649b383919bso2283385d50.1
        for <linux-gpio@vger.kernel.org>; Mon, 02 Feb 2026 16:29:32 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVe/xLinngh+mA7wtNleEIOM7ntemVRlaN+qMGuvttpw8i+6fwm0nvxfmDZLMkUrPLSxyD53ehQdFTJ@vger.kernel.org
X-Gm-Message-State: AOJu0YwLdX+bCVXTM/KEUwVgtyzYNyUiXTf9POFeZ+d3zHV6eyBtxEYY
	AAxW4g+Bna7d/us7voX4ixdUZBi69nY8QTuSwDg9Tya6N2u1T2zLy2cG4/ZEggCshidBDOpV8bj
	voEaeoJGcX9aBDyyNfavwqcwTKN0xSuo=
X-Received: by 2002:a05:690e:118d:b0:649:d19d:3b08 with SMTP id
 956f58d0204a3-649d19d3e01mr1760131d50.89.1770078571815; Mon, 02 Feb 2026
 16:29:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260128-amlogic-v1-1-c8aeb2953dcf@gmail.com>
In-Reply-To: <20260128-amlogic-v1-1-c8aeb2953dcf@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 3 Feb 2026 01:29:20 +0100
X-Gmail-Original-Message-ID: <CAD++jLnM+_ot6CyDKYDUKcy5EcEFYbDZD1_0FxHoxF=S8yFyPA@mail.gmail.com>
X-Gm-Features: AZwV_QjBQY1gX2gsq14TbI1JTob3bjmO9B641FWFogw9-JRL8gq-V-nd0dVYpsQ
Message-ID: <CAD++jLnM+_ot6CyDKYDUKcy5EcEFYbDZD1_0FxHoxF=S8yFyPA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: meson: amlogic-a4: Fix device node reference
 leak in bank helpers
To: Felix Gu <ustc.gu@gmail.com>
Cc: Xianwei Zhao <xianwei.zhao@amlogic.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-amlogic@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 27, 2026 at 7:23=E2=80=AFPM Felix Gu <ustc.gu@gmail.com> wrote:

> of_parse_phandle_with_fixed_args() increments the reference count of the
> returned device node, so it must be explicitly released using
> of_node_put() after use.
>
> Fix the reference leak in aml_bank_pins() and aml_bank_number() by
> adding the missing of_node_put() calls.
>
> Fixes: 6e9be3abb78c ("pinctrl: Add driver support for Amlogic SoCs")
> Signed-off-by: Felix Gu <ustc.gu@gmail.com>

Patch applied!

Yours,
Linus Walleij
