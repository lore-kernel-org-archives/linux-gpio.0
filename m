Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A156E3B27C6
	for <linux-gpio@vger.kernel.org>; Thu, 30 Jul 2026 11:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785412448; cv=none; b=PBFlGanyO8kR/sO8XOiiNtBjKF3jEDO4Y6vj/QWibYJ8qy+A+qiI6tQbrCo5lDWCYGCw0hUbCA68ccBpLwepQVazCr/vKvH5wYbqa1bkJFPJcdSG/tpyKfS6uBV5QlHh+5NXqHImm/+kiiEHHUXM0amUMX/bRVTn61N/GVBbp0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785412448; c=relaxed/simple;
	bh=PWIEEQjaHeHJ5fxTgr0YOB4InTHJrKcidKplWWfbj8A=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=anWkafRq/Q2SKl171TDDumnVOZZbj9eSsvycquhCTvE/TekYmNrGdPTiA1LdQyXN93ajY6iz5DxbfdP2rjOhLNF4bcqTvjGRNGd6toWgRnQSPI6VhzF9nqEDzfXhW9V+pBFLJMMcs+3MbcwZCBdesbjk9eUeo2PJkExg1pifnRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cbouM69Y; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cbouM69Y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76DD21F00AC4
	for <linux-gpio@vger.kernel.org>; Thu, 30 Jul 2026 11:54:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785412447;
	bh=PWIEEQjaHeHJ5fxTgr0YOB4InTHJrKcidKplWWfbj8A=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=cbouM69YhwFY7cVqNT0XzrbRgTNiiIO9oCsC3AYShqoH7eLFVreZvRWImtxQ1uQGi
	 UJqrHNEGxO6LRIRVVnWkk+fY2Ej7dOdlMFQuZunHjhkMP0ba5p3Jyr4Ub8chJtYoQi
	 SbPZrgCfl1jDJmPFMinCryZXIWpr5pM3aIrpgfyDkMxtVCPn6mJEJhxrfZOyyAhMxt
	 k0pC3ikW1cuW0DinPbGsdykwhYkPxYh5w6YG2OPdbxXMe2e93h8MDbGfftToYppNr/
	 n5H0hBBnqk9oRdYxx/QqtVRfZQdI04Plu27MkrHZxsHe5DqGrRLvYJ8aNJaXR68m+B
	 EadthDyHKAwYw==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5aea0fff535so2400945e87.3
        for <linux-gpio@vger.kernel.org>; Thu, 30 Jul 2026 04:54:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpDsUDC8Uuam0KYZav1ABIXrpqsVPe64tMHYqaYIaMou9KMpbnF6a1CaL1+vaa+K2Ppd29ZOP2v7OJr@vger.kernel.org
X-Gm-Message-State: AOJu0YxeTtx2n3RXPDWorYni1yzRIgB6fJHfVdZLXlrSQ/fxT1fSiQCu
	8hFDqUbniApH6Exu2aXRWXjNdwsGcwDF+8/5uXJhXRSUDCVpnC65SwGy/ai2zzyqstm8fYbPrhe
	Oh48T/FIVYrfkIYH548TyTbMtqYPy392fyZaLDSDHmw==
X-Received: by 2002:a05:6512:6690:20b0:5b0:197b:9811 with SMTP id
 2adb3069b0e04-5b2db373c5cmr282662e87.53.1785412446192; Thu, 30 Jul 2026
 04:54:06 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 30 Jul 2026 04:54:05 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 30 Jul 2026 04:54:05 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <30b3f278a10b46252783458c81dc438df176f86c.1785405882.git.chleroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <30b3f278a10b46252783458c81dc438df176f86c.1785405882.git.chleroy@kernel.org>
Date: Thu, 30 Jul 2026 04:54:05 -0700
X-Gmail-Original-Message-ID: <CAMRc=Mfmpq=Lb8yUqUAdvP29VzXO+FzF1m995Mwsh+dnnW6f6A@mail.gmail.com>
X-Gm-Features: AUfX_mzScc3M9rGBw46jkrwGJk1nYV1wT2PFySG5uBLlIaqWgjEfkCdTsW4Lf0c
Message-ID: <CAMRc=Mfmpq=Lb8yUqUAdvP29VzXO+FzF1m995Mwsh+dnnW6f6A@mail.gmail.com>
Subject: Re: [PATCH] soc: fsl: qe: implement get_direction()
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, linuxppc-dev@lists.ozlabs.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, 
	RAGUENES Jean Noel <jean-noel.raguenes2@cs-soprasteria.com>, Qiang Zhao <qiang.zhao@nxp.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 30 Jul 2026 12:09:40 +0200, "Christophe Leroy (CS GROUP)"
<chleroy@kernel.org> said:
> The lack of get_direction() callback in this driver causes GPIOLIB to
> emit a warning. Implement it.
>
> Fixes: e623c4303ed1 ("gpiolib: sanitize the return value of gpio_chip::get_direction()")
> Signed-off-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
