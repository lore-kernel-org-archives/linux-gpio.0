Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792660301;
	b=FT4a3Qj+1zr+s9zPsRU85b6deyYrJXjtswikTS8njRGS4zsr0A4jI0YBwqOKPnPibKJ6
	 lI8zNa8IdeMVOD1QiF87n1P/1FSrvXGrTW80a8c5+F/tsuL4SplML7MBkuyn1Q0wX4ymJ
	 0HnF0oAPzawxYt9NhJtUNrrtfSlfQCEi9PPXBBALZiwakdy/0KzKqCSekw8Cvoeyg08ZK
	 DV3bFGZxuRX23BLhPrfy6XoSI/qqEGCxe7kkzr+XYR4cF6DviiAC+618Oiuf4k2+pWiTH
	 Tgg8o6aK7HFexzPNoIf8m9Z5G4WpkOtNH8kz5yq2leUIYo2Ad4H85Ab/dQkhhl6sIbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792660301;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:Received:Received:From:In-Reply-To:
	 MIME-Version:References:Date:X-Gmail-Original-Message-ID:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=p/rWYroWakeh+XKdFXLD4/hTsWddof8wuTHxvaKPBIs=;
	b=XhzW31GZkBvzIFAj7Ce+oa3GR/HhX6E+XP5ATHJcJZWWXlHEuIl8P4Jx8JlO8WyehSM0
	 ZbgECF+QF4IQOch9M7u+00DO97EI9Ngmykl1ZQXVnpNPlwoMYv/oF3RsSd/at/eDTDFxA
	 ETd9cQ6c+5AGhvc124+Fl+WGSTkBruzPCPLMdqrF4FvWHytUhZ0cowcQ1tHQP62mNfxRV
	 LiB8O3MF8nGXxkzgtDuJC8Pfc42FXmGHCVCLPna0n1guBRSsorreDQq/Dp1z0bMJSR5lk
	 sqjPLY0PGkb9R5WgO96rnZkX2MCcUrxLECAvpLbNPtoDGGePsbw3ufy54uxfdvP5yFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JgXn7b0F;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D880606A319
	for <linux-gpio@vger.kernel.org>; Thu, 22 Oct 2026 09:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JgXn7b0F
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C63941F000C8
	for <linux-gpio@vger.kernel.org>; Thu, 22 Oct 2026 09:11:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792660300;
	bh=p/rWYroWakeh+XKdFXLD4/hTsWddof8wuTHxvaKPBIs=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=JgXn7b0FPQxh81xw+phuxyPgQ9fuRV/9DmFkK0eOdg8ypWV4kydREYNqip5Nm2b14
	 p4ve/6KD56vOpkpFi3Yp90WjnlYiMR71N4Kr1/nwbH1PWsfBtzhN2Wq5tUym79Hrc7
	 1fds9Tn6ugtgU7PlIwDFioK/oxKiJXXk/IKuvoSpaemVzVMjQGqO6JpDHof8OsDbz3
	 NvArg4bpbV/VJxnT0S7+nU2Xl88zgTEGjg6NP7+hRPX3AyMX4brriLK2xVeTrfJ52z
	 iGhrkI+U0FhRoeUNwiv1BcFnJWygwCDJGbgrIj18u8YrQ3W5RCXqWoTipeBEs32Q56
	 sAPgrSgr0lZfQ==
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-3ab53a99771so14529851fa.3
        for <linux-gpio@vger.kernel.org>; Thu, 22 Oct 2026 02:11:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzu50MzmpjhKgm3vVTF9de6XCN5ohNM+dyaw5+YbgH6F+LwR5MBRsiJ+x0Lm5ztTe4yh2A5i95Eq7NH@vger.kernel.org
X-Gm-Message-State: AFq9FYJPZ1CKXSg7pSVtRYkgBfKdURRFB4RqiBk4yr8SAq5kShxeDzVt
	kXe3IXzNjv1pOYHh1buXY5TEz6Xhlg1NlrxriODEr/lXzCHvLmoEzzkRS0NmlG294tSTeyc7ubG
	EGU0KZ+D7HbFL8YR3S+JMAmRoxE9f+1gc3NphAdwGRw==
X-Received: by 2002:a2e:be9e:0:b0:3a9:d937:7540 with SMTP id
 38308e7fff4ca-3ac4416243dmr12975201fa.9.1792660299462; Thu, 22 Oct 2026
 02:11:39 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 22 Oct 2026 02:11:38 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 22 Oct 2026 02:11:38 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20261021204654.1001101-1-andriy.shevchenko@linux.intel.com>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261021204654.1001101-1-andriy.shevchenko@linux.intel.com>
Date: Thu, 22 Oct 2026 02:11:38 -0700
X-Gmail-Original-Message-ID: <CAMRc=MdHEzHBXx=P1-0Ut80P5=sQnPDwZRD-zdpoE75iHcJjBA@mail.gmail.com>
X-Gm-Features: AclHuK_hz-v2b1ECvbFN520xl5CJy3PF0_qpuWYzZq4NEyeOn4Gq02HoHw6YzK4
Message-ID: <CAMRc=MdHEzHBXx=P1-0Ut80P5=sQnPDwZRD-zdpoE75iHcJjBA@mail.gmail.com>
Subject: Re: [PATCH v1 0/3] gpio: Introduce helper to dispose IRQ mappings
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bamvor Jian Zhang <bamv2005@gmail.com>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Samuel Moelius <sam.moelius@trailofbits.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 21 Oct 2026 22:44:42 +0200, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> said:
> I have noticed that a few drivers use almost the same code to dispose IRQ
> mappings. This series to deduplicate the efforts. I only converted a couple
> of the users (there are potentially more) in order to stay in the same
> subsystem.
>

The "few" being 2 testing drivers of which one (mockup) should ideally go away.
Do we really want to add more code to GPIO core that will only be used in
testing module(s)? I don't think this is useful, sorry.

Bartosz
