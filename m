Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A4BC40DFDC
	for <linux-gpio@vger.kernel.org>; Tue, 30 Jun 2026 12:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782823382; cv=none; b=aPI6afmT8UHPIkrEbrx023N1Gf+WNfbTCBOzj7hDnKm4ZWzHKfq8TKl9N9CSh2FDjVPVWAnWPYVV/XdyuP4g46iPsFspio54AzgB7/hcRbKR5KU+SA3q63BPwd4p3aHXFs1DnXys8kUrVfSJie6Oq9cysGVt3gyicoesZdhMxZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782823382; c=relaxed/simple;
	bh=ZXgrx+i/lzRmzelbZNdMdT4PblJHk/UsxA0EFnVoETM=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=YT9gSimPzibs5V1pxsz7fz6yqKVf1gZBaDcdAaUhURkUadSTR/8zDAut9OlX0sk2suaRZMM0jfMWt7rQ0dnam0zS7AvanXECUmE45dEXDaoGB63t2UxDmKNs/dB/CxEsd791E4iJqvFC/1SdaJJRshV3fFzXRoR3A9nHMnMjwgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jXHqKVIe; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jXHqKVIe"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2c0b7ca8831so5559025ad.1
        for <linux-gpio@vger.kernel.org>; Tue, 30 Jun 2026 05:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782823380; x=1783428180; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=wQQt8/liiD7j9rkNB8OmPdlXy1iI1AH7RYaIrvmmAGM=;
        b=jXHqKVIeAn0mml3ruum1w+oYoEvn3O3W/enBKCShYsJU9U7O4Lz8OGqJD4MsOHCl9L
         cZIDUGIwP7PL/zgR9G94DLmcSv8FiMklJmvHR51167ZiX3UWlkI0UqFnHFH/z5ksZxh2
         YU3Z+9E7TUbvWRKigjg8VyZQa0yfSsmoe6jQ0k0U5TfpyvnE8qFY4+j4GiaKLZ607iIO
         f82J01Qtc5gMEJaY6H1NU6w3CprP+Im4tZXnE3O+pe2K1NhVdaOtgWhdgxzOzRIqq/6Z
         9rS/eVGiezQp1N96XxLHxMy2Ku8IUwzTqB6nYZmin2cf27e/n8+kru4mGi+leGKOzkyt
         vrbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782823380; x=1783428180;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wQQt8/liiD7j9rkNB8OmPdlXy1iI1AH7RYaIrvmmAGM=;
        b=DlAhHMgR8VhEHpUkKWEvKmLuMSXYpmrRzrFx2N9CpfeEhHRMVutl+kC0plwTe8gi1G
         Qke/qZCRrvZDcumr3xsV6rksPQOxhn8bwk5/c3U7ZpgctoAHPuucgPuYEIKqSZngqLB6
         Baz2bNaomElAtotjq3NpJ0YaO5GLJL2BBXjdvShwLm2RiIV2/f9ZDMaw6WT8KSmwJWjF
         yt5MhbssA52bQRmJ6SXOCRN6hVy9UkVhD3eX8HeeUzglaaPD2UiDgQYnhT2yhNRvbsbp
         /01nWcEn0VOZXfBrN90/fO5tIQ5AxByaLLtHDxgiyaoN5NUR+FwsTCjSCo+l34h1UOsI
         HMCA==
X-Forwarded-Encrypted: i=1; AFNElJ+6q9OYSvLN7ivwRs2CiVYrAfDZucNpQx8CFB0yaT2GDzev6GZ5G559c+FLoLZ/e7+c/1T6pOe2Zhc1@vger.kernel.org
X-Gm-Message-State: AOJu0YzMZrU221iertjwPDTIq+ZtaPHqkRRWNNmTgEv3ggvnL413y06i
	n9TveTNktB/bhoULeQWy21ldms6TfGiRlgTvxc+q61HcKiVHVVIhCFEt
X-Gm-Gg: AfdE7clRJC+I6cUH4o1LXijDubvSBWepW39rlh3tPj/VDmm1Cpns9AM3zPE/TuEkCph
	DC2LrdrP+VEHGgTDZBUx/ZClpE/IHrkqgzZRD5q0OX3Do125eCy1qbov6597ML4uM9swynG9XQD
	P3Vv5JUsQ+W5So2lCM9fvLSZj488RDEN2/CvXFlj/yyMd2xbwEVKK48O7LTArfP8TTzIJ75cfYW
	h0c0gEQFi/Pf86YFC5yRedAz+lSumcZVLecBGXqjQj12XGHADjoVcoIM65cqI/PlTe6ZTmodUPl
	w8xuOFGT+NbF/eFsYRJwvMxKg5KNsfvV3+y46P6COi033dgf+aeQ8ERbF+2IeweSH5dYvppHbIn
	145srD+K2hsa9VA+JxaAaU0siN1/bjjaSnxUpfG6cS1QBKcmnYp1Q/3MickHfufSTDTREM6BuTU
	fdvHgf/YT0EjGgqBCNl7GpzNtA06FoyZeSZeNxnFxoTA==
X-Received: by 2002:a05:6a20:939a:b0:3bf:7d96:2db2 with SMTP id adf61e73a8af0-3bfc52d4607mr1841452637.6.1782823380390;
        Tue, 30 Jun 2026 05:43:00 -0700 (PDT)
Received: from smtpclient.apple ([23.247.139.92])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c9bbc6da7a1sm1528434a12.2.2026.06.30.05.42.55
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 30 Jun 2026 05:42:59 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81.1.8\))
Subject: Re: [PATCH RFC] gpio: loongson-64bit: Add back the support for
 gsi_idx_map
From: Miao Wang <shankerwangmiao@gmail.com>
In-Reply-To: <akOxdBR_-rOweHXB@ashevche-desk.local>
Date: Tue, 30 Jun 2026 20:42:43 +0800
Cc: Bartosz Golaszewski <brgl@kernel.org>,
 Miao Wang via B4 Relay <devnull+shankerwangmiao.gmail.com@kernel.org>,
 Huacai Chen <chenhuacai@kernel.org>,
 Jianmin Lv <lvjianmin@loongson.cn>,
 WANG Xuerui <kernel@xen0n.name>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 linux-gpio@vger.kernel.org,
 Yinbo Zhu <zhuyinbo@loongson.cn>,
 Linus Walleij <linusw@kernel.org>,
 Hongchen Zhang <zhanghongchen@loongson.cn>,
 Liu Peibao <liupeibao@loongson.cn>,
 Juxin Gao <gaojuxin@loongson.cn>,
 Mika Westerberg <westeri@kernel.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <B77A4E49-774C-4DB2-9CA6-FFBE14F1EF94@gmail.com>
References: <20260630-loongson-gpio-v1-1-576908831fa0@gmail.com>
 <CAMRc=MdtRj6c3Bg72QMaAEMPovNyUdqWL_qDPGb1p=Cu=cETvA@mail.gmail.com>
 <akOxdBR_-rOweHXB@ashevche-desk.local>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
X-Mailer: Apple Mail (2.3826.700.81.1.8)



> 2026=E5=B9=B46=E6=9C=8830=E6=97=A5 20:07=EF=BC=8CAndy Shevchenko =
<andriy.shevchenko@linux.intel.com> =E5=86=99=E9=81=93=EF=BC=9A
>=20
> On Tue, Jun 30, 2026 at 07:45:52AM +0000, Bartosz Golaszewski wrote:
>> On Mon, 29 Jun 2026 23:05:28 +0200, Miao Wang via B4 Relay
>> <devnull+shankerwangmiao.gmail.com@kernel.org> said:
>=20
>>> This patch adds back the support for gsi_idx_map, which is used in =
the
>>> ACPI DSDT table to describe the mapping between the GPIO line number =
to
>>> the index of the interrupt number in the declared interrupt =
resources.
>>>=20
>>> This property was removed in Loongson CPU Universal Specification =
for
>>> Interface Between PC/Server System Firmware and Kernel v4.1 in =
November,
>>> 2023, but still in use in firmwares released this year. A sample of
>>> an affected DSDT entry from a 3C6000 board I'm currently using is:
>=20
> Oh my gosh, can somebody actually try to consult first with the Linux =
kernel
> developers before adding non-standard and wrongly named properties, =
please?

Inferred from the time when gsi_idx_map was removed from the spec, I =
believe
that the removal might be because the maintainers suggestion against =
introducing
gsi_idx_map. However, the firmwares "in the wild" have not followed the =
change.

>>> Device (GPO1) {
>>>  Name (_HID, "LOON000F")
>>>  Name (_CRS, ResourceTemplate () {
>>>    QWordMemory ( // Omitted, not related
>>>    )
>>>    Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive, ,, ) {
>>>      0x00000010, 0x00000011, 0x00000012, 0x00000013,
>>>      0x00000014, 0x00000015, 0x00000016, 0x00000017,
>>>    }
>>>  Name (_DSD, Package (0x02) {
>>>    ToUUID ("daffd814-6eba-4d8c-8a91-bc9bbf4aa301")
>>>    Package (0x03) {
>>>      Package (0x02) { "gpio_base", 0x50 } // Ignored by the driver
>=20
> Yes, it's non-standard property. It's a broken one in terms of the =
style.
> See DT binding documentation.

To clarify, I agree that this property should be redundant and ignored =
by
the driver and global gpio numbers should be assigned dynamically by the
kernel.

>>>      Package (0x02) { "ngpios", 0x20 }
>>>      Package (0x02) { "gsi_idx_map", Package (0x20) {
>>>        0, 1, 2, 3, 4, 5, 6, 7,
>>>        0, 1, 2, 3, 4, 5, 6, 7,
>>>        0, 1, 2, 3, 4, 5, 6, 7,
>>>        0, 1, 2, 3, 4, 5, 6, 7,
>>>      }}
>>>    }
>>>  }
>>> }
>>>=20
>>> As can be seen in the DSDT entry, the mapping is essential for =
obtaining
>>> the IRQ number from a GPIO line number. Otherwise, when IRQ is =
requested
>>> for the line numbers largers than 7, it will fail with -ENXIO.
>=20
> This doesn't look good. Why can't we simply hardcode the proper =
behaviour based
> on the _HID? The gsi_idx_map seems quite regular and periodic, do you =
have some
> other examples with different mapping?

According to the manual, the gpio controllers in HID LOON0007 and =
LOON000F are
actually embedded into the CPU chip and the interrupt lines are hard =
wired so
that all the gpio lines of the gpio controller share in total 8 irqs =
such that
the i-th line is wired to the (i%8)-th irq. So the mapping for these two =
models
are fixed. I have no idea about the behavior of other kinds of =
controllers, which
should be answered by Loongson personales.

So far, there are known to be 2 styles of DSDT entries. One is defined =
by
the latest Firmware Spec, to list all the irq numbers in _CRS, e.g. Name =
(_CRS,
ResourceTemplate () { Interrupt () { 0x10, 0x11, .., 0x17, 0x10, 0x11, =
..., 0x17,
... (in total ngpios entries) } }). The other is defined by the previous =
Firmware
spec, to use the property `gsi_idx_map` to map the gpio line number to =
the irq
number listed in the ResourceTemplate. The former should now be =
compatible with
the current implementation of the driver in the kernel, while the later =
not. I
believe that although being abandoned by the spec, the later should also =
be
considered and supported by the driver, since it is used by the =
firmwares in the
wild.

Looking forward to your advice on this.

>>> The code in this patch is mostly picked from the version 5 of =
Yinbo's
>>> original patch.
>=20
>> Cc'ing ACPI GPIO maintainers.
>=20
> Thanks, Bart!
>=20
> --=20
> With Best Regards,
> Andy Shevchenko

Cheers,

Miao Wang

