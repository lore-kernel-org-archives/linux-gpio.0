Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D44393CF69E
	for <linux-gpio@vger.kernel.org>; Fri, 31 Jul 2026 08:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785486296; cv=none; b=jRx24+Sj1bpgC2NCesw2agD2ZaFg/m5Xv0dUZym/XK67GhVkS5jA7KYxZztVu97gx2TX6VzzI1e70z1oB2KHUwxIcp1gkkOsdtAxvUDZmWaJHgv5hD4EKvB2rZD/7she3va0PWMDjIFgHdWSJRvynYI5g+Hq1kMc/Oa4pvXtlGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785486296; c=relaxed/simple;
	bh=0cRWJ4eKnZR83IAvPi9vpmww2wPNWwtloX3nTeIN+Fg=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=Ic5QBJ9J7J+EL6qEzYnXztp+K32ufEgzDrccsc9/gbZ6CHdB3QGoeZf/9ZaHI+ZQrVm6tblf86GYcBi99ypx2g1UEBR/fPhC/ge3h8XbPJOA7V2N5MqBQxillZK/2ks09ySBQYxKcejQ1/UxiLYiSIobNHYR3kujaAfoWR2uvRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iZnbNNIP; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iZnbNNIP"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-ca6d9c91206so55853a12.2
        for <linux-gpio@vger.kernel.org>; Fri, 31 Jul 2026 01:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785486292; x=1786091092; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0cRWJ4eKnZR83IAvPi9vpmww2wPNWwtloX3nTeIN+Fg=;
        b=iZnbNNIPE+Oagdy/ieL//yOt0JlncSHiBhfY2vx/rW8RbzC2rVJ1lZuHRpg4JxUR57
         4iCkypJ/TWPSGj/KoNFNG5p2XZnjfgFkRHu3rkmEsxDWY323QRI+TVdMLSArByWkzaB4
         nsI3t4+zLdBp6AlTBUiuReX1rBJEcyV4kfJZFnODAmlvPz8GPiM6ygR0i74k+O1AzLO9
         X+5Sd+LZMA3TGrK9Ev/7z1mi0gF8kypXjb7LbEEx+2Pz+MR16HYB2+1uzrE4o7+VVMuK
         1etuz7ujmimwamCpZKQJ8+uKb6wEGUmDK8rOoUubII1jp9oRfP6SInjTfpUHdhBn2iLv
         IWHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785486292; x=1786091092;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0cRWJ4eKnZR83IAvPi9vpmww2wPNWwtloX3nTeIN+Fg=;
        b=Cu+neUepS9mhKH8MFoRPXhrMeZKCQ8vwFBWAc7vohfsxte977GUW5bpp2Zl95JnG1g
         ajI/ilgHkzRVlYUNi3Wt8K9J3eWbmXLPDQp9yj9mhDCzynMb4hR3xq4ooGe15H7VrSUL
         m7ZQZ/9/CeeWg82lWIy6w7Uz243bKos97zEIbpvdkAFF5gt3qHaQXaQTLCxPiiUcEB9m
         4NW0a+A77CsykgupDhtwvJ5aDRcZfGKlGZbFE/JC1oDzeB37O/yoPMANi7qSy2q6LT+j
         0/hYiM1zrZo+/8LiLhHYpkn2cdVzlbCb0I37SRZUfYNx7icg21zybbd/HCd/mf2onJvL
         u5zA==
X-Forwarded-Encrypted: i=1; AHgh+RomhDmg5tMrdj4pbLx1eEujWYwp9qFmpBW1paCipHPQYob8gUvwiuMsFGF/HkS4Wsb0cYYTgGJGE4Hb@vger.kernel.org
X-Gm-Message-State: AOJu0YzHfmJIl5Mr5YevyMwH8AStzMmvbdK46VBqry1AU56v8jNYpfLU
	TZ/4B4rDzIRPPXIeGPQiRdTwe7LbEhJCOU90O/oKEoQXl1Lf6jOG5Fp7KXpmzdct
X-Gm-Gg: AR+sD107wDyV9SCmK1f7lRLPf53oT/b0YnJ1NzgWUI41e754nHWGCSS16FqSA+6Q3TF
	NwVLdEgSCuBkuQzjt0f9foNGxP3y9SG4CcD6o6pxS4qyHlRvm4MeLFNkco0aAASLZ8sXcby3HMO
	f/wHjXHx5u/cwa+kChcBvUFme8A5dgMJwMLWY5BclCiBljCBTpLj0ZF3E+CRth/lB7D15wRNj7u
	V9hrR/jQLgrlZzuV7P79rqlqlSWKXE3xX4cPCer7Jjow00arXOs1UCBV5PMFRZulUzdE0ANvHTl
	obKIkJtWRpYSDqE2jHTQ+1+xx/u9uwghalA5lHcFGukoYn9awv7wFpo/jerWZlMcI+32jSwVVz+
	T2Rt6iG28q+vx+kGiEhq2+WhQj5aitpVv4F730h9PniYzZYj81GLGIh3VHLSUlbkG2RdBhixM16
	QT3DKt1Ua8OPJchG+J16HtqrmKp2t7Ch37gEKxhq6Q3WeeLOCPRDupsg/c9bWjbhE4uG9D8Tr4s
	ju8b3//AhF7fw==
X-Received: by 2002:a05:6a20:12c8:b0:3bf:99ea:aeb2 with SMTP id adf61e73a8af0-3c91b63a5fdmr1209603637.4.1785486291673;
        Fri, 31 Jul 2026 01:24:51 -0700 (PDT)
Received: from smtpclient.apple ([23.247.139.92])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbe3963ddc3sm276125a12.7.2026.07.31.01.24.46
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 31 Jul 2026 01:24:50 -0700 (PDT)
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
In-Reply-To: <CAAhV-H5wFZHN2jD-vGgNLuMqugGxwfyfq2TnK=HKyZXxZR7iRA@mail.gmail.com>
Date: Fri, 31 Jul 2026 16:24:33 +0800
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
Message-Id: <64E79496-E66E-45A0-B1D6-DB5466C35D46@gmail.com>
References: <20260710-ls2kbmc-mod-v3-0-ef718636e78e@gmail.com>
 <CAAhV-H6kqN1+ZiTqyvXfPEtQJfvFhp_964AB9C00o0O6pigZmQ@mail.gmail.com>
 <8FCFD614-FEA4-475C-9E0C-50E075B49453@gmail.com>
 <CAAhV-H5wFZHN2jD-vGgNLuMqugGxwfyfq2TnK=HKyZXxZR7iRA@mail.gmail.com>
To: Huacai Chen <chenhuacai@kernel.org>
X-Mailer: Apple Mail (2.3826.700.81.1.8)

Hi,

> 2026=E5=B9=B47=E6=9C=8831=E6=97=A5 16:07=EF=BC=8CHuacai Chen =
<chenhuacai@kernel.org> =E5=86=99=E9=81=93=EF=BC=9A
>=20
> On Fri, Jul 24, 2026 at 5:28=E2=80=AFPM Miao Wang =
<shankerwangmiao@gmail.com> wrote:
>>=20
>> Hi,
>>=20
>>> 2026=E5=B9=B47=E6=9C=8824=E6=97=A5 16:55=EF=BC=8CHuacai Chen =
<chenhuacai@kernel.org> =E5=86=99=E9=81=93=EF=BC=9A
>>>=20
>>> Hi, Miao,
>>>=20
>>> On Fri, Jul 10, 2026 at 1:24=E2=80=AFAM Miao Wang via B4 Relay
>>> <devnull+shankerwangmiao.gmail.com@kernel.org> wrote:
>>>>=20
>>>> Previously, the driver has been introduced to support the Loongson =
2K
>>>> BMC running on the Loongson Servers, which is essential to prevent
>>>> the system from hanging when the BMC is being reset and the default
>>>> efi-framebuffer is being used. However, there are some drawbacks in =
the
>>>> driver.
>>>>=20
>>>> Firstly, the driver tries to read and write to the connected PCI-E =
host
>>>> controller registers, assuming that the BMC is connected to LS7A =
PCI-E
>>>> host controller. This assumption should be true for real products, =
but
>>>> to prevent from accidentally reading and writing to the wrong PCI-E =
host
>>>> controller, this driver should be modified to check this before
>>>> accessing the registers.
>>>>=20
>>>> Secondly, the driver uses non-exported functions to tell the vt
>>>> subsystem to redraw the screen, preventing the driver from being
>>>> compiling as a module. This can be fixed by using the exported
>>>> functions instead.
>>> You can replace the redraw function, but I don't think it is =
necessary
>>> to make the bmc driver modular.
>>>=20
>>> BMC core, IPMI and simpledrm display are usually (if not always)
>>> supposed to work as early as possible.
>>=20
>> I believe that it should be the user's decision to choose whether to
>> compile a module into the kernel or as a module and it would be =
better
>> if we can provide the possibilities for the user to choose from.
>> Additionally, I don't think these modules are supposed to work that
>> early. The mfd module provide two functions, the display and the ipmi
>> device. In the aspect of graphical display, without this module, the
>> user can still see the output during booting on their monitors, since
>> efifb is working, providing a basic display function. In the aspect =
of
>> the ipmi device, I don't think the lack of such device will influence
>> the boot of the system, since it is a common practice to compile ipmi
>> device drivers as modules on other architectures. As a result, =
neither
>> of the two functions are required to be loaded that early and it is
>> reasonable to at lease leave the choice to compile it as a module
>> to the user.
> Flexibility is not always useful, if a config doesn't provide good
> effect, then it just increases complexity and makes maintenance more
> difficult.

I should emphasize that to allow this driver to be a module, there is
no such increase on maintenance. Moreover, not all loongarch machines
are requiring this driver. Especially only a part of the server models
are quipped with this BMC. Comparing with other architectures, the
driver for BMC are normally compiled as a module, such as mgag200 for
iLO from HPE and iDRAC from DELL, hibmc_drm for Kunpeng server from
Huawei. None of these BMC drivers requiring to be compiled into the
kernel. I cannot see there is any reason keeping the driver from being
allowed to be compiled as a module. I also do not think it will bring
any significant maintenance burden. Implementing correct cleanup code
should be necessary instead of burden.

Cheers,

Miao Wang


