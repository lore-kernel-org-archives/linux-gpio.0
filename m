Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A0D13BADB2
	for <linux-gpio@vger.kernel.org>; Tue, 13 Oct 2026 08:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791881089; cv=none; b=VXUbFkUMcYFfWKs5X2ZExRK1hGp46EbHqzAXgpADaWL/ddeV88B+FBqxB5dCGZflNIkYTY5miI/ScfGGnIVdTEBASCnxNAkm7AJl+WgWrNG4cVTQy8LAJWoQNsLC0xow5NuMhcUWCGYemC0wAyXcsA/kVUxEg/MTOQICR+aRATc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791881089; c=relaxed/simple;
	bh=vxqqcKeLdquDIj2KN23L6bIhx0QnUrefdPPqJUxyJLc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TIYtp94OB6cYziFmlYOy59zW2LLX52yvEydCLt4bWkPvXpdOq4AylGdFiLZcvONHSdoitGiMEbgDOVkVMDlcKLTxHCkNkm4onuhCgccGNIFkMI29jLNE9uZDWOMMcMaKo2fCX2zAZcasmIEkMKMz2oCbSChfmVmiTX033Q1LzcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JBJto5vs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JBJto5vs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31B9E1F008A6
	for <linux-gpio@vger.kernel.org>; Tue, 13 Oct 2026 08:44:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791881085;
	bh=vxqqcKeLdquDIj2KN23L6bIhx0QnUrefdPPqJUxyJLc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=JBJto5vs6Ta5E/laTRijxncLWHwZSeMl1+SClQ5oFUvXM0v718q+e20I6pYu0DfxG
	 w/4fRxhonEgkDArXFln4ElPzOKrrcRqsZSUYu2sA4YrUbFnUE9/8M2Nfq3o4T30bj7
	 7Y/IEqCfZlmcDKyap6K5e9RbVvosULTeXnkkcS9NSDl/k8EL2VWgbiClg+50O+sqBQ
	 R9LHUbOIC2nEqLkWIQaNSlkAAQhg8DxTJuWeCljZPmF27WHT31I3sJvHfnzrf0STWR
	 7qmGGRHb0aHs5PSjp7DSOsNQ+xxCV5dpANwf8GOPmcxRC8w8SM1S/g8H3NMfkwoXCw
	 cjAe+fGH6sbBQ==
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-3a65ed9c7cfso20148881fa.3
        for <linux-gpio@vger.kernel.org>; Tue, 13 Oct 2026 01:44:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwDa8o8bQfCzYZdSL0W7r1BFGd7JHGRS2TIRBVFr9es2Q534qNy7USZ5YQFFfUOmc85GmAXXk2oYhcS@vger.kernel.org
X-Gm-Message-State: AFq9FYJaX+7CIzLT+Tul9w1VWzc/kmiHU2L/9tl205HVyzP+t8gGEW3P
	V7PxJ8kTRZLcF1i0qwVDR94r/RK6ijuYscB1tsLDDXSoFeJ/vAI1ujMBvEVoG2DJ/uSXIjMCo6g
	XB8DAjjFLS3dBNGUAqlB7Y6XvfVaoZ/g=
X-Received: by 2002:a2e:be0b:0:b0:3a9:abd6:1ab9 with SMTP id
 38308e7fff4ca-3a9c514fd25mr26402801fa.8.1791881083577; Tue, 13 Oct 2026
 01:44:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260921-cv75-v5-v8-0-282ff5d98dda@ambarella.com>
 <20260921-cv75-v5-v8-4-282ff5d98dda@ambarella.com> <CAD++jLmKF5XxHsJX29sdXC_6JHKn-7HkE=N+TKtk5xODtQj3_w@mail.gmail.com>
 <b2256847-3ec1-47e8-ac79-ceca86eb09e7@kernel.org> <CAD++jLkrXXg9xrhAZ8HETc5Qcv5BbkY-ibjvzBmE5WZVqDEGWQ@mail.gmail.com>
 <a0eca34d-5eb2-4730-b8c7-0f2302bcf265@kernel.org>
In-Reply-To: <a0eca34d-5eb2-4730-b8c7-0f2302bcf265@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 13 Oct 2026 10:44:31 +0200
X-Gmail-Original-Message-ID: <CAD++jLm=T-U07vAVCogMnfOfkDf=i9QhGGc8ok2N-ZUh50WLNA@mail.gmail.com>
X-Gm-Features: AclHuK8uOkUyYpjHvZrw-87c6Tq4ZbkYSTxyMDm1V9n2PMOjyOCFsNCXto0ZE_s
Message-ID: <CAD++jLm=T-U07vAVCogMnfOfkDf=i9QhGGc8ok2N-ZUh50WLNA@mail.gmail.com>
Subject: Re: [PATCH v8 04/18] dt-bindings: pinctrl: add Ambarella CV75 pinctrl
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: longzhao@ambarella.com, Arnd Bergmann <arnd@arndb.de>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, soc@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Jerome Brunet <jbrunet@baylibre.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Long Zhao <zl020895@163.com>, 
	Lee Jones <lee@kernel.org>, mfd@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2026 at 9:08=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
> On 12/10/2026 09:06, Linus Walleij wrote:
> > On Fri, Oct 9, 2026 at 8:17=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel=
.org> wrote:
> >> On 01/10/2026 09:03, Linus Walleij wrote:
> >
> >>> On Mon, Sep 21, 2026 at 6:23=E2=80=AFAM Long Zhao via B4 Relay
> >>> <devnull+longzhao.ambarella.com@kernel.org> wrote:
> >>>
> >>>> From: Long Zhao <longzhao@ambarella.com>
> >>>>
> >>>> Document the CV75 pin controller binding using generic function and
> >>>> groups properties for pinmux configuration.
> >>>>
> >>>> Reviewed-by: Linus Walleij <linusw@kernel.org>
> >>>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.c=
om>
> >>>> Signed-off-by: Long Zhao <longzhao@ambarella.com>
> >>>
> >>> This patch 4/18 applied to the pinctrl tree.
> >>
> >> There is a dependency, you cannot take this patch alone.
> >
> > Oops, but is it a DTS dependency so if none of the other patches go in =
through
>
> No, it is a bindings dependency, introducing new DT bindings warning for
> both your tree and next.

Is there a problem with the bindings patch itself?

In that case Long can just send an incremental patch to
fix it right?

> Your tree is fine in this case as long as next
> is also fine... but next is not, because that patch did not make it there=
.

But the patch is in -next?

~/linux-next$ ls
Documentation/devicetree/bindings/pinctrl/ambarella,cv75-pinctrl.yaml
Documentation/devicetree/bindings/pinctrl/ambarella,cv75-pinctrl.yaml

> We cannot have any new DT bindings warnings in next.

I guess I just don't get it :D

To me it seems like a fairly normal situation: ACKed bindings merged
together with the driver, no dependence on anything.

But if you tell me "revert the patch" I will simply revert the patch
because I trust you, it doesn't really matter why.

Yours,
Linus Walleij
