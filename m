Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A19935E948
	for <linux-gpio@vger.kernel.org>; Wed,  8 Apr 2026 08:15:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775636127; cv=none; b=i3SviMhoEODwvgR6mg/pEMKIwyMeTtVG32j0PrAGP28uHrcxd6RJYnDmfOSLRTPgbJ6PuJwoEI874s4+vocsHekn74gAIMBW6NvLaBoetBEdi3kkzeOa7XX7TjoyY85oRnz4rbIozTFK2P3enhhBIIzvu36yjG3zHamuQkO2VkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775636127; c=relaxed/simple;
	bh=xZTSZRs0sbRDgY1K81wjxHHQ/9DUVcEHhVIDQRsGRhI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lEtWZkKhGtp6bHtgWveewri3oW5m/EdF7d9BYC0xXlyf/C/01RnSRYjrAPrqOfw9PY3Hs8/8oRWsbGXwR8Ftqoqxzv5TOpzQ6csxgYCerKr9H+hRCpWv3dQmTHSvsP7+H1poCjR1G2o1WAAlv7y/utA7QJEJNQoObifC9O1lDp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EdzAMEba; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EdzAMEba"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AFC4C19425
	for <linux-gpio@vger.kernel.org>; Wed,  8 Apr 2026 08:15:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775636127;
	bh=xZTSZRs0sbRDgY1K81wjxHHQ/9DUVcEHhVIDQRsGRhI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=EdzAMEbaoAnwjaLYx0qzcbimv03/A8Yk6Fbq3r0R1iFfdf4Z6C7AG85cLOUpTbzB3
	 0IMj4KLokxXA8A/AunIVVsYNUkMz1qGzZ9lSlZhKexHjmCZOsMsmso2fWhlzIdAxpk
	 yDbFfRTCHmB6hMFHnmhldWEbWIT1Swb4JT3AEv4g6uaTTkzD3Zn3UiWCr3ku/SaHCa
	 rbpiJZtAoSx6CdbB2ul9eI937QKOMmZgJnCJqOTCYl+kT1koFVUF7RXgGcQGSmhi6E
	 Od45wUmL4X6+Ci5KINf5W4Mdl3Ri9XvnVFzaPrZrHCgrljyvGSw1DH360UFLKnpGlQ
	 e14xIoWW85i4w==
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-7982c3b7da9so53986207b3.1
        for <linux-gpio@vger.kernel.org>; Wed, 08 Apr 2026 01:15:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUKw6VdyHY4U0ESzkvXPz4xD13qtLJnl8tAd7LAF+bwrB3ubtLQScfLzFku5QXZdr22D3N5FpKkdK6G@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0x6W/44dDFQbOSq1HEah06TjikQLXrPM3c/3pldlZCQv5fGrY
	dPpcEPx7FrhcVB+6uZUA1Yf79+onWf8u2Ae+3yHQWR/+t7YNmKJJ04EBdX+8k1aj+hfqD+VJ8ao
	LcZDa0kefW7onUjRpuI+XaMHb4uNsG+Q=
X-Received: by 2002:a05:690c:6c13:b0:79b:e346:fcfb with SMTP id
 00721157ae682-7a4d536d25amr203296817b3.32.1775636126528; Wed, 08 Apr 2026
 01:15:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260401-waveshare-dsi-touch-v1-0-5e9119b5a014@oss.qualcomm.com> <20260401-waveshare-dsi-touch-v1-12-5e9119b5a014@oss.qualcomm.com>
In-Reply-To: <20260401-waveshare-dsi-touch-v1-12-5e9119b5a014@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 8 Apr 2026 10:15:13 +0200
X-Gmail-Original-Message-ID: <CAD++jLnAaUzHun-i7PBLzFQmsKCXXfRO+4hAgTFCZtLm_Bu6iw@mail.gmail.com>
X-Gm-Features: AQROBzDPMsTo8Q-h8qP3H_WTkRwwClJVDSsQZesP_kI3xg0qbihfSen8BjVkm48
Message-ID: <CAD++jLnAaUzHun-i7PBLzFQmsKCXXfRO+4hAgTFCZtLm_Bu6iw@mail.gmail.com>
Subject: Re: [PATCH 12/19] drm/panel: jadard-jd9365da-h3: support variable DSI configuration
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

Hi Dmitry,

thanks for your patch!

On Wed, Apr 1, 2026 at 9:27=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:

> Several panels support attachment either using 4 DSI lanes or just 2. In
> some cases, this requires a different panel mode to fulfill clock
> requirements. Extend the driver to handle such cases by letting the
> panel description to omit lanes specification and parsing number of
> lanes from the DT.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
(...)

> +       if (dsi_ctx->dsi->lanes =3D=3D 2)
> +               mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x80, 0x01);
> +       else
> +               mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x80, 0x03);

If lanes 2 we do unexplicable magic A else we do unexplicable magic B?

Do we know more about what is actually going on here?

Can you check the datasheet?

The patch is nice anyway and no big deal so, so +/- that fixup:
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
