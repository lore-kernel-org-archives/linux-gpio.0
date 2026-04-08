Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2F8E39DBC0
	for <linux-gpio@vger.kernel.org>; Wed,  8 Apr 2026 08:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775636147; cv=none; b=O1MpknbhU2ge+QmFtBw9ZTHfKSI+MvXRsbZrycBWgqO0Z0z2SsSiJNA72MLlHJd2ieMYLLGvI9qUFCkeSGP9khTbS6y/z8snaaC8vvq/BVdiIA6cfN+OZDioK0R7S6iKg7MCFMcaEx0899XK2Z1FR9D2dVSTAqg8kYIoT+lp85k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775636147; c=relaxed/simple;
	bh=Z1Ts+VSZ8ou/NVe55RhyiohrVm9KZyDeSwhovMasKD8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ld/mScIuLrDHyIsOpxMnPr9kt5Qd/a0MmQ0QWYIJ/WtnH2exCeD1EbGJO23qYbDpChWYAprDRWfiUTKIliN3Wta2uWjMtR4J5g4me4l+lPza/k8NXvxQGQ/PS+BJ6C8aYHWMPZs1zKK8JQzb3q8PcJoUUY6VLLvsJftc0lhAFWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DjJUWZ8p; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DjJUWZ8p"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EA74C2BCB6
	for <linux-gpio@vger.kernel.org>; Wed,  8 Apr 2026 08:15:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775636147;
	bh=Z1Ts+VSZ8ou/NVe55RhyiohrVm9KZyDeSwhovMasKD8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=DjJUWZ8p+SrYZMJe8a7MP/eKq6noIw+mM8ZBQN2VSSPp7t8H4gTwqMDq/NJVd0jjK
	 XROF5dzZrwwfVLsMfdCa5K8zQVWscKCo0yn06R/meLJiSxRz/PluiLBKTx3IS4kD44
	 D2JGDmNXuXVV2wJ0nt68vInXT/6LPHFQZCIbZMETGRmapO224VQUkLwOPr/btLV/J7
	 Q3LtR8MajB6r0oEDBU4o2elNrokdZdV4kslHPn0M9aUj4qTB9dLlNSe2s2Rr1P2rNo
	 uxSAVIif+Uh78xnf69h81njib6Uf3keCxOm9dTpEhfNSnvXuAzkuIIcgbMQxb81AdW
	 /vvmbiJZjmT5g==
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-79853c0f5b9so94813927b3.0
        for <linux-gpio@vger.kernel.org>; Wed, 08 Apr 2026 01:15:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW1jkOfgmDWR1sSzYMWC0uLPsQQlnHNPjAC+RBVVTX/FszxyjG7fnno2iu5l1pY8mNKQBUJ0QXhKECw@vger.kernel.org
X-Gm-Message-State: AOJu0YzrCCZxa/J2q94CYux0boHTr5AcyYDtXMn1KaZPcQWX1PdKtvIg
	uP+fLq5Rn3Tt3qnGd9U7NNsGZeNUlm85VUKeYZ7QcByPVOWDUDV7nWf7b8eDIH4OrjD0dR7gAIz
	xqpDGb6MVZrNePckj1ef24dYR//Hs8XY=
X-Received: by 2002:a05:690c:12:b0:79e:21eb:e9ca with SMTP id
 00721157ae682-7a4d566ad29mr202825207b3.30.1775636147018; Wed, 08 Apr 2026
 01:15:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260401-waveshare-dsi-touch-v1-0-5e9119b5a014@oss.qualcomm.com> <20260401-waveshare-dsi-touch-v1-13-5e9119b5a014@oss.qualcomm.com>
In-Reply-To: <20260401-waveshare-dsi-touch-v1-13-5e9119b5a014@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 8 Apr 2026 10:15:36 +0200
X-Gmail-Original-Message-ID: <CAD++jLm1kjuodURGsQt9ChA11zKJPf9Eayw7dy7LN_fdfWoAGw@mail.gmail.com>
X-Gm-Features: AQROBzDH7UQOKJUwrcrXsozOYhM9A3Hna5Srzfu5ji4HDrC0JSqqCxNeZwfuyJ0
Message-ID: <CAD++jLm1kjuodURGsQt9ChA11zKJPf9Eayw7dy7LN_fdfWoAGw@mail.gmail.com>
Subject: Re: [PATCH 13/19] drm/panel: jadard-jd9365da-h3: set prepare_prev_first
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
