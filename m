Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 286FE4A4839
	for <linux-gpio@vger.kernel.org>; Fri, 16 Oct 2026 13:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792156212; cv=none; b=aMozpxMWW0/2+k5AZnNDatfj7SH2LD3evs1CgFj2Ge/7pOfYxf1N0fTJ2Ayzyd2hKFCKmegmA4qSsb/25W/F2zUfe3iLZFE8j0hLbpnwzCpEeph9MWOX/KGhTHXVZx7bgbqUobG1JJf1abzgNl6PVriILDquimObZwuwE+N8e68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792156212; c=relaxed/simple;
	bh=FQ09vxMYGYd2ttuL80Iy/iCi50C6RG5783hdiIeKPfQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HV1naSRkJRPS1CDBk/A+ax1jcd2E/6HCarbMwkbyKQdxijqUvbu9hj6oKnazI25VMNSwyiIAtpFyMiz48McyX/XxxbQ/Y1bFziB1uV0EBVJQdUYewSC8V+Wvay7hTasqNVs1Nz1ahTeNMW3pkt8jnt2AmdyXfO2ybcpQtwuS2XU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zp1d5DrQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zp1d5DrQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECDCA1F000CC
	for <linux-gpio@vger.kernel.org>; Fri, 16 Oct 2026 13:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792156210;
	bh=FQ09vxMYGYd2ttuL80Iy/iCi50C6RG5783hdiIeKPfQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Zp1d5DrQ+g9gZOqi1ktuml9geH1/C+rDv7YqCvb4CkbBbMuDZHftL8I4yOx4/FIf4
	 OPwb7NuuMkeRC30FxjGqpvUL1ILYq+kJ0k3EL40eVoVSW+qECwU3hKL2gQVHuEWirD
	 RqInfzwRSTFeqGS4GCRl9RG3R9KWpMnTCCItiV7GbXYM/MwZrRipgcudFQjeHI53bJ
	 bmUrni3nLo84fLh14aPUtB8K+1gGoCJfuvTbzzifN0CxQmOtJTKlgM9sA32knvlvxM
	 SXzql84inrJwPZFcnQQisuL0NuXETlcn3ezCbPTgI8eZbAeD4MTfJ7u9x/BRD3s902
	 WDkBvi0oS68rQ==
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-3a75f960be3so36000271fa.2
        for <linux-gpio@vger.kernel.org>; Fri, 16 Oct 2026 06:10:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBycJPGlJQqYG4u/TVc6hlsPqxmspp6rLlWkI8b8DAy9YewPB4yimZRTIhW4HSN2/51QmGX3TPcXpLPm@vger.kernel.org
X-Gm-Message-State: AFq9FYKkEG+Fa65KA+EqZ5bFTFbURGRCsrD//gIQNV+tGJVSld1NrReu
	HsCBby12ZcTnKbbwOuWp5pHztDvI+7QenljEEFIy/r75Lf2KW1e1h/AmlTbwwDv1VoITNhJiGW+
	EUk27nZDzeWVfyIjQJz+F+dh1XzRRD4Y=
X-Received: by 2002:ac2:4c56:0:b0:5be:494a:f966 with SMTP id
 2adb3069b0e04-5be494afb99mr795645e87.44.1792156208704; Fri, 16 Oct 2026
 06:10:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261014-gpio-shared-fwnode-lookup-v4-0-2253ad645fd6@oss.qualcomm.com>
 <20261014-gpio-shared-fwnode-lookup-v4-1-2253ad645fd6@oss.qualcomm.com>
In-Reply-To: <20261014-gpio-shared-fwnode-lookup-v4-1-2253ad645fd6@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 16 Oct 2026 15:09:56 +0200
X-Gmail-Original-Message-ID: <CAD++jLnNLryFVBvxwTrw0N9JoHorP0E_SUJcBEQz50i9QnRUuw@mail.gmail.com>
X-Gm-Features: AclHuK9TuCFmvkGVc_qKE21bFcDzH5CIbWg6ZWuK5Fbj6e2kEGf1TDNPflTSDE4
Message-ID: <CAD++jLnNLryFVBvxwTrw0N9JoHorP0E_SUJcBEQz50i9QnRUuw@mail.gmail.com>
Subject: Re: [PATCH v4 1/4] gpio: shared: fix use-after-free bug when adding
 shared proxies
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 14, 2026 at 11:38=E2=80=AFAM Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:

> The GPIO lookup table can stay alive for longer than the kobject whose
> name string's address we're assigning to lookup->dev_id. Fix a potential
> UAF by duplicating the string.
>
> Cc: stable@vger.kernel.org
> Fixes: a060b8c511ab ("gpiolib: implement low-level, shared GPIO support")
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

LGTM
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
