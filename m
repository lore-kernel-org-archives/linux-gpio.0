Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5B2C3BCD28
	for <linux-gpio@vger.kernel.org>; Tue, 22 Sep 2026 20:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790107616; cv=none; b=W7E6vETmpFOys3hUIeeihcJKW4HIlTdA5hV5mIN1IBdaNmjb5kXiu9neMPSoqGlWPu9WQX3CsOMMeekcnwtwJwg2tIKMeL9ANv6L5IYgp7+81ZfYev37heZ75ap61gcHDXJrTv4Ea7oTAIiGyYAwnRDQK1oWLNZA6QhIUZc1i0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790107616; c=relaxed/simple;
	bh=DQ6pOyH9/gwI9NGnOmICJ+Z+AjY+ewLm9COTYSgD430=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gOQuTu8yLy0N0lFtY20GIFX46xacnWXHH3Dt/2uvZsfVznGUbEXXcIW/BAMq+Rc+qoynb8qAkqwDqrGB4EGCo2Yk4abmZtgeeoguNuq11WLl2UwcqeK5CBTs+FFbVCoxyqOBRzgIFYARmpvOzjEd6OBqFG8b3DnVn9WozxrR0lA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IPnEarB3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IPnEarB3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 140801F0089A
	for <linux-gpio@vger.kernel.org>; Tue, 22 Sep 2026 20:06:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790107600;
	bh=DQ6pOyH9/gwI9NGnOmICJ+Z+AjY+ewLm9COTYSgD430=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=IPnEarB3y99S7CqDKkxw5Iqqacm0mKqK4TbmtiBYyoy/FwO/rFFWqFlNWnIZLD5Rs
	 Ti+IwcjjF/1K0OsZDqnS42lYA6eZsR3D0ea4Ccx/AULS+dvkOajeAgEU867nrklSzs
	 O/wS2tpW5ivg2skIolqvpBsibb+CQ/LcFeuTDXr/qmm1WMUULaK0H8nD4LgdxfLCcJ
	 vWs1LdbMkUlThPbjuQ4KfyzxY+T8RZaRIl9Uk/ovWH3fhFVLgPr/mJ5Buafzt5+AXT
	 vUaqMgrntVyCGuVfRPy7S/8q/Zs3cjdi3tAno55AkBl8dGesfcaCqDvpfr4Xg7Bw39
	 gxZa3DzwNWtAQ==
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b5e4f1e419so64797e87.0
        for <linux-gpio@vger.kernel.org>; Tue, 22 Sep 2026 13:06:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByx5QPgLqTjE9GloXfoJ4AhQyKjb3+OwU4oJHZpbua+LJ46rztj80sYrwCSuIZNST1+6d7yt0ODKJvf@vger.kernel.org
X-Gm-Message-State: AFuF++noqUJ6fisLCW4VxCvHDPee4IhOHmjGDIJg9lw9Ley+gZnCZhSv
	nhBbIjX+JxtCRPh5ZOcSe1aRTsjXBG+SGmRLC24XW/rA42AipL6Go4ol1C2FlkdXB4BQCqTPuzy
	NsjEp0t1oEHzw9w8cd8eYcGWqQ3OmheE=
X-Received: by 2002:ac2:5452:0:b0:5b8:9a95:e259 with SMTP id
 2adb3069b0e04-5b8d87955b0mr117714e87.27.1790107598761; Tue, 22 Sep 2026
 13:06:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260909-pci-tc9563-aux-v5-0-c9b33f56c8d3@oss.qualcomm.com>
 <20260909-pci-tc9563-aux-v5-2-c9b33f56c8d3@oss.qualcomm.com> <fratyclnf6t232dg5s2kvsysw3gbovkwnrzfhnlblsax3wb6qy@debn6qdpp7jh>
In-Reply-To: <fratyclnf6t232dg5s2kvsysw3gbovkwnrzfhnlblsax3wb6qy@debn6qdpp7jh>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 22 Sep 2026 22:06:26 +0200
X-Gmail-Original-Message-ID: <CAD++jLmDTR8hTqEaL+4MkYpNyJM1Xqw_yDVXWk37j0U_EXW8vQ@mail.gmail.com>
X-Gm-Features: AclHuK9hkx-ggz7G0g38jTqdTsuWa6o6XzZhAY7sBjdJ2ocCBPHQ5wBU56tnIRc
Message-ID: <CAD++jLmDTR8hTqEaL+4MkYpNyJM1Xqw_yDVXWk37j0U_EXW8vQ@mail.gmail.com>
Subject: Re: [PATCH v5 2/5] gpio: tc9563: Add support for the embedded GPIO controller
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Michael Walle <mwalle@kernel.org>, 
	Alex Elder <elder@riscstar.com>, Daniel Thompson <daniel@riscstar.com>, 
	Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>, linux-pci@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 22, 2026 at 6:19=E2=80=AFPM Manivannan Sadhasivam <mani@kernel.=
org> wrote:
> On Wed, Sep 09, 2026 at 04:55:54PM +0200, Lorenzo Bianconi wrote:
> > From: Alex Elder <elder@riscstar.com>
> >
> > Add a driver for the GPIO controller embedded in the Toshiba TC9563
> > PCIe switch (and the Qualcomm QPS615). The device implements 35
> > GPIOs using two register banks: three registers control the first 32
> > GPIOs (20 and 21 are reserved) and three more control GPIOs 32-36.
> > GPIOs 22-24, 27-28, 31, and 34 are input-only.
> >
> > The driver is registered as an auxiliary device driver. The TC9563
> > power controller creates the auxiliary device and provides a regmap
> > that gives access to the GPIO registers, so the gpio-regmap helpers
> > are used to implement the GPIO chip.
> >
> > Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> > Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.=
com>
> > Signed-off-by: Alex Elder <elder@riscstar.com>
> > Co-developed-by: Daniel Thompson <daniel@riscstar.com>
> > Signed-off-by: Daniel Thompson <daniel@riscstar.com>
> > Co-developed-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
> > Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
>
> Linus, Bart, what is the merge strategy for this patch? Since Bart has Ac=
ked
> this patch, can I assume that this along with pwrctrl patches can be merg=
ed
> through PCI tree?

That works for me but Bart manages the tree and any conflicts would
be his problem so it's better if he says what to do. The MFD subsystem
ususally produce an immutable branch that we can pull in if something
would conflict, despite it nearly never does. I don't know if the PCI
maintainer does immutable branches.

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
