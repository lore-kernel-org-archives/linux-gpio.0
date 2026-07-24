Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0CE73AFCED
	for <linux-gpio@vger.kernel.org>; Fri, 24 Jul 2026 09:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784885302; cv=none; b=aHg1LNBLQQeJls8X/WXBD8ZJfSf4vIzvA11uLfMOcvZNOUwWss1oO0pvIeHMOmJFJrZKX3X4PufL4sIXIepNSYiIUCsAIUsw0DOALjto7VZj+P+2kx/cgy15YTHphum+y2x6Zeqxcz5mzKdKvOIe7WvhAd1v9bIgGQLIxBLTypU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784885302; c=relaxed/simple;
	bh=JS+IFyx0Nx5QnGWEAUcELDS9dig3ky8MVWpuyJmtYrU=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=cwomZWBUkqMLN0Bp2UJB4Jd4LdsJSzaaUyLg7mgUXv1gn5qKf+ZuWCQSZIdtXFPHad4ZYgxi9Ck4nF//7ImrF0jqNNLgtODS8aF1FJ6bsqUXfOB4n8utwNVtVJMylE6eSlmvbSxK6YEH+brn1s82H/8XW+8ENJ4mi4V7HvDFeeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HQF6eere; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HQF6eere"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2cc8311c6ddso362765ad.0
        for <linux-gpio@vger.kernel.org>; Fri, 24 Jul 2026 02:28:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784885300; x=1785490100; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=JS+IFyx0Nx5QnGWEAUcELDS9dig3ky8MVWpuyJmtYrU=;
        b=HQF6eereYndxrC2OYConm7qiAcfHitE8pQHzCChkydi8QkWQUXHSyxFX5pdjo92UrY
         kVD4q0wVwaQfXEMyaRNNXHRrcHEwwvHbTqa7qJPY6At7OsA4PsmtQvP8VVYOJNOoW+hV
         OyfY7fGXtVH7yNsuj9ZuHlgGYF1bNfEFJByU8W9VvmYrFx/WAC0bc4HAF8J+SUcd7sdm
         zZ8GQIIJE/rR/bOKmrGQG0BfarUv7OD+OR/dHa8HsKkih/kwPbo7GHAAHG0hqG/RgjN9
         NCX9P0hFRsyEVi1Qm55NwG+XW+OivHNQrGyGkz7nHyiixRYyPYMYfVVjGNLlStgaXEcu
         udPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784885300; x=1785490100;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JS+IFyx0Nx5QnGWEAUcELDS9dig3ky8MVWpuyJmtYrU=;
        b=r4RXxxTnd1WbbfZbJXjbCzBEmyIHdr81dkLeWAqaD9BoacAUWEwkSiS382ftzBmrRv
         CJLB5OdFrBSJRol2ChRw2IofYWFxD+WTalVSPIu1dSV8wdDSYVHHasq6czb21sauiHMN
         YLcvPyCxQklVEq82oiY53kCN0dl7H7TSentYsPGYrHcYj/phumn56VDiA+EF8VoWE3PJ
         NihPKBB8EpjhOMu4GlolMr9Jyw3v70GkrlHewyXReU89fqerVt6HJDYzgP32FjPo6Nx3
         us+tnrwcrJTCnvkVDVHZg+Uoxt0UZRSAaZ6RWapCx8y/4ycJz7tJvESWlonQ1uoXUl2r
         G78g==
X-Forwarded-Encrypted: i=1; AHgh+Rr8R7mEgF2PMMKJ6EOWxEyi4otrDtapzxezmdG2wqFqujXOvtF5jezWYn8Po98YBrp/VYufS+iFehrE@vger.kernel.org
X-Gm-Message-State: AOJu0YxLq+eYpxcIrZYYpOSAXY846DnokLMZ8r8ouXLVPnZCSJQQw/Al
	deuLSBp1++Y8pj60y4A4hr5vTsP6z7bsxDOR5bXANp03oQZUDI+Uctxc
X-Gm-Gg: AR+sD12DQAi9DBaOElKVhUBEcIwVNcGMqn0HMKP8aqPlOLqNSeZKxZIEaN56s3cpFQo
	Gc8JE0KmhH6rLwpGd2MAmZHeZ9e6OrXMFkU/dW9hxL6LOIf5cO3TOK6+ksjZ38b9yd6ukHZhGJ7
	/IXWJvRA+7gjQdIX+sll4Gc4UrRPnJBtR8jyP8aTOmNVz2mB1ja9p3JsqqSKGWkUmjxtPks2fD3
	Gm3IsNDRYrkRbDiVsxUQOoPHRGEkrtMWp262MyGHIsjahQaiCM76YM8Mq2MnIoL/WuEFu408a3i
	I/a4HX3rav4izm/97dKVCgAnOl4HpJcCBCcJYKlWN02E87Oz3JErbjt73d4uUOo3f8L0i259EYF
	5UCaki9ZfcZffOMd35U2gMxTCYoROX0c088xhrON5gkS8JCPygu5jrN7UcR5o0HbrYhDrakzC6X
	P4kF21FxRDLtMtbTIhG63Nw6yt
X-Received: by 2002:a17:902:d550:b0:2ca:d344:7752 with SMTP id d9443c01a7336-2cfbd6a970amr27757825ad.8.1784885300129;
        Fri, 24 Jul 2026 02:28:20 -0700 (PDT)
Received: from smtpclient.apple ([23.247.139.92])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8f310644sm48128715ad.55.2026.07.24.02.28.15
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 24 Jul 2026 02:28:19 -0700 (PDT)
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
In-Reply-To: <CAAhV-H6kqN1+ZiTqyvXfPEtQJfvFhp_964AB9C00o0O6pigZmQ@mail.gmail.com>
Date: Fri, 24 Jul 2026 17:27:58 +0800
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
Message-Id: <8FCFD614-FEA4-475C-9E0C-50E075B49453@gmail.com>
References: <20260710-ls2kbmc-mod-v3-0-ef718636e78e@gmail.com>
 <CAAhV-H6kqN1+ZiTqyvXfPEtQJfvFhp_964AB9C00o0O6pigZmQ@mail.gmail.com>
To: Huacai Chen <chenhuacai@kernel.org>
X-Mailer: Apple Mail (2.3826.700.81.1.8)

Hi,

> 2026=E5=B9=B47=E6=9C=8824=E6=97=A5 16:55=EF=BC=8CHuacai Chen =
<chenhuacai@kernel.org> =E5=86=99=E9=81=93=EF=BC=9A
>=20
> Hi, Miao,
>=20
> On Fri, Jul 10, 2026 at 1:24=E2=80=AFAM Miao Wang via B4 Relay
> <devnull+shankerwangmiao.gmail.com@kernel.org> wrote:
>>=20
>> Previously, the driver has been introduced to support the Loongson 2K
>> BMC running on the Loongson Servers, which is essential to prevent
>> the system from hanging when the BMC is being reset and the default
>> efi-framebuffer is being used. However, there are some drawbacks in =
the
>> driver.
>>=20
>> Firstly, the driver tries to read and write to the connected PCI-E =
host
>> controller registers, assuming that the BMC is connected to LS7A =
PCI-E
>> host controller. This assumption should be true for real products, =
but
>> to prevent from accidentally reading and writing to the wrong PCI-E =
host
>> controller, this driver should be modified to check this before
>> accessing the registers.
>>=20
>> Secondly, the driver uses non-exported functions to tell the vt
>> subsystem to redraw the screen, preventing the driver from being
>> compiling as a module. This can be fixed by using the exported
>> functions instead.
> You can replace the redraw function, but I don't think it is necessary
> to make the bmc driver modular.
>=20
> BMC core, IPMI and simpledrm display are usually (if not always)
> supposed to work as early as possible.

I believe that it should be the user's decision to choose whether to
compile a module into the kernel or as a module and it would be better
if we can provide the possibilities for the user to choose from.
Additionally, I don't think these modules are supposed to work that
early. The mfd module provide two functions, the display and the ipmi
device. In the aspect of graphical display, without this module, the
user can still see the output during booting on their monitors, since
efifb is working, providing a basic display function. In the aspect of
the ipmi device, I don't think the lack of such device will influence
the boot of the system, since it is a common practice to compile ipmi
device drivers as modules on other architectures. As a result, neither
of the two functions are required to be loaded that early and it is
reasonable to at lease leave the choice to compile it as a module
to the user.

Cheers,

Miao Wang


