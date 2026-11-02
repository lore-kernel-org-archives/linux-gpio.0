Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793652562;
	b=rRTFDLeJ/I5d0/UHxQcl/QCkB56WSWmV9hQkrOieRMYvbPWvXBURKPrf+7D4KWva90Z6
	 nGPhuX5weGw0D0Wa1WzUstGCm4XenlL8tX3ilMaEksjOK7k2L0V6psJ9/f/pQGWraG68h
	 ZYy7Qf/F9O/Tms/xm3Uvs2Mh0Sdr+CiHytd/NddLjTaArFCVy2YRYqMklTHQXuFgP/R6T
	 u+Kpbo8atyTEux3HTFCi0OK9HVa87Ywl5ANbaKi64sFdJQVHIXcLRP7PrzFUs5Q+nzKGJ
	 unDAwNMbto/tQvQzM7TmeBMUYCfbDxE8l3ghjCI4JqAK1T80JWXAZZZoxAi0fJ14bOg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793652562;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ItCWCYWrsffF/cY1kyEqSlpPkR04jjNQaVh5eabm9IU=;
	b=Y6pH9pNyBiQUIu9XH/jHIgTkTMYfXAjVmn1jeJKzG6WNsUNcoczgD2dTDYpI7OsC+Fbh
	 ngIKlqjkP8maEFTWsWrgQeMq0QYAZaRqRthY6arYHb/caVIIYPKOz4VHkgoBuqfqsDyrE
	 7LzqyYcZ0tmEc1EXbw7y6vi2UuM003ecu1VIOPqWPxYDZtG/uEdCkUTjGjw4KsPJmqdZo
	 ECmHNaj1wM75BTUUE/OyYuQMghkEdkCJSqzyp2bePs9Ae8V9ms9BkOePZp6Ks7EqlFot1
	 U94MTV3WuJ769jNA1CRB/m+gsftwKE5i4FiYr1Ua17Jv0D0O0sRMr7B8SNGv4QqZ8XQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Qy2hS9ud;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C01E1606A324
	for <linux-gpio@vger.kernel.org>; Mon,  2 Nov 2026 20:49:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C01E1606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Qy2hS9ud
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c3f8d72d7ceso570099366b.3
        for <linux-gpio@vger.kernel.org>; Mon, 02 Nov 2026 12:49:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793652560; cv=none;
        d=google.com; s=arc-20260327;
        b=WMYNCSowa5obTu1UafX+2dubHFCYYZiXBdFmGEST5z7EhJqfVUk78xIC9/kG1ZWfDX
         RG4VXfXb6KXefIf+DTwgd0jVKr5gtig7GSNkuFBnvtWLf4EbMhTXggA5a0I8C3xLg0qq
         gvLNDzPEkzushovj0WhzzWOGcXFHVfRKvYQcnFQBc68NEb4c/byQxmGo8UZQ6fynKnSr
         rFeYXOxX7AZM4vEdJiIQm/lhWbPPeIXdVinPrbKgr2U1Sm+dIGcOjkSLH79k1Z9DTSO9
         WNuxbGjpmb3cEwqWf2OGKq2XQNiULZ2mdHcbhj3GorgZ0hxPz9FyCKv6mg0XwNhhXoEO
         v3mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ItCWCYWrsffF/cY1kyEqSlpPkR04jjNQaVh5eabm9IU=;
        fh=77q+OTkEORNN8k9QAz9q8oYvN3jfilYo9uSG9Wp0CEY=;
        b=ZrmxthiBR0XaFF+eJA3I+9paAjjFywT8UckbRPrdSSGZoe8ggHMKULef+ZT1Uh+VhP
         GTYsd5yhaa41wmKp/ZYPQUxRbqVJUm62tz2gDnVJclCwZH/TE8SbBmIzSfE0TOJ642uW
         iwdfSuxpNJQ/1eKwtlzMkar2Z+XSAxwSf8QMnF7SrzYKJK01t66xxd3MpRxm8fVH+lby
         RDx03SrQNp7Mx9NJYYf+6w38WgHAmOqyL5llt5T/OKrxgHD9RLWJ78IHnhKxaVJyl21j
         1DJyuEjylLN0LziLh1cSbJCKc4e8njllwBeLjGcEFpObpZTWuCtc4xz9L/bxlBkIHO/8
         wA3w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793652560; x=1794257360; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ItCWCYWrsffF/cY1kyEqSlpPkR04jjNQaVh5eabm9IU=;
        b=Qy2hS9ud95X7n9esuBpUoaSmRXMK3C1B2qWzynHOm77J4OanH3hoyqpGF27NHPHbNA
         MSHI5tFqMS0LxRpmqtSjuubJLWiKXjXKoxfio+KO+tvROBDxTC3UgZJ911KInm6JzBPl
         HIwnwfbPNedmz2Il1UmZjxyP4GxXDZCEdfqoVdRVGmmN73+lc447BeBf094jEUzCwGgN
         AKYHZ/fKu2UL5YzcelEtWW8qEc6LC8tNCIAbx94kFzlwzNTO+9zhE+IIsLPew29cNVJi
         rPyQhBLvHgU2c0nJ87zsnrS4lPP81MZDjasPgfn6Fc3AHLrf/5pQ+h+qyMrb/yExXdrR
         9a+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793652560; x=1794257360;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ItCWCYWrsffF/cY1kyEqSlpPkR04jjNQaVh5eabm9IU=;
        b=sBP7n+2xaRCTA+/FTSeQqPKbjn12W/upMdkuJ6ODIe5jrY/0efYEfbSrpp+/nuAWIg
         ra48GYDqEIGmIQ5YjoZH3kxcz4DUIqWI9fpJxe65DIM1eEEK2d/hht6mz687wOhVDR4f
         O0z2IK0mgSwJGrENtqRZyJsSSWpxdfa78DBx0pfw5W9Wy4U+eCA6UmCai0U9B11Kk90Z
         KH+5Bhe6r6jNEI9YEZBRGV4NgyRq8EWuczdx4BVG+ng3P/zfdz9N3Sssy/NSyr740G1C
         xQCUbpsRQkZdPyrXoSkCE0KazMpMGpz4+p39FDjG1ws2a/LB0YuTlNGpU874cdJJ0Ctr
         vaZw==
X-Forwarded-Encrypted: i=1; AKwUvBwsb+b4oBh0/iUArmbUyZP1cvTGORXbh2dXSdIjJtmER0wGBJYB8ny1BIenQ5k2tfymr6wYbX8jE/LS@vger.kernel.org
X-Gm-Message-State: APuU4Z/XMp9ITeMmCcpiQQzuXTi1+yyZnUlovApJswzRXoGyfx58ONiF
	7uV01Ra1TL+/mPNI0f6pK9RKiBETImSUoxl0gKEEvJXrObn3YCKFHS1v+ImtSpXxOZsIv4uYWbR
	Nz6HJ93MYfzTl2YXyisiY0AwwUpuXf2I=
X-Gm-Gg: AYBFou2s8vQjqTB3TuHYzehXqJ3VIqp0pSeVMg0oHvlqAogA9K+4o3UaBA3lt6cog68
	V2BRVgQVFsZWYMaOwBD7N+qaseMDNhfgGWntMYQuQWfBkYQhZ/VEDzzTNpQuHHsxZg4ARPhsJYe
	ehXeNs7crh3Ktv4za5qHFcMz/1CF97Mz2AzAY0k5X6iU4J/x/9E9v3cA47CQdlCESD4MzYSN5z9
	zT+AYNjDVoLxqxrrzQ1MnpYE8n1IDElFnvs2dLF14aOzAuiRBvoePxh9Z2r36i8t55t03jsRBD1
	m86ItlfgHdvcD4RcIFCcktJ6NpBVvbb1oa1i330Dc4kf6qrcLUj4QURuNUr1doW499yi9yXxHT+
	8mxBdecDP6njvv+fNpres3FJCTxwOG6M+baq+sbP9cwPRU9AoEiDSkuWxPrvpn7WoDBWsbNdPNM
	1gJOANajG6diEjylKSEd0agginkvc3bIt3RG9UsyjdyGH2fXDKiOSYyGFY/72mWrI25w6sAGWcP
	bNWnFxstAkId6QD9GZDJkFhYA==
X-Received: by 2002:a17:907:96a1:b0:c41:30be:4f82 with SMTP id
 a640c23a62f3a-c4ca7ab1f72mr900570266b.39.1793652560193; Mon, 02 Nov 2026
 12:49:20 -0800 (PST)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260925160913.1648565-1-andriy.shevchenko@linux.intel.com> <gxfngcnnkgkk5zrmsyrmqam6bk2ti2aflipwsutvce3dtgc7tv@nu3mmjfrt75u>
In-Reply-To: <gxfngcnnkgkk5zrmsyrmqam6bk2ti2aflipwsutvce3dtgc7tv@nu3mmjfrt75u>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 2 Nov 2026 22:48:42 +0200
X-Gm-Features: AclHuK9vu6sBba2BxIIl6hwB1hx2favluLvkLKkyiaeY3qnyVXOxghpaXG0PETs
Message-ID: <CAHp75Vdocfk5b7GkL21z4nKv4mNcGMF4Y_aZP_sPPeL16FrsdA@mail.gmail.com>
Subject: Re: [PATCH v1 0/5] gpio: Move most of the Intel GPIO to the dedicated folder
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Linus Walleij <linusw@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Raag Jadav <raag.jadav@intel.com>, 
	Junjie Cao <junjie.cao@linux.dev>, Runyu Xiao <runyu.xiao@seu.edu.cn>, 
	Maulik Shah <maulik.shah@oss.qualcomm.com>, Peng Fan <peng.fan@nxp.com>, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Andy Shevchenko <andy@kernel.org>, Peter Tyser <ptyser@xes-inc.com>, 
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, 
	Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>, 
	William Breathitt Gray <wbg@kernel.org>, Israel Cepeda <israel.a.cepeda.lopez@intel.com>, 
	Hans de Goede <hansg@kernel.org>, Lixu Zhang <lixu.zhang@intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 2, 2026 at 5:33=E2=80=AFPM Bartosz Golaszewski <brgl@kernel.org=
> wrote:
>
> On Fri, Sep 25, 2026 at 05:57:02PM +0200, Andy Shevchenko wrote:
> > For the easier maintenance and future development move most of Intel GP=
IO
> > drivers to the dedicated 'intel' folder. For now it only covers the dri=
vers
> > I maintain (as per record in the MAINTAINERS).
>
> I wanted to apply this in order to see how the menuconfig looks like
> with it but it doesn't apply neither to next/master nor v7.4-rc1.

I will check this as soon as I can (currently I have something else to
address which is more urgent and it's not related to Linux at all).


--=20
With Best Regards,
Andy Shevchenko
