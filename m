Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBC562BEFEE
	for <linux-gpio@vger.kernel.org>; Thu, 11 Jun 2026 12:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781181634; cv=none; b=Q+hTyslmntOTANGhQvrHPGRPDtHpC//+cCtHq7pIhwWKLQAYV+eC9p+kckxmI+C/D4UPoYmspYKErn0tgJvIVHKpE/3uiJWFg4mrgeJ5lThLuI4U8U6QDw+y9oe3DZExD5+TEzfV2CxqJWaIF9NTvKn23AfMIi6jjVERKUBMeXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781181634; c=relaxed/simple;
	bh=2P4PmcnHeSIbmz3J0AKO+3ABrN1m7BkMBBGbKGlWimI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PT4SKe3H4v4XtPWxexjMQ/v/kSOa/JDuJGJGONxL3QFqTSP3Dt+QAJEh5FEty41Oh0kHTC2XXGeQJ5Lyov46jR8dtIP6vpA3jU4EJu0RsvKqPJIudJGOMyIOdIUNvZQoLObCtXvF4lMnIC9vjqZHvTz48kZvnxD+7ZeR5YZxUKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LgQlvCWz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LgQlvCWz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5CD91F0089B
	for <linux-gpio@vger.kernel.org>; Thu, 11 Jun 2026 12:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781181633;
	bh=2P4PmcnHeSIbmz3J0AKO+3ABrN1m7BkMBBGbKGlWimI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=LgQlvCWzASZTDlq0M7janNNq4Rs04qI0YUVTvm7Pdf217QxM67HdfmkOPdgsI9GKe
	 pmQHAtyP8EbJxZP7OxnPk0Jtwb/2YZgVcAXoucTJZxfsRLwytLYqOYVut/GyXyFliR
	 ijAOJK7JZmFPRK3TdLPcUIwALIzlsX6ejpg5qBCtuXSKbiFBo2O+sg7ahouw3f41pO
	 58kz5LC91v2Ow94piAcNf7ZSRarXBzzSN/EP2U1zn4nmTDBaoy0V5naZ0bNkb+bfHm
	 g7UegBC1dtidkYnX1o1RFivL49JeOJBKvlFvSVevzxo1K/9rztcSgaoZC5cG8RE4DU
	 MVGdyiwzIbijQ==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5aa68cd8dd3so7655263e87.0
        for <linux-gpio@vger.kernel.org>; Thu, 11 Jun 2026 05:40:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8oRLQIsvmwZ7u0HgYEe7iAFUorMdQYFHlFapJJuOI1mc3j3A/Ci1Mo8nI/t1Cgg1zycxuWAFQMAial@vger.kernel.org
X-Gm-Message-State: AOJu0YwDn198t2uRL0FxQoGw9vz+W2yeY5/30KcXUEvNCFCtsDEW7gjD
	3E4Cdru0tc11psdjSURxsZTVB5OnvrqwUBjly25WDxettfRPjhVIXCbagcVQP1bYWHNYGPnnuRP
	hER+FObTL9ukF1gE/IGpFmkoaCChl1fo=
X-Received: by 2002:a05:6512:118a:b0:5ad:229e:3860 with SMTP id
 2adb3069b0e04-5ad27aaf3c0mr778501e87.3.1781181632448; Thu, 11 Jun 2026
 05:40:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260611-pinctrl-nolock-v1-1-aca022d4d60f@amlogic.com>
In-Reply-To: <20260611-pinctrl-nolock-v1-1-aca022d4d60f@amlogic.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 11 Jun 2026 14:40:19 +0200
X-Gmail-Original-Message-ID: <CAD++jLmdCCYTKv+J09pS=49c4y19stBYmBgytc2SG_MM4D=ABg@mail.gmail.com>
X-Gm-Features: AVVi8CcK6vKj7M9lrxTHVvJAMkxnXvUH3E59BGUGT9lSHYyOacydnWB2IyiXFRI
Message-ID: <CAD++jLmdCCYTKv+J09pS=49c4y19stBYmBgytc2SG_MM4D=ABg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: meson: amlogic-a4: use nolock get range
To: xianwei.zhao@amlogic.com
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-amlogic@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 11, 2026 at 9:10=E2=80=AFAM Xianwei Zhao via B4 Relay
<devnull+xianwei.zhao.amlogic.com@kernel.org> wrote:

> From: Xianwei Zhao <xianwei.zhao@amlogic.com>
>
> Use pinctrl_find_gpio_range_from_pin_nolock() instead of
> pinctrl_find_gpio_range_from_pin() when configuring a pin or
> setting a GPIO value.
>
> This avoids taking the lock and allows the code to be safely
> called from interrupt context.
>
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>

Patch applied!

Yours,
Linus Walleij
