Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AB6932B100
	for <linux-gpio@vger.kernel.org>; Tue, 13 Oct 2026 13:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791897495; cv=none; b=VIDnjLZ2odjRsMMi0mU/jtJlvp4PtADH3ksZiXDVA6ZrOzCZ9FeMfU6gBHIOyobjRFRmrIhCA6F0vD5Kbb1GG7chvDVY+ta7R5VUlXRtNmqsnnux4YDBqUK/Et+XVSixtV0mMqHOk2sJ4zPPeRdTRRUNVc54irRHx3gpg6vzuAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791897495; c=relaxed/simple;
	bh=lwbHtHTp0gwZwOZd0t1ftlUDIs+ANxTV8ILN56eSQvE=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Niz3GAKTxofWk6O1YdzwoLPb7HYTvm4+z7HCbQfb8m22O4XCbxtS3Oxeay56Dh9MWtBaTUNLK+kgJpqYKKbdXxdtvOS1Oy71eMC8ySehffXXXHhRxJigWNlM5IEJFI8b6tkUUW1nBcLAl245XxX380f2VhWCQT2GGym1En2kPG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mUOf4h3U; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mUOf4h3U"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 683C01F0089B
	for <linux-gpio@vger.kernel.org>; Tue, 13 Oct 2026 13:18:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791897494;
	bh=lwbHtHTp0gwZwOZd0t1ftlUDIs+ANxTV8ILN56eSQvE=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=mUOf4h3UTtn5qube9iKl1gSQX3Hd7Zn+7Tu1HV/nDUxMzUVlAvuBYvicarfDusVgO
	 INeP+5xUHHB1UYpkhUKyS3dIPFzqk79yL4f8IHQIxZTpy5BgFxv8OerbErt/5ja57X
	 G3gx4dAoZcdEdUBWtqcjaAFIWHGZ9CoFcAvnWiu5q4CSrlMuZw9sneuCgEFTx19GK1
	 d07fkKc2QjC/JNcijoebWo92eB0SNzuKCo0cImuhtlTxaiVBOrdgFp5gtm2N4V+Dax
	 vX2DaocuVce6N+bCEtOhiqrsH/z0zZ6uh0VzH6wPp2iHnqXvCeV+mP5bUv6G5knwfl
	 vOenDnuYFI+eQ==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5ba328513b9so2346813e87.1
        for <linux-gpio@vger.kernel.org>; Tue, 13 Oct 2026 06:18:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwd2I9RNrWnPjdFqdoKZdZ9+5sDLbQdX4Lbt9a/yONbmYuhAkCrgC1RJyrjZW/X9FDLbojJdq7aX4ut@vger.kernel.org
X-Gm-Message-State: AFq9FYKd0uGN2Zy+Kz9G9kSmMYloM2HNXSsBGoL2+DoTyx5NoD7kLZxI
	S+y+RTZ6nNNktZBh6wnxHd9NCFg0WCsvDyF57HN9ztCPc2kBVcQjvtsYZtcdwRygvkckOPBEJ46
	PP8igRb3TOXQmZ9oIr/H1+MWtsrZU565dQvOlMQ0i9A==
X-Received: by 2002:a05:6512:6696:20b0:5bc:e47d:3ce4 with SMTP id
 2adb3069b0e04-5bce47d3d2dmr2367059e87.16.1791897493128; Tue, 13 Oct 2026
 06:18:13 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 13 Oct 2026 14:18:11 +0100
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 13 Oct 2026 14:18:11 +0100
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260925-arm64-have-shared-gpios-v1-1-57fed3fae35c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260925-arm64-have-shared-gpios-v1-1-57fed3fae35c@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 14:18:11 +0100
X-Gmail-Original-Message-ID: <CAMRc=MfJR==AiSOjaCFHhiY_nsp0LhNckTYZw4eGeDMx_c7SqA@mail.gmail.com>
X-Gm-Features: AclHuK8s4-NI7PYNkfIoRQUiKC4lZufEZRfgVawvM-TRXBlHCp205JIZBqlkoHc
Message-ID: <CAMRc=MfJR==AiSOjaCFHhiY_nsp0LhNckTYZw4eGeDMx_c7SqA@mail.gmail.com>
Subject: Re: [PATCH RESEND] arm64: enable HAVE_SHARED_GPIOS for all ARM64 platforms
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Drew Fustini <fustini@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Frank Li <Frank.Li@nxp.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 25 Sep 2026 09:43:17 +0200, Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> said:
> Shared GPIO management provided by the GPIO shared proxy module has been
> enabled for Qualcomm platforms for some time. By extension of the
> defconfig, it's been effectively enabled for all ARM64 platforms when
> using the default configuration. Bugs discovered initially after the
> feature was first enabled, were fixed and I haven't seen any new reports
> for several months. Make the feature enabled by default for all ARM64
> platforms officially, which will allow us to continue the removal of the
> deprecated GPIOD_FLAGS_BIT_NONEXCLUSIVE flag from the kernel.
>
> Acked-by: Catalin Marinas <catalin.marinas@arm.com>
> Reviewed-by: Linus Walleij <linusw@kernel.org>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---

Gentle ping. Can this go directly through the ARM-SoC tree?

Bart
