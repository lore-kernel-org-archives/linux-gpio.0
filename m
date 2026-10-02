Received: from mail-pj2-f41.google.com (mail-pj2-f41.google.com [74.125.227.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56299205E29
	for <linux-gpio@vger.kernel.org>; Fri,  2 Oct 2026 04:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790913803; cv=none; b=DkOzlajAvgXoO+3WrAG44x1GEjnrx0S4nE8gZ2lMeyNHQwnmgZ3M5USzH7+IMhLiuQ9QfwrMxYV1dctAY5AsvgpKH1Bxux/jGBF2bqpKn506w9W317/tuJE8uKQ0pHGhobVDJ5kjsF7UkkMtq0hbbMrxVgXlgy1n2SZlEQvxz6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790913803; c=relaxed/simple;
	bh=g9rjyBFKyz8/fT6X0ihutSjref47BDZAXNIuWZ++R2Q=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=Htrfz+EYKoOiaa8nv9Zv+/WvzBoTiPCnRMM7qc3td/mJMJSOh82XSdirBZpXPBH7gfmF5ZUVHNbGlchk1hnxm9/V0YZoicCmLB5+k1lUAf3cs01CcZ0qA8fmbcE+nNOGMPQQSX8c0ErIdZtCF/g9hF/gOdkNcG9Z2KBWTJIOd0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X84moNtB; arc=none smtp.client-ip=74.125.227.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X84moNtB"
Received: by mail-pj2-f41.google.com with SMTP id d9443c01a7336-2e49fc73a7cso621435ad.3
        for <linux-gpio@vger.kernel.org>; Thu, 01 Oct 2026 21:03:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790913801; x=1791518601; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=l/y9SA8Xp9ypUT4pM/+vyMouDzNX0kvEm0OBvzyJrUg=;
        b=X84moNtBWtdv/+pZTIpu9mbM3989a/WMuQe/tqjMoZcvqUUbkufrDpGCFi3YSGsz/1
         Aa5F+rYXWwZLMhXDciKqAF2Adl0zavFNSwH7m6RQSqoOY9y8tF5z1uhGS12APneYS18H
         NcfQ+RDdaRf2i2vuYmjy0T+Z2HwO8oxUeFekQsoixdy9XPuWWq1j+9hgUzKPZlaqJT1o
         G7CNfCoJxVQ0/fPaHSqwlFYVw8Z1ES8g2umkgLLcmr2gKtkCRvVlgaGr+4CH1uBH3l/1
         8/yn+wjO9ML84QRY3di5B5HovKywyZMyogALj3ietAPA1apUN3Iiiik+ysImKlYeHNFz
         RomQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790913801; x=1791518601;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l/y9SA8Xp9ypUT4pM/+vyMouDzNX0kvEm0OBvzyJrUg=;
        b=cN0VchKIryv/WAeEadFYaei5FLvn+Qv3QvfNflcnKL4NfZUUGBsWad/Zx6QO/tz1Zw
         k39eNOoLmFM3losgOvjXRSBOQfvg9cMaL7oU3Yndv+rmIn79yUdqGEqmyPIKbH38+vHE
         aU/J3qIhVP9g3Jhq2ghO4B8kSoM/sZ0gjJyC/vgEJiLxtISBY+QOHhesvbBIQImXC0dQ
         GTPhxt5yZ9PSS0PFLOvEQPEE7gKSP4oG80/+MvQWD1rpfBJ2rZ6xTQLxEMhhJ6z4oE2t
         A/Yrh580fND9tEqA1KviEmeWOPBkCRE+YJ3JwVk4eKZAzYwYgxnazfY6lu6DYGP8zZmL
         x2PQ==
X-Forwarded-Encrypted: i=1; AKwUvBz95uUjgOjhkaWMzNrDF9j2uLuvYjE4BiBDzn07FXDDHkYpPU7+yfum4g0sgotS/Mv0dU1lVO1m+XXX@vger.kernel.org
X-Gm-Message-State: AFq9FYI/gDb026XTu3/kPIk0TwN7Gt411qdM4mkVuwKg5fq4T7PO3mHe
	sM4f1daJZQglFzh3ae+aPm/sy9K2n/bw8wGUmSPVwGuoN+d/AMaRH6ZekVukVw==
X-Gm-Gg: AYBFou1IzCf2zcxI+iYV6xdPm9kXBld0iuzcM2h3OXdpvaDTaMt1d/bBExOtD7mHR62
	MEvASXJZpInGFZ6dWGYHqm+yDirtNAeEkoDGVJQDlScdrm1X68d4B4JvbFGLMrmBPeDldZ2Os9x
	OzsrAP85TAuYQufIxLJk14sHavIygd0/642GGUsJ5qksdxQXoRur2/vty8c21bKekfYYpk2Ttpp
	QRtDO1Kel5/zrG4zfXUr2F1vdfBAzSDv5WieZGnej/DiKw1JZB04A5zKCsjtA1DKbiE13H8hjon
	xjoG0q8Ut2wcgnere/fXNoIk9uztMyD2eNKZgx49qZRG68df8VatAncDGTCB+7v6Z/4bG/Hsq09
	mCBLcqyqOaFWsXC8ICZPIRvtKLBS1eWuSkKioxqwHBd/qZdAx7pSYXCDzy/78KDKi5KILqk0zMS
	2xTvWBakAO35gtcGQ8xVI7/2w/0QKa3za92WiBTG2VxZtedPTWJGlyWUEt/iwjAKDl9c4rRTnTe
	jg0KrxH6saZ0h8MwePI
X-Received: by 2002:a17:90a:2c84:b0:3a6:e61f:74a5 with SMTP id 98e67ed59e1d1-3a6e61fd172mr606098a91.2.1790913801473;
        Thu, 01 Oct 2026 21:03:21 -0700 (PDT)
Received: from smtpclient.apple ([23.247.139.92])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4f4747100sm7013550a91.11.2026.10.01.21.03.19
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 01 Oct 2026 21:03:20 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81.1.8\))
Subject: Re: [PATCH RFC 3/4] gpio: loongson-64bit: Add shared interrupt
 support
From: Miao Wang <shankerwangmiao@gmail.com>
In-Reply-To: <CAD++jLn54ts=136H2SXtOfx2n7PukYCQJY9VyKm_h+uxR4=gDw@mail.gmail.com>
Date: Fri, 2 Oct 2026 12:03:06 +0800
Cc: Yinbo Zhu <zhuyinbo@loongson.cn>,
 Bartosz Golaszewski <brgl@kernel.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 linux-gpio@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <1E8C13A3-5203-4516-987C-867690208D09@gmail.com>
References: <20260926-loongsongpio-v1-0-71de7ebebb76@gmail.com>
 <20260926-loongsongpio-v1-3-71de7ebebb76@gmail.com>
 <CAD++jLmRWGXBo8UP6RKt+HHCTam0NxaN6F1DK4XAjoQpoNujjg@mail.gmail.com>
 <C6A08AB5-069E-4CC6-8CA0-DEF22F369208@gmail.com>
 <44D04759-C409-4C4C-9FD0-737A8CF9B79A@gmail.com>
 <CAD++jLn54ts=136H2SXtOfx2n7PukYCQJY9VyKm_h+uxR4=gDw@mail.gmail.com>
To: Linus Walleij <linusw@kernel.org>
X-Mailer: Apple Mail (2.3826.700.81.1.8)

Hi,

> 2026=E5=B9=B410=E6=9C=882=E6=97=A5 03:43=EF=BC=8CLinus Walleij =
<linusw@kernel.org> =E5=86=99=E9=81=93=EF=BC=9A
>=20
> On Thu, Oct 1, 2026 at 7:47=E2=80=AFPM Miao Wang =
<shankerwangmiao@gmail.com> wrote:
>=20
>>>>> +       unsigned int usedby : 31;
>>>>=20
>>>> Is this a bitmap? Then use a bitmap abstraction.
>>>=20
>>> When exclusive is 1, it is a pure number while when exclusive is 0,
>>> it is a bitmap.
>>=20
>> To correct my self, usedby is not a bitmap. When exclusive is 1, it =
stores the using pin
>> id, while when exclusive is zero, it is a counter which stores the =
number of using pins.
>=20
> But what is this mess with using 31 bits for the pin ID?
>=20
> How many bits does it *actually* need, using 31 bits looks
> like some way to try to help the compiler to optimize the struct
> which is pointless because the struct isn't even suffixed with
> __packed...

Ah, you are right about it. I intended to reduce the memory that
is needed to hold the struct. However I realized that by using
bit fields, the memory cannot be saved due to the alignment. Will
change in next version.

Cheers,

Miao Wang

