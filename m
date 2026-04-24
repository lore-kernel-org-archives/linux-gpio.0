Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D35133537E4
	for <linux-gpio@vger.kernel.org>; Fri, 24 Apr 2026 20:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777063627; cv=none; b=Yw4tEfzjRP8cwHTla4PURDS5Jx8KL3xvPQclaUfeN+3gVnkccG1hcYa4ZXbzSlqi6jevQ2FaioU+B5cLjRMxhrnlal37u+u0F4DNHiD0pXygOfdZZVlDno5X3qC/Bc9Qfa8aHpGxzmriCgjzjPe7a4hmJii9dzeQDGaVnRZQEqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777063627; c=relaxed/simple;
	bh=jw+MgYZVVHgfn3vtTTfB+rLOtsgMZ5y6tsJcAYzS4SA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ETFtL26WsiEzas1OKVmUUSsh1ZIQ1zko1QU7GN2Vj/1y+HhKpZvLdzMKDxvkvlq5isGO/8HDa5VaiJ6gMhFleoPYO9YKAGMyKwYuVJOq2GzS/mCpSUh37Sy/Ko6ipGO7Jenn2i3jgATKTZliZGa0Z5zn84p2kqBL5F/yIzGXeZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WXqVmki+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WXqVmki+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4D05C19425
	for <linux-gpio@vger.kernel.org>; Fri, 24 Apr 2026 20:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777063627;
	bh=jw+MgYZVVHgfn3vtTTfB+rLOtsgMZ5y6tsJcAYzS4SA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=WXqVmki+zweyn313GcGXqCCf3atLGl8cQ/gT6LuW9fthCetmh2BwQqcJqXvzJLX15
	 8IWgGoeBh3SDD1Tn88vEvo6yJ7MvN/GokI3damcSed2M6eP/cthBna2VNGwCZN+QZ+
	 IPKq/NYRB5tcucdTHD6E8l13pZf8ZpoXLa6OsPbu7tdER2tusUtYwpPQBz4soaHQxv
	 LHarndVh+Lx/P+JZPDCxESdxzouZc9aAHT46xxUYmRlLgKaDp9HKedJmFa6CBK8fqM
	 5u7MVcx8Y6FNQKKD8BFJEECihFbXOP7dFAGM8OqO4Said7LKapnAtdEfHcm23TdyxZ
	 o/2axPcYVtdTg==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5a413f83226so8397146e87.1
        for <linux-gpio@vger.kernel.org>; Fri, 24 Apr 2026 13:47:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/7JdTB1j1v1+toWnl/OotjcTvSZEuQxfaj+e1Bc8kfFbGkoRMIUYFISFjy0EdkwSqLVOByUgiXJaBb@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6yh3fpTOdCcIYUySIxevvBrQNJuBXIsmS7dRRgy1ly1CqdKIz
	y+AHH/Q0siKKUkmQpdL9PcHTv4SFjyc8fbuabJTeBDqAirvdigqnV9JM5huMqBlcVTnn1b5w8sM
	lEwU3YoJaCiq+987FXh2sRjAHy2DAcDo=
X-Received: by 2002:a05:6512:3e20:b0:5a2:c962:59f1 with SMTP id
 2adb3069b0e04-5a4172a3042mr9516685e87.16.1777063626467; Fri, 24 Apr 2026
 13:47:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260418-waveshare-dsi-touch-v4-0-b249f3e702bd@oss.qualcomm.com> <20260418-waveshare-dsi-touch-v4-2-b249f3e702bd@oss.qualcomm.com>
In-Reply-To: <20260418-waveshare-dsi-touch-v4-2-b249f3e702bd@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 24 Apr 2026 22:46:54 +0200
X-Gmail-Original-Message-ID: <CAD++jL=CT4CDViP0tz=F670f2YEPfzzxU0pBiu-eVa0B6XeALQ@mail.gmail.com>
X-Gm-Features: AQROBzC_zC31n0yaYjbDYVpdboDyP2JOJXGqdTaVQIcUTzUXKKm5ahVP2tMdfpY
Message-ID: <CAD++jL=CT4CDViP0tz=F670f2YEPfzzxU0pBiu-eVa0B6XeALQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/4] drm/panel: ilitek-ili9881c: support Waveshare 7.0"
 DSI panel
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Cong Yang <yangcong5@huaqin.corp-partner.google.com>, Ondrej Jirman <megi@xff.cz>, 
	Javier Martinez Canillas <javierm@redhat.com>, Jagan Teki <jagan@edgeble.ai>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Jie Gan <jie.gan@oss.qualcomm.com>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 18, 2026 at 1:16=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:

> Enable support for Waveshare 7.0" DSI TOUCH-A panel. It requires
> additional voltage regulator, iovcc.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
