Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5AA3255E27
	for <linux-gpio@vger.kernel.org>; Thu, 24 Jul 2025 10:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753351335; cv=none; b=gVeIJ/nu1irdRk2Ro3WJ4UlnnFaEBpLztVxxVyqPKpMSh+qDF97a2bexH9zuKeFGAT1q/zPDRBjqOWx0Fnc1rF0KS9RQlsApdu3sDWUrvt1bpSN4Fanu5sBqAkiwTzroV2JcVKPPOtiKpsbLe9Y/cGX9hXOdLG6/6ABE+ERj3Js=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753351335; c=relaxed/simple;
	bh=KWyqMGEUBT6sPlAYGN8ahqpDMLDIFJaLyGGzuzUqjK0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RMgV6ubadGP3AycdSDDc11wIYVvBQqIleAOWrE0Ee9kTl4/gPysDJmWQlfwW8HHhvphpXsvWX51DWPFVPK9wBMXYpavd3OacL6yAsX8v9ZmM9r/xVbH9TOZNuFSPOlskLf7rgzdQqYki7KEPTU7oHBL4Zb0vJdBvUj44fFclKw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=V/vPM8Rb; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="V/vPM8Rb"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-553b3316160so798945e87.2
        for <linux-gpio@vger.kernel.org>; Thu, 24 Jul 2025 03:02:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1753351332; x=1753956132; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KWyqMGEUBT6sPlAYGN8ahqpDMLDIFJaLyGGzuzUqjK0=;
        b=V/vPM8Rb1cbKAv+XnKhAJOmIjhQO4tB4NYqtbMsIQL7++wi1r1fweGMRbtHgsBo/Fm
         zYyyOLRDr8faufcUrwibj8Spaz00uUBCsmQ+qSzgCbek0JhsssboISKnyBfMp/3C/YPn
         njKEMYZwFYlJuwY7yQU3VSUy3nc9MBGEtQqBI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753351332; x=1753956132;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KWyqMGEUBT6sPlAYGN8ahqpDMLDIFJaLyGGzuzUqjK0=;
        b=WMMu9AHieB7KuWT+Os6TtCVFlbzj9dAeGX9qTbs0VVsLwuQAmw3rFJV+plvcgOcmUZ
         A0vKqqcmy2N3n1xrIsN7/bPQiY4hTKEHiA5EUjgyQ7CxOnRIkI/0xHZKkp2aXp73/mB6
         GD4vepZAaDc2vFp389mv1ogwZPFw7+tVae3RuhMBactMiGGju7v9p0m2ZhmAuu/RNxzs
         BqoKvAtDWBVf6cYc1OF36LxB4nlCkZ3rFhTj4BPGJuJ4xA6mNB3uh1UpMkiMqM8io/kV
         2V10eo90jwsB/y7sVQ0w9sNXxRwjdPDvCjd3CVCs9Ja9JOvRYJm+F/sXFiFXXnxLvq8N
         Z+IQ==
X-Forwarded-Encrypted: i=1; AJvYcCWyYebzh6TqRF8SJVzrkmNme5JFr1AFYz/6wL3IpufaauXOPxK0zPYCvHiQg0Ex3kBRbVid6oya/CO2@vger.kernel.org
X-Gm-Message-State: AOJu0Yxx4rKoQFMQ4NOnzkw7lWrfqVhxHlBMo3LQ0vgiZCO86Y6Ah+yK
	TaOrL0XnpJmQ2FdcyeJTBu2LbJ+2W5HMyzWID3C+gmad4b0g1Dv0G4q+NPJqhmS7s7TdRfDHtMB
	G2R2rGMLBTmAw9iOXCfN+Ep5cN+BR1x4ejCoRl21g
X-Gm-Gg: ASbGncvLtjmLz6P2znwuHtJdFUyLbz0gXzi4SXJ/9ogPkp0NaNONtoS1rj0sdjTEh+W
	uK7Ap9lK94mDkQ+wSYm0q9bCOeggiSxVLYdHWCcZyi4qSJC/5YlMee4PzqBatKoT3BjPknJ+89J
	DZ1xJ+KZ/alCp0oE1ilXkSBdODlp1K8KXUgS3LHMvV0Vnpyqkz2n78hTBRWj1GxBcWxpRHSH5Y8
	NjhJ2dd1FVmMWfTH/OvujvMFCtCoMXkW+4=
X-Google-Smtp-Source: AGHT+IESUy0W5d8sN6DOxHQC9VYSfHke7csoBbtn4oiuNMESAIIOLfvRI9EoIcZqqzK+oAmlqA1BtKODIpYwZl1nk3k=
X-Received: by 2002:a05:6512:b06:b0:55a:4b25:b33b with SMTP id
 2adb3069b0e04-55a513879f4mr2300615e87.15.1753351331794; Thu, 24 Jul 2025
 03:02:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com> <20250724083914.61351-36-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250724083914.61351-36-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 24 Jul 2025 18:02:00 +0800
X-Gm-Features: Ac12FXxwmEtskk9yW4VS4U_sXrqKN7rxCsdJIjp0VaKRTEqFbUzw8Bs63nu9Nbw
Message-ID: <CAGXv+5Gar47gRZoT6DUDpPRabjzoSE==Zi0wrR76A7g-SJL1=A@mail.gmail.com>
Subject: Re: [PATCH 35/38] arm64: dts: mediatek: mt8195-cherry: Move
 VBAT-supply to Tomato R1/R2
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org, robh@kernel.org, 
	herbert@gondor.apana.org.au, davem@davemloft.net, krzk+dt@kernel.org, 
	conor+dt@kernel.org, chunkuang.hu@kernel.org, p.zabel@pengutronix.de, 
	airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com, 
	mripard@kernel.org, tzimmermann@suse.de, jassisinghbrar@gmail.com, 
	mchehab@kernel.org, matthias.bgg@gmail.com, chunfeng.yun@mediatek.com, 
	vkoul@kernel.org, kishon@kernel.org, sean.wang@kernel.org, 
	linus.walleij@linaro.org, lgirdwood@gmail.com, broonie@kernel.org, 
	andersson@kernel.org, mathieu.poirier@linaro.org, daniel.lezcano@linaro.org, 
	tglx@linutronix.de, atenart@kernel.org, jitao.shi@mediatek.com, 
	ck.hu@mediatek.com, houlong.wei@mediatek.com, 
	kyrie.wu@mediatek.corp-partner.google.com, andy.teng@mediatek.com, 
	tinghan.shen@mediatek.com, jiaxin.yu@mediatek.com, shane.chien@mediatek.com, 
	olivia.wen@mediatek.com, granquet@baylibre.com, eugen.hristev@linaro.org, 
	arnd@arndb.de, sam.shih@mediatek.com, jieyy.yang@mediatek.com, 
	frank-w@public-files.de, mwalle@kernel.org, fparent@baylibre.com, 
	linux-crypto@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-phy@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 24, 2025 at 4:41=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Move the VBAT supply to mt8195-cherry-tomato-{r1,r2} as this power
> supply is named like that only for the Realtek RT5682i codec.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
