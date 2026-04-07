Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B67553A6EFD
	for <linux-gpio@vger.kernel.org>; Tue,  7 Apr 2026 09:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775555959; cv=none; b=HraMsG2+uYEo7uP+X/ee7fcBob2beLoYUEUOEdT2SH2A26Qos2Q3ntK2maqZKyiah1e/5LgPFqegYPgslNdh1eowBrX3r+2P13shsIPcFtF2HWwMrknckreSl3Bh+elwvo/lx/KYdvFw+re6K7baOpD/p3p6fwuoBeL5MMGqixY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775555959; c=relaxed/simple;
	bh=c981Q2Q/QLpktJuG9HwYJ71obkxADUmQpe4pmDWfTDc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mCKByfkkJJuFtFqF3IKzkY1p3FPc7QIQvMeAcKUVFs4k6tuzX8UqVlsCkPY/bq2uZngbHJnSiwd3dWQglda0NduDs6O0QmCYy/ur6Jy/lcqmhEl9XnIB/JrQGUrwRw0WKC+xBsg1vPMdGo/bj02O7SdyFCuexVpZtiTUOehYl/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P912Jf+q; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P912Jf+q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C8DEC2BCB2
	for <linux-gpio@vger.kernel.org>; Tue,  7 Apr 2026 09:59:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775555959;
	bh=c981Q2Q/QLpktJuG9HwYJ71obkxADUmQpe4pmDWfTDc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=P912Jf+qEyAauhRKKmaYufL6PHdBMOc11WwL7P4LW3noO2j3NmmvTxzzYoVbow6+v
	 2hCCwp86rERbLpC2HlL9SMRPAQBNjTm2PmhtFSdlE/5FMLkM1MWoLXM8CvR38FlCmo
	 CwJkZD/oTzeWO62ouieoT+mKDuUaLX86Zqy0PINrN39Yw8h91w+X0HQ/4oO/fsuUgK
	 T5xfAUp49HkoWWzak6lJpEKf2uldUgc4Q6n2uqopYvbWt2WX3N73bILCKdlwAkLHDm
	 qqV9Af/MuRsD0LzWTMpYYGLMIFQ0Kwxddh6pRaEKL2lKTRfH6GqIq/u1eRpNtsp2/Z
	 IDXclmOAcaV6A==
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-79c20063a32so50379397b3.1
        for <linux-gpio@vger.kernel.org>; Tue, 07 Apr 2026 02:59:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUzXK9rC8o2TILmNTWVrv7DtltalTxbtgIWQ6iY8oO4GTRJG8nd07/85EnvqMZJc9uKvQrpGVl30Uud@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1WeMYdS+uRwEQwqrpuKtDaCuEbTDfhSE1S14RKcQqNPFRt+2l
	rjh1P2GDhFthU5vqVanoWAo5utV3PgfYXQLZn/x+yJ0kSfZbRCxc6iPFPafnF1PS/mkuZOFT7s3
	rzLI6RE7M78kzDmooXm8FR8lHz1fBZnY=
X-Received: by 2002:a05:690c:e3ce:b0:79e:b3aa:b32b with SMTP id
 00721157ae682-7a3bb9163b4mr156103497b3.5.1775555958839; Tue, 07 Apr 2026
 02:59:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260406075114.25672-1-clamor95@gmail.com> <20260406075114.25672-3-clamor95@gmail.com>
In-Reply-To: <20260406075114.25672-3-clamor95@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 7 Apr 2026 11:59:07 +0200
X-Gmail-Original-Message-ID: <CAD++jL=SQsfwOiaTQqzPmbuUECtNi6qO+yuYXgTps0c5SV1OYg@mail.gmail.com>
X-Gm-Features: AQROBzA_IdcSazOyc2bgD9C9Hq5TVGgjJ-aCKvv8NCBUXO83eSKFubViHi4jZDk
Message-ID: <CAD++jL=SQsfwOiaTQqzPmbuUECtNi6qO+yuYXgTps0c5SV1OYg@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] dt-bindings: pinctrl: pinctrl-max77620: convert to
 DT schema
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 6, 2026 at 9:51=E2=80=AFAM Svyatoslav Ryhel <clamor95@gmail.com=
> wrote:

> Convert pinctrl-max77620 devicetree bindings for the MAX77620 PMIC from
> TXT to YAML format. This patch does not change any functionality; the
> bindings remain the same.
>
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>

LGTM but waiting for DT maintainers to look at it before merging.

Can I merge this one patch separately to the pinctrl tree?

Yours,
Linus Walleij
