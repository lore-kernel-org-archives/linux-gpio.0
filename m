Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792611813;
	b=mH4aXoqW+UUOXeqNiu4TyOeedrVHRr6oGcZLE9j71EyIczVH5Xk/iNyvVPhiJO/HWN2z
	 EugzXhkYJBBbS0KePmhYcVSCo1cO3UJyW36eRb9vFxuETRMWdssq+ljIFcIVbDV4Vf3mt
	 aOeg5ldaNQ63PbpO6eqp1Wh7GK4LxJuN7pICBe8yOSqGPO6xUh9sFziCd1tNa4q6yj5EN
	 olq4gMKMpSs/SiNgONtQiBFR389+9mGYxVVhYwJ26xGSVRM/ScJXjshKBI/f2E/h5JSYn
	 Z/md6pPO+awFvtjlMKgWj4SgELVxfOOvgn/2fAHEomP+bTlaFs4NWFCusAx2d3l7K+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792611813;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=+ywMzQ+to7W6P4+Q6vGmUU1pcAEfM/gAHMO22DZ3gX0=;
	b=3Bpd2IL/KDOTljqo8Lxt/ZxO7Uf+6P8/EC66ujCW1t9oi4ySBdj0h8g/pl5KGCZnXDyu
	 wSpraA9uWJRpccObwFU2AE8xPJ41cogSYIuuumn/moS7D2xnuB3uB80HE7NNNNwqxyFL4
	 UgSAIQ8OCDYriVF3PsqGx5TTPFG7R7nrsG6xwMe8IwGJc9WYBUR1Zuk//+Wp+DuAZNT1b
	 /yFcixz6kGlUo3HH85vVeScyWGHEviOr9V4wHG+lsR9WDUYf/9aD4VBHWuPAmOUvTMdwe
	 /frEpASpnvHAC05ZMzOOvnZxeJhyDDqgYUFGz2ZNALa7Z30FFRW73p8rsDPpVlxkL/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jXJLdWXU;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18C97606A31B
	for <linux-gpio@vger.kernel.org>; Wed, 21 Oct 2026 19:43:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 18C97606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jXJLdWXU
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-368581df789so240109eec.1
        for <linux-gpio@vger.kernel.org>; Wed, 21 Oct 2026 12:43:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792611812; x=1793216612; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+ywMzQ+to7W6P4+Q6vGmUU1pcAEfM/gAHMO22DZ3gX0=;
        b=jXJLdWXUbIO6BAVwWpahbYB6kuv2stskNJnEjTt/T7LPq4h4xpcSwcbuPX2lyLt/IO
         kOo1UyQ2lyrkEAqUJZzWecphJKuBAdwyzrTJN4t8wG1U5htXFP0t8cy9P+CUGP0k4kfm
         3IcrAb8ErsRv5lF+kV3Q17Lox7ICKGz9UogA7MUft91uDXXzTv/WlOOvuuKosgbVsq7A
         hhMyBGTPtsRtnvqFtS2n9VtahzCh+YEbzLvwhIQwn7C3IhopiegDVMR2RPlR4SHK+avU
         dEPeQ5khKJehe/UPizMk5ur7ob4ucM9d76X5OWCBTnBHAU/fih4scufI6y0fCpfOVUut
         TVDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792611812; x=1793216612;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+ywMzQ+to7W6P4+Q6vGmUU1pcAEfM/gAHMO22DZ3gX0=;
        b=PHu+6oPAYAyeAMLIhOC9RsubaUJWZkaX2UpprOV0Kaj3aRcVJ075uHGJ7RaJ/6cLgM
         rFPj1kFOtlVqRU+KImOUJrECttZMcVnH58r0YF96Q5GM1FPwN6e7PhA55XYc8sHIemsl
         MpAsFMtjOBSEc7mwSet4ryjitRMDwBOGVza3SqWdXnaz+8ifH8KgZ0dozGcMnvOVFk6v
         TrWRqvWh7Ul54/J78iSnDRXjKyIpm8nFRYtPkHV0ngb+68r7217t/1BM/KofZXC8La9W
         KGXn3Ni6ogi4b4ndvYHfK4ahcBWoDDewLnt5THqSkBN8E9ZL0wsXWZk0SZRSrtFE7iXh
         o/Jg==
X-Forwarded-Encrypted: i=1; AKwUvBzVCXAvCKZnGF5TBAWL7LWwWPd3s8hChLg/7BHD1ayIwpRkuoze9zxQ22Pi33ZYp/CdM4EDkSIminvH@vger.kernel.org
X-Gm-Message-State: AFq9FYKBDDsfBiX1pR/ohiJVMcOIKP+EJhJnhUnBzr4eyULChUgwtkHl
	a5CoQMqJYdddCB2Kx189MLdxIxffNSpb8obLUAfADHppkNr0Iwu6V+Ss
X-Gm-Gg: AYBFou1QHXUbCu4qn3YeU8aEdoQWsxjoh2Pa3tmnBYu+Vxi7YxG/Fd8K1Rpho67me3U
	QKOBMJG8gCXXSeQU5aWJhuehwQ4b2iOfFSHjmHCf52IV0yy+OubDpktwaVC9J5AScGd2qsHVRD9
	Hvn8jijd6ARYZu0Kf+geHVTfRbTn1CAoHB08u7O1v3Zx63NOQibEtmiWbD7A7J/w0G/mjpN9u6u
	URhY/atUEJioKfmIxlGZ4jCRZDDQmEvqVZZmSQAA639Wbt7aJWBZ8RDmD4SRrzLSXi2uALMhIVN
	2UJcwuj+FbOc5YTK7dK9S+akCZCjkdiPb6WSgMq7mJOIsV03tWEFRje4BHLBld6NldheKIE0CB3
	2Q8ntrzodC7p0bSR/IDQULicp2FtXLlXFMWISc+cA0VmvthDSNv8Q+yyHcMe0Q+BxkAMWFp3jjG
	uv8k7JH9A1JZEciMDl8+JMrNJ8pwaDWqRf4uJH0wSIADaKOXGT6R3OuH4/hVGS4T5syv0tZVPl8
	eksxo7AhrEB2+fz7VB5/u/6MiCB1X6DXCS4c3KGXdFCiUiTf9T3dPvHp6f5tNGs7lCqAfUHav1X
	5RBTMC4aCVPv7Juub06JFw==
X-Received: by 2002:a05:7300:559a:b0:360:aeee:9b8a with SMTP id 5a478bee46e88-368afd86aabmr373883eec.8.1792611811996;
        Wed, 21 Oct 2026 12:43:31 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:1761:399a:3c8c:31ba])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-367f52ce166sm6124428eec.29.2026.10.21.12.43.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 12:43:30 -0700 (PDT)
Date: Wed, 21 Oct 2026 12:43:28 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Andy Shevchenko <andy@kernel.org>, 
	Janusz Krzysztofik <jmkrzyszt@gmail.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] gpiolib: fix GPIO descriptor leak in
 gpiod_get_array()
Message-ID: <atkVrwhbP45oLiIE@google.com>
References: <20261021190212.2237804-1-dmitry.torokhov@gmail.com>
 <atkULU8_9xQ1c3eY@ashevche-desk.local>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <atkULU8_9xQ1c3eY@ashevche-desk.local>

On Wed, Oct 21, 2026 at 10:36:13PM +0300, Andy Shevchenko wrote:
> On Wed, Oct 21, 2026 at 12:02:06PM -0700, Dmitry Torokhov wrote:
> > In gpiod_get_array(), descs->ndescs is used as the loop induction
> > variable and is only incremented at the end of each iteration. When
> > krealloc() fails on the first iteration (when index is 0), descs->desc[0]
> > has already been acquired via gpiod_get_index(), but descs->ndescs is
> > still 0. Consequently, gpiod_put_array() frees descs without releasing
> > descs->desc[0], leaking the descriptor.
> > 
> > Fix this by using a dedicated loop induction variable and incrementing
> > descs->ndescs immediately upon storing the retrieved descriptor.
> > Additionally, since the fast-path array_info setup only executes for
> > the first element (index 0), simplify the bitmap_set() calls to start at
> > bit 0 for count bits instead of calculating offsets from the loop index.
> 
> Can you start doing cover letters, please? The problem is if I want to give a
> tag for the entire series I will need to iterate over all patches, while `b4`
> has facility to do it for me. Also with --base it would be easier to see which
> base you have used for the series.

Alright. It was supposed to be a small patch so I did it in my patch
queue, but then it grew to series if 5...

Thanks.

-- 
Dmitry
