Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 963263E44ED
	for <linux-gpio@vger.kernel.org>; Thu, 13 Aug 2026 12:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786622977; cv=none; b=WkEHwjFN3kzHrjUNNsKJyG1/nsI2KReqXy4S8Y4X6JEt2cB/OXSKdm5ehLDvusK+4zqLaIlPi0HqDlYDmxCQU7AbumlJyNWJKriivq5iW7AAQn7OOTZmYMRj9hTF3LVDe7C9B38mH5s5EZhHJmiSSM90fWUZVIt1SxQXJc4/srA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786622977; c=relaxed/simple;
	bh=wH9ebgAVmcwWQL7wXm9tpkRZBXuosH4mzbUX4Wd+bS8=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VXid9zBYPNorIoRW1U4SCIn9cihjByjWumRm4lscYCqCPcKkO7cwoulbAt5mVPkgCWVjRUI4Wbujl39ctzcfDYjJly3EelpvFS/Y+AIo8xnYBltlnqUBq1rVymfgtgfQHV8UMuST5vga/CDr2VtlTHXu+3WqXohs4h1YoArXRVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VdI786+U; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VdI786+U"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A7091F0155B
	for <linux-gpio@vger.kernel.org>; Thu, 13 Aug 2026 12:09:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786622976;
	bh=IBQa4Er77V9YLJg5BavjFMQl1C1RDdo1RB+OP+7gpzY=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=VdI786+UKkG05ZIQcN1yAOmsC5sQdtxbgzzA77gh2NLoPumEmduT2TYR3pculiUZ5
	 wTY/iPn5tXuNey14qQAO0EHNdIlVmnKCAA3nfhAwAZ7G6sF2D25VYhoiHJ8sq86HRS
	 fJlHmskckM9wBraOFWosS32ti6iLiD7Lfoc7n8GpLknLVIM8ca4NW61grJD3FGf8C0
	 RXarNC7d2rxnTgAAYKOPyMQj9+vAYUEfdLKhkt1yo/g4c6W6ql6qfZocFY/kLqCD5h
	 RNhOmFpodl+I2PsuS+7REkymgzWrLZFF29nJ03xWSQUo4oPefvi8x8mT1vvWnyuJvC
	 OWr693MNYmXXg==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5aebd52488cso654590e87.2
        for <linux-gpio@vger.kernel.org>; Thu, 13 Aug 2026 05:09:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rr3V8ADE3k7/mdTB5kRg7G38NgGwB5NbMGCuhRN5AMRxDGTCOULDdINJAZ0SX+Ti+RDN86hb+TXz2SI@vger.kernel.org
X-Gm-Message-State: AOJu0YxI7fJz3Xxkxnwm5NJX/wWOc9wi2HvWEzHd6ZbrXycmCy/YbO8W
	DqNUxUzlwdh/IkS8uIcyExYxKfyZlimVREVv+P/SbPP94zaGXJtqxDCqBoVbYCFZaL/ozx/BieQ
	Zov2XaqHQ//U20zc3tGe4Rt+LJyEYqjmf2I6AjGDkeA==
X-Received: by 2002:a2e:bcc5:0:b0:39d:9eac:8ec with SMTP id
 38308e7fff4ca-3a11a8007c8mr6359941fa.25.1786622974743; Thu, 13 Aug 2026
 05:09:34 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 13 Aug 2026 12:09:33 +0000
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 13 Aug 2026 12:09:33 +0000
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260813085451.GX1072730@google.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260811-ls2kbmc-mod-v9-0-4fa9a5584406@gmail.com>
 <CAMRc=Me=4vhCACibcXWhH1J6OmjxbEmhatPLuUuRE3pFLkT7xw@mail.gmail.com>
 <E22A87D6-F231-442F-83F5-FAE25D0955A2@gmail.com> <20260813085451.GX1072730@google.com>
Date: Thu, 13 Aug 2026 12:09:33 +0000
X-Gmail-Original-Message-ID: <CAMRc=MfaRqNb1J_KWWM5KSq=8ACvVPm9TyDong0tmozXS79CTw@mail.gmail.com>
X-Gm-Features: AUfX_mzOwZmaoQuqwywWSQmIZRt22vedQdB8FcbSGjQU0Pvb6pC48AZuMoUTf0M
Message-ID: <CAMRc=MfaRqNb1J_KWWM5KSq=8ACvVPm9TyDong0tmozXS79CTw@mail.gmail.com>
Subject: Re: [PATCH RFC v9 0/8] mfd: ls2kbmc: multiple fixes for this driver
To: Lee Jones <lee@kernel.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>, 
	Miao Wang via B4 Relay <devnull+shankerwangmiao.gmail.com@kernel.org>, 
	Xi Ruoyao <xry111@xry111.site>, WANG Xuerui <kernel@xen0n.name>, Yinbo Zhu <zhuyinbo@loongson.cn>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, mfd@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, openipmi-developer@lists.sourceforge.net, 
	Corey Minyard <cminyard@mvista.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Binbin Zhou <zhoubinbin@loongson.cn>, 
	Chong Qiao <qiaochong@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Corey Minyard <corey@minyard.net>, Linus Walleij <linusw@kernel.org>, 
	Miao Wang <shankerwangmiao@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 13 Aug 2026 10:54:51 +0200, Lee Jones <lee@kernel.org> said:
> On Tue, 11 Aug 2026, Miao Wang wrote:
>
>> Hi,
>>
>> > 2026=E5=B9=B48=E6=9C=8811=E6=97=A5 21:47=EF=BC=8CBartosz Golaszewski <=
brgl@kernel.org> =E5=86=99=E9=81=93=EF=BC=9A
>> >
>> > On Tue, 11 Aug 2026 10:07:24 +0200, Miao Wang via B4 Relay
>> > <devnull+shankerwangmiao.gmail.com@kernel.org> said:
>> >> Previously, the driver has been introduced to support the Loongson 2K
>> >> BMC running on the Loongson Servers, which is essential to prevent
>> >> the system from hanging when the BMC is being reset and the default
>> >> efi-framebuffer is being used. However, there are some drawbacks in t=
he
>> >> driver.
>> >>
>> >
>> > I will stop reviewing this series now. I had further comments that I w=
anted
>> > to post after reviewing patch 6/8 but got carried away. When I came ba=
ck to it,
>> > there's another iteration already on the list. This is not the way to =
do kernel
>> > development. Please *don't* send new iterations hourly or daily. Once =
a week is
>> > preferable, twice a week in special cases is acceptable. Anything over=
 that and
>> > I'm losing interest.
>>
>> I apologize for interrupting your review. I thought you had done the rev=
iew and
>> given the suggestions. The only change in v9 is adding the comments whic=
h you
>> had requested in the previous review.
>
> What's the plan then, Bartosz?  Have you given up on this series even
> post-apology or will you finish your review after a short break?
>

I will get back to it in September, I'm going to be on vacation starting
tomorrow until the end of August. It's v7.4 material anyway at this point.

Bartosz
