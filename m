Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AFDA39B97C
	for <linux-gpio@vger.kernel.org>; Wed,  8 Apr 2026 08:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775635701; cv=none; b=jpEIxxdDb5B8rgr3mWgLYWAF7kUmqYa/0Jgy5J+ZhUPj0uXzR3wwvkRTGOkuBYC9u8FEwFyDhCfKpIRwzM9UaCDPR3YbgjHJKVfC/1vjPbTNs63eFuLwux1rHJYLZLQKcdh2Sje8HuziZpuRQdgZTEcVd9WxfOaCN+sBF5Hb6FE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775635701; c=relaxed/simple;
	bh=Z1Ts+VSZ8ou/NVe55RhyiohrVm9KZyDeSwhovMasKD8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pf7NP3xPskLFD5VfniURcH8UJDDiwVAQGS+gcXcpZSWyCJEUnOtJCNN0Xdw/J73sgzmC/c7e55lvE6fLRM+8o4pKgK+8RTESWliBa9rbrVBOv85/SyKKCVzMyfMG+6ucEkIwTLGmY8zYmcDs91kBIzwjCpKvitwf2RELJk/utC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EFUIV8Vz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EFUIV8Vz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF649C19424
	for <linux-gpio@vger.kernel.org>; Wed,  8 Apr 2026 08:08:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775635700;
	bh=Z1Ts+VSZ8ou/NVe55RhyiohrVm9KZyDeSwhovMasKD8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=EFUIV8VzagVTGspbyWcs99qygrmbWHOf3+hu2/gd9pXn9sEVpWWttAUWKnsJTkfKm
	 GQsm2BAFr0YvwRbV4wxTCKYxqIR9rf2+akW2xVglsXTL9O/MA8DEmp2LPtb/HYMzUy
	 2o+udoxr+wB53XnefG9Yw44IRJU7WpigKpVxtz2LBtYDZvf66cL3h7y1u9jZ7QttpS
	 HFm3gSG3dgCSRfzHGvq8Xu2r8zcKnryvWoKA7dSaq78EzUzdjV/Os5zyUF7gz1u6Gn
	 bUeZC8+HRZTzeIoi3Pa+GdqQ8sK1j/M17LfUQjQSU3Y00rRCLjVRc7MYnXY65PUGj7
	 LLUBCRZyXw13w==
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-7947cf097c1so55647917b3.2
        for <linux-gpio@vger.kernel.org>; Wed, 08 Apr 2026 01:08:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXypRPJ/NDjNQOV9V/2wCym+Om3C3C1TuazG+diRO1Vfedizzy+BYNJsrScZPvbNLuMhz5N5cXs+kjk@vger.kernel.org
X-Gm-Message-State: AOJu0YzlHnsnS2P8UdTrbXIK4tOkM72PZk2a1AyJwhLcBICoABwCHD9K
	OMhKBX46i2y9j83UfVtbn5X4NnrNSM+uivKlZNV+geC1vdJBw6bD4cX/zSZ7Kex2wucAv5T8A2Z
	2YNMC3nmDd+i/E3rWZZ7AqdyjDnXLFe8=
X-Received: by 2002:a05:690c:83:b0:79f:3715:1980 with SMTP id
 00721157ae682-7a4d31e8531mr208856957b3.12.1775635700366; Wed, 08 Apr 2026
 01:08:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260401-waveshare-dsi-touch-v1-0-5e9119b5a014@oss.qualcomm.com> <20260401-waveshare-dsi-touch-v1-8-5e9119b5a014@oss.qualcomm.com>
In-Reply-To: <20260401-waveshare-dsi-touch-v1-8-5e9119b5a014@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 8 Apr 2026 10:08:09 +0200
X-Gmail-Original-Message-ID: <CAD++jLk4_hrHPau6o_hcDHxkogcb1gJN_B-7=mG2h_yy+jcABw@mail.gmail.com>
X-Gm-Features: AQROBzD0nHt18W_nwPr3GegJacTTDqPAXGlhjqavd0Oyh2PTNzHmEVgvGVfoQsM
Message-ID: <CAD++jLk4_hrHPau6o_hcDHxkogcb1gJN_B-7=mG2h_yy+jcABw@mail.gmail.com>
Subject: Re: [PATCH 08/19] drm/panel: himax-hx8394: set prepare_prev_first
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Cong Yang <yangcong5@huaqin.corp-partner.google.com>, Ondrej Jirman <megi@xff.cz>, 
	Javier Martinez Canillas <javierm@redhat.com>, Jagan Teki <jagan@edgeble.ai>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 1, 2026 at 9:27=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:

> Sending DSI commands from the prepare() callback requires DSI link to be
> up at that point. For DSI hosts is guaranteed only if the panel driver
> sets the .prepare_prev_first flag. Set it to let these panels work with
> the DSI hosts which don't power on the link in their .mode_set callback.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
