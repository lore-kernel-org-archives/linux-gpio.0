Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EFA149EC43
	for <linux-gpio@vger.kernel.org>; Wed, 16 Sep 2026 13:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789564444; cv=none; b=MQcYHbfy82ykv30G/amENCltxzI/sICmWnjcyQ0A7+tDevUpCSpBLe4YXoUAGzTimrKGIhGef6MOJ4B4XY540d48srJfifRKzjaGEIIieFIu/3Nq4UCLqdzgHKJ2rExDLrHMtcnc+ymolcQ639VpqK76r82F0s30UAo0FTA+O0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789564444; c=relaxed/simple;
	bh=pihBz4gn+5eleCo7xhCNM4+VAMRmVbSp72bOE4FVM2U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OSDULnKrJ+3+ldIDYGnqEVHTdK9ZCvlpZRB+3XQC0q5h9lGc+djHh1MAiXttvSxsCrRGaZtzp++ghuGb76rnphHACdwTovNhPELKH9jqWEiM6Ycg3aSCH0pYB7+QAiZ0EQQvN8kz/7a9HoL9iysm9y976UiQz0nTUdjoJbFmU+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=akBX6LHe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="akBX6LHe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC6FF1F0089A
	for <linux-gpio@vger.kernel.org>; Wed, 16 Sep 2026 13:14:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789564442;
	bh=pihBz4gn+5eleCo7xhCNM4+VAMRmVbSp72bOE4FVM2U=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=akBX6LHe38VpRRHRDqiXVGPbMIsT3Yvr6/pzNS0JkAZrMjBTpCLNe5Nzosrt8JRJw
	 xL46ZYU3+BMGiAqj2fgONy8QFMuPGCs+VKLN8fzxnODpsFtdPf8st5sNvtY9tkBjGl
	 txwWpE/VQA67nOUOxEbNtrZr0i6SrSbn/oLPQhzAYMJZfKoaDt4JS+69OMKHr+nbug
	 ibwx+BtWbBoTcK4zu5q1of+pRz2V0ruyep29Edi2mfNc9x8kFMIZbF0OwFF58h4Ehj
	 6PoCDCNtVNanRVqdT2TS+4mLUtan5L6jCaaB4+Hz3oOm+sJIcJ34PAx8j7Tu/yJnl5
	 ml0caq6d/uV0A==
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f16c72so922178e87.0
        for <linux-gpio@vger.kernel.org>; Wed, 16 Sep 2026 06:14:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByTa+aYPa/CCHeKK/x2iawGQ2fCCA6T6JGVDZ1QMs7JU4wEBkqzZpasXT3ExsCTBk4mlfGtwBa+eQQr@vger.kernel.org
X-Gm-Message-State: AFuF++kGmF1ouYRvMIRbib0yuphjwQCRC0NIWu1aUxxBuCw1lCPLhEAj
	VqXAEKYuqI7qE+zrFeYKjwk7VSnqry109r8LJKLDSPo7rNDUcqAZ3SefnakLKmIoNJ+6M47i1ap
	qR7t3zSUMzc0u99K5d6EEZBCwu2z8heU=
X-Received: by 2002:a05:6512:3e07:b0:5b7:651b:1cc0 with SMTP id
 2adb3069b0e04-5b8b660c2bfmr761601e87.4.1789564441313; Wed, 16 Sep 2026
 06:14:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260901-q8b-dts-v1-0-7de0b6a73d08@radxa.com> <20260901-q8b-dts-v1-5-7de0b6a73d08@radxa.com>
In-Reply-To: <20260901-q8b-dts-v1-5-7de0b6a73d08@radxa.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 16 Sep 2026 15:13:46 +0200
X-Gmail-Original-Message-ID: <CAD++jLnuNCcaY+GW5Qzv1caSZfi0CGx_3Hx33x8MVpR6iS0wtg@mail.gmail.com>
X-Gm-Features: AcwNN1Vw67ZSGXweqRIWzw8TAfqqxjv5DWNR5PtBCdGSa2CfcBJrR47asGFCEnY
Message-ID: <CAD++jLnuNCcaY+GW5Qzv1caSZfi0CGx_3Hx33x8MVpR6iS0wtg@mail.gmail.com>
Subject: Re: [PATCH 5/6] dt-bindings: pinctrl: qcom,sc8280xp-tlmm: allow gpio-line-names
To: Xilin Wu <sophon@radxa.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Stephen Chen <stephen@radxa.com>, Junhao Xie <bigfoot@radxa.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 1, 2026 at 10:48=E2=80=AFAM Xilin Wu <sophon@radxa.com> wrote:

> The SC8280XP TLMM GPIO controller exposes 230 GPIO lines. Allow boards to
> provide descriptive names for these lines and constrain the list to the
> number of GPIOs exposed by the controller.
>
> Signed-off-by: Xilin Wu <sophon@radxa.com>

Sophon, right I got that reference ;)

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
