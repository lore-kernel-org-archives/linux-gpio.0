Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8D3739C00B
	for <linux-gpio@vger.kernel.org>; Wed,  8 Apr 2026 08:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775635743; cv=none; b=aw+KRb2Lo0FwBLcqW/Zi2sjYMT1vRN2lJTf5D/kQKPCKeRIztfrHY7fkUua45VbFfqdPUG7D0AqBDlIlMforX69jv0A+LNMEG+BW/9rNNl2MiFHDQyKOg0GWgAiCTmyg88kA3q3huuwr30naQxP+dgOuyHRL50c3709iLBBegQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775635743; c=relaxed/simple;
	bh=umQSa+ggsoHR8bIX76wvaugAVwppX0RMa2t3Cg4tIZ8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r823BqXaP8+2duAI/dXCNWSILQ1QhKavDbaMPp/ADfNWqIZN1P2oyk6OSTeGdaXtnfmvbUXYN+hD/bk5mZrtIqNjv5VvsFbuMCj+0DJbeEKAYOyfCUnt+gAUAClc87RKsBjmdkIiP2v+mD3JS2COG7kzVxZWsUtyA9y2eTjKlmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZZKMsX4y; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZZKMsX4y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F3ECC2BCB5
	for <linux-gpio@vger.kernel.org>; Wed,  8 Apr 2026 08:09:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775635743;
	bh=umQSa+ggsoHR8bIX76wvaugAVwppX0RMa2t3Cg4tIZ8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ZZKMsX4yRGS1ZfxC+wafZvfUSOGnZtjmNFig5zwF4JYHD/hM2vpSPdUcDgz0t01Ah
	 yCwHgQlC6CGag2Cf9Cnel3qKw4RPA1A0cv9yXzT34iQR/qquBJhHCxGxKSE/2iSMX5
	 Pary78qBZEGxfqlmv/RYQvsGNmRBUbKjgt7FLYI76DFdpI7djARUPc4Y6MpUCgrcFb
	 z2Vl/jGlxKYdDe9FCkwmZT/Jf9cqMK2LhYzHNAzCD8r1bqNkNKDS34IzpJuKf8xjKP
	 qmtMwy/9CzmVaTsN5qRgYIYKDTGQpvDI7KEm0iz636gDcblzuKkqqurfDsqlqDvGTE
	 55d7qqsb0J2NQ==
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-79ab5fd969aso60429667b3.0
        for <linux-gpio@vger.kernel.org>; Wed, 08 Apr 2026 01:09:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV0ciP0vbY0SCMCGh1ARxSZHqGbmcLI3EdjE9EB7QHKOvbh+q6QcA+q+RDB7A/4pbMIUk2T+UxkVuws@vger.kernel.org
X-Gm-Message-State: AOJu0YzCAobJVWaHrXq/HNBPlU7p5zeICpVoj7Ya5EONXNqckLfbtogB
	J6xb0fEn6SdPYER+wILYoQUZr7IF+XsgOo0EiJWsoU8a/R1Y7BhNeL15atdap3cOiM16tUJuDMr
	pMq91GDQbjQGsqkYF40cKhno1q/kBm9A=
X-Received: by 2002:a05:690c:5c0c:b0:79b:e24e:e326 with SMTP id
 00721157ae682-7a4d5f56502mr164827067b3.46.1775635742703; Wed, 08 Apr 2026
 01:09:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260401-waveshare-dsi-touch-v1-0-5e9119b5a014@oss.qualcomm.com> <20260401-waveshare-dsi-touch-v1-9-5e9119b5a014@oss.qualcomm.com>
In-Reply-To: <20260401-waveshare-dsi-touch-v1-9-5e9119b5a014@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 8 Apr 2026 10:08:51 +0200
X-Gmail-Original-Message-ID: <CAD++jLk6_q77qiBYhg3u2ivx36m767Ps_S52wEC9m6DNwqrG2Q@mail.gmail.com>
X-Gm-Features: AQROBzABeGHUAeJD_Fqtm2qwvxK49Jozh0F9hVQhu_g7y9HzP82hY8UcJC3hAqw
Message-ID: <CAD++jLk6_q77qiBYhg3u2ivx36m767Ps_S52wEC9m6DNwqrG2Q@mail.gmail.com>
Subject: Re: [PATCH 09/19] drm/panel: himax-hx8394: simplify hx8394_enable()
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

> Simplify hx8394_enable() function by using hx8394_disable() instead of
> open-coding it and mipi_dsi_msleep() instead of manual checks.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Excellent, thanks!
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
