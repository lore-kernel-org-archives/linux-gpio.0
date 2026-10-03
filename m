Received: from mail-pj2-f39.google.com (mail-pj2-f39.google.com [74.125.227.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA8BF38A734
	for <linux-gpio@vger.kernel.org>; Sat,  3 Oct 2026 16:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.167
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791046695; cv=none; b=IGL4Lh+pMqpbghRnCFEJLkBsUIYxaLMKws18vxtBXNU2yYbVaRtI0KjyZQm1eaXphiM3/6T3ehUWjRRjDRePHleKWhgkhFLPxmHouk5BXJ+xQW5tPhj1WNwSVS+zeO3PrwDiXgbanWO2UWI8/N6ThMVQf7F6Tv+/GEfExUyl9a8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791046695; c=relaxed/simple;
	bh=tV68AEZfVUl2ePwMevpcFNFrGswYi8vmfdu1EZiJ9iU=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E/JsSS7TFLpQV+kAd1eLwmjXkXgQvG37UTYxWz2BgEWieXow6JyfyXtc8fSBpNgDfRlGEschco9QJVBEbnfRJhpUJHjQyeQLwaxNASE2zC8fIzKfAJ5t9iGCTf1ssBE1tp0d8W5c1Yw6zTfpGhRQ15tar1CwR1sj0S1jgFEdfOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EcSIiaBZ; arc=none smtp.client-ip=74.125.227.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EcSIiaBZ"
Received: by mail-pj2-f39.google.com with SMTP id 98e67ed59e1d1-3a49b6bb21eso223279a91.3
        for <linux-gpio@vger.kernel.org>; Sat, 03 Oct 2026 09:58:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791046693; x=1791651493; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MLMhydZ/wyB/4hMugvVsF4Xnk66VRKTgxqNM58pVWT4=;
        b=EcSIiaBZNQkOV5Q3S24HkwzJ55DoYFv5VXWOPk5GJv9BcRYW41F3TnwXkGPEYJZ1/i
         HjJTNec5SaNr6xVqSF0xpf8BtnWtKCXLH79aXCahzUTBCV61Nlmklm6Ps+yku3WamTnq
         SIXH/pgxwmcf5USpYreYTE+h3isy1XBC7WbLKHTgBYyezIG2P8pAUO6+ZHvOSC/CnNgO
         iJtZ3cPH6sS8k1Pwd3MQ+knN8rDxyoiGoDKppK6Pklc2/gsRrGrLH6lLdiyaaXIo+SOL
         iZIfLEoWIt4E28bXbykWcS7baEQUFHPP6+EhMinh2C+4k+v/AQnAPXOT1k9chewddYID
         t6FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791046693; x=1791651493;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MLMhydZ/wyB/4hMugvVsF4Xnk66VRKTgxqNM58pVWT4=;
        b=dMaJrRQX5nBpovexPIOPmA5WpzdRcrsAeBBnEpUGnxfe5PNhGKtK2Qtt2PKH6wrqzF
         D0aagc8Abtfc9zD/uuL0Q67ES2ruRzXgiQAa2wuDKS3aEKisSo8NQX/jL3ocqkVH4+lp
         qkuZutf4zIYxsLIfz/+jEL8fU/CrfJnVn66b9xs+e58Fe4Wdewg86vizKJBI6Fp2rSZA
         oeH0a56koJ+iiU55DvzIVAQYhDgVhVZGC8ljRelfgOs9zl7fQt13NLR45eUiRvk9gz4F
         Xn+IvI6STiE+wasAfTSoOn27Py8Yl2LCNqYZdIEcP2/r4V3cL4CrGnFliyx6jSs+O6ip
         ksKQ==
X-Forwarded-Encrypted: i=1; AKwUvBxA3PQUtDZHycLD1kXQ2JaXXqVNaUm/hzP+ooFI3SXebk2pNPsgqNka5VP8bWScV+gmsjPY49/qya7k@vger.kernel.org
X-Gm-Message-State: AFq9FYJyX6E5zvVpA7aCyzf5ci2WwGno1jZnoODMrFbWhwKbCKx1G5ee
	aB3c9Mj1KGzMjosjD9fE4P0EadhGSYWLhH2vp5RbdixjaVOZpvLTbs+T
X-Gm-Gg: AYBFou1TthxSwJ7evTrn2sfiBkpDEQdo0lSNy9vQtc6sM3rOOHQcAOzYX/rBw9N1Qbr
	zN8H9VUqugN3CLRoCVpL3CkQNTuBapkMXZe8LVMVgHB861zgXSjj8miCnklKE9fiQ2z+bAXKXm1
	8NRIFomtBfBoH2uqfcOqB75zc/aJHGFsGzS/+uQfDXR0P6OMz7KveaX5ZIHD/DkyBWdJRu5Eyvi
	xKebp+0O3cYQGCxsaMLRcNoGPkARXSHcu6HrfglVvFFGKHOmpaXbNhbI/uelU5LXy3/P0/p4g98
	evzFhQx+YBWk2+2ERI0jVkJsdDNpI/Buy5kcN+RzCpEpceGal+r2XNP+kKIuAN544+K3wO3d8uX
	XewW0lfdEO92UvyZGegnkJezcGVuk86mr/Hi6OukG5pdQiFj3VmV1sh7hMjwwxvoGIrSG9n89Yq
	AW2YHjAphKufB1nsYF850mJEQ/ZzDJwALB88o0elzzPgb0By/bVZtFNFcdIaKDwrkI4iUPBGGgR
	iGQ1KSo44H70CEmUQ==
X-Received: by 2002:a17:90b:4ac1:b0:3a0:22bd:6ef6 with SMTP id 98e67ed59e1d1-3a6ce64fb77mr3278447a91.2.1791046692966;
        Sat, 03 Oct 2026 09:58:12 -0700 (PDT)
Received: from localhost (madb688426.ap.nuro.jp. [219.104.132.38])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a78d7cd47csm3574222a91.17.2026.10.03.09.58.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 09:58:12 -0700 (PDT)
Message-ID: <6ac13424.00feb36c.a9616.9685@mx.google.com>
X-Google-Original-Message-ID: <20261003165810.zgrm3r4jr76mkmq2@DESKTOP-1P5QNTF.>
Date: Sun, 4 Oct 2026 01:58:10 +0900
From: Kohei Ito <koheiito.dev@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>
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
	Onur =?utf-8?B?w5Z6a2Fu?= <work@onurozkan.dev>
Subject: Re: [PATCH 3/3] sample: rust: Add GPIO consumer sample driver
References: <20260906-add-rust-gpio-consumer-v1-0-24d192f93760@gmail.com>
 <20260906-add-rust-gpio-consumer-v1-3-24d192f93760@gmail.com>
 <CAMRc=Meei7Z1f1n0M_Hy1LdxG=NVhkFeEiT3=p5QVpw6BTv3EA@mail.gmail.com>
 <6aa662d7.0ca013b1.1575e3.0a60@mx.google.com>
 <DLENO35F39LL.2YNA66D9FCXYH@nvidia.com>
 <CAMRc=McV2YKgbmnknLZTSGoSa_9eCHDiOLzuPPyPHHnj=vRuvw@mail.gmail.com>
 <6ab12d24.a3d4836d.3b68e.d0f8@mx.google.com>
 <CAMRc=MfZckBMT-4PEDxr-PjRbUPO4FY3OZw8ks3w+uoEyixbAQ@mail.gmail.com>
 <DLLVT33ESJA5.1XE4J08AEZNMX@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <DLLVT33ESJA5.1XE4J08AEZNMX@nvidia.com>

Hi Bartosz, Alexandre,

Thank you for your advice.

> >> The best approach I think is a combination of a Rust consumer driver and
> >> a C kunit module dedicated to testing the consumer driver. This is
> >> almost the same as `drivers/gpio/gpiolib-kunit.c`, except that instead
> >> of directly exercising the GPIO consumer APIs, the module I'm suggesting
> >> exercises them indirectly, through the Rust consumer driver.
> >>
> >
> > Can't you just call a C function registering the platform device from unsafe
> > rust?
> 
> You should be able to. It's a but laborious, but better than not having
> tests at all, and acceptable as a temporary solution IMHO.
> 
> Of course an even better solution would be to provide a safe abstraction
> for registering platform devices. :) I don't know exactly how much work
> that would be, but there is already a `platform` module, so supposedly
> we wouldn't be starting from absolute scratch.

Sure. I'll explore the Rust kunit approach by directly calling C
functions to register `platform_device` and `software_node` from unsafe
Rust. I'll also drop the sample driver. I'll let you know if I face
problems.

Best regards,
Kohei Ito
