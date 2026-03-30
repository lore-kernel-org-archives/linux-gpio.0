Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CD5E3AE190
	for <linux-gpio@vger.kernel.org>; Mon, 30 Mar 2026 08:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774859966; cv=none; b=s4eWnSKGMY77x/JjFijRTbQWJ6LPS1rsYqodEZjkefZVaU3g1zoUzOaQPhU0d6mEqiXD90RuZTyNimzjxKrRdBRCRTLmQE/RBywTMoesrD67qPyYqu/jvaVU4ENsMqWS1KT5N+YdSdXLVqcLE5tRDNRRNwhY/85UOAZGAFo8DhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774859966; c=relaxed/simple;
	bh=umnQk3UpOh+qDDWistEbDv3ogCuUOM9rD50xV5AN+RM=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mbvoB6XwrAJZDt+HRVJV0jqn2eizik43SFmvVTcEtxOF6YquBBgM42CLYvu3F2OZKGIgwzUIkLCdqHFBGMTlgIGdD0J/8ry93ti2iGA69zeYCeodH3EA3ZyQIuSnBLzIiXjAQTJn8nsiGyXG3TPJst45nhTiY0AoLbmKoPpzevw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EShYnJy8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EShYnJy8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD863C4AF09
	for <linux-gpio@vger.kernel.org>; Mon, 30 Mar 2026 08:39:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774859965;
	bh=umnQk3UpOh+qDDWistEbDv3ogCuUOM9rD50xV5AN+RM=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=EShYnJy8Hf82zxxxrb5lFSNfIYnW6HFgP96jJAY+fjNBcb+Rf/gbFp3fiI84GnT6M
	 gvfE5DjWSVf57okVW1QGgXqCRCFGx0pijAaiigOGkjXVo86XDHHv8o9RgKUAJK9oDE
	 /nm0SptGUoSb8O1M1Bn9MKX+X0J7vJjUIEr11w9mFOe/gWW+R3Cq5OwrVM3OTp61bl
	 g3TogEC+QAKE0mlWp/9c1BnJtBRxQE7HDEsk1GunyRMhv4I3maQwWZWU2GujYUpDjn
	 mZLaJoM4Ws0KmmIkDrlnxK2GTAKX/nMsb4qigDl385WVe1aemxXO0tBp6aSqlttBTI
	 r/7U+pNvSwMCQ==
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-38a76ba6a78so27075981fa.0
        for <linux-gpio@vger.kernel.org>; Mon, 30 Mar 2026 01:39:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUuJBFKGbuP+gq3hWZ63iA3WnvUshloN8ZZYZnmTLzn3yrd49kWHTTtb9LFNwifLOzY/QUY26fvBkyo@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+3doqhsbRrXYj8aso6RdmF5O2OSahCYTg0BKjnzy1rRjyzL/J
	syArnyE3hH9zyfD8DfxkB+BDgCuPxV3/pt9Q2+QkgXNTvieIpVpAnTwBgs8BTDsC9nJTx6QyQa3
	DfqE+UFxj+McJawmxnvoBfz2UimObcKZItQOiCJmNpA==
X-Received: by 2002:a05:651c:f13:b0:38b:fba9:d2bd with SMTP id
 38308e7fff4ca-38c73227fa0mr37423571fa.14.1774859964448; Mon, 30 Mar 2026
 01:39:24 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 30 Mar 2026 01:39:23 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 30 Mar 2026 01:39:23 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260326-mfd-arizona-irq-v4-2-50c47ed0a18e@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260326-mfd-arizona-irq-v4-0-50c47ed0a18e@kernel.org> <20260326-mfd-arizona-irq-v4-2-50c47ed0a18e@kernel.org>
Date: Mon, 30 Mar 2026 01:39:23 -0700
X-Gmail-Original-Message-ID: <CAMRc=McsYje-u_o8zDV8zCHNBq4x0z7tNoW3KGcpVfhWwBprXA@mail.gmail.com>
X-Gm-Features: AQROBzDfz4YwJLhrElk0As584U1OTPimowRcM6qcvhfCOQVEv2V7w4HBGKdrrbo
Message-ID: <CAMRc=McsYje-u_o8zDV8zCHNBq4x0z7tNoW3KGcpVfhWwBprXA@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] mfd: arizona: Convert GPIO IRQ handling to descriptors
To: Linus Walleij <linusw@kernel.org>
Cc: patches@opensource.cirrus.com, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	Lee Jones <lee@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Charles Keepax <ckeepax@opensource.cirrus.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 26 Mar 2026 11:51:12 +0100, Linus Walleij <linusw@kernel.org> said:
> Convert the arizona polling GPIO handling to use a GPIO descriptor
> instead of passing a global GPIO number as platform data.
>
> This mechanism is not used in the kernel, but let's preserve
> the mechanism to be nice.
>
> Users can define "irq-gpios" in the devicetree or software node
> for the Arizona chip to provide the GPIO line corresponding to
> the IRQ.
>
> Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
