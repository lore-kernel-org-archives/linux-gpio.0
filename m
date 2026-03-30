Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21A2537EFE1
	for <linux-gpio@vger.kernel.org>; Mon, 30 Mar 2026 08:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774860359; cv=none; b=ZeFXMm7oIxfI2Fg4Hj0pYKtgiV45t0tpp3ocKpCjIaPZ8oOPgZNgzewx33Tt8TtnwrFp7qNQOdha24fI1NfRn6sNLq9Avx5Y6c9TvCO5zvRQ3scktkyYONCmL5lTEl9Nd2OoHPnBwrg3UJ0dZjKIiO+uonemNBWNpMB29nwi3uY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774860359; c=relaxed/simple;
	bh=VVdP76hWbQZ1myWLOezS16f0Edy7mR9KOkFQN1ME0b8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lspMgcjInKi1SsqpJZ0fD6S7HgxvoXD61c0Hzhf0vDHDHJL9NBJie8LeW1aEf1G8u0+3Dd0aN6/BlLfLfjjhbG65gesDzNqM4Hd7N421d6AkYh8mmchywDpdIVABK6iOyXbBgC4MOButshA6xM2Vg0xWQ0ms8Q4IreT5A+qH4AY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cbnFbQdq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cbnFbQdq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08775C2BCB4
	for <linux-gpio@vger.kernel.org>; Mon, 30 Mar 2026 08:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774860359;
	bh=VVdP76hWbQZ1myWLOezS16f0Edy7mR9KOkFQN1ME0b8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=cbnFbQdq1lP5UQ1VEEZcwhsV6r8qQ+1axudixEoYfEGyHpw12hJqt/oRzEmhHBD3S
	 ZfGNO9/fs0BIIzE/pdktpWsNKaY16XPxv1cXhikFodjVKPhNYi2h/kgwBkzLs6cfqk
	 mPLDTEUe4CB+HSmxdpRiwvA3rk2sCHnHQvYkYMLu8IYr39JkdxXPgGUKoG4Hpew7t+
	 3rOH/tS5MS3tCjD4MvITabyn2PYlXru2PL4GmNEFEWDsEmsibTj+af+xHvrOO7Yn5A
	 WMVIxyqu8vsNSTGG9MuWUb3OJzUBDO4XBU6JVs80wKQjZtAV871VlVYzpvUVCpeTUS
	 8a0JDJB/1Df1g==
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-6501547d7edso2084801d50.0
        for <linux-gpio@vger.kernel.org>; Mon, 30 Mar 2026 01:45:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUNlp/VaGFmdPZhz9FzsoM3bC2IZUBQA+RAMWYNYqa676pu79whdCJIoW6lakC6Fh/z9BY7YfI5EEC8@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7Vjy1IPd+SD3p6JSoe8E2VQdC5t6VRRap+JJ1mZ0HYNuYCS7v
	G7l+0dJPUM6ZQKwBkwbDFrnkCszwbIJF4N+kFc1yNNhCDwY7Nqro+Xih8VITPUct79A631jLCLb
	2bOjNXfUJ8TY+TtWlwEM1Qk3u7DvlAHs=
X-Received: by 2002:a05:690c:e4ed:b0:79a:2ef2:7f7 with SMTP id
 00721157ae682-79bddd17b60mr106298117b3.23.1774860358365; Mon, 30 Mar 2026
 01:45:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260330-ipq5210_tlmm-v4-0-b7c40c5429e5@oss.qualcomm.com> <20260330-ipq5210_tlmm-v4-2-b7c40c5429e5@oss.qualcomm.com>
In-Reply-To: <20260330-ipq5210_tlmm-v4-2-b7c40c5429e5@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 30 Mar 2026 10:45:46 +0200
X-Gmail-Original-Message-ID: <CAD++jLnwqDgKJMEBomgGSt-Mo90Tp0Or0EdRx3MkhM9D9dj=4g@mail.gmail.com>
X-Gm-Features: AQROBzCK6pjIcVdpjgVwnYJ7kIXrt07lP7aui1yTSLgcFOefC8zFgKA67z6lAjE
Message-ID: <CAD++jLnwqDgKJMEBomgGSt-Mo90Tp0Or0EdRx3MkhM9D9dj=4g@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] pinctrl: qcom: Introduce IPQ5210 TLMM driver
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>, 
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Kathiravan,

right before merging this patch I merged:
https://lore.kernel.org/linux-gpio/20260327171240.3222755-2-mukesh.ojha@oss=
.qualcomm.com/

On Mon, Mar 30, 2026 at 6:51=E2=80=AFAM Kathiravan Thirumoorthy
<kathiravan.thirumoorthy@oss.qualcomm.com> wrote:

> +               .intr_status_reg =3D 0xc + REG_SIZE * id,               \
> +               .intr_target_reg =3D 0x8 + REG_SIZE * id,               \
(...)

Should intr_target_reg be dropped also from this driver?

If so, please send a follow-up patch.

Yours,
Linus Walleij
