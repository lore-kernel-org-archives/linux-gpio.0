Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 496A24A207C
	for <linux-gpio@vger.kernel.org>; Fri, 25 Sep 2026 13:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790344695; cv=none; b=M1HTsqLMN8aqur4ZCuATHDm/Hr+wiAcKP456PvFbmOIqacjH7cZudcs+RpNqO64oxwnM6jVMyYSJ7gB73fQ0BPIv8I6aSbPtR/Sbc1nWdtBROwRs+YQV02zX3VWs9sZn1bVf/m6ehtRt8QnfREpRZBsqOW19JRL9Lam6x372AZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790344695; c=relaxed/simple;
	bh=WY082453TlPCTma1mIlRghpUgP9KDDRJNTi/4bbvnRw=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sL5aLNlqKxiDOKikIgHnonDUASAe+vdedBzZtmp1AKXLgoxaMH3v5Z/JK1xisMVhj/yRoNLwc5EwPDq7D/1qkuzUTwP8nW0j/gO468fSdcwuQ8S+skWRcW9KC3kOxsYMXzHBdPHvCgqnUTD9bek/DhuhKD2Ok88SHxC+6nEx7AU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Rc/BQQho; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Rc/BQQho"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B6E91F0089E
	for <linux-gpio@vger.kernel.org>; Fri, 25 Sep 2026 13:58:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790344694;
	bh=vIgn7AIbQnjzx1RS/ZD1D4EmBW5CrnhAG1C3i73MfCU=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=Rc/BQQhogLa+oB1TVyglzSZN8xHAKM6S2Ewk9BlAJKIYGrdMOBP/tIIc9o4EZI9GL
	 ujXj6dRCJ+wrCSeT7eLs4z/QVLZgaAI68HRHGBCUcGIbXy//FqpDqYXHtvGAGBO5fy
	 XG2q4CZilb5ApaV/NfLb5F1UTZxQ/pwphoGaEvTjHC2X8MDGsUFGG35A6kfmqqHR4r
	 /mkqXon53aHNAeJ4a+CiQOHKxzQ4hGZodz2KgEOSMX2SPThTUYJU8imlv5FBCIgdA8
	 3SPqFBggdqdkMuUvT8lyyKq+q3N5FP/WANpvxb7Fpz9pVQCHlsWaFWzmgw6mTPSo3u
	 BuxNpo5tjy0LQ==
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b76ff64d78so909648e87.1
        for <linux-gpio@vger.kernel.org>; Fri, 25 Sep 2026 06:58:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwEFcPc7gCsnIPH068N3epJInPJe+sne7Al+5ukFcTs5xcA2QRAgvjOx055KuUoVMgl/8DVXk7paevV@vger.kernel.org
X-Gm-Message-State: AFuF++nnHsgwMQHuLw9AcvS9OokjVI63nVg6frMUCps6oJX62ifis4XD
	4YPUyANqnFk1JtCv3VK7ULFyG8sHgYYVC9IMH8HXQ1n4+1s6ujCRr3tjpFOp23SLhwqGLjnazwl
	FR+jiP1Lij/BH/z823pdqPeDhULPpK1ZMalgfF0YPFw==
X-Received: by 2002:a05:6512:686:b0:5b6:1a7c:59cf with SMTP id
 2adb3069b0e04-5b8df0c6fb4mr2178374e87.41.1790344692743; Fri, 25 Sep 2026
 06:58:12 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 25 Sep 2026 13:58:11 +0000
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 25 Sep 2026 13:58:11 +0000
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <arZOfm4_ePPn6QU0@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260924083512.461838-1-peng.fan@oss.nxp.com> <179032407610.10527.4008737984510756760.b4-ty@oss.qualcomm.com>
 <CAHp75VdBbr5TgEXrJ6XDQiPvsGfhyKQmVL+zUQ3mNS=GiWw1RQ@mail.gmail.com>
 <CAMRc=MfdAU0fvYa-XzGvdeMPsAG7z+QeMP7zywNaRW-emRJjRw@mail.gmail.com>
 <arZJDjT42V1X0I8m@ashevche-desk.local> <CAMRc=MdZ7n5061rwA6mo0_xTn++63HZ_JjwxTaC_qMWvTZT-fw@mail.gmail.com>
 <arZOfm4_ePPn6QU0@ashevche-desk.local>
Date: Fri, 25 Sep 2026 13:58:11 +0000
X-Gmail-Original-Message-ID: <CAMRc=Md2JRzwyEcZPVPPafBDs2-iRtPYBuMbOQ5QFrUboS4brQ@mail.gmail.com>
X-Gm-Features: AclHuK_ZZnAD416lgVWZnTdGopDl34L6Ss08Bn5BYHXYH5cAY4hK-eFBxSaGBso
Message-ID: <CAMRc=Md2JRzwyEcZPVPPafBDs2-iRtPYBuMbOQ5QFrUboS4brQ@mail.gmail.com>
Subject: Re: [PATCH] gpio: wcove: use regmap_assign_bits() for conditional set/clear
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, Andy Shevchenko <andy@kernel.org>, 
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, 
	Linus Walleij <linusw@kernel.org>, "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, linux-kernel@vger.kernel.org, 
	Peng Fan <peng.fan@nxp.com>, linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 25 Sep 2026 12:35:42 +0200, Andy Shevchenko
<andriy.shevchenko@intel.com> said:
> On Fri, Sep 25, 2026 at 10:23:52AM +0000, Bartosz Golaszewski wrote:
>> On Fri, 25 Sep 2026 12:12:30 +0200, Andy Shevchenko
>> <andriy.shevchenko@intel.com> said:
>> > On Fri, Sep 25, 2026 at 09:54:42AM +0000, Bartosz Golaszewski wrote:
>> >> On Fri, 25 Sep 2026 10:27:55 +0200, Andy Shevchenko
>> >> <andy.shevchenko@gmail.com> said:
>> >> > On Fri, Sep 25, 2026 at 11:14=E2=80=AFAM Bartosz Golaszewski
>> >> > <bartosz.golaszewski@oss.qualcomm.com> wrote:
>> >> >> On Thu, 24 Sep 2026 16:35:11 +0800, Peng Fan (OSS) wrote:
>> >> >> > Replace if/else block using regmap_set_bits()/regmap_clear_bits(=
) with
>> >> >> > the simpler regmap_assign_bits() call.
>> >> >>
>> >> >> Applied, thanks!
>> >> >>
>> >> >> [1/1] gpio: wcove: use regmap_assign_bits() for conditional set/cl=
ear
>> >> >>       https://git.kernel.org/brgl/c/428cb7603f95d0ee6fad06cbf56321=
b1bdeaaa85
>> >> >
>> >> > Are you going to handle all the Intel GPIO drivers that have a
>> >> > MAINTAINERS record?
>> >>
>> >> Sorry, backing it up. We really need to organize GPIO drivers by vend=
or...
>> >
>> > Do you want me to start intel subfolder?
>> >
>>
>> I already did[1]!
>>
>> Bart
>>
>> [1] https://lore.kernel.org/all/20260925-gpio-organize-by-vendor-v1-1-8f=
eefd60581b@oss.qualcomm.com/
>
> Sorry, but I have my own approach which I prefer over yours. I will share=
 patches soon.
>

Sure, I'm certain your approach is yourer than miner. :)

Bart
