Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABEEB42A140
	for <linux-gpio@vger.kernel.org>; Mon,  3 Aug 2026 13:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785764752; cv=none; b=CHS7JNiUWTbuCXRBRW4sqoPBSaYL5UBV7j++b57XvPjaeUDgJGHEj7IITlnGBO/bdTM6yZTMCi+kzgkkEcC3wsmUGsk7zmg2r45gp+ex2QYKteuzorjFCySMP0SNj7rgRxkXf+00rN/LyfsXj2ESs3E+DbiBwQzMuIGspxvvd8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785764752; c=relaxed/simple;
	bh=6VB/5XDZcG4nxJkXWLXnXZ5ouQKsEVwa3yihjHoIPZw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iNEjHZCikwIG9OnERKGReME4BZvwRkqFCuI0V7L67ZeqpnPYfABGoE9qA8T5+ohZ0ZESoDSWYROOyl1qghpRt2cvhrEnZOKpWiyLbR35ncDUOSq+ZmQBSve/HFbt3l864VqYNYcY3pTvfDAcZDm+EB3pmjpK0QcG41Hf5rYEhFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lTEBaJ/E; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lTEBaJ/E"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69B6B1F00ACF
	for <linux-gpio@vger.kernel.org>; Mon,  3 Aug 2026 13:45:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785764751;
	bh=6VB/5XDZcG4nxJkXWLXnXZ5ouQKsEVwa3yihjHoIPZw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=lTEBaJ/EyRKyfoWUtq4J45dViS4VC6N9S1wysYwoVSDhoq6/oFnzfzpKlg7k/Lwna
	 24qnT6Lf1C0/wCS6YL+qPfmB+ftUtRw6HN+4O2ATVD4lBu622fTT+L+8ea0CzlRAuQ
	 Xy5pTHyAVc/OtDqbvOgOVADFRc5q5vFUKJOx9z9izZKjvR1bqp2eQp1z6ZWz4IWXAX
	 bdUUGmM2DLsPtLGx5pB3tVpwl3j46lWrV5oPGX69SEKixno0VqoOkDILFOBCM0IbIJ
	 oxxO/VME2FaRkNiLIigWGCvEHxAnmtudLuvZNXfU2/kRjRdbslbcaXfUPCHLxhlwpN
	 t1v0KD/u9kklg==
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6a0ed8a10ceso1790917a12.3
        for <linux-gpio@vger.kernel.org>; Mon, 03 Aug 2026 06:45:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rp8ncxyJ5y4RbHH0MCR02QZTVQ9tsOy5EwamkMgg2oHpvUsfWQEw5mroNKV7Oa77jYizXsKA+ZSMfdB@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2fBqtxfMNWhcnrlEgfFt3VSAMnwGPdPJ5sF5MtMLmCI7keW0G
	Yeu4fPzggs/6Nu8vtHxbeUNpHKxnOkFTRsuY7BlasvOZgHH+oeI/22SxcpqVNKwno2Pk2JPnHEL
	s4do+bygyQS57RyXaaTvMi8YT2Et93rs=
X-Received: by 2002:a05:6402:3608:b0:69e:2d56:690a with SMTP id
 4fb4d7f45d1cf-6a0a7c6b775mr6984378a12.8.1785764750026; Mon, 03 Aug 2026
 06:45:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260710-ls2kbmc-mod-v3-0-ef718636e78e@gmail.com>
 <CAAhV-H6kqN1+ZiTqyvXfPEtQJfvFhp_964AB9C00o0O6pigZmQ@mail.gmail.com>
 <8FCFD614-FEA4-475C-9E0C-50E075B49453@gmail.com> <CAAhV-H5wFZHN2jD-vGgNLuMqugGxwfyfq2TnK=HKyZXxZR7iRA@mail.gmail.com>
 <64E79496-E66E-45A0-B1D6-DB5466C35D46@gmail.com>
In-Reply-To: <64E79496-E66E-45A0-B1D6-DB5466C35D46@gmail.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Mon, 3 Aug 2026 21:45:39 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6EN3K_QCd6pJ755PH7t5uUS0g-+BbRKjWr7oq7vX9ZTA@mail.gmail.com>
X-Gm-Features: AUfX_mxZa_kW556MbPU7RtyeHU8jvtHv1WPI2WaH47CV5_TRvcQTmtsF6hyI33g
Message-ID: <CAAhV-H6EN3K_QCd6pJ755PH7t5uUS0g-+BbRKjWr7oq7vX9ZTA@mail.gmail.com>
Subject: Re: [PATCH RFC v3 0/7] mfd: ls2kbmc: multiple fixes for this driver
To: Miao Wang <shankerwangmiao@gmail.com>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Chong Qiao <qiaochong@loongson.cn>, 
	Lee Jones <lee@kernel.org>, Corey Minyard <corey@minyard.net>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Xi Ruoyao <xry111@xry111.site>, WANG Xuerui <kernel@xen0n.name>, 
	Yinbo Zhu <zhuyinbo@loongson.cn>, Jiaxun Yang <jiaxun.yang@flygoat.com>, mfd@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	openipmi-developer@lists.sourceforge.net
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 31, 2026 at 4:24=E2=80=AFPM Miao Wang <shankerwangmiao@gmail.co=
m> wrote:
>
> Hi,
>
> > 2026=E5=B9=B47=E6=9C=8831=E6=97=A5 16:07=EF=BC=8CHuacai Chen <chenhuaca=
i@kernel.org> =E5=86=99=E9=81=93=EF=BC=9A
> >
> > On Fri, Jul 24, 2026 at 5:28=E2=80=AFPM Miao Wang <shankerwangmiao@gmai=
l.com> wrote:
> >>
> >> Hi,
> >>
> >>> 2026=E5=B9=B47=E6=9C=8824=E6=97=A5 16:55=EF=BC=8CHuacai Chen <chenhua=
cai@kernel.org> =E5=86=99=E9=81=93=EF=BC=9A
> >>>
> >>> Hi, Miao,
> >>>
> >>> On Fri, Jul 10, 2026 at 1:24=E2=80=AFAM Miao Wang via B4 Relay
> >>> <devnull+shankerwangmiao.gmail.com@kernel.org> wrote:
> >>>>
> >>>> Previously, the driver has been introduced to support the Loongson 2=
K
> >>>> BMC running on the Loongson Servers, which is essential to prevent
> >>>> the system from hanging when the BMC is being reset and the default
> >>>> efi-framebuffer is being used. However, there are some drawbacks in =
the
> >>>> driver.
> >>>>
> >>>> Firstly, the driver tries to read and write to the connected PCI-E h=
ost
> >>>> controller registers, assuming that the BMC is connected to LS7A PCI=
-E
> >>>> host controller. This assumption should be true for real products, b=
ut
> >>>> to prevent from accidentally reading and writing to the wrong PCI-E =
host
> >>>> controller, this driver should be modified to check this before
> >>>> accessing the registers.
> >>>>
> >>>> Secondly, the driver uses non-exported functions to tell the vt
> >>>> subsystem to redraw the screen, preventing the driver from being
> >>>> compiling as a module. This can be fixed by using the exported
> >>>> functions instead.
> >>> You can replace the redraw function, but I don't think it is necessar=
y
> >>> to make the bmc driver modular.
> >>>
> >>> BMC core, IPMI and simpledrm display are usually (if not always)
> >>> supposed to work as early as possible.
> >>
> >> I believe that it should be the user's decision to choose whether to
> >> compile a module into the kernel or as a module and it would be better
> >> if we can provide the possibilities for the user to choose from.
> >> Additionally, I don't think these modules are supposed to work that
> >> early. The mfd module provide two functions, the display and the ipmi
> >> device. In the aspect of graphical display, without this module, the
> >> user can still see the output during booting on their monitors, since
> >> efifb is working, providing a basic display function. In the aspect of
> >> the ipmi device, I don't think the lack of such device will influence
> >> the boot of the system, since it is a common practice to compile ipmi
> >> device drivers as modules on other architectures. As a result, neither
> >> of the two functions are required to be loaded that early and it is
> >> reasonable to at lease leave the choice to compile it as a module
> >> to the user.
> > Flexibility is not always useful, if a config doesn't provide good
> > effect, then it just increases complexity and makes maintenance more
> > difficult.
>
> I should emphasize that to allow this driver to be a module, there is
> no such increase on maintenance. Moreover, not all loongarch machines
> are requiring this driver. Especially only a part of the server models
> are quipped with this BMC. Comparing with other architectures, the
> driver for BMC are normally compiled as a module, such as mgag200 for
> iLO from HPE and iDRAC from DELL, hibmc_drm for Kunpeng server from
> Huawei. None of these BMC drivers requiring to be compiled into the
> kernel. I cannot see there is any reason keeping the driver from being
> allowed to be compiled as a module. I also do not think it will bring
> any significant maintenance burden. Implementing correct cleanup code
> should be necessary instead of burden.
Can we split into two series, one fix bugs and the others make bmc modular?

Otherwise I don't think we can reach a consensus in the near future.

Huacai

>
> Cheers,
>
> Miao Wang
>
>
