Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794059941;
	b=v7uNdJ3rfZaxDqbACMccMRSXKU5ByZEoEMK2DTz9aGRKYCfHLAAGnBlbwm64x/Q9KO/5
	 XlNdw94Y+0O873fbi8KUqye0BlAj6UUmmBmkJFay868Xh7uDnPhnx2DsdG+R6NXUzHHLZ
	 xbmLnyNyuQ9WwH4VcRNu0ko7NCQIRnjkFoB3OHiTAMFBN/LXgyg8hkjXBwWw4kzeZd6qw
	 ZCb8QT69lKXZY1w9WDooO5lGzk8NR3i1cMMM9RvFe/81ijSSDlIM16NYU93TjBG1QDrtB
	 zHuU4Wu78yKN2smFY2Lehm9HAwSf/JIfCDA1EaatTsNKl30FTXv9O+xtQ3f7G5Wbb+g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794059941;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=VVi/e87sJpab+voYaoq45WS0pEGrOtNiYKBZsW27Q+s=;
	b=LJ04GUTmTvy1W6g0bh1OvQ2hJjsX7+0+ParsVNsXTkPsQZsTF8rKPujpU9D/T09UZTv/
	 e+LmbCo82oVDOcB8UVokz6TyitburbAnjtwmwYzuNTr9llnlpvPm89x+3dg55LN5kPxfK
	 WhIvBYAmEasq426I6dWbm9mpuvzeSflx+kUy3rfR4Lc3c0YshJAq3Fd7GUFHG/GFHvSoL
	 jWFq1IOCqlfGpAnnKXQat0ORGLW2MFIadMgg4jpLZ+M13KPcEYaC9rN3Jcvb1VnJYyx33
	 +6+Th/zDavNrn2/OXN1L2LUnyv6Cj7KA/1XT1jYj+buC78EgC/B4db7KP0drKyIt45g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EEyUDNy7;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.48
Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 338BB606A333
	for <linux-gpio@vger.kernel.org>; Sat,  7 Nov 2026 13:59:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 338BB606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EEyUDNy7
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-67c00f291e1so1064650d50.1
        for <linux-gpio@vger.kernel.org>; Sat, 07 Nov 2026 05:59:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794059940; cv=none;
        d=google.com; s=arc-20260327;
        b=Y/vfInF+VWG3t1HiYQRctSI9i1LAdFxHJxZLZnvWLWfAWH4XtIEB34GSzP+cp+2jIS
         tc8uxwP9LqoyAyQkOjipLinVTL2VbCu7n+7fSrTqFc9jSk9LfLwd8hC18DqR/CLzXrFd
         rCpGDhNZ0DFTfPIfK2IzYb1/yfRUl1W8rcfaMoKsqAmPd35dCMNxMF3Qq2R7j5MiNgT+
         jgsAKVD35LsDZMrue/hEAi2002UjOjQAEA6EjorX+bo1Cf/epN5R/4JOxlyVbyh5LU54
         XOIyfibDtCAUJ2yui7wvxAdMJGA55V1EdteJbKC/1RE/HSFgfa9kC2ojJW8AFSGnjxwx
         cxcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VVi/e87sJpab+voYaoq45WS0pEGrOtNiYKBZsW27Q+s=;
        fh=QUS/GVpgGHCPcjHGt0WdToDSYD/i7TRCOgaKEluln/8=;
        b=P2jKF6t2DQnTc7T1eVEzgfp3Iz50DERM7wgGHim8kgYYvM8jr1dQJnEYN/94BHZdJH
         7Dhba/gmrDlmbBg9s3Ro8bpCeTasWdBzcyplakfLJMitSsn8qkEhE7ktDiGnFHGe0IrJ
         Ei6gXVw0DELyeT1FbjFpDZiGjFI0sn5EDtn/Cmffg4a4SLcJaqvnGlLZ1m/leqGe/KKF
         DTIgeZZC+QHSHI3nFqY8JNoNoOnEAbLZqigXOLV0pV2mZhLwHC8pY5sQ8FjfLHWpk+nx
         9l8UlbFCrACTBhpKGMgzL0jetaV5HSjCgQLZIOP9SmJiu9e8gCP0xPkp6s1/813ZRCaT
         SpLA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794059940; x=1794664740; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VVi/e87sJpab+voYaoq45WS0pEGrOtNiYKBZsW27Q+s=;
        b=EEyUDNy7aTmKMbp07qiBDqoiEA0tfEvhxsvjvhJxPef/sSPkm6POk75XkrdCRdYrpM
         tojYcXpOv7axIcxgqaHJuvhLmYkffGeggO4Go0AcUoUYgM/xZ8a+v7/l4G9W6ZijU8mf
         Ew1yzpCgBieEoqnP2VqqaqvO64qkm3QLT/ltZNYatirrZW1+57A1t2gNo/WJZ7kmCO4K
         KuiZpBCZMcuSjsn8q3TVoA+eXXjfx0JYU/dLdAYQYAssdmDBxEFzuOBpSmoJt5jrChNY
         d+p28ksu6U1shxwFf4BaqGkkiPAIRuuEZCpq4hZE5hUsl9PvFK5lB4j/EzRCZMZYDt5e
         VFoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794059940; x=1794664740;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VVi/e87sJpab+voYaoq45WS0pEGrOtNiYKBZsW27Q+s=;
        b=BP+hHp8Hp/Y+eDoLVzNcWnD2mCK/uzRiBcf7uauVh5xRoqbR2mSyji1EM+a4yyhogq
         bcvCV4hTbe+JWIpFe0SLdjTVXSn2hlKPieI5bUniferWqKEGGgRm91WYB09DQsOPnhjq
         PRZX3tk1vdNewFJKRPS53lBD4YjGGxCu5raJo0SRhE6/9kRP9f1D7paw1sL1taVF2rLn
         k6XvPzGCV5DGYsCMy0KWxVJWgUWiGbYMyzWJqEcBkkI6bf0G+juBWGLhQCt+FJCpzBeR
         XPMLcwo4tGtjAcvYN37lK3ZE25kGXGKxridTBssrIrMJU/buv8spII5yriv/njrp/VJF
         Zajg==
X-Forwarded-Encrypted: i=1; AL+hErFN4Ica765ZiwS32ug+kIykT2cAA1H/hJ9SV0iq3DJNoNMKG7tAsNXkUe7xuRVlVCoy/ozeHyDjFfWa@vger.kernel.org
X-Gm-Message-State: APuU4Z/S0zxH83Fh61rLgmeDhwvjOOKtytJCkmhUdO4n1tD0OeBX/2Cz
	c54JOF7Ot5rXg8VpXY4xsD1uwqCxHwO/MtiGxsvKc0Nm56fYaGQr3A1ANXD3Lg0V2wMH4BRCLl0
	+QJLyT6oZcfSzYBDZK+Lw7Vq5jyY5PK0=
X-Gm-Gg: AYBFou2FSY7UN3NPUo/bxR6ZXrXhN7zRrQMkUWr68hBy32j6vsF+9zjyEg8mST5C9bB
	inu+DVD+ihfjqbnRsUS5tfIJ0MZmCFixtANe8fC2RclLjzMuzNkYD0IyC6zsQC+FAYsIco1g3lY
	nHb/oneotsX9TzyjTO50gDo7ZCZBH6m09UzKN6WPRNuOsV/zOnq4ey1aavsXZ5zVrV/TDrzfv38
	QxVY6Npy6IEFPTJUubEk9yXGizUg6i2/ZWPNR2jG4X/B3jNSm9KP0a+BaFyzM11Zuhy6llJcM4z
	wv7TRL/bfmeQ1g/Qj4d0boTzmoCBcpUrxEnl/HctZvRB8rbXO6s3sXDyQDAUowW8R7xIv4MUAzY
	1gzmN2w+mFrYuX8pew/AXWwo9+8Ds7sTcXoQQ8241V7jaqh4oq3qJx3QNLE3NJfqu/KcglMPwTg
	kXvUJHpeuntGgidQ+fUR/7yp4LNBTEV5RjWEqGCV+RJAre6PPRDyUl1JWeyOmKHQW3UYThrKxTI
	sVhJizdVD6Ei9Dllf+E4DphKGZwHPXoFZjpTp5kNMQQD+GcMuoCNuIBDkOSCw==
X-Received: by 2002:a05:690e:14c6:b0:67c:2755:7133 with SMTP id
 956f58d0204a3-67c275584b0mr1164502d50.129.1794059940031; Sat, 07 Nov 2026
 05:59:00 -0800 (PST)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261106-pinctrl-subsys-v1-0-f17582f32aaf@redhat.com> <20261106-pinctrl-subsys-v1-1-f17582f32aaf@redhat.com>
In-Reply-To: <20261106-pinctrl-subsys-v1-1-f17582f32aaf@redhat.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 7 Nov 2026 15:58:23 +0200
X-Gm-Features: AclHuK86k0sr_RRex5QWUFnx4k6XGaW6tT01IfPzghodPfwjLTwWTNGGOkqKBzk
Message-ID: <CAHp75VfW-DV_HcorM_XWWkBnc6YVrj0fBReFf=WgziVCOoEjzg@mail.gmail.com>
Subject: Re: [PATCH 1/2] pinctrl: ingenic: convert to subsys_platform_driver_probe()
To: Brian Masney <bmasney@redhat.com>
Cc: Paul Cercueil <paul@crapouillou.net>, Linus Walleij <linusw@kernel.org>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, Andy Shevchenko <andy@kernel.org>, 
	linux-mips@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 7, 2026 at 2:27=E2=80=AFAM Brian Masney <bmasney@redhat.com> wr=
ote:
>
> Reduce boilerplate code in this driver and convert it over to use the
> macro subsys_platform_driver_probe().

Wasn't there already a set of patches from somebody for the same reason?

...

> +subsys_platform_driver_probe(ingenic_pinctrl_driver,
> +                            ingenic_pinctrl_probe);

Anyway, this should be a single line, it reads better that way.

--=20
With Best Regards,
Andy Shevchenko
