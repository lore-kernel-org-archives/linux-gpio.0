Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ABFC38AC78
	for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2026 09:27:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777368465; cv=none; b=KV46jTUFv0tvYMtPdFsWTbDvM7wr+nic6/jZYkG/k/tbDuwLa4P+QHFqLmXKy1eDaG3cS8boqx7wEOWd9SmnsL0zirp/9etzfERm5xFWH05HLHXFvgAJ2W7hex8e/s/O2/yj0nMqe5LEReEF629fDNMf07T4kkghd1pNTitH3EY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777368465; c=relaxed/simple;
	bh=JLPg9I2TfzrfbOLy6uXjaM76yTogNYLPST+TWWZ8VZc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XamU9iWXY+CN8Q9AA3769Mxc2FQYaCqMS8A64fp3zsNZ3NB64CTTtGjsNtPQWg60AMsMfb6JrwrKRgbel6Ke4NvBSn/8Eu/hNf6E+NKmX8Y7wTcax1teITFlmqzSIwJMYcmaPPUkYuKIeXi+hG13KyCsoDLIS9T1XfnYygP9vbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MEZHm19g; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MEZHm19g"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37113C4AF0B
	for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2026 09:27:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777368465;
	bh=JLPg9I2TfzrfbOLy6uXjaM76yTogNYLPST+TWWZ8VZc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=MEZHm19gvZpwO9u3ndneAVtCNM4tyEd/w6l1ikZE8f7b+7m8O8nrIBHZx3cq2a4SP
	 WErQQtPfw3VpSnkv6JOBohBk4Dvw+FZUrs8gPyyuaDMiqiXL34VaT9t3kgHFqKR7j6
	 XGjhKCsZAdsX7df+bmHEvpl0uTjkPUpPi0DiFu+2ZTlumJOnI+sYfR3dUUzjBXXc4G
	 mQ7begPvK17AGMAgjyUvAWQBpTxa7FyMM1OpS7F/DlH27LvXwjgFUuOcUJiyiaNIvJ
	 uzTIX5eE15cPAkjhZycxsRAbJEVCwZ1nQ/HpHWMVjOmemcfxK7Ls3T+tw8D6136E5t
	 1ZPsx2nC9AUnQ==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5a2b5ea59a1so16844363e87.1
        for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2026 02:27:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+FEcEg3X4E9p86GDY4mlzcSPgbB33OYIBCR+jl5CzVxF7UyrH6olQArnt5UF2x1yCu9udaCqGfpub1@vger.kernel.org
X-Gm-Message-State: AOJu0YwwcLaHUHaSOEDiUzeFktpGvDTJ45ocnFNUmsJ5niErhORC8XhE
	uU+dZ3Zob7O63IJM8bR5mr2xy3nzhhreAmRl+17DU3fMgGzGQrYfbx1ehfoJK9fJ1NDen7Edu5N
	xB1o5IIIDUtu6p777lGYgBzZTmcssjO8=
X-Received: by 2002:a05:6512:39c9:b0:5a2:c914:8af7 with SMTP id
 2adb3069b0e04-5a74641075dmr832234e87.5.1777368463886; Tue, 28 Apr 2026
 02:27:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260415-ipq9650_tlmm-v1-0-bd16ccb06332@oss.qualcomm.com>
In-Reply-To: <20260415-ipq9650_tlmm-v1-0-bd16ccb06332@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 28 Apr 2026 11:27:32 +0200
X-Gmail-Original-Message-ID: <CAD++jLmxJUPNjXkFi490GSPwB-bHs4tdJmMFwxyCX07N=kxGHA@mail.gmail.com>
X-Gm-Features: AVHnY4ItGCSX_rPtMRPswLMsDRdapaHild8dXsI33WcyNIcmsp3xn1n67AlJGXQ
Message-ID: <CAD++jLmxJUPNjXkFi490GSPwB-bHs4tdJmMFwxyCX07N=kxGHA@mail.gmail.com>
Subject: Re: [PATCH 0/2] Introduce TLMM driver for Qualcomm IPQ9650 SoC
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 15, 2026 at 1:29=E2=80=AFPM Kathiravan Thirumoorthy
<kathiravan.thirumoorthy@oss.qualcomm.com> wrote:

> The IPQ9650 is Qualcomm's SoC for Routers, Gateways and Access Points.
> Add the pinctrl support for the same.
>
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualc=
omm.com>

Patches applied for v7.2!

Yours,
Linus Walleij
