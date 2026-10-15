Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6B3A303C8A
	for <linux-gpio@vger.kernel.org>; Thu, 15 Oct 2026 13:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792070683; cv=none; b=swjJ3aE9ljZ4gHnM5BLYfVvlPCiGQNfDNRywD3ZeevX+SHt14drmXc/EJrRGIBxIsghSZ/K+hWK6QcTAFdaZnTrExobN/3pV+y5XvIew9bkAOB+K+nzS9SMI5qnMb7I4kbSiFtla6qrEiICIRcgyPG4N/iItmZBn0S5Ymx9yVHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792070683; c=relaxed/simple;
	bh=G1RFmgWr2Ig2R+Xoi/w/XI0FsCNlVvPxJLZRujNFl4I=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XuaqXr/mjcsEzzOs1n4kZGGBoOtumXo25FyyDXLExd1d/Tr8mAXiRmrh6y8qO1E2vfqgzUbXHrjITjxT/7hRuibLHFI9vMxnAWjBFtRjf327i9DFPv5VndgtEQu/fl+OJ5lN9uwOuiejXrUaN0R2c1bojpwkFSBSpqbuIvKaRnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eF/Ul6bU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eF/Ul6bU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDE5A1F000C7
	for <linux-gpio@vger.kernel.org>; Thu, 15 Oct 2026 13:24:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792070682;
	bh=G1RFmgWr2Ig2R+Xoi/w/XI0FsCNlVvPxJLZRujNFl4I=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=eF/Ul6bUp/qITC9Ozh4J9A3ORiTDuUUhseLSPtmt6M9AET/RcoInRq4tuiLgd3DuA
	 C+LKNNCF+6o1QLIKZ1QpblveH8VnSSO6h/nuUI0YbYavBN9m+0DMkqJcCwW+/TI3xS
	 usjjdPBnt+SAoPTRkXtmz9+GqrWRDZmCSoV7ObfPtA/ziVaRh+g6y23JYWky6ocBxP
	 vjBgYYad4rthR8jONx/wq4RISiSpCu2jXivVlXb9JOU917p0qEw2hSvlGuvGmfoI0H
	 jqKkstrWjtzvFCIko11aqDSNsyS/smNI4dQonLy15MFuXCi1CrJxCiWBZswaFhqrUZ
	 POtu5AsR9p8oA==
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-3a98f260f85so15361921fa.0
        for <linux-gpio@vger.kernel.org>; Thu, 15 Oct 2026 06:24:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzYPj3TObSge0J7Kl4vtY4hZl4RJLX6UFXLq0Qkh1ba8EDSPUGBgeMTn6Q7K5JHwcED6GYAThlpJ6X9@vger.kernel.org
X-Gm-Message-State: AFq9FYJZhG+e9VwRfA3YqjD6j5j1qZ8IAWlHQ8X8mOxYbVpwbr53AVNn
	Aspm6frmSntmY6AUAIi5niOaMttTpYMnk49rFqdKZ1KI7X4VbPhzbaGZlCt8LUvKUlvbjCi8a4d
	gOg2zcsncizna54graqFhxkvKQlslAu581dhPcQlQ0w==
X-Received: by 2002:a2e:be91:0:b0:3a3:7682:49a1 with SMTP id
 38308e7fff4ca-3a9c53912a7mr46373821fa.22.1792070681510; Thu, 15 Oct 2026
 06:24:41 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 15 Oct 2026 09:24:40 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 15 Oct 2026 09:24:40 -0400
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <317E251E-9135-4376-B813-74B8A748FD72@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261002-loongsongpio-v2-0-6e3eb150a4ef@gmail.com>
 <CAMRc=McnDBO6OZx6p9HGHn=Yyt8ydD=8Z=zYZvYvuy-_DUq6tQ@mail.gmail.com>
 <7D6EB1C6-0CCB-44F1-B698-89B0479EEDA2@gmail.com> <CAMRc=MeW2nR8W3_4266N05p3Oa1WPNJhA92+T3miXQ0k5CsyJg@mail.gmail.com>
 <317E251E-9135-4376-B813-74B8A748FD72@gmail.com>
Date: Thu, 15 Oct 2026 09:24:40 -0400
X-Gmail-Original-Message-ID: <CAMRc=Mf0c8mqU46xqNVZRF+GSy=uZnHq_o90UsQXi+tUwgzEDw@mail.gmail.com>
X-Gm-Features: AclHuK9a3YohfadF6sHj5vpL87Sa01FkJ0gyvUVeaZqzi3KdNPm-mZiLYaf6jms
Message-ID: <CAMRc=Mf0c8mqU46xqNVZRF+GSy=uZnHq_o90UsQXi+tUwgzEDw@mail.gmail.com>
Subject: Re: [PATCH RFC v2 0/4] gpio: loongson-64bit: add interrupt support
 for more models
To: Miao Wang <shankerwangmiao@gmail.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Miao Wang via B4 Relay <devnull+shankerwangmiao.gmail.com@kernel.org>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Yinbo Zhu <zhuyinbo@loongson.cn>, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 14 Oct 2026 18:20:49 +0200, Miao Wang <shankerwangmiao@gmail.com> s=
aid:
> Hi,
>
>> 2026=E5=B9=B410=E6=9C=8814=E6=97=A5 23:33=EF=BC=8CBartosz Golaszewski <b=
rgl@kernel.org> =E5=86=99=E9=81=93=EF=BC=9A
>>
>> On Thu, 8 Oct 2026 12:21:43 +0200, Miao Wang <shankerwangmiao@gmail.com>=
 said:
>>> Hi,
>>>
>>>> 2026=E5=B9=B410=E6=9C=888=E6=97=A5 18:04=EF=BC=8CBartosz Golaszewski <=
brgl@kernel.org> =E5=86=99=E9=81=93=EF=BC=9A
>>>>
>>>> On Thu, 1 Oct 2026 20:13:18 +0200, Miao Wang via B4 Relay
>>>> <devnull+shankerwangmiao.gmail.com@kernel.org> said:
>>>>> This patch series aims to correctly add interrupt support for GPIO
>>>>> controllers found on more Loongson CPUs. The GPIO controllers in such
>>>>> models do not have a complete intgrated interrupt controller, but cho=
ose
>>>>> to delegate interrupt handling to their parent interrupt controller.
>>>>> This sounds like a heirarchical interrupt setup, but what makes it
>>>>> more complex is that multiple GPIO lines in these controllers may sha=
re
>>>>> one interrupt line on the parent interrupt controller. The details is
>>>>> described in the third patch.
>>>>>
>>>>> Signed-off-by: Miao Wang <shankerwangmiao@gmail.com>
>>>>> ---
>>>>
>>>> The series looks pretty good. Who is the RFC addressed at in this case=
? I can't
>>>> really answer the questions from patch 3/4 as I don't know this platfo=
rm nor am
>>>> I well versed in ACPI. Maybe Cc the GPIO ACPI maintainers for review?
>>>
>>> Thanks for your review. The RFC contains two questions, the first is ab=
out
>>> the firmware interface, including FDT and ACPI; the second is about the
>>> way handling the delegated IRQs.
>>>
>>> Regarding the firmware interface, it is to be decided how to declare
>>> platform irq numbers for the GPIO controller. Such a GPIO controller
>>> may have N gpio lines with M parent interrupt lines (M < N). The
>>> firmware should a) list M irq numbers corresponding to the M parent
>>> interrupt lines or b) list N irq numbers (which might be duplicated)
>>> orresponding to the N gpio lines. Previously b) was chosen by the
>>> kernel driver. However actual ACPI tables found in the published
>>> firmware chose a). The discussion about it happened in [1].
>>>
>>
>> Unless it impacts DT systems, I'll let Andy handle the ACPI part. Please=
 Cc him
>> next time as I pointed out under the RFC.
>
> Will add him on the Cc list in further revisions.
>
>>> Regarding to the interrupt handling delegation, since there is no
>>> complete interrupt controller integrated with the GPIO controller,
>>> the interrupt handling, including detecting edge triggered interrupts
>>> and masking/unmasking, should be delegated to the parent IRQ controller=
.
>>> I want to check if my implementation approach is acceptable and not
>>> violating any implicit rules on the interrupt subsystem side.
>>>
>>
>> I'd suggest to run your implementation by Thomas Gleixner because direct=
ly
>> accessing the internals of the parent's irq data looks fishy. For instan=
ce:
>> you call irq_set_type() directly without going through __setup_irq() ->
>> __irq_set_trigger() which does some additional bookkeeping.
>
> I would originally tend to avoid directly calling into ->irq_set_type() a=
nd
> other handlers like this. However, the IRQ subsystem does not seem to pro=
vide
> APIs to mask, unmask or set type of a given IRQ. Furthermore, __setup_irq=
()
> is for registering irq_handler for an irq, while in chained irq chip, how=
ever,
> irq_flow_handler is needed and should be registered via __irq_do_set_hand=
ler().
>

As I said: I'd involve Thomas in this discussion as it's his territory. I'm
afraid I lack the deep knowledge of the interrupt subsystem internals to be
able to help here and I'd also prefer to avoid adding any new abusers of th=
e
IRQ API to the kernel.

Bart
