Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58FA93B2FD0
	for <linux-gpio@vger.kernel.org>; Thu, 23 Apr 2026 21:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776979486; cv=none; b=p2tlqI7EF5qqavRkpDwfl47SoF4TxC1Xfh+jz+SB90M2NO4POS+TQw5yN8+XGis05Er8BnqGM+IIG6jYzIXnE7nA3zzlDWJRBeGZxOXieMSk7O8fBXC2H+1tfFAC5BkM4PfiVkR8O+m6h109U8vzTONrujsFn3SwoSDD0RI/bvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776979486; c=relaxed/simple;
	bh=bwLbQ5NviOj/bY0u6od11N2GNC6P5OodS0ixTy9vUk8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FwxoQpJPE91adWKheOXismCmd9H8wjczrRdEO23ErOl9TZPbUV0ucP8kVUPXJN+qb/YVK6CAM7Gqr8tTWXMtKZT5JQbDUkv5bOfOsKLO63jW1IkOEqDyDN3ExGCLhLfdfb2APPC7N6anBxh+hnDg1S3uxkQ1sjQBzQDYZ+I4cBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Pr5rX5+i; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Pr5rX5+i"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D042DC2BCC9
	for <linux-gpio@vger.kernel.org>; Thu, 23 Apr 2026 21:24:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776979485;
	bh=bwLbQ5NviOj/bY0u6od11N2GNC6P5OodS0ixTy9vUk8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Pr5rX5+iSOtoDmywesPolyZqj/RoYZzXZzqAKOCPXaAPVbQy181gcY4KqmWelL3xe
	 iI8OxPQrJC/OTrH/ZLz0rOUiOTVtcX+tgL8fQldFAyifEXq4Ro7X9rCkCPHaEon8lf
	 78I3H6UHjrVSc0vZ/rmfbV584lCxPbmjMUsEw20EYHIC1m11yOmA53E7zZ9iwFFwMY
	 h1y3TQiPQ/Mn6Lkn2GPmkG1BtNNIAudFgaxnIc/Wmh/3c8UYfH/tzhp03vDl1Esv5z
	 JNQTUBvUtjQZhZCzy7NjdstndEvcCFBbiVJ8BrVj/ubjrTdizCo6szD4gaROtGlr3Q
	 7rfjwEOk7fYLQ==
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-38ce0ab821cso61588311fa.0
        for <linux-gpio@vger.kernel.org>; Thu, 23 Apr 2026 14:24:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/wI37dWkX1pvxL9mUO5py05kDrleajmsd1r+EOKQkDXKz8uu9zlF9YekPRGCZ0Dfs+Oclo02xR+8pv@vger.kernel.org
X-Gm-Message-State: AOJu0YwBGSymem4XgycGOLNjKj2arKyUKQckAx/38Gnv/LHuKyRUPAV2
	Qjzh5TfE4TuA2vvzZTKI3x/foN2vz9VXp9wzf8IMYYl4lXncCjYM+Bs0cdNnQlIaMziYC0s7lIt
	AavnRauQKOzPPCAROHVLUOuX+L8gj0zY=
X-Received: by 2002:a05:6512:118b:b0:5a2:8568:826a with SMTP id
 2adb3069b0e04-5a4172eece0mr8397088e87.34.1776979484421; Thu, 23 Apr 2026
 14:24:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260413-waveshare-dsi-touch-v3-0-3aeb53022c32@oss.qualcomm.com> <20260413-waveshare-dsi-touch-v3-17-3aeb53022c32@oss.qualcomm.com>
In-Reply-To: <20260413-waveshare-dsi-touch-v3-17-3aeb53022c32@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 23 Apr 2026 23:24:32 +0200
X-Gmail-Original-Message-ID: <CAD++jLnsVc3xqKfhuZo08wQFkGrgDiw+OAhTOfUi7vD5ZFY2_g@mail.gmail.com>
X-Gm-Features: AQROBzCz31PGPdHjUDpQGU0MKBOAMjnGwCLXEjwbbDFHz8TqNnaOCqTWhFhlvZ4
Message-ID: <CAD++jLnsVc3xqKfhuZo08wQFkGrgDiw+OAhTOfUi7vD5ZFY2_g@mail.gmail.com>
Subject: Re: [PATCH v3 17/21] drm/panel: ilitek-ili9881c: support Waveshare
 7.0" DSI panel
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

On Mon, Apr 13, 2026 at 4:06=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:

> Enable support for Waveshare 7.0" DSI TOUCH-A panel. It requires
> additional voltage regulator, iovcc.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
