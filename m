Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3600631F99B
	for <linux-gpio@vger.kernel.org>; Tue,  4 Aug 2026 19:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785870541; cv=none; b=WoSftdSb2JeBVICO4Wh3+sxq2CsSogfbZ6rm4Yj9JM9oxGwlerenDic90xOn5UH86J5ShoGB2ctuz99fAnO4NLUjnXbhke9BBtr9c1xmK5ShWbmVHGo73Y0aQiEY5bwlRNOxihZRx3r3Cu8fkQ2MCK6w91V5UuVFYpzavtPq5ME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785870541; c=relaxed/simple;
	bh=YMxWtMXZyeRd/HYUFDtZpZrSpZBDrtrLuc4SnVs5v3g=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=lOT+/ubRjJvNfRV6b7yZpsYMLi0uhjQ70JZjLm4QcmDBCj93Z8sVdahzLDtEwpts+2ETbETQK1AZ4Qn8YEleEWFNZR1U7N/A5+hy7N06vmA1hg8c+utbl4LbtBoWVT7VG6esnOoz6NseRUT8Q2rXevPDM7LYepEILeVWTnO6wig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HInfzEA6; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HInfzEA6"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-84a3e5ca66eso26083b3a.3
        for <linux-gpio@vger.kernel.org>; Tue, 04 Aug 2026 12:09:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785870540; x=1786475340; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=F0woQJfmg37Twfv47ChN4B/RazTPZya8Nv66SBatWA4=;
        b=HInfzEA6Sg6ctDKBr32m+Eihhy2d81Baojxy2D1UYSym7o7jnlXJA5LIWr3l1Tb/Ji
         muvB+XY6JxbW8y8is5ZL6AP9CGoiXNDWFxFrszgfszVcmX8UwyXgsghzz4UNgH+OYpxm
         IeVwg94ib+ov+lP1Qd0Nvsi8vQEP53zMRrfnGCjbxxgCAblq+aROUwgFeOGLKsToA+pH
         3Hg+BnRcB1Xh9oOr+Sy6P0CDmN+q/opXiaTL6lh1zZnqlHPNKb3BWDF9aZe428XjE7qu
         PTxRjOy7WRtCZwBw3I6AZXCLF/XUkf1VU8ObmILHOoQgFlLiL2xEhAQkpY/QI+PSv/v5
         lPqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785870540; x=1786475340;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F0woQJfmg37Twfv47ChN4B/RazTPZya8Nv66SBatWA4=;
        b=EJpMiqksVU8HUaWIlLy2FZmNC7roCvO/nZCCZ7MA9jASBO6edRRb7bZvYyxLJ5hGCa
         6uBc7LUPL6qOr4TBHTxci0F4L/GWxEdI/QXVC0x6tgvGSwZXeqdyBm6+cMcu1NeZX3W7
         CeX8xmj6UUrBE+yDStwoxXj8ZSxujzi5zWP60o/A61ul/8gynaiIYC0v8WuXTXhuuiv8
         MM1irLyDRtwWSlYhxcRpBq3OfEdP4g16xgLsI/rdqRM9eDKVHKmQQ5ykJ/Gs0jNLUdxs
         hM9sqeMfRPRS+pU0HPHrNtSYnM2KcjpuVCJbkO+5HXuV0pppA/8NqHW5GK2GuQqgEBXN
         VCpA==
X-Forwarded-Encrypted: i=1; AHgh+RpsA4C3eHMuavqq/UXxJZT0H3KyL/gNO91pH/1rmmfvecvC3h/Pvyv1NCO8EyGJ1tRylBA19u27CP2u@vger.kernel.org
X-Gm-Message-State: AOJu0Yzp1Q3Z7DwEMfCelSHzV1mv8lQYKgHuJLGwF/NXZ8rSoQ0gQwHT
	iQV3gyX/3rkqDsGXhim6gStIH/+T7iyJHt9THDJeqYoBjntyThn+Wzq/
X-Gm-Gg: AR+sD12pCz8nAogkr1WNW/m/wofB1xA8gMameuK5cUoUi0o1VJeDUI6rMzfX42kUQXD
	0br+MSE//ZwoIXALZyxZOIlO7YeqZevx7XqNCntd5swRLGSNM1U4PLE9K+U3Hrz8u1C3YXuZ1a3
	KZvVW+xoNPfA+mHUrdTinpxXHOh2WaRvXc26XV6/UNAbYcf218dNan5VAgxDU9zum16nJDNPFQp
	M1L0VNg1R+kFYPgDTOsVW40BmlLyHcKOvMY3Pfistbqt7miOlGEY8fbcp2cRD4T3quT/4N2Ip5t
	B7yat7oIj+MMN8BzKdOlxQC9e0/tfsxz0BeCV+l9ABRuB7VQFSJfofzTqfeEJ/CPpyHjK7MH+j2
	lsXX15blM0e6cTWOmb0n5+/O3jX6RMtsqFg9I95SjWRj53V+yZfFyVufDzvAyJcengAD7KtAXtw
	p7Kcjc8gCu/Pll/scPQ8UlGxFbl1xbj4nH+mzxvih2EdU8AHWvLE37AXlsAvQgbdWNKiZkbR0xm
	f8FRl1xlY0=
X-Received: by 2002:a05:6a20:914f:b0:38b:d93f:bbf5 with SMTP id adf61e73a8af0-3cb85bc6bf7mr1016979637.0.1785870539436;
        Tue, 04 Aug 2026 12:08:59 -0700 (PDT)
Received: from smtpclient.apple ([23.247.139.92])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbe708e64b6sm161155a12.24.2026.08.04.12.08.51
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 04 Aug 2026 12:08:58 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81.1.8\))
Subject: Re: [PATCH RFC v3 0/7] mfd: ls2kbmc: multiple fixes for this driver
From: Miao Wang <shankerwangmiao@gmail.com>
In-Reply-To: <CAAhV-H5VhwHyBtaf8uXDxiq-6-CyvC1PNsrjL3hwZ+uVuF33cg@mail.gmail.com>
Date: Wed, 5 Aug 2026 03:08:38 +0800
Cc: Binbin Zhou <zhoubinbin@loongson.cn>,
 Chong Qiao <qiaochong@loongson.cn>,
 Lee Jones <lee@kernel.org>,
 Corey Minyard <corey@minyard.net>,
 Linus Walleij <linusw@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>,
 Xi Ruoyao <xry111@xry111.site>,
 WANG Xuerui <kernel@xen0n.name>,
 Yinbo Zhu <zhuyinbo@loongson.cn>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 mfd@lists.linux.dev,
 linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org,
 openipmi-developer@lists.sourceforge.net
Content-Transfer-Encoding: quoted-printable
Message-Id: <B740826F-51D2-4BAA-960B-CE4D320E2E44@gmail.com>
References: <20260710-ls2kbmc-mod-v3-0-ef718636e78e@gmail.com>
 <CAAhV-H6kqN1+ZiTqyvXfPEtQJfvFhp_964AB9C00o0O6pigZmQ@mail.gmail.com>
 <8FCFD614-FEA4-475C-9E0C-50E075B49453@gmail.com>
 <CAAhV-H5wFZHN2jD-vGgNLuMqugGxwfyfq2TnK=HKyZXxZR7iRA@mail.gmail.com>
 <64E79496-E66E-45A0-B1D6-DB5466C35D46@gmail.com>
 <CAAhV-H6EN3K_QCd6pJ755PH7t5uUS0g-+BbRKjWr7oq7vX9ZTA@mail.gmail.com>
 <94FDE4B9-CE06-4596-9965-25A70E5A2E3F@gmail.com>
 <CAAhV-H5VhwHyBtaf8uXDxiq-6-CyvC1PNsrjL3hwZ+uVuF33cg@mail.gmail.com>
To: Huacai Chen <chenhuacai@kernel.org>,
 Binbin Zhou <zhoubinbin@loongson.cn>
X-Mailer: Apple Mail (2.3826.700.81.1.8)

Hi, Huacai

> 2026=E5=B9=B48=E6=9C=884=E6=97=A5 22:33=EF=BC=8CHuacai Chen =
<chenhuacai@kernel.org> =E5=86=99=E9=81=93=EF=BC=9A
>=20
> On Tue, Aug 4, 2026 at 12:09=E2=80=AFAM Miao Wang =
<shankerwangmiao@gmail.com> wrote:
>>=20
>> Hi,
>>=20
>>> 2026=E5=B9=B48=E6=9C=883=E6=97=A5 21:45=EF=BC=8CHuacai Chen =
<chenhuacai@kernel.org> =E5=86=99=E9=81=93=EF=BC=9A
>>>=20
>>> On Fri, Jul 31, 2026 at 4:24=E2=80=AFPM Miao Wang =
<shankerwangmiao@gmail.com> wrote:
>>>>=20
>>>> Hi,
>>>>=20
>>>>> 2026=E5=B9=B47=E6=9C=8831=E6=97=A5 16:07=EF=BC=8CHuacai Chen =
<chenhuacai@kernel.org> =E5=86=99=E9=81=93=EF=BC=9A
>>>>>=20
>>>>> On Fri, Jul 24, 2026 at 5:28=E2=80=AFPM Miao Wang =
<shankerwangmiao@gmail.com> wrote:
>>>>>>=20
>>>>>> Hi,
>>>>>>=20
>>>>>>> 2026=E5=B9=B47=E6=9C=8824=E6=97=A5 16:55=EF=BC=8CHuacai Chen =
<chenhuacai@kernel.org> =E5=86=99=E9=81=93=EF=BC=9A
>>>>>>>=20
>>>>>>> Hi, Miao,
>>>>>>>=20
>>>>>>> On Fri, Jul 10, 2026 at 1:24=E2=80=AFAM Miao Wang via B4 Relay
>>>>>>> <devnull+shankerwangmiao.gmail.com@kernel.org> wrote:
>>>>>>>>=20
>>>>>>>> Previously, the driver has been introduced to support the =
Loongson 2K
>>>>>>>> BMC running on the Loongson Servers, which is essential to =
prevent
>>>>>>>> the system from hanging when the BMC is being reset and the =
default
>>>>>>>> efi-framebuffer is being used. However, there are some =
drawbacks in the
>>>>>>>> driver.
>>>>>>>>=20
>>>>>>>> Firstly, the driver tries to read and write to the connected =
PCI-E host
>>>>>>>> controller registers, assuming that the BMC is connected to =
LS7A PCI-E
>>>>>>>> host controller. This assumption should be true for real =
products, but
>>>>>>>> to prevent from accidentally reading and writing to the wrong =
PCI-E host
>>>>>>>> controller, this driver should be modified to check this before
>>>>>>>> accessing the registers.
>>>>>>>>=20
>>>>>>>> Secondly, the driver uses non-exported functions to tell the vt
>>>>>>>> subsystem to redraw the screen, preventing the driver from =
being
>>>>>>>> compiling as a module. This can be fixed by using the exported
>>>>>>>> functions instead.
>>>>>>> You can replace the redraw function, but I don't think it is =
necessary
>>>>>>> to make the bmc driver modular.
>>>>>>>=20
>>>>>>> BMC core, IPMI and simpledrm display are usually (if not always)
>>>>>>> supposed to work as early as possible.
>>>>>>=20
>>>>>> I believe that it should be the user's decision to choose whether =
to
>>>>>> compile a module into the kernel or as a module and it would be =
better
>>>>>> if we can provide the possibilities for the user to choose from.
>>>>>> Additionally, I don't think these modules are supposed to work =
that
>>>>>> early. The mfd module provide two functions, the display and the =
ipmi
>>>>>> device. In the aspect of graphical display, without this module, =
the
>>>>>> user can still see the output during booting on their monitors, =
since
>>>>>> efifb is working, providing a basic display function. In the =
aspect of
>>>>>> the ipmi device, I don't think the lack of such device will =
influence
>>>>>> the boot of the system, since it is a common practice to compile =
ipmi
>>>>>> device drivers as modules on other architectures. As a result, =
neither
>>>>>> of the two functions are required to be loaded that early and it =
is
>>>>>> reasonable to at lease leave the choice to compile it as a module
>>>>>> to the user.
>>>>> Flexibility is not always useful, if a config doesn't provide good
>>>>> effect, then it just increases complexity and makes maintenance =
more
>>>>> difficult.
>>>>=20
>>>> I should emphasize that to allow this driver to be a module, there =
is
>>>> no such increase on maintenance. Moreover, not all loongarch =
machines
>>>> are requiring this driver. Especially only a part of the server =
models
>>>> are quipped with this BMC. Comparing with other architectures, the
>>>> driver for BMC are normally compiled as a module, such as mgag200 =
for
>>>> iLO from HPE and iDRAC from DELL, hibmc_drm for Kunpeng server from
>>>> Huawei. None of these BMC drivers requiring to be compiled into the
>>>> kernel. I cannot see there is any reason keeping the driver from =
being
>>>> allowed to be compiled as a module. I also do not think it will =
bring
>>>> any significant maintenance burden. Implementing correct cleanup =
code
>>>> should be necessary instead of burden.
>>> Can we split into two series, one fix bugs and the others make bmc =
modular?
>>>=20
>>> Otherwise I don't think we can reach a consensus in the near future.
>>=20
>> I accept different opinions on design trade-offs. However, I don't =
think
>> you have provided enough excuses to remain this driver as built-in,
>> since I believe normally in kernel, most non-core drivers are all =
able
>> to be compiled as a module. I also provided some examples from =
devices
>> with similar functions. As a result, I'll not split this series =
before
>> there is indeed a strong reason against allowing this driver to be
>> compiled as a module or we may have a great benefit if we force this
>> module to be compiled built-in.
> At least you should remove the first patch from this series. Binbin
> Zhou has been fixing it:
> =
https://lore.kernel.org/loongarch/20260616115530.4012675-1-zhoubinbin@loon=
gson.cn/
> =
https://lore.kernel.org/loongarch/20260624085550.1508771-1-zhoubinbin@loon=
gson.cn/
> =
https://lore.kernel.org/loongarch/20260706021909.2346535-1-zhoubinbin@loon=
gson.cn/


Sorry for not noticing Binbin's patch which had already been addressing =
the
same issue. However, I believe the fix in my series has covered more =
issues
than Binbin's patch and thus should be better in the following aspects:

1. Since the length of the resolution string is short enough, there is =
no
   need to allocate buffer from the heap. The buffer can be allocated=20
   directly on the stack. The most possible resolution string might be
   "video=3D4294967295x4294967295-4294967295@4294967295M\0", which is 51 =
bytes,
   and allocating 64 bytes on the stack would be enough.
2. My patch enhances the validation of the mode string. strsep(&ptr, =
sep) may
   set ptr to NULL if sep is not found, which will cause later strsep()
   invocations returning NULL, which is not expected by kstrtoxx() =
functions.
3. My patch further guards string manipulation functions by adding the =
ending
   '\0' to the end of the string buffer, to prevent strsep() from =
overrunning
   the end of the buffer.
4. My patch also addresses the type of the data. The fields in the =
struct
   simplefb_platform_data are unsigned and thus kstrtouint() should be =
used
   instead.
=20
If the BMC device is under the control of an attacker somehow and the =
attacker
is feeding malicious resolution string to the host kernel, then the =
second and
the third issue will cause memory issues in the host kernel, which might =
be
dangerous.

I wonder if Binbin is willing to address previous issues in that patch. =
If
Binbin is willing to do so, then I will be pleased to drop the first =
patch
from my series. If Binbin agrees, that patch can also be absorbed and =
replaced
by the first patch in my series.

Cheers,

Miao Wang


