Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA3F638737A
	for <linux-gpio@vger.kernel.org>; Sun, 13 Sep 2026 08:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789289179; cv=none; b=WPnA1P4z6TyMasNHmTeseiJdY2ShkwdZx/yS4hDZh0w26fsLSII29X6BkoxWxnbQTpaXlOusDK/BYAOEn5a2tvEEo/9NiuaTSg3piniSPcNBOZQ/xRiQeyBIjhjP3bFMpMF2l0WLQhL8hdSBXixUNC4C+t/qJitdK3zuBA51KPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789289179; c=relaxed/simple;
	bh=iHvIsz7cl3fIxEd7ZH9+eu1Bi+Ug2ZIJ7yL/8KUNzhc=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jb1tP0V53y77GNsyYRfpEdVkE5eIby2lUgr+JGoeoYZ8i59Ri5e/g+eymrWHUsPrar7Ogl26ZawEJoPThnB+RTnwd/YIVHgQJMjwR4iRazMmZzm/LOVMyzKjfr1Oz5R2hjWZl9P5sIc0FNcE5ywWXTjwdUjXNa1a7hDU13SXmDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jU/LtYRo; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jU/LtYRo"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d8fe517774so15229665ad.0
        for <linux-gpio@vger.kernel.org>; Sun, 13 Sep 2026 01:46:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789289176; x=1789893976; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8L1RhqceTVtKN+YKBRtMP6Pzolyp5M8mVVEfY7BsJsg=;
        b=jU/LtYRoRbQUvU0jctkifESRhlMKVvQUlUykjquKDllblDB51b/rkhrsESGiMcN7Al
         xXdq/2FTTzsvKr4h1U0ZsXoY9job/bAk8QuSfNknKGGTlr1BBhPloUuIugXAQO9qn+R6
         lSj14kVSGtgao1GCqRXc6tye9sAq1xw+7X3a9HPwzNENPHeea32LnkeIY5A75jvmd+mE
         mwm91v0IqjolDt4bj1UJpRKRXDwGIkObQbor6MxogEfzBuhZalMpbXkgBZqQICIuT6/O
         RD3wFusepTunoNKAiyXQ42piNvUFGFtRQ3fUJVj/UGmV9l80yqDGrJA7TfwQYt9b7J3q
         c7LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789289176; x=1789893976;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8L1RhqceTVtKN+YKBRtMP6Pzolyp5M8mVVEfY7BsJsg=;
        b=j34atcnUE4O97gb5dyywmZS9FyM6WC7l6EJA84uNZiC/cPkmEJU3JzIZnH+9hbp3gJ
         r34GRLVZ5+fMUM+aFyAb4BE3FGjHL9Hc8KHkDyHbAKffAQqPfI9GdKFy9KNmaqnAAaEj
         pY29Ouf7YvF0qUhi9XtxrK5ijChgyhrBa487dPeFd5/IpUI5b5WghXelFtlFny9X9dNq
         TEg2ZTmvxfsaXFg8sj4ZslipPETTmFiCh2vBzI3HCuFtYUtuguiasn64dsC3WG0tSgGu
         S0WmBeec+J4siRW0x0NhmQIPiOH3OKj272ZLGkq39pYfL0MP9Umleu8SWAz77PVMNOon
         fX8w==
X-Forwarded-Encrypted: i=1; AKwUvBxE4XWGXJCWRZoLlWT81cs//ceIX+aE7Dd5L00M/FHIqZhrMQJSuYkIqIcVJaDY4IV+SGCxiZONTDCW@vger.kernel.org
X-Gm-Message-State: AFuF++mh3PkOv+I3R7TTHtBapPxlmSRCZpPZS6xnq7M7kqWaXZj7m8Q7
	q49XRvqN5SNhAlWnnAIbGULqRLACJPeOpl6w75AHuebmAw9YORedpiqb
X-Gm-Gg: AYBFou3eSZr6yRCOFamL7tZnWAzvwGw39Zub9qetXQNcyCh/B2JzShxRdf9+kA8LnXM
	xkrjFYoxe/bsKYjUaRXRY/VvvipqlTDmBfdUhiesqyhNE/WPyLgn65nixEP+PWPhIWiJEvQF+jj
	QxWmT0UOuKGtFQWkHvmSnzIZGGD6mJAh3paobEI2TRJ5eq08kmibtj9mIHfPdEf3RO4Pisd3C9/
	AovHLt0kU8dO2oga80ciy+R45IoqKOApeLnVmlULswyCghy79JAczAvfACWivV7BNhcopbOqIeg
	vu3Db9/cr5Sz7Uvj5r/XdqUNDz/kJkZWDOV3xotJeFspH3nj6HfZ000Yx/mm566/6bVBI4cqkLW
	Xy1ne8Is2szdEzlHoJGjdeoUNF/SuF44CdSoAdthwRKq7AUg3VucQo0sG8BWR+JkTm+WSd7NwEu
	NwFXSkr1ZT/L1IYp2o4GAJlUAFvqCCSRrHWgiycWK0AlWwMLptllG2E+mOCeoOo/0I5e/pquCRb
	YShqtOsSxXkvTMM5DI83UKe+EDxTw==
X-Received: by 2002:a17:90b:3810:b0:398:9be8:ea68 with SMTP id 98e67ed59e1d1-39d9c35dddemr21890581a91.21.1789289176156;
        Sun, 13 Sep 2026 01:46:16 -0700 (PDT)
Received: from localhost (madb688426.ap.nuro.jp. [219.104.132.38])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39db113a3d0sm9891430a91.14.2026.09.13.01.46.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 01:46:15 -0700 (PDT)
Message-ID: <6aa662d7.0ca013b1.1575e3.0a60@mx.google.com>
X-Google-Original-Message-ID: <20260913084613.3dzcb4puhqeetjos@DESKTOP-1P5QNTF.>
Date: Sun, 13 Sep 2026 17:46:13 +0900
From: Kohei Ito <koheiito.dev@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	linux-gpio@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Onur =?utf-8?B?w5Z6a2Fu?= <work@onurozkan.dev>
Subject: Re: [PATCH 3/3] sample: rust: Add GPIO consumer sample driver
References: <20260906-add-rust-gpio-consumer-v1-0-24d192f93760@gmail.com>
 <20260906-add-rust-gpio-consumer-v1-3-24d192f93760@gmail.com>
 <CAMRc=Meei7Z1f1n0M_Hy1LdxG=NVhkFeEiT3=p5QVpw6BTv3EA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAMRc=Meei7Z1f1n0M_Hy1LdxG=NVhkFeEiT3=p5QVpw6BTv3EA@mail.gmail.com>

Hi, Bartosz,

On Thu, Sep 10, 2026 at 12:37:17AM -0700, Bartosz Golaszewski wrote:
> On Sun, 6 Sep 2026 10:45:51 +0200, Kohei Ito <koheiito.dev@gmail.com> said:
> > Add a sample driver to demonstrate the use of the Rust GPIO APIs.
> >
> > Signed-off-by: Kohei Ito <koheiito.dev@gmail.com>
> > ---
> 
> I don't like samples as they rarely get built or tested. We seem to already
> have kunit support for rust, wouldn't it make more sense to implement a kunit
> module for rust GPIO abstractions? If we don't have provider abstractions, you
> should be able to reuse gpio-sim as the GPIO controller for testing just by
> instantiating simulated GPIO devices.

Thank you for your suggestion.

I assume the kunit module you have in mind would be implemented like
`gpiolib-kunit.c`. Based on your comment, I agree that a kunit-based
approach is more appropriate than a sample driver.

However, as far as I know, we don't yet have Rust abstractions for
platform_device registration and software_node, which are required to
implement a kunit-based module for testing GPIO consumer APIs. Given the
current state of Rust for Linux, I think creating a sample driver is a
more practical approach for now. I would like to consider migrating to a
kunit-based module as future work.

Best regards,
Kohei Ito
