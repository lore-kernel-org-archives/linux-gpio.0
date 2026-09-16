Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AAE8495ADA
	for <linux-gpio@vger.kernel.org>; Wed, 16 Sep 2026 17:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789579303; cv=none; b=tueUw8GMwXxPpiCXjeAyd2V9lei6IdQnYAHBJNWWK4vIsfQwpCy6zdUJqaYrvINBrIGQDCjKdEvQ+oiVVTDXmVIT44gDQLyHRWsHpV2oDpaivOP5/SwKvlTkLCqJqWEOF5zMXxABehOagKohotkWPQVLsikXWMhoHeVaNImK7PY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789579303; c=relaxed/simple;
	bh=+Wm8XztWe9cjSuQsXSOKuMkDzkD1yzW07KRTOyVgie0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CI1aORot30R8p06V3T1ZPWNjMGdOdYIKEr5vzHTZCH9S1nldEO3yL/Ij4gycumTdS0X+MmJwHsasLUS4fLCxkfWF5Agg5/sH+sSlUjvJMVXpLSuebtPKTFuQWHVpxkSKLaUJUXzOWkINHwS3nnCybhQNfGTww2rZfA2CdiiOiyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OtqPa6xW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OtqPa6xW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED3361F008BE
	for <linux-gpio@vger.kernel.org>; Wed, 16 Sep 2026 17:21:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789579302;
	bh=F1UErD4H6r6whOgpoMHeGy/yiV6kGc+XBk8QJER2Od8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=OtqPa6xWTvZHahphsBKsXSM0vVDuwyyQDfeMMeeEdCwWUcXyf9dlKeNLwgs5z44tQ
	 WrEw0/lFS1kR81AfTFFl8gO2WD8ymB6OULjtt3mMaSrQZ/BLplGiHqg2ZX64o9jZyv
	 lRQjurrPvX6EHDlo/M7bJ3vybpD2OkTMf18ZzfkBroMKIYFxdFYoOBO4SqZXkxmA+m
	 5H66Szm6FTlqa6jX0VplbsuV5ZZ89DhiviBw+u3aGEgpG3N7+v+oORv1usu/Fl+caa
	 0oDpvEUV/RUY8fvpDeaGcVR6CILUMSDmpvRRSbahMAfV/wEskXbF0UkH8q4fFAn5zH
	 6D4yaBy6bTqaQ==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5b5f21afe8cso2387073e87.1
        for <linux-gpio@vger.kernel.org>; Wed, 16 Sep 2026 10:21:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByUqe+O5XVkbJwdQG6wyGo5ZLw9kY5prGtM5kIGfiNwFqFB5Wbm52ie/R2MeYzgaegD4TL2/FwS84wc@vger.kernel.org
X-Gm-Message-State: AFuF++m2mN9jdfBQ12MbuuLCIkb8qW5hou/Cu8Tc5lkSNeAub/6fIjVm
	9t8Z2kCVmtLZFNjnyrRA2YSlOH1DHv71WGH0jNw7b7kaNMI7wUblLPMRcvQQ+YfqkO+EXsbNmz3
	T5dtJyqyVbeUxU6Nc62rfw8mLVrjQxOI=
X-Received: by 2002:a05:6512:6883:10b0:5b6:172b:7ba1 with SMTP id
 2adb3069b0e04-5b8ba5d1a82mr67749e87.9.1789579300578; Wed, 16 Sep 2026
 10:21:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260913123223.99893-2-krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260913123223.99893-2-krzysztof.kozlowski@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 16 Sep 2026 19:21:28 +0200
X-Gmail-Original-Message-ID: <CAD++jLm2hQ=fHmLGL4KnaK-q2L95tz3P6__qx=dFCUeiMUz9tA@mail.gmail.com>
X-Gm-Features: AcwNN1WeMHFPjUODWxifW5uhfKTviiZfd6OYXXOq_JHN6cgG4pckjp0gwgbXDp4
Message-ID: <CAD++jLm2hQ=fHmLGL4KnaK-q2L95tz3P6__qx=dFCUeiMUz9tA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: pinctrl: Use consistent indentation in the example
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Dong Aisheng <aisheng.dong@nxp.com>, 
	Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, NXP S32 Linux Team <s32@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Sean Wang <sean.wang@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Michal Simek <michal.simek@amd.com>, Gary Yang <gary.yang@cixtech.com>, 
	Fugang Duan <fugang.duan@cixtech.com>, 
	CIX Linux Kernel Upstream Group <cix-kernel-upstream@cixtech.com>, 
	Del Regno <angelogioacchino.delregno@somainline.org>, 
	Rahul Tanwar <rahul.tanwar@linux.intel.com>, Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>, 
	Jingyi Wang <jingyi.wang@oss.qualcomm.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Krishna Potthuri <sai.krishna.potthuri@amd.com>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 13, 2026 at 2:32=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:

> Correct indentation in the examples to consistent 2- or 4-spaces
> indentation to fix dt-check-style warnings ("example 0
> [indent-consistent] indent mismatch ...").  Preferred is 4-spaces, but
> re-indenting entire example just for that is too much churn.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Patch applied!

Yours,
Linus Walleij
