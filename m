Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0E361A682E
	for <linux-gpio@vger.kernel.org>; Fri, 24 Apr 2026 13:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777035736; cv=none; b=XOOxcpP9Z6mxbucZ9m78IwcOVOW4N5ml7sYRbfPGEPxAuKDAbFy1HcDGr1ujj4dNWM16NvQTXaGM7Exv1/AgmexM4+Ij7Ev1wHdwkMa9tTwNZjtFF4raIvTXheRqb93xRsSoblGj69p+0U/NAUIjkCp8Mp/+Ly4HSgf8ENMtTcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777035736; c=relaxed/simple;
	bh=/HaF/nLTDJIXNgA/QXZ7iAz6ZVHxmz6n45/ib3aCXsU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jgII/lqr0IJx3yqzFa+tr3P+hM1F2eJhKUsLr0JTMG+9rzKhT4IkXwRagqc5HWjeScvNKXPPjsy28GAkE6aWI6Z9JcjJdo/dKB0ROxIbJtpGAutMZocjZelbzQfFoRrHUvsALEzHN9eZeixbltoVSCf9xMmQJFjQKxF98mo89m0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Lc9O20B0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Lc9O20B0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8697AC2BCB5
	for <linux-gpio@vger.kernel.org>; Fri, 24 Apr 2026 13:02:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777035735;
	bh=/HaF/nLTDJIXNgA/QXZ7iAz6ZVHxmz6n45/ib3aCXsU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Lc9O20B0GWZbSZdmA8F7R4dtSM07HxBa7hqMrnsGDlwz3GlJZWW13ZX/whEPayndf
	 VUYtww6860xFhzUG13EFuQl1eDK2pFr1IO3vxPqe/NbilyvlsDRGgVkORcfsZACeoP
	 oqopxRnYvyZBVR/8zhl32Z/Ds6nZ5DKwN8FOO4SpfJfQD8P0mzAO4ItjfRUvk0rlq8
	 9r5j8wNsqbXiYmy0AJRmba8K26jiEPbLNtLAd8cDeQqdLO/BhpqaTda/h9OcU+mDO7
	 IBKsI7cvaLJEa1dsphHrzAK2dRE2Hq3McwY9p3Qo2/i1OCK9fPGLOiPCD+TIEvZO0S
	 ClMz/mKnkd9FQ==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5a3cee3a271so7891384e87.3
        for <linux-gpio@vger.kernel.org>; Fri, 24 Apr 2026 06:02:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/RiRLO3sWadGX2iukisg0YkMROW645RP3Rrcuu8d4S3eQ/kivEIlhLtov6rvmv8NfDSmSDW0NLv+hG@vger.kernel.org
X-Gm-Message-State: AOJu0YzsZ0a90nPkSN9zqVRa1gPace7XVLXBJv1Ph7fec3p3oeOYrjOm
	FEp7jJvZGxJDfFV6lsy9LBb1dqwjtiCIhA6rT7LD3hZS4OjOpdyUgXCfY+Sb15CS3jTQT65U50F
	YIYrs2vLD9QyGfF/hiEmON+G0s0vzyfn0QYn9irDg3Q==
X-Received: by 2002:a05:6512:3e18:b0:5a4:157:5342 with SMTP id
 2adb3069b0e04-5a4172eeb07mr9927569e87.39.1777035734166; Fri, 24 Apr 2026
 06:02:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260424-meson-build-v2-1-d45fdfb8b7f6@oss.qualcomm.com>
In-Reply-To: <20260424-meson-build-v2-1-d45fdfb8b7f6@oss.qualcomm.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Fri, 24 Apr 2026 15:02:01 +0200
X-Gmail-Original-Message-ID: <CAMRc=MfrmyGN3zfQSFW=WXdyWm6u5_vB7Tw3xpkXuUMLKYdbew@mail.gmail.com>
X-Gm-Features: AQROBzAIiZwlrfjy97V3r98igMftBWh307Ofw_fcNol30VZWJ5KnSQXrggu6CUg
Message-ID: <CAMRc=MfrmyGN3zfQSFW=WXdyWm6u5_vB7Tw3xpkXuUMLKYdbew@mail.gmail.com>
Subject: Re: [PATCH libgpiod v2] build: replace autotools with meson & ninja
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Linus Walleij <linusw@kernel.org>, Vincent Fazio <vfazio@xes-inc.com>, 
	Kent Gibson <warthog618@gmail.com>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Erik Wierich <erik@riscstar.com>, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 24, 2026 at 2:23=E2=80=AFPM Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:
>
> Port the project from autotools to meson. All build options are
> preserved with the same semantics.
>
> The goal of this change is to produce the same set of files as the
> current autotools approach: libraries with correct SONAME/version,
> headers, pkg-config files, GObject introspection data, Python extension
> modules, D-Bus interface and configuration files. This is done to enable
> a one-liner test command running all available test suites.
>

I think it's also worth sharing the impressive reduction in build time
with all options enabled. The results are from my regular Thinkpad
T14s laptop.

autotools config:

real    0m26.269s
user    0m20.500s
sys     0m5.904s

autotools make:

real    1m6.966s
user    5m10.145s
sys     0m45.755s

meson config:

real    0m2.981s
user    0m2.231s
sys     0m0.750s

ninja build:

real    0m30.468s
user    4m2.969s
sys     0m34.504s

Bart
