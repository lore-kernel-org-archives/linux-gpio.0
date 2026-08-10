Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CB4B434407
	for <linux-gpio@vger.kernel.org>; Mon, 10 Aug 2026 20:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786392499; cv=none; b=tQv88HMqaIrB5hU7sFEFsAK9CI36fdCd2MjuPDMxJ3OZbj1eCsjZg++hmKV2jnaMkInFoFrDOJ1fIXKwRuU7xAzbzUSxe1Zi6+KOUcNYIFUu8N53Sz09p+K9RCa921NxSJ5WXnlUH35uLuvtfUMIUmsyEqL77r97O2+Mi2WP/pw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786392499; c=relaxed/simple;
	bh=gnc0EdyeiEsqgD6ZmbcZDCKYRtZBL5CUiTZPP2YKLs8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IU9nFkV0V575K4qGMUpPYWEMd+ym21CWjnKh6eApjoVOfygRGMZZGLsoXN0MQM/qbMvmBdKM8gbSdXzADJtbDlBdoAa4Rq6fNzmzSsbWVstdF5xxj09BpgPsy4zZThaSu8Z+jI2YYiq1CIWPkaugCjPeYc4XAFAzRZyKM9LKTro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OxbBDOX8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OxbBDOX8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4F021F00ADF
	for <linux-gpio@vger.kernel.org>; Mon, 10 Aug 2026 20:08:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786392497;
	bh=gnc0EdyeiEsqgD6ZmbcZDCKYRtZBL5CUiTZPP2YKLs8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=OxbBDOX8FR1yMtYc2FacGlyQTM3NSC7+jsLExWaIbFSyfE1EA+wYk0Cw+4PQlGDYd
	 ZKsW1uSmZ8I5ziy1HHflUgz4kXVOZcSiOp/tL2oGd+eVf4WormnmLanbHUot9N6t23
	 ps9W/JJkPq9H455D0V+c5bppDGzrpSznrZC3aS8C2ew7fs5zwky9OiWjX5k34H+cR0
	 MYIEVgtSDlH6IOosraoRZq3IWMQjBj1WhmSM8Ih90RaFhtab11G4jvpsM6xhJ3cB1D
	 oWBgkjYkJ/D6X/e4Zap4RC9CwjbJS78wCtMRlFO73MzJ0C+avmtQjkr0OqgBtODaNG
	 01Oat0bB4dxUQ==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5aeb59d54b1so2468607e87.1
        for <linux-gpio@vger.kernel.org>; Mon, 10 Aug 2026 13:08:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpqbcgjZneRx1EpjDxDiPJ9nPIAKyI4IQkhvwlihUV1izrUGS2OkXq17WNS0iSZT0ozzX28mCr5LMXu@vger.kernel.org
X-Gm-Message-State: AOJu0YyaOCmcetw0HWMtfPHX3tWYACHkNpPyGpECdJhGQGEjFE8U2B+Y
	jxK4clpAs/XhJfLBZdWdBXDcxAZ6/WBR2zki8BrHiNRwpz8j6OeGzcXF6/J8Bo/+b0NdEpHYW12
	rvtEC5MZmjHT6KCRL4GDUPL6lAM5hnwk=
X-Received: by 2002:a05:6512:10cf:b0:5ad:5cec:74d4 with SMTP id
 2adb3069b0e04-5b30b77a1d4mr2649686e87.41.1786392496581; Mon, 10 Aug 2026
 13:08:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260729132736.3807082-1-sjg@chromium.org> <20260729072727.v3.3.3a4f9d47d4dba36e14141f8796afe8907028aa9c@changeid>
In-Reply-To: <20260729072727.v3.3.3a4f9d47d4dba36e14141f8796afe8907028aa9c@changeid>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 10 Aug 2026 22:08:04 +0200
X-Gmail-Original-Message-ID: <CAD++jLkfKKeht4VupGiGaHRnJEZJEvoozD=6ZBjHe+oqLSP+yg@mail.gmail.com>
X-Gm-Features: AUfX_mw9WSjT9UvG0UlhqGTC--GuRIOMT32n9ySgxc10IaFc7YOGymcNv3-QqPE
Message-ID: <CAD++jLkfKKeht4VupGiGaHRnJEZJEvoozD=6ZBjHe+oqLSP+yg@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] dt-bindings: pinctrl: rockchip: Add RV1106 compatible
To: Simon Glass <sjg@chromium.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>, 
	devicetree@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	linux-rockchip@lists.infradead.org, Jeffy Chen <jeffy.chen@rock-chips.com>, 
	huang lin <hl@rock-chips.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 29, 2026 at 3:30=E2=80=AFPM Simon Glass <sjg@chromium.org> wrot=
e:

> Add the compatible for the pin controller of the Rockchip RV1106 and
> its RV1103 package variant.
>
> Signed-off-by: Simon Glass <sjg@chromium.org>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>

Patch applied!

Yours,
Linus Walleij
