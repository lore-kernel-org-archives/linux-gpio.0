Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793263481;
	b=p2Qsfvg5A6BGIIM0jJqflIrwG6AfUC9OVeqDXRfBWvRIrF7f5w5yaObZPP9WET8F62GH
	 qLu5+CRo5/ztESXThhbOH4eY9/pU5Vr2ZuxIeCgC8f0ylJqRlrFBskvi3Lp9TGSpC5MX+
	 rU0nfZtFVCo3lmGQ3QrMznsAysNfTsXCCovLYS+FUihmuyRJZBPd3pS7J6/uwmtTOWTyu
	 pOojNbs6ny8dwZZEPgHl6K1fuhl83Lsw9Lcrk8/Q4q5n8wGGofL+qPLpSGOcwC+hUlrZK
	 XYh/DNAhvWP782+hAV/5sgu7bL2dWJVOKSL3YTH1drzlvIPv3X6RIrI4S8uIPba/lKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793263481;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:Received:Received:From:In-Reply-To:
	 MIME-Version:References:Date:X-Gmail-Original-Message-ID:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=CIFDFPylu/mnQMLEn3PFRbf3YzOnbEo4bKDz6zQAyzs=;
	b=3S0E82XvF7K8Kqo80OXN/lZMOKyso1iOjP+gzaa6byPsKPoYWraD/iLLkRCnCxVAZeX5
	 3M4CwAkaBdOl3azYmZY6qusJs8qI2Ln7ATEFqdIBhjUZrP2HVvC85gRv0xpaTJDgJfbMa
	 a/Ro2QupeoS7hmKpUs8PxzCK7dG7we5hl8upyGz2U4PJtrTBkWW0mQYix2A/qOI3MYdsX
	 aM0NBLa0K7JT5t2+v/y/wnJRrq+2mgSmtaPj2ijMaEk+449sDlHof9ylq6iwK/nO0Ad7B
	 +n6vwnKcZKElL4trTXikF8xm3nrzn53cx8cHkyWQt7x0NsWUFqF1ooV4qmvxEcxt7Fg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mLvaC9Nj;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27C97606A322
	for <linux-gpio@vger.kernel.org>; Thu, 29 Oct 2026 08:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mLvaC9Nj
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE5591F031E6
	for <linux-gpio@vger.kernel.org>; Thu, 29 Oct 2026 08:44:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793263480;
	bh=CIFDFPylu/mnQMLEn3PFRbf3YzOnbEo4bKDz6zQAyzs=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=mLvaC9NjLAeSVdSBe+WEtsA1GSUTxBy2QeFTB2Iaa90vu2CXWeK0SqjpZmD5Uciq4
	 laSMQavfWYSfHLMzcFRiL68W6AD6la1G22TsGWNXBcqtDoRjh6J2HVDBUCCGcS1nLe
	 3ZFTOiy1aV0eb07L1b3XSEhtib+PkVLVp4tn/Y6PJb+zv5HDclsdBDnIIaUkUu+ziX
	 ApaUXcLJec5vjmACBfD3VTY2WiRiEaFdZ6PTw4OyCMFpRBl8Wk3A3RZfK62vnPAS8A
	 hMhaf4j7POlLNevTynOQJf5nvYpF1u+uWIzcAmIBxV41yPwjVzXvQ562fss5rcvBEN
	 uUOKhfIvWQ2EQ==
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-3a75f960be4so14656621fa.2
        for <linux-gpio@vger.kernel.org>; Thu, 29 Oct 2026 01:44:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxXWKKwS7wIOl9XXsksvxiOrLymbaCu8xEybK0fFgwe5G0A2Yj2+aZZAJMpHWHgNgG1BihWGyLHnibv@vger.kernel.org
X-Gm-Message-State: AFq9FYKcDFxEfOAs59GidKHmfzKJpTQzLE5bMV3q+GawkqMlMklXK/zH
	sd3jtcuBDVc34z7oHIWOBY1apeizArAkwrB1wise83j6l70MpVjoVL6qPn0Q4iAWOyiT3mkW2AL
	N+WTLAOv+dOVSWgt4jCXiDy40Tq3Z1/+pFGqa05F0Yg==
X-Received: by 2002:a2e:bc19:0:b0:3ac:76de:ae16 with SMTP id
 38308e7fff4ca-3ac9cf82d1emr10952131fa.19.1793263479412; Thu, 29 Oct 2026
 01:44:39 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 29 Oct 2026 01:44:37 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 29 Oct 2026 01:44:37 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20261029080013.519442-1-yegorslists@googlemail.com>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261024123124.3700266-1-yegorslists@googlemail.com> <20261029080013.519442-1-yegorslists@googlemail.com>
Date: Thu, 29 Oct 2026 01:44:37 -0700
X-Gmail-Original-Message-ID: <CAMRc=MfSDfEV51HWy17G8HOOzpUmdb5yRGnM2C7yj6nQQEFjbg@mail.gmail.com>
X-Gm-Features: AclHuK9ZYr6E0wkWUOj0vGHq9RpCSD2hlhE02e4FylQv2sOk8COITqgIdU7nHjI
Message-ID: <CAMRc=MfSDfEV51HWy17G8HOOzpUmdb5yRGnM2C7yj6nQQEFjbg@mail.gmail.com>
Subject: Re: [PATCH libgpiod v2] build: honor default_library for the
 installed libraries
To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 29 Oct 2026 09:00:13 +0100, Yegor Yefremov
<yegorslists@googlemail.com> said:
> The installed libraries (libgpiod, libgpiodcxx, libgpiod-glib and
> libgpiodbus) are built with both_libraries(), so the shared variant is
> always built, even with -Ddefault_library=static. When the toolchain
> or the environment requests a fully static link (e.g. LDFLAGS=-static,
> as done by Buildroot for static-only builds), linking the shared
> library then fails:
>
>   FAILED: lib/libgpiod.so.3.1.2
>   [...] crtbeginT.o: relocation R_ARC_32_ME against `__TMC_END__' can not be used when making a shared object; recompile with -fPIC
>
> Use library() instead, which follows default_library, and set
> default_library=both in the project's default options, so that a
> default build still installs both the shared and static libraries. As
> library() returns an object behaving like the shared library when both
> are built, the users of these objects (link_with, pkgconfig.generate,
> generate_gir, full_path) keep working as before.
>
> With default_library=static, generate_gir() would get the static
> libgpiod-glib, but meson's gnome module does not pass internal static
> libraries to g-ir-scanner, so linking libgpiod-glib.a then fails with
> undefined references to libgpiod. A typelib for a static-only library
> would also be useless, as it has no shared library to load at runtime.
> Disable introspection when only static libraries are built, and error
> out if it was explicitly enabled.
>
> With a default build, the only change in the installed files is that
> libgpiotools, already declared with library(), is now also installed as
> a static library, like the other libraries.
>
> Fixes: 97bab4cc87dd ("build: replace autotools with meson & ninja")
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> ---
> Changes v1 -> v2:
> - disable introspection with default_library=static, as meson does
>   not pass internal static libraries to g-ir-scanner (Bartosz)
>

Please resend it as a new thread, not a reply to the v1 thread. Every new
iteration of a series should be its own thread.

Thanks,
Bartosz
