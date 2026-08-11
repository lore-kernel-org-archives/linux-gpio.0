Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE34A446BE8
	for <linux-gpio@vger.kernel.org>; Tue, 11 Aug 2026 14:12:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786457553; cv=none; b=WGTPvkpBI17f+71mPFPUPOluPwUZd2PPrQkaDHzfWNrhbm2paMB9fQ0KIJenWxW/Ze44C55ZQBwsLBKpJhsr4w98pF5yofTPCkcn2EgD0foS1/Kn4Q9GkBsUZjrCmtIMqad0TMIN1eP/+0YRu2OJ+3b6CW3bXNHRKGOFU00B534=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786457553; c=relaxed/simple;
	bh=1k3JViH6fAUiAFXFgQcs5bAOpgubp2YCdUyHYnM2jew=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=it5wBI8oeAD9xqnFoYVHOExsHkQEFXn0Ax9Vv9+7GTtUOmlQ5Cqrsn7OAU5z6ygBaGJqzzoxTs9cyXv34tRH9B526RVCs5V43vuPtpSPLHvOV/Cz1ykYrGxfvTkevr1Vca8PFgt7e2AL21gkaMk+fL4n5I4bNQuyaYFzd03Iui0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cXrZ5Go/; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cXrZ5Go/"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cbedf082ba2so21435a12.1
        for <linux-gpio@vger.kernel.org>; Tue, 11 Aug 2026 07:12:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786457543; x=1787062343; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1k3JViH6fAUiAFXFgQcs5bAOpgubp2YCdUyHYnM2jew=;
        b=cXrZ5Go/+2j7ChnKzqGHCMcFWZHPJdWGkBUItnBs/pc5MyF6tgiyN0rqW7W4LwhFFG
         Mwwas7Y8xTbOBD5MHdKdHJ1J3C9pTYd7nvrdvoIHde1wQ4N6Q+j3DMgDmrTC8rXWbgzk
         QhAJsCWWoWZAGCJg+h+up3POL7xa2cOKwzTrhuXihxfUbGOtjdMLAPNoiU5mCYb2jPby
         eTh6PU/cvOWrXN2vi819Izv8dhsoWbnm+IKvIP7vxVnyqSAU/7hZJKK1lImW6+ZfBD9Y
         fbpWfHHSboDy/QgWHhLG3eKs+cGDLVfb2D91aXSu+KvEAjPt0dtZVA7mCS6spTSCGpb9
         dwZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786457543; x=1787062343;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1k3JViH6fAUiAFXFgQcs5bAOpgubp2YCdUyHYnM2jew=;
        b=qeCYg/AOoAbQ5SnboNFNBgk4PICYr4D982GmspVjVrYNACGyhW23kuw36AbPK/IAaM
         uXmfiHZifmPQinK1ZFB0nNlrOE8weuDkC1K8JWa4YDmAvEFoAGPG79vflmQTlnj3mMsN
         3Dqx5vOnnyiQ71pRtBC7ysEvWb3CUjfhdAI/2LoL2ophdQJok2ESKZ1pbTCIHMpRHLsi
         HIG8jI8XleKwQh88c8gCJDEC4HarIW126oJNrXtDOncPyYkJvk/dgSC64yn52ITVeQPA
         0KUtKsUf84PkcAgzguuwi7/7/4IOISHGdZEoBaJv3Jx2nKI6QU4/czg9l42ygziT8StE
         Lk1g==
X-Forwarded-Encrypted: i=1; AHgh+RowziyhmZanU6f6BWZpLpxP02J1j//8v60sw/lmsWynHMzdvG6+CWut2eFKk6MjiNh8BdZzQUtZsdNP@vger.kernel.org
X-Gm-Message-State: AOJu0YwCoI2wvujM9fdfL/PJryyAp9hEMjYU4CgL03aEvegG/yxBaCh6
	V4OpVkpIKNxEaYw6jtICGRXqIX+J8COyJYT8bHeuHfEkhl+u8tQDIIf3
X-Gm-Gg: AR+sD12+POlRaG1MeFee/6dJ3xxDI59RAVOvhu+3q5f6+pUipFyLkVk5D9qOQWPbWAo
	AkqZDusDDXmVdSugraAV8FURxkCB/+WCmNSAlTwpnvT5EnTpeIWfDgWIOZAlbClnPqyA7xz0MYh
	MLRpzuCswYnb5eesbIZb79B2OBuL5KISZinpIVzohKKyMpcgwJz9yllE33L0lPiFPwD++xXNI9F
	WcZw9bovOtCKL8mSpgUu4j+NONj5JALjAnKX2VffrUHfs/r1OzyYkCj9dZqgZ3/4OcrsuaoD3xq
	9dOJmgEtNhUdyrcu//7WdxjsAMiq8NQDuQpGHm5XrPMwBXMt2BIq66MXSuq37T7FNIUdMzVdQ3c
	KfCVWfKRIybS8NmMdLUJ43ZSUmDxOldJrNhHAQjBHRrWkQSfMlf4SDrTQPHAtecaPN3zN3xeNMG
	iauOf6YHwwPfeYfZI56kngH4PxRQTKes3DmGyEOHk4m16fIblIL0SW0S4GbRtRuHmET5gG5ouet
	QPf6yr3u2w=
X-Received: by 2002:a17:90b:2d81:b0:38e:6d4c:14df with SMTP id 98e67ed59e1d1-392ec6eeea4mr2830864a91.1.1786457543223;
        Tue, 11 Aug 2026 07:12:23 -0700 (PDT)
Received: from smtpclient.apple ([23.247.139.92])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-392d5195a4dsm4310683a91.4.2026.08.11.07.12.16
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 11 Aug 2026 07:12:21 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81.1.8\))
Subject: Re: [PATCH RFC v9 0/8] mfd: ls2kbmc: multiple fixes for this driver
From: Miao Wang <shankerwangmiao@gmail.com>
In-Reply-To: <CAMRc=Me=4vhCACibcXWhH1J6OmjxbEmhatPLuUuRE3pFLkT7xw@mail.gmail.com>
Date: Tue, 11 Aug 2026 22:12:04 +0800
Cc: Miao Wang via B4 Relay <devnull+shankerwangmiao.gmail.com@kernel.org>,
 Xi Ruoyao <xry111@xry111.site>,
 WANG Xuerui <kernel@xen0n.name>,
 Yinbo Zhu <zhuyinbo@loongson.cn>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 mfd@lists.linux.dev,
 linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org,
 openipmi-developer@lists.sourceforge.net,
 Corey Minyard <cminyard@mvista.com>,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 Binbin Zhou <zhoubinbin@loongson.cn>,
 Chong Qiao <qiaochong@loongson.cn>,
 Lee Jones <lee@kernel.org>,
 Huacai Chen <chenhuacai@kernel.org>,
 Corey Minyard <corey@minyard.net>,
 Linus Walleij <linusw@kernel.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <E22A87D6-F231-442F-83F5-FAE25D0955A2@gmail.com>
References: <20260811-ls2kbmc-mod-v9-0-4fa9a5584406@gmail.com>
 <CAMRc=Me=4vhCACibcXWhH1J6OmjxbEmhatPLuUuRE3pFLkT7xw@mail.gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>
X-Mailer: Apple Mail (2.3826.700.81.1.8)

Hi,

> 2026=E5=B9=B48=E6=9C=8811=E6=97=A5 21:47=EF=BC=8CBartosz Golaszewski =
<brgl@kernel.org> =E5=86=99=E9=81=93=EF=BC=9A
>=20
> On Tue, 11 Aug 2026 10:07:24 +0200, Miao Wang via B4 Relay
> <devnull+shankerwangmiao.gmail.com@kernel.org> said:
>> Previously, the driver has been introduced to support the Loongson 2K
>> BMC running on the Loongson Servers, which is essential to prevent
>> the system from hanging when the BMC is being reset and the default
>> efi-framebuffer is being used. However, there are some drawbacks in =
the
>> driver.
>>=20
>=20
> I will stop reviewing this series now. I had further comments that I =
wanted
> to post after reviewing patch 6/8 but got carried away. When I came =
back to it,
> there's another iteration already on the list. This is not the way to =
do kernel
> development. Please *don't* send new iterations hourly or daily. Once =
a week is
> preferable, twice a week in special cases is acceptable. Anything over =
that and
> I'm losing interest.

I apologize for interrupting your review. I thought you had done the =
review and
given the suggestions. The only change in v9 is adding the comments =
which you
had requested in the previous review.

Cheers,

Miao Wang=
