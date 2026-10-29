Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793278836;
	b=Nxrj93hfCGTnLvPsOyasczOZxvb42jyiD9bcwijBoMGaWHzJQtLuSbY36vDLWTiJdCnY
	 MUBgc8JwNMIIKXhgKGVZazA8hi+1LUFK/+dWsuK3aXhxKODBCZhNnRPd0e9ssjKi4uk1Z
	 2fn4S/U8dyE/Brv/piXkgartccInh7XaQ9TJJ9M6+r3gFua1SdEmG58kqPz7VFGAxEVVW
	 esJ+ZLpzKH6peNvUSIxoAst65pYMcBRN0JaCD7FHFZEuMqr5U/403vdjiJX8h6EmeYStK
	 e+R0ZzPqFc9PwxLd2bzkW0V5Z+n6/3vyVNDybtEvbd6g7HfpBIUOA7GTwhCZHsTd8QA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793278836;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=XwD3tkQ64aRCla1mgFI5NO1jCorsIdlneIFywgKjYxI=;
	b=TR+Tz/SkDq5befoDW8ItT4ndcQyUTcH2UrluxTZ8E8YI08bhuCX6SY+nTqq+ecEbanVJ
	 yZ7hzYlrGeD79T5jHMtqaOm4OBlXPQUyXKSBTHyCHUTbQXDySk3t73m30d4XU2cQcJ+HU
	 NTMe5FrhoW48C31RuMlMpII3UXCL04MxsJi5I4futBSPEp2zgRy8I8/baCg+WQUmZvUGU
	 6sXEP5m0SeYMBiiFO5kk7zgRZVqXDkjIv99FHpqcrDRuzlw/50ek4KZXnd9mnMHzYoEJ8
	 pXYx+S61Lr6gT//p0qiBCBGWyHL0qyygY8nLRVBDy5uOh6tfU6ST99bOllLQ8um37hg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="m/CeT8Be";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31F39606A320
	for <linux-gpio@vger.kernel.org>; Thu, 29 Oct 2026 13:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=m/CeT8Be
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 079531F031E4
	for <linux-gpio@vger.kernel.org>; Thu, 29 Oct 2026 13:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793278836;
	bh=XwD3tkQ64aRCla1mgFI5NO1jCorsIdlneIFywgKjYxI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=m/CeT8BextZ+AOu0A4DyEnCBIXB2uclRB8PLGsguu6ixuUnsS0MbiREFuPrWUH5wD
	 Fvb8fCpAHq/5KFuKMcmimhbwUcqB+JGOriRLmUgzd4I8ewdC6YN3qGBcebd0/1QOap
	 bGKiRxYbkCq0aCVnIPRxI+SBRRJkNticYiFKx8ymy5oeD59cQjR14mW30Z8OXgDgTW
	 2J9OHrfCM8O6gS62mTwoHMU92ZIZBwgN9Z6Ux1MaolFkr6EKlEFFCLQssiaobW/0kg
	 yAfwZyOHY9YQ6zTZ4kyLHNBkiP+7ontIyL7mARcnrFVdKI7wUs0sFM9KDYl253mnsC
	 vRldpRLjz/qiw==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5bfbc25a76aso273356e87.0
        for <linux-gpio@vger.kernel.org>; Thu, 29 Oct 2026 06:00:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxe5FweEoImeWFOVRzmTsYQ85iBH/dHlwPnQCiJIqArBSKMfrRAZ0DEX34/NMMnCZEtWyPbR39D7CSk@vger.kernel.org
X-Gm-Message-State: AFq9FYIpWM5RaqPK+TF5y6LFGDBaq/L+WLj8rLr8tTtsDf5uVJTNsA0O
	xffdwsvJjCQrvqJTs72jUbPxJAqIa0RXNzeC+cet/1hPFVVNjk0lp2/e15vqKKV/bgx5TfiYAsY
	1Sc2Pq6jDdA7/8x22ZUPbti07iBE0A1w=
X-Received: by 2002:a05:6512:2159:b0:5bf:d29e:f7eb with SMTP id
 2adb3069b0e04-5bfd29efb06mr357760e87.14.1793278834801; Thu, 29 Oct 2026
 06:00:34 -0700 (PDT)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261017052534.115203-1-changhuang.liang@starfivetech.com> <20261017052534.115203-7-changhuang.liang@starfivetech.com>
In-Reply-To: <20261017052534.115203-7-changhuang.liang@starfivetech.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 29 Oct 2026 14:00:21 +0100
X-Gmail-Original-Message-ID: <CAD++jLmtOcNMZsXWgH5Q1fHk1A3vAZx3OnX3=RDvOjKpcefCcA@mail.gmail.com>
X-Gm-Features: AclHuK-ur4YmhzooEcJhKo5CJnhDEqWcuLqSNOXf9L0w0FIc9PDWosppkFp5N90
Message-ID: <CAD++jLmtOcNMZsXWgH5Q1fHk1A3vAZx3OnX3=RDvOjKpcefCcA@mail.gmail.com>
Subject: Re: [PATCH v1 6/8] pinctrl: starfive: Add StarFive JHB100 emmc
 controller driver
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 17, 2026 at 7:26=E2=80=AFAM Changhuang Liang
<changhuang.liang@starfivetech.com> wrote:

> Add pinctrl driver for StarFive JHB100 SoC eMMC(emmc) pinctrl
> controller.
>
> Co-developed-by: Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
> Signed-off-by: Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
> Signed-off-by: Alex Soo <yuklin.soo@starfivetech.com>
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>

Overall LGTM
Will you resend the patch series after v7.4-rc1?

Yours,
Linus Walleij
