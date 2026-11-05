Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793866542;
	b=dFnpaT+O7KxFXpqLypctrSxLE0VyjaqawrXGwiIWui++LRSQ/9M+g1AoJU9q3YsbnFtn
	 z6aKZRo0PSzSbp4eKlLVu7lO9YWlPePlq9+RzKIwy14oojiqHjp5n7t4d2fIvRuFcf2+k
	 ichZO6e7VxAmTBWMtteb75QCDeJ69412BI5dEqstb0cZNTw4R49ioefgsN5yWmSXm7NXi
	 xzd9gatqeZWxSz5Iw8DuQ1a6EEighbvcwVM8m89iIedGby4dnOy7vcfDymS9rgig9aWAV
	 DV/+Uu2ggYJkhj+ena4qm83AshubYa6f3H41JUYXbsRsINL37p29LbsaS4lFXXVwC2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793866542;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=SlJEODHK5MhthQR/d2UxlA9DGUVXpksfxM99m3lFYgM=;
	b=RUwxMCFBWBwzwlRaL0qwBWhvii0zhv9M5FNraAc2lijqqgJGoW952S/FQT8ppvr0BJvf
	 wDP2xQbrhqi4DBpNKMUlVDznCF9PTQkeqNTF267bUylFSh4EDBb3/zpx92ACe8+m69lrj
	 fTD5X3tBspKA+rahXMHsv9uCY9/5ieSHrA3Wvb18/r2Ol41F3p7eXViJpnWcerqc1lp5m
	 LafMULc1Lw/MnfNEGvZF7CTAKKX7eK9Nu/obtXr2CPhfBrAEYg87ajktbuHnk3uCJO4Ia
	 fDjEtoBLs5eViAlDFrli1AprJYnGUUBW69RRXs2FbPe5DXIjsrAoT9ZrhFHuPz6RMoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WQmT+uC9;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A150606A326
	for <linux-gpio@vger.kernel.org>; Thu,  5 Nov 2026 08:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WQmT+uC9
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43F171F00A15
	for <linux-gpio@vger.kernel.org>; Thu,  5 Nov 2026 08:15:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793866541;
	bh=SlJEODHK5MhthQR/d2UxlA9DGUVXpksfxM99m3lFYgM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=WQmT+uC9OrCA13ynSLmpLIRum4zNdUoKsGrsDvhAEslXqC22LA6/LfAvWjC0HV59a
	 YRUNLGBOhWmPSpmRS2f22eVgpEq7lza7e7wI4d7+wWLlvPnV8/WuPp+woW0xjVUFgd
	 BzGm/HAXQNrSsrpU/MOucBbx9dEMChy1Eu0R1HbZI0aBW28aFVg8b4x+YaPaRC3HNr
	 yo5994LMT5XOPHJy+Owc3HpHVmrJ4GkDYPimFgWq2//sHRuuzJmZpEIcj5SVPZ+2Qj
	 /CsBLKa4WEnxPfIOR1Nj6s5TggJaykdH4vio5BO1yvtP7A2nisemy6Fd2KcpY3wK1T
	 ooTVfGhc8tKXQ==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5be47aa555cso1369110e87.3
        for <linux-gpio@vger.kernel.org>; Thu, 05 Nov 2026 00:15:41 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBwz1hM80CAcg3tWWxXcY97SV1PGQ/9aEPYZCVJ3Ma36Ql0xPPSksVMG86ubpcIOby2zVWR7X+YTcuud@vger.kernel.org
X-Gm-Message-State: APuU4Z/hn36HBsW+ElFwzb1ObN7tczBlrjdgeiLt51nM0qyDcXL/9jOQ
	ZEFcaNvLFEKY/Uavjk3+o7KcT22KEgCsfU6HtRbMvKbCcPDQkj+ADGL1Yk3a1ZUGN776pXgzZ3d
	BLN+m71wEzZrBh9niL1nUjN6PJqxiSps=
X-Received: by 2002:a05:6512:3056:b0:5bf:b96b:2c75 with SMTP id
 2adb3069b0e04-5bfd957c416mr6871531e87.37.1793866540055; Thu, 05 Nov 2026
 00:15:40 -0800 (PST)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261030181214.2448140-3-conor@kernel.org>
In-Reply-To: <20261030181214.2448140-3-conor@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 5 Nov 2026 09:15:27 +0100
X-Gmail-Original-Message-ID: <CAD++jLkAD=SqT9p0U3ZoynfHoLoDqFWVGqnrr20=XbinmGQg5w@mail.gmail.com>
X-Gm-Features: AclHuK9dF7wnimf_TqjYQ2LeWPJLM4JGM9lr2Af8kMxRnI3M55-B2AgQwBBIkvM
Message-ID: <CAD++jLkAD=SqT9p0U3ZoynfHoLoDqFWVGqnrr20=XbinmGQg5w@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: mpfs-mssio: remove unused mutex
To: Conor Dooley <conor@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>, 
	Valentina Fernandez <valentina.fernandezalanis@microchip.com>, 
	Daire McNamara <daire.mcnamara@microchip.com>, linux-riscv@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 30, 2026 at 7:15=E2=80=AFPM Conor Dooley <conor@kernel.org> wro=
te:

> From: Conor Dooley <conor.dooley@microchip.com>
>
> The pinctrl core creates a mutex that is used to protect things like the
> generic dt node mapping functions. The (currently) unused mutex was added
> when the driver was in RFC state and contained a custom dt node mapping
> function, and used the driver's own mutex to protect it. The driver
> probably could have borrowed the core's, but this is moot since the merge=
d
> version of the driver no longer has a custom dt node mapper. Remove the
> unused mutex.
>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

Patch applied!

Yours,
Linus Walleij
