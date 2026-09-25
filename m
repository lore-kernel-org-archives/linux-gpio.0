Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5D8F48F004
	for <linux-gpio@vger.kernel.org>; Fri, 25 Sep 2026 10:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790331839; cv=none; b=I0rxqr9gbD9cJzbNeMFKK+azSJf1A6W5pDdeTnZb3yFY7pJTp2NKiNtC1JmNAu9zZfg/DbjW6M1V5Z1nby+bomraWT7o8G+f/q01yURBG1xSNDMJr/DJ//QC3h0W3Pux45F8b3lVmLsCkt6IsaU4RKH7qI361fO46Kyd4rAiqm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790331839; c=relaxed/simple;
	bh=mYL9jrgJntw1uTiYaPA8rqvX87CeWqWEkuqVf/MuJ2g=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lYltraquRkJxGaR1LmnUo23lClmUPYrVi0Tkshz/6UloMU0s8BHUNQTuhZE5a0GP9n+6cgAMTOmz9XNAyhEs9e8a+J0JUZV1dj8w0hj0Oy/SmXqONae4K0pQIaLsQKBAv/IpbzCRTZSgPq62nvGIRR8POALzrg6Qa/mkNpZM3Ec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=etoZZUM/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="etoZZUM/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A412D1F0089A
	for <linux-gpio@vger.kernel.org>; Fri, 25 Sep 2026 10:23:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790331834;
	bh=FrSot8x4QotVXyr/g8ObBtebHxyiGnkrZvpM0ljF0Ck=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=etoZZUM/NgHwmbaHw3aPr9aWHpvzxSV97euUHRnfIkrx3p3CLqPDXapEvOXa4AX6P
	 LSwNJP3X7AtDXWF9rR9Qfpm2zVy667449sNqvvjTf+1nJ+EKE0uCAwUQLRAVkvlSzG
	 z41Nb2e50Dx12AtQ6youHq63D9+T4owvjPFWdjS2d4HrVvCo7RiVseH89T3HgloyZN
	 PnxcnGw11lri29v6WvkBLn0itTrIEMW6sJWtHJZgbtO61aOKGN0YkFWW6+YlWm/e1u
	 rRztVFbmp31aCdBFrJWIrJGHY18QvhEdUev2O3r4QZOdo0IYMeGRgbx1DFZVBvieAl
	 5NkvTKsLdHusQ==
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b8e911e665so358063e87.3
        for <linux-gpio@vger.kernel.org>; Fri, 25 Sep 2026 03:23:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBw4WcyQ2FOGz0CTJq88tbDlGxTBsPTv5mw/o1trQE34u5uM5d9KnJnS8Sw0ilhbbDsVHE/PimIGBvWt@vger.kernel.org
X-Gm-Message-State: AFuF++nzFMATdBq7nUjR4QVH35Lo0wgwcSqh7bCEErDEKQPAP7uZvspd
	aDytrkODp+N1PhLbus5fAefUDwkpgvrNcNLycMr0S8fCN9DL2qYx+fqhMu29SzJJ/HJlaooGy5E
	mdrZaH+H6WbLGf/Tb4noBHrVnHjGpcyEZMHyOHPRoGQ==
X-Received: by 2002:a05:6512:318e:b0:5b6:1a7c:fd99 with SMTP id
 2adb3069b0e04-5b8df0e5636mr1998168e87.63.1790331833253; Fri, 25 Sep 2026
 03:23:53 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 25 Sep 2026 10:23:52 +0000
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 25 Sep 2026 10:23:52 +0000
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <arZJDjT42V1X0I8m@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260924083512.461838-1-peng.fan@oss.nxp.com> <179032407610.10527.4008737984510756760.b4-ty@oss.qualcomm.com>
 <CAHp75VdBbr5TgEXrJ6XDQiPvsGfhyKQmVL+zUQ3mNS=GiWw1RQ@mail.gmail.com>
 <CAMRc=MfdAU0fvYa-XzGvdeMPsAG7z+QeMP7zywNaRW-emRJjRw@mail.gmail.com> <arZJDjT42V1X0I8m@ashevche-desk.local>
Date: Fri, 25 Sep 2026 10:23:52 +0000
X-Gmail-Original-Message-ID: <CAMRc=MdZ7n5061rwA6mo0_xTn++63HZ_JjwxTaC_qMWvTZT-fw@mail.gmail.com>
X-Gm-Features: AclHuK8BLJv0Nmfuu1qClpQlZ68hH-_lPmNJq0HkRLGew1Aay6jSE9B3O9rM94M
Message-ID: <CAMRc=MdZ7n5061rwA6mo0_xTn++63HZ_JjwxTaC_qMWvTZT-fw@mail.gmail.com>
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

On Fri, 25 Sep 2026 12:12:30 +0200, Andy Shevchenko
<andriy.shevchenko@intel.com> said:
> On Fri, Sep 25, 2026 at 09:54:42AM +0000, Bartosz Golaszewski wrote:
>> On Fri, 25 Sep 2026 10:27:55 +0200, Andy Shevchenko
>> <andy.shevchenko@gmail.com> said:
>> > On Fri, Sep 25, 2026 at 11:14=E2=80=AFAM Bartosz Golaszewski
>> > <bartosz.golaszewski@oss.qualcomm.com> wrote:
>> >> On Thu, 24 Sep 2026 16:35:11 +0800, Peng Fan (OSS) wrote:
>> >> > Replace if/else block using regmap_set_bits()/regmap_clear_bits() w=
ith
>> >> > the simpler regmap_assign_bits() call.
>> >>
>> >> Applied, thanks!
>> >>
>> >> [1/1] gpio: wcove: use regmap_assign_bits() for conditional set/clear
>> >>       https://git.kernel.org/brgl/c/428cb7603f95d0ee6fad06cbf56321b1b=
deaaa85
>> >
>> > Are you going to handle all the Intel GPIO drivers that have a
>> > MAINTAINERS record?
>>
>> Sorry, backing it up. We really need to organize GPIO drivers by vendor.=
..
>
> Do you want me to start intel subfolder?
>

I already did[1]!

Bart

[1] https://lore.kernel.org/all/20260925-gpio-organize-by-vendor-v1-1-8feef=
d60581b@oss.qualcomm.com/
