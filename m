Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 751B6480DC3
	for <linux-gpio@vger.kernel.org>; Wed, 10 Jun 2026 20:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781123932; cv=none; b=mWd4vVQBu/zC7iML17kP0Xu4qxkZ2VE7+ZS/TvylPOQQBH+bzMIvaVdRsB8EP1wMQsZsAz7FRqa7A7+7zluJ25lh7xdu9cSJ/7GMUrxAfeNWdLL8mutUG9AdxlvdR5TAVmuQipL/Ki+ZMt3cjG6jObroJxz3S8/2UhQnDX4RJIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781123932; c=relaxed/simple;
	bh=f67ZmRJ0n1a66PsXYtB5SiVwO/WGcaSSKczY5SamLlU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=InwuxuHMz8QNJ4JG1vvGoKLfaKaLUCtcY3UD68IGBhT8oyz2FNcNjuAe+o6noz5eDPscwQxoDDwHepW3rmVqp/pVhKJ+4Is8GYv6plFOLHmbpf1f+8Wsr6aD0JV9iIQp3CaTTNeK6GSmAyZjhoqK89cuXJFv7VMzYFq/va1kyuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YR1HlcYF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YR1HlcYF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40EB41F0089C
	for <linux-gpio@vger.kernel.org>; Wed, 10 Jun 2026 20:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781123931;
	bh=902TNf+/Ct1NmVzci4z841fAsnlRr9Twzx86YTQXdN0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=YR1HlcYFnExtke/A8zj4NsC+IAEpWiB6DO1G1VdhhgbQd4cda7wt+TP68+uPOWRZD
	 jw8wAAApVqtaSkafieGFRhPsaYYCroK/XDfhAX1lvuASTg/AI50ru4RREeU2FTOrKi
	 go15nYeehgajYT8UmQEnE3UlGEhsZTMgK8E4WIxZ1umXItmZC8EJFHyFxuCgmiPAfl
	 PtZnt199C4TdicWmuhEDwBt/ZmM33+jzPawA1io5VJqrPrXX87Qc1B0OrqAz+t2WsB
	 kAlNTHYhVl8dG8VM2J/YFIJ6wpDltlZO2TUbh7zlAY74fb6GRnVmbqrgAXJSYa/DbL
	 TtOQVrSbN2XaA==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5aa5edf347eso4913168e87.3
        for <linux-gpio@vger.kernel.org>; Wed, 10 Jun 2026 13:38:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+rf+2VFvvRFQxzlYPwh0bxdLHjDE/VXey8tJt3yGCeucIXyiQAXMl9xwQD64+Wv+XVju0bRCiAPNrx@vger.kernel.org
X-Gm-Message-State: AOJu0YwbN0+CLDk/nFhhEXMsMo2JKpQncoMY9NUXYUDWBMEsQy2aS0Sh
	ajJ4fYpWdWMcVUw1gKXZGL1GqXGLvuztj4gEfjZlKvz6JueJz9z2fegB7j9XB85+D+G6AHAtiTJ
	5e71qKmMK6le3X2Qsv8OkrEP7iUeqDzg=
X-Received: by 2002:a05:6512:1250:b0:5aa:854c:61e8 with SMTP id
 2adb3069b0e04-5ad27379ad3mr93224e87.40.1781123930027; Wed, 10 Jun 2026
 13:38:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260610180012.3505877-1-ajay.nandam@oss.qualcomm.com>
In-Reply-To: <20260610180012.3505877-1-ajay.nandam@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 10 Jun 2026 22:38:37 +0200
X-Gmail-Original-Message-ID: <CAD++jLmu4GEVBM7UzoTCG-MXtzGmZRMM9dzB_KwF27vGYAbcdQ@mail.gmail.com>
X-Gm-Features: AVVi8CcerLS42au05U5T9fgpLOIn5ysAVJ6hcId9TKxoq_SzYj9LNgAO6DSpqcI
Message-ID: <CAD++jLmu4GEVBM7UzoTCG-MXtzGmZRMM9dzB_KwF27vGYAbcdQ@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: qcom: lpass-lpi: drop unused runtime-PM write helper
To: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Nathan Chancellor <nathan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 10, 2026 at 8:00=E2=80=AFPM Ajay Kumar Nandam
<ajay.nandam@oss.qualcomm.com> wrote:

> lpi_gpio_write() became unused after the PM clock runtime conversion
> switched write paths to register helper calls inside callers that already
> hold an active runtime-PM reference.
>
> With -Werror this triggers:
>   error: 'lpi_gpio_write' defined but not used [-Wunused-function]
>
> Drop the dead wrapper and rename the low-level MMIO helpers from
> __lpi_gpio_* to lpi_gpio_*_reg for neutral register-accessor naming.
>
> Fixes: b719ede389d8 ("pinctrl: qcom: lpass-lpi: Switch to PM clock framew=
ork for runtime PM")
> Reported-by: Nathan Chancellor <nathan@kernel.org>
> Closes: https://lore.kernel.org/all/f03850f6-186d-4988-a450-e6e95f24a551@=
kernel.org/
> Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>

Patch applied so linux-next builds fine.

Yours,
Linus Walleij
