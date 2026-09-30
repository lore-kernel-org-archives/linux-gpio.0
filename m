Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 699883B3C01
	for <linux-gpio@vger.kernel.org>; Wed, 30 Sep 2026 22:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790807100; cv=none; b=oPRepeN1D+J8KMW0VDQE6ZDObgpyWGZeg5rZL/2MODwL2sDhD7zqtIVWpbjXCv8hg39p4kjBdYXHzfIm8Vcc5HCOvC5+ViXPy6wJgj3w5fIQ9wbve0klsgSPrD8Z103XW9K37QhfenBPguosXSiJ2iboJmKHP1hzUauFJ2kqG34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790807100; c=relaxed/simple;
	bh=YrwgfEUNUs8Bd8I/K2XTh2XjHkYWV+9BlHyKyuH5jXs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O2yDvBEfJp3Hcf2GvvTtgRCRFyfnDzwpCcqyjKq7WJuQFtxv4PvP0k8i1PZwQrCxrTAIAyH/IAqZyRWQDLyvqKznA5nOXATEzLAY+iLZPqcTJMAScjKgUHKrHf/u8YHLsA949LFtyeC0rshB9WoF17sxeWTcovd8RORUhApDkDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G7vy3IMd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G7vy3IMd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04CE31F0089D
	for <linux-gpio@vger.kernel.org>; Wed, 30 Sep 2026 22:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790807099;
	bh=YrwgfEUNUs8Bd8I/K2XTh2XjHkYWV+9BlHyKyuH5jXs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=G7vy3IMdCQf2io88txWqOeNfTfn8YDefIzI9YoWNcutsSV+5kk7WHSYUX1c2nxrYO
	 UyMeae62rNXhJfzyN53XYy61Ymk1gb0NDMUfZg+QqynpjbkZQ3JkY174eg3u2qoZBU
	 LeovifhL4wG4TajY0eRJLqHQU5tLVGg8PoNUSGI7pM8SYUFyjG56ODsWUIBQcvOLXl
	 qsB0Z70d0h8mPZiTDLYlCx5Jt9axXeoEBUlCCoz8ScBN9VEPyk+3hIDrtMDF1M8pWs
	 zgOKSmI1uNxKZ8hAfusRxxDgBq382B5prMvB70tfglUnfZMvFvMv06TcEmQHl7ZTDf
	 niNj7fRu4DN9A==
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5ba42939bfeso613860e87.0
        for <linux-gpio@vger.kernel.org>; Wed, 30 Sep 2026 15:24:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzCBMV4NwyICMdLKIiYDrObUMGy5UArb4637hZ0SOF64OWlkbe88zgPapYRVaxveCXiR7iazj+sMf1F@vger.kernel.org
X-Gm-Message-State: AFq9FYKsXIf/ugc+GwQBL3zdSzA9/aRh4Cqfv8xskD4im3BlSYeocEMN
	GFHkkm7acEv6AH2zYKDsLUAjNZBFEZNsXZIb35oW69sQ+Lz3K6IiAar+zhpCIIMCwMsV9cVYQ94
	c7zznhmzmsdJNx/87+Jw7Z55+efytZnM=
X-Received: by 2002:ac2:43c4:0:b0:5b8:cc2e:300d with SMTP id
 2adb3069b0e04-5ba4061d6f4mr871530e87.61.1790807097765; Wed, 30 Sep 2026
 15:24:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260830065118.51551-1-changhuang.liang@starfivetech.com>
 <20260830065118.51551-3-changhuang.liang@starfivetech.com>
 <417251d0-c2cc-4e10-940d-b75ab20acdec@kernel.org> <ZQ4PR01MB12022D97EFD74D5A80DBBE34F2A92@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
 <5f99fc90-02e0-40ab-8d1f-c2e7bcce7a5e@kernel.org> <ZQ4PR01MB1202FB18CF51DB252C393D0FF2A92@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
 <20260831-dramatic-phrasing-beb1b360cd58@spud> <ZQ4PR01MB12029CCB91CB5673761C6F95F2A82@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
 <20260903-precise-diamond-loris-ae2da7@quoll> <CAD++jL=U6=YcS325TQEJCM6FJNaam=DQwXfv_TZcGusqBte_cg@mail.gmail.com>
 <ZQ4PR01MB1202BF18C8CC554CB79EB91AF2862@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
In-Reply-To: <ZQ4PR01MB1202BF18C8CC554CB79EB91AF2862@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 1 Oct 2026 00:24:45 +0200
X-Gmail-Original-Message-ID: <CAD++jLmfGdx7AMv9VZ63qD5d+xE40SeNkKTubUcZ0rBzEJoyXA@mail.gmail.com>
X-Gm-Features: AclHuK9cuBAEQBmV8vudn5oR-pLGZ9J-ZwWIR_JVQs1tALNOOsiuEdt5peJfqF8
Message-ID: <CAD++jLmfGdx7AMv9VZ63qD5d+xE40SeNkKTubUcZ0rBzEJoyXA@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] soc: starfive: Add JHB100 UART Routing driver
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Changhuang,

On Sat, Sep 19, 2026 at 12:55=E2=80=AFPM Changhuang Liang
<changhuang.liang@starfivetech.com> wrote:
>
> Hi, Linus
>
> Thank you for your feedback.
>
> > On Thu, Sep 3, 2026 at 11:32=E2=80=AFAM Krzysztof Kozlowski <krzk@kerne=
l.org>
> > wrote:
> >
> > > Anyway, as you pointed out there is already one code like this -
> > > Aspeed
> > > - thus this is a second one and that makes it reasonable to make a
> > > proper common user-space API.
> >
> > Brrr my stance as pin control mainainer is that this was merged behind =
my
> > back and shouldn't have been done like that, and two wrongs does not XO=
R
> > and make one right.
> >
> > I think what we want here is a way to flag some specific pinctrl states=
 as
> > userspace accessible and develop an ABI for that.
>
> In this series, I have organized v2 and sorted out a common interface for=
 Aspeed and Starfive:
> https://lore.kernel.org/all/20260905102901.126035-1-changhuang.liang@star=
fivetech.com/
>
> This new series does not affect the previous usage. I am not yet sure how=
 to implement this
> functionality in pinctrl.

It's pretty clear how to implement this in pinctrl, just like I said:
a userspace ABI for pin control states.

No-one knows how that should look, it would need to be invented
from that point.

Probably something in sysfs.

But if another subsystem is going to deal with it, I will not complain.

Yours,
Linus Walleij
