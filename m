Received: from mail-08.mail-europe.com (mail-08.mail-europe.com [57.129.93.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D494533F360;
	Sat, 13 Jun 2026 10:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.129.93.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781346032; cv=none; b=rCchKc4Q9xZhR0N5SijOhM9z8hqBqFpq34CKnO8bwTgPPy+2O94GyLzWQZroPBTCYQxzb7Fcyt9so5qYD7/azlZxJbpHmO70w17ViSdPsQLM8TwxxVBYLZtjFWWDhYW4BNkJS5Mzc5VW+oqHA+Va4g1Nj3wSy+1GhrmBYnJtj4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781346032; c=relaxed/simple;
	bh=ko5UWYVVjvjr748SyWZ1mgjUtAFia/tKl7hCGMvdA/w=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bPNHZpyQ5D9ycTj121BgLkZkwqIbF3dSVJqNkxaWqNP7cGhkL5aaFYDAxlsFUird7oMc3vr8ugwML3982lXNmfgfdZWI/YwGr+wO4qHLYKC/dpKL+1dwK4fJ9qhnUALKj+d3Yg01oQNnI/gjY1QP0KKKQDaAzcb+te3uFbeUVAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=h4Idtran; arc=none smtp.client-ip=57.129.93.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="h4Idtran"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1781346014; x=1781605214;
	bh=Q74DfFMJGIf43h3oG0AaLzcz+fNjnLU10vcumudtGPU=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=h4IdtranjLetTUOBYNFCtKZrpcVlKvaVpaSOmd/8APazXezroN577JvQezid6+eIn
	 k9PZutTzzHO0TxhLBx3/vRK9YVgUlxLFlN+Sa9OO9LT6birHINfK4jzf/AXvB+nrAo
	 t7Y1jaJHDk29YH+iyMkyshEx7MaCkRJdDrtkhmBr4/4qZ7OvbrBjDnQvePODJJJnjQ
	 shebYd/6/akaMoggm1FE2Dqnrb8yK0ztISMxX97RQIMVvoCZPjiYPDQU0AdwZHndQr
	 uudKj2FHIcqrwKFc+aBiuzbQ9vuOg440f27fcU7hAH9AcMqxDolfzchfyzpycyJ1oP
	 m/Hs8Cch8/SyQ==
Date: Sat, 13 Jun 2026 10:20:10 +0000
To: Linus Walleij <linusw@kernel.org>
From: Yassine Oudjana <y.oudjana@protonmail.com>
Cc: Yassine Oudjana <yassine.oudjana@gmail.com>, Sean Wang <sean.wang@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Andy Teng <andy.teng@mediatek.com>, linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v8 6/6] pinctrl: mediatek: Add MT6735 pinctrl driver
Message-ID: <PjcK3j_TxnXwwBQ8ATPAPOO6LJl5b0Laa_6eSBTVfEfqsxIcaeDEVS4q4UkvGQA7CLQbuGxopLF6p3eIh1JAIDTkPFIgwp-hVP-fex_WEqU=@protonmail.com>
In-Reply-To: <CAD++jLkA3v0RD1skaanqqG2eN8JLivUQPrYdK+hbX1YhQBgKqw@mail.gmail.com>
References: <20260530145800.1029920-1-y.oudjana@protonmail.com> <20260530145800.1029920-7-y.oudjana@protonmail.com> <CAD++jLkA3v0RD1skaanqqG2eN8JLivUQPrYdK+hbX1YhQBgKqw@mail.gmail.com>
Feedback-ID: 6882736:user:proton
X-Pm-Message-ID: 23bbe0e76ed880a27521d811693ae6c5ed41470b
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Monday, June 8th, 2026 at 9:41 PM, Linus Walleij <linusw@kernel.org> wro=
te:

> Hi Yassine,
>=20
> thanks for your patch!
>=20
> On Sat, May 30, 2026 at 4:58=E2=80=AFPM Yassine Oudjana
> <yassine.oudjana@gmail.com> wrote:
>=20
> > From: Yassine Oudjana <y.oudjana@protonmail.com>
> >
> > Add a driver for the MediaTek MT6735 SoC pin controller. This driver
> > also supports the pin controller on MT6735M, which lacks 6 physical
> > pins (198-203) used for MSDC2 on MT6735.
> >
> > Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
>=20
> Sashiko has good comments on this driver, look into them!

Didn't receive any comments and I don't see anything on the mailing list
archives either. Am I missing something?

>=20
> > +config PINCTRL_MT6735
> > +       bool "MediaTek MT6735(M) pin control"
> > +       depends on OF
> > +       default ARM64 && ARCH_MEDIATEK
> > +       select PINCTRL_MTK_PARIS
>=20
> There are in-flight patches to make MTK drivers tristate for
> the Android GKI. Do you want to use tristate for this driver too?

Sure, doesn't matter much to me since I'm always compiling it as built-in.

