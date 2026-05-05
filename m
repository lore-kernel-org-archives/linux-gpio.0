Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E518D31F99D
	for <linux-gpio@vger.kernel.org>; Tue,  5 May 2026 09:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777973406; cv=none; b=Kvi7LpCb+QlEduaQRGLCNbzeMkHMoVp05DhMg1G/SZNi9v86y3qkp5GzagobAvEYOX8X3g0iZVmPuCeaIiG5i5Ti9ktFS8T+GcS+oojKKTrQVcBq8kffSPIRsfCzhOZakBdH8yFWNEPH3ozz3V8INj1vjRtIRxTDTNDcg4QjU3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777973406; c=relaxed/simple;
	bh=iBvZb5NBOYvypj8flltjDiowahrIrfjpdsW4qgP9dns=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H00pbr1nsiEIcoYXIfomp3Sdcwzn4u0IbuQvyrXYl67MabNJL86HkXjWreXImvlXdc5wFTq6MNbufQ7QPa0nfJHTuoRYBpyeRR721lFxqi76qEoGwO91dxPpD0lKVpVGw3aKRw0gJURamrfa2AYtWLcl4Q27E6CP75PuHEvbncc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VpNMpWwX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VpNMpWwX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A934AC2BCB9
	for <linux-gpio@vger.kernel.org>; Tue,  5 May 2026 09:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777973405;
	bh=iBvZb5NBOYvypj8flltjDiowahrIrfjpdsW4qgP9dns=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=VpNMpWwXyB/ezHR4NBP4ODBIXNLYMQ188/6XGY/0EIo3EnM2rpBOlT+dWY/MQ4OV0
	 hX9FvscikjnJyJuztgB9czrpF4a1gSh4vaSZu8fuSLC1wGqWIxEZTq2mCvAmtcR8H2
	 dia8NbIlmGyqrI3hsC9PV/HBemGh5dawiT+dUa+Aiuep9YiEBxbMd0vG9tKElXh0jq
	 S1KkoF0bPk3vE5Un8AuCZ72bRLDA5lVomSxeSO/Bs7gsNMDEhhv+yvXCL+peIwi4Ov
	 buL1jhufBK1CPk2I55VagxtSa1ppzX5jPP/sL6p/t0yfHspdylLelzGBOQEssLXgmN
	 s+3ZBa6ivUmUg==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5a74ac8b40aso5374598e87.1
        for <linux-gpio@vger.kernel.org>; Tue, 05 May 2026 02:30:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+Bn6D44g/9VqEiKeyGBhEP0ux+b16wIj0zWJBwkK9OOHlpAnLOWJYHV2E/UJ6YCVYFO+tFWAzN5zJt@vger.kernel.org
X-Gm-Message-State: AOJu0YysuDqrb1M1NnQWbh2tHGDSSqIGnv1BXcb0c34PoEXHveNojnfo
	EcwHz+QuQ1x4fQfMwn5gImSakpx77brC9nfJxGYab/sUbsiMkof57l5e0UbIpgEDNpbqOjrYfSc
	IxH3oVBBwQD3GFEVExTgBdWQy4VTpnbY=
X-Received: by 2002:a05:6512:3b0a:b0:5a8:6b96:9d10 with SMTP id
 2adb3069b0e04-5a86b969d62mr3038495e87.40.1777973404397; Tue, 05 May 2026
 02:30:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260504-nord-tlmm-v4-0-ccaa731ee8b3@oss.qualcomm.com>
In-Reply-To: <20260504-nord-tlmm-v4-0-ccaa731ee8b3@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 5 May 2026 11:29:52 +0200
X-Gmail-Original-Message-ID: <CAD++jL=QK+Qzm2Y80HpKArVs7Kqbz9nV5wjj_1XzSQW8zGhgZQ@mail.gmail.com>
X-Gm-Features: AVHnY4KVwZcEXHjIrqpN3eCjaCziqA6pzTQtchqPQylelmHffx2YGJEKMHDFEvE
Message-ID: <CAD++jL=QK+Qzm2Y80HpKArVs7Kqbz9nV5wjj_1XzSQW8zGhgZQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/2] pinctrl: qcom: add support for the TLMM controller
 on Nord platforms
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Shawn Guo <shengchao.guo@oss.qualcomm.com>, Arnd Bergmann <arnd@arndb.de>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
	Maulik Shah <maulik.shah@oss.qualcomm.com>, Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 4, 2026 at 12:07=E2=80=AFPM Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:

> This adds DT bindings describing the TLMM controller on Qualcomm Nord
> platforms and implements the pinctrl driver.
>
> More info on the platform here:
>     https://lore.kernel.org/all/20260427003531.229671-1-shengchao.guo@oss=
.qualcomm.com/
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

v4 patchset applied because why not!
Surely any remaining snags can be fixed in-tree.

Yours,
Linus Walleij
