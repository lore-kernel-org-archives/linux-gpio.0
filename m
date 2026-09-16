Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9416B509EEC
	for <linux-gpio@vger.kernel.org>; Wed, 16 Sep 2026 10:31:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789554674; cv=none; b=DQXk/IWX4IXttCKTeTZoh0mRdYCf3ChBcPLAqJjcBnuAybFfzop3FPj2N9fraIasbbQK6n/zL4Q/CtEUn0XNv06CMekFZOR+jpCxTKrgNlGEwfzOec8m7arkJ4N/UYLClyQnMif4/74+mWqQVMV8J3vmlMmlT/+4UPZwGQnRVSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789554674; c=relaxed/simple;
	bh=KI2Il4P7f/4Gh6q3rtxLJcODMETR787SYpqX4hUjLRY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=K0J4TZ9e10v04Sadkc+R5EVshfzNq13mnnvTVj8PEb24xh8nP4WnAxp66lqS3/i0feTledsf2LKYEuTZ+I5kqcLPpOklBN5m8pDxIggiOTeN+P5CKOUyLsnGAXcm6bgjRBxhdGdO/Cy98rONth7UBYjlbQfxnoA81B9ErzsMYNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffroot.co.za; spf=none smtp.mailfrom=ffroot.co.za; dkim=pass (2048-bit key) header.d=ffroot-co-za.20251104.gappssmtp.com header.i=@ffroot-co-za.20251104.gappssmtp.com header.b=vM3EVsxU; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffroot.co.za
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffroot.co.za
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ffroot-co-za.20251104.gappssmtp.com header.i=@ffroot-co-za.20251104.gappssmtp.com header.b="vM3EVsxU"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912e4b11so4373295e9.3
        for <linux-gpio@vger.kernel.org>; Wed, 16 Sep 2026 03:31:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffroot-co-za.20251104.gappssmtp.com; s=20251104; t=1789554666; x=1790159466; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:user-agent:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=t3FEA+oyST18v1zQTtRjBsrs8LKBIAI2sSiAsUdrn1Q=;
        b=vM3EVsxUYRizuV/KfRTwWwwgppaZXhA0XIhWPngNRoXSGNcJnV5x4ncZPObmFPyuHy
         rlXNNLkOZpieusJaK1kGyac+AF2xs5xpsKZLFTNbU7djXUWylIkqEbLvdJ4cmlNgieAa
         UdwUecOJO5HVXYV/tiHgl5fR1Gg6A9tIubVdqmtt+rp/lDt2BoHOU38RAVCdEr95304e
         XH04t40AZdWDzCPRfAYpY4KxQsx1gIu9iRKdD3U8LW0/uHrq//KqgqNSzn3O7HjHndmA
         TNbL7D9/LEpyQ+82bJQfwAxpdCxN0keD2qUc4uX36Hz3AbWZXdxXJASd4lkivZrS3I/s
         XIew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789554666; x=1790159466;
        h=content-type:mime-version:message-id:date:user-agent:references
         :in-reply-to:subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=t3FEA+oyST18v1zQTtRjBsrs8LKBIAI2sSiAsUdrn1Q=;
        b=vN6OdX+9RKoL6r2+a18Xh7nAqvzk4aClltyPSBmQPqj0m7KkkKDQSH8/YwXhQupvcX
         vUOVCmkaddX6S14K0vgWE3jkCoiWktASfa+L7Xjeu7Do2R9D75j+q2bC952nech3S1G9
         IxMmewZHDanamIHlAOttmTzz+vJdnvMDXlbZtvtsh+b8V2F2bW3IcsBYbuPaEzEx43u4
         KCR9BdBo6Vfxaij58wvMXJmEdsj4lRQ1r1W98iJk8lwClATY3fcP90Ypmpr51mwCv++g
         cQwQl0Eh46Bphr7nyncVWdDDoIsrphZ/fEyshyKIPE9gRpY6gjGoUbRaGSNFlXdmn+HG
         qWhA==
X-Forwarded-Encrypted: i=1; AKwUvBz8lFsYsVuY2B3/9DvPjVhyEQ0o9gaJrouJlhiYgJfWemAowpCdVhjj6GLFFzxD37FiiqWILzzdfqUG@vger.kernel.org
X-Gm-Message-State: AFuF++k5K9rVpt4/6c1vtwJhKIVkMXGrgn0C6i4jd47uPd+OTjtcV8va
	vJkcgpQ0Js3XuduIkvXGjdLRJYUql6f8dYzMa4QfY4tvvRh9ueS+Knfe9a2eE3Wl3VqY+FiwZdY
	cy4lPvVw=
X-Gm-Gg: AYBFou1x9WbtzIWM1t9tp8TlEPhoEIIJHLX/D86Jms5atbjjnet2gJ9gzYu6yT9Xc03
	p9Sa9UMrfI5ebLQjQ0G7tXRvjW4igFoVXi49KV2j5x7+dgaYMrJL3N8EZsxgKrsl5kVmonrapux
	+EbDFSB5wsZwrRMEznAWmxLQhYejlSemeTjGr3DyzaYB8+A3D66TfQSxsjfdZyvS8prmjw86b7I
	E+zq8PyLMjhkzTv1ZTmdDbA8hLElWCsFmmIMiqxeNfeMDUsg9OnSqsIswJWdY08H4BYrNEQ3VlH
	KDNZwPN2sLm3fvpxmawQEBdBmzV7LtwZyJMMkCWeyQqcp3xDTao9fizM2+X3w6RyNY8EISGAkjD
	0NKBxM6Jh2h2oMdBYZLh5YF45B7AT0gnn3c+MNfUkW5QIpRbmRAjKL724pGL2hbnPeIOEkwWPV0
	yhogOn0O/qYUvypBGZoBWJAllFczJwMA0D2y8yG+zBuSQwDs4AqJK1pvb+otOFGpDQKvdCfJyPe
	MRRQ+QYqMwjM78=
X-Received: by 2002:a05:600c:3492:b0:49e:7c4b:1753 with SMTP id 5b1f17b1804b1-49eb72fb6c2mr20631655e9.12.1789554665907;
        Wed, 16 Sep 2026 03:31:05 -0700 (PDT)
Received: from dev-ag ([102.33.165.38])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e83dbb0c1sm71813665e9.14.2026.09.16.03.31.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 03:31:05 -0700 (PDT)
From: Andrew Gaylard <ag@ffroot.co.za>
To: Julian Braha <julianbraha@gmail.com>
Cc: linux@armlinux.org.uk,  dvorkin@tibbo.com,  wellslutw@gmail.com,
  linusw@kernel.org,  arnd@arndb.de,  afd@ti.com,  aaro.koskinen@iki.fi,
  linux-arm-kernel@lists.infradead.org,  linux-kernel@vger.kernel.org,
  linux-gpio@vger.kernel.org
Subject: Re: [PATCH] pinctrl: fix PINCTRL_SPPCTL=m
In-Reply-To: <20260904121825.43320-1-julianbraha@gmail.com> (Julian Braha's
	message of "Fri, 4 Sep 2026 13:18:25 +0100")
References: <20260904121825.43320-1-julianbraha@gmail.com>
User-Agent: mu4e 1.12.14; emacs 30.2
Date: Wed, 16 Sep 2026 12:31:00 +0200
Message-ID: <sa6fqz9ij2z.fsf@dev-ag>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Julian Braha <julianbraha@gmail.com> writes:

> The PINCTRL_SPPCTL option is defined as a tristate in Kconfig, and the
> help text suggests that the user can build it as a module by setting to
> 'm'.
[...]
> Note that I have only compile-tested this change, since I do not have the
> hardware to runtime-test it. Please advise if it would be better to change
> PINCTRL_SPPCTL to 'bool' and remove the help text suggesting that it can
> be set to 'm'.

Hi Julian,

I've tested this on real hardware, and it fails to boot.  I don't think
it makes sense for this to be a module, since most of the devices in
this SoC are pin-mappable and need muxing to be configured before they
can be probed.

Let's rather fix this by making it a bool.  I'll send a patch shortly.

-- 
Andrew
