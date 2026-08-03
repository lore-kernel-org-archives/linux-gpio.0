Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52012365A1A
	for <linux-gpio@vger.kernel.org>; Mon,  3 Aug 2026 16:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785773366; cv=none; b=UO4VWEtmI25b6QYTm0cb1eSqW+w/M/ebeK5A9LKoC0DnfOmE3gtCyumA7Kmcx1CEocZV8JFJ1vkkL6Q9dJGj7WpBKUcJSb88GLrvoZhq0YEkKhTkQ5UlPC91b8Rcq5XaJL3pNk5paWNa+FiS2fzZGxxArZ1exRwl9w14lTflzWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785773366; c=relaxed/simple;
	bh=/jikEh0ap5JVvxcrd8r/3UoXZQlm/E+GShUrYZzsWAo=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=AL/SudrWHPghMNh7hEPZ5k0UtKaUVAFaDGUMgd3CtlN96Tal2PGPdI7h64Clr3H/7KbJ9SeA4R5fxtWAUwIuXAi3q98ADiUZTQcLWMsMFUZzEb8s1nl8s1YMFegBctcOOMyllCKGVA4XWh3KFUB0Bogu0C5Jo8aKy9tnIkQhB18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QMtvuD/w; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QMtvuD/w"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-385b78b4f9bso167831a91.2
        for <linux-gpio@vger.kernel.org>; Mon, 03 Aug 2026 09:09:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785773360; x=1786378160; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/jikEh0ap5JVvxcrd8r/3UoXZQlm/E+GShUrYZzsWAo=;
        b=QMtvuD/wob2dSh0WbFi6qNZDHSqeGRxecXjIVSgPcCuTInQLpkMtYJG1VNEQulD6xk
         LCjVi2knCk9twBkjjrUo1yrp51CTayaa6X0s3QrLqpOtq5Qz6rGg2xBPzLQp7knPQZT3
         EM40H99XQN32p+yru0gsJw0iyd4rQAVlkz0JGgwKqQUGRzrU3wESKd9Gzt8rk3H0AuoY
         Hhjugat0ou9oolzbEUdAnrhOXoN17r/X1P0Mcr+kI7hgc+E5MfKUVNmznWnT9FR3me24
         uAaMfvsDKPcwpG5UDgbvKvr9dbeswCDYsy5cUJEGl8pMeJVCWfwX4pvbl/AJtWyJxrFd
         MRDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785773360; x=1786378160;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/jikEh0ap5JVvxcrd8r/3UoXZQlm/E+GShUrYZzsWAo=;
        b=Llj1kQfwLi5zbxgCg8pJjJTUott1S1/J2lKRxkjm43vMCr9vOXZUU7HC2MZxRv7Okr
         PkFmmlGuwQdeBr28Wq/SdQv7hwkrTrgh9NCRbqHRQgnEVyMuWG2iNuMoIR2A6xAuPdfj
         GWJnM+QF1KxvIGrvicxzXrLLyDsj2QsRaOJ2QMbnZmvV5BNrkZ6+4xxNFkU5jJ/IwuaQ
         BEqgy5Y0AoreU5RdqYQ0s+OKNa0ialXx2Ov2RqdrK8v2xsE6E8qk2LIh17RkPXrWnHXJ
         l0rJmOoNDbCdNCm6t+iMnJ/PjDKiHRen+Ahx8X+Di/jyN5tbQskFOGft9Zwn8RWTVPGy
         SmWg==
X-Forwarded-Encrypted: i=1; AHgh+RpVtrSwVVHqexGqAoH6yzJxWM/UaJGzODPhsTEEQ++jupJ41qGw2zziFQJ2EzYxDkcCoxrfMySHd6hS@vger.kernel.org
X-Gm-Message-State: AOJu0Yztq/t92kJs92I1n7Hmbiw0cvMFIoFyMWtfD9CHBOgq7MocWT2I
	RQo3gsQyLHu70FsAekuSmQa8QXlAOqftkQlNV/MpqQ/tC519H24uQOi/
X-Gm-Gg: AR+sD10LvUdzn37B0qV87LOW4aXW4siH9mmMDSoYxAlT6dEAELYjTVWWuAHe2oEpzSE
	HUo1Ly59kTvVHJB1gysGF2pEuVbaYwlcr3hmyFT7e8T+BBGjh+aSBp8Xw9FS3OrlW6RR2UO9iHk
	YbLXTWl3NOdpU4Ve6liIUE5XJxbcSI8jx4UQ3ZLuYvIrsRvluZJWPXBN9gd2FIjOrn3MbEtAayk
	8YZSioxcEQX3+J3Jgao4rwpL86HKpsgwrDUwA3IaA/IgMsY33STHmMESTyd/+uo9Alxa0KcvsAM
	u9ySsUeFVtENUwuJAAc76vqcPjj3NuUrD5UBv44N37JX9DA/V/xJQzY5tCSq3wGcsRqiFpj5/bB
	SqnM8vc97aZT+eCueWC2A73pY9hrTHiqTzSBgbsdM40Rvf9xhjNPC/Y5HCoKpU3Um4udm0lKjCw
	Eeh4ew6ZZOCFVC06pkUqHXZCCQBAZrVwq9SWj7L7/CbzsQsr4nLpVgKcQL+exWKsK0wyF/uVRbn
	Y799fpqcvY=
X-Received: by 2002:a17:90b:562e:b0:36d:b30b:14ed with SMTP id 98e67ed59e1d1-38fbc4ad251mr13589275a91.2.1785773360472;
        Mon, 03 Aug 2026 09:09:20 -0700 (PDT)
Received: from smtpclient.apple ([23.247.139.92])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38febfdae78sm43066a91.4.2026.08.03.09.09.15
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 03 Aug 2026 09:09:19 -0700 (PDT)
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
In-Reply-To: <CAAhV-H6EN3K_QCd6pJ755PH7t5uUS0g-+BbRKjWr7oq7vX9ZTA@mail.gmail.com>
Date: Tue, 4 Aug 2026 00:09:02 +0800
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
Message-Id: <94FDE4B9-CE06-4596-9965-25A70E5A2E3F@gmail.com>
References: <20260710-ls2kbmc-mod-v3-0-ef718636e78e@gmail.com>
 <CAAhV-H6kqN1+ZiTqyvXfPEtQJfvFhp_964AB9C00o0O6pigZmQ@mail.gmail.com>
 <8FCFD614-FEA4-475C-9E0C-50E075B49453@gmail.com>
 <CAAhV-H5wFZHN2jD-vGgNLuMqugGxwfyfq2TnK=HKyZXxZR7iRA@mail.gmail.com>
 <64E79496-E66E-45A0-B1D6-DB5466C35D46@gmail.com>
 <CAAhV-H6EN3K_QCd6pJ755PH7t5uUS0g-+BbRKjWr7oq7vX9ZTA@mail.gmail.com>
To: Huacai Chen <chenhuacai@kernel.org>
X-Mailer: Apple Mail (2.3826.700.81.1.8)

Hi,

> 2026=E5=B9=B48=E6=9C=883=E6=97=A5 21:45=EF=BC=8CHuacai Chen =
<chenhuacai@kernel.org> =E5=86=99=E9=81=93=EF=BC=9A
>=20
> On Fri, Jul 31, 2026 at 4:24=E2=80=AFPM Miao Wang =
<shankerwangmiao@gmail.com> wrote:
>>=20
>> Hi,
>>=20
>>> 2026=E5=B9=B47=E6=9C=8831=E6=97=A5 16:07=EF=BC=8CHuacai Chen =
<chenhuacai@kernel.org> =E5=86=99=E9=81=93=EF=BC=9A
>>>=20
>>> On Fri, Jul 24, 2026 at 5:28=E2=80=AFPM Miao Wang =
<shankerwangmiao@gmail.com> wrote:
>>>>=20
>>>> Hi,
>>>>=20
>>>>> 2026=E5=B9=B47=E6=9C=8824=E6=97=A5 16:55=EF=BC=8CHuacai Chen =
<chenhuacai@kernel.org> =E5=86=99=E9=81=93=EF=BC=9A
>>>>>=20
>>>>> Hi, Miao,
>>>>>=20
>>>>> On Fri, Jul 10, 2026 at 1:24=E2=80=AFAM Miao Wang via B4 Relay
>>>>> <devnull+shankerwangmiao.gmail.com@kernel.org> wrote:
>>>>>>=20
>>>>>> Previously, the driver has been introduced to support the =
Loongson 2K
>>>>>> BMC running on the Loongson Servers, which is essential to =
prevent
>>>>>> the system from hanging when the BMC is being reset and the =
default
>>>>>> efi-framebuffer is being used. However, there are some drawbacks =
in the
>>>>>> driver.
>>>>>>=20
>>>>>> Firstly, the driver tries to read and write to the connected =
PCI-E host
>>>>>> controller registers, assuming that the BMC is connected to LS7A =
PCI-E
>>>>>> host controller. This assumption should be true for real =
products, but
>>>>>> to prevent from accidentally reading and writing to the wrong =
PCI-E host
>>>>>> controller, this driver should be modified to check this before
>>>>>> accessing the registers.
>>>>>>=20
>>>>>> Secondly, the driver uses non-exported functions to tell the vt
>>>>>> subsystem to redraw the screen, preventing the driver from being
>>>>>> compiling as a module. This can be fixed by using the exported
>>>>>> functions instead.
>>>>> You can replace the redraw function, but I don't think it is =
necessary
>>>>> to make the bmc driver modular.
>>>>>=20
>>>>> BMC core, IPMI and simpledrm display are usually (if not always)
>>>>> supposed to work as early as possible.
>>>>=20
>>>> I believe that it should be the user's decision to choose whether =
to
>>>> compile a module into the kernel or as a module and it would be =
better
>>>> if we can provide the possibilities for the user to choose from.
>>>> Additionally, I don't think these modules are supposed to work that
>>>> early. The mfd module provide two functions, the display and the =
ipmi
>>>> device. In the aspect of graphical display, without this module, =
the
>>>> user can still see the output during booting on their monitors, =
since
>>>> efifb is working, providing a basic display function. In the aspect =
of
>>>> the ipmi device, I don't think the lack of such device will =
influence
>>>> the boot of the system, since it is a common practice to compile =
ipmi
>>>> device drivers as modules on other architectures. As a result, =
neither
>>>> of the two functions are required to be loaded that early and it is
>>>> reasonable to at lease leave the choice to compile it as a module
>>>> to the user.
>>> Flexibility is not always useful, if a config doesn't provide good
>>> effect, then it just increases complexity and makes maintenance more
>>> difficult.
>>=20
>> I should emphasize that to allow this driver to be a module, there is
>> no such increase on maintenance. Moreover, not all loongarch machines
>> are requiring this driver. Especially only a part of the server =
models
>> are quipped with this BMC. Comparing with other architectures, the
>> driver for BMC are normally compiled as a module, such as mgag200 for
>> iLO from HPE and iDRAC from DELL, hibmc_drm for Kunpeng server from
>> Huawei. None of these BMC drivers requiring to be compiled into the
>> kernel. I cannot see there is any reason keeping the driver from =
being
>> allowed to be compiled as a module. I also do not think it will bring
>> any significant maintenance burden. Implementing correct cleanup code
>> should be necessary instead of burden.
> Can we split into two series, one fix bugs and the others make bmc =
modular?
>=20
> Otherwise I don't think we can reach a consensus in the near future.

I accept different opinions on design trade-offs. However, I don't think
you have provided enough excuses to remain this driver as built-in,
since I believe normally in kernel, most non-core drivers are all able
to be compiled as a module. I also provided some examples from devices
with similar functions. As a result, I'll not split this series before
there is indeed a strong reason against allowing this driver to be
compiled as a module or we may have a great benefit if we force this
module to be compiled built-in.

Cheers,

Miao Wang=
