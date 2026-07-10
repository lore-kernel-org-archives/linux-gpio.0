Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89090405C3E
	for <linux-gpio@vger.kernel.org>; Fri, 10 Jul 2026 10:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783678829; cv=none; b=Ssu/3YTMLh4aIuQM48KytOj90h/Thk40x3g3uVtvbQMUUllFKWv2tcsB5HxdUnOLXfeu5JRSYP9RLyn4BYg5uGwBQhgaOssYuZfvfsJAUKzBuEWBpza2Xgpr+IK7UXMEVQMLvaPHdtykT3J22WNwu+Oxqp3X4NYOYmCMO4BX6t0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783678829; c=relaxed/simple;
	bh=12QK2Ullzg+k27NNDQcc9C5GXSPfW0MrD00xA2zZm9w=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=IODURQVJw7203DqZiuUEwrh+yzRLMTKf99hmPk5shyHZLlLmSZH3tt8/M2+bBmmHP4BFn0uFu8UuciGCp0qIvAEJlCkK1j5/DRRG9ULEmT1VoCkNUDRMjQoN7ePRMxAjzo4dL+nKJ1e4K0OxOvOwuD5WfXt/MeGJcKE+LxQtnTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=oxjTFfTF; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="oxjTFfTF"
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20260710102024epoutp0473ad2d2f094963e2ca02a99ebbe080bb~A5nDFQ15f0551305513epoutp04L
	for <linux-gpio@vger.kernel.org>; Fri, 10 Jul 2026 10:20:24 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20260710102024epoutp0473ad2d2f094963e2ca02a99ebbe080bb~A5nDFQ15f0551305513epoutp04L
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1783678824;
	bh=PldIhv8wwqqstZVWCGURuCKJyfZtUw8rjeAUKONcvj4=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=oxjTFfTFEGJehIHn1HqSs3PlvSOqt39o3n9okDr3pTBHE2do+pLaFSGVMYn9+izOQ
	 5QVTxUhwgEE/Q+lbB2LLQiGPBk/O7nIM2TBsoHy62yX8TIIczj+OP0ERmSGHchXuPB
	 tiUJHQGe8JIsfAxrxxzesjfvhDRiVO/xQN+UL6sU=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20260710102023epcas5p195126fcfc955ad4b0793b4288f0f0350~A5nCkw2n00109301093epcas5p1k;
	Fri, 10 Jul 2026 10:20:23 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.87]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4gxSWp7194z6B9m8; Fri, 10 Jul
	2026 10:20:22 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20260710102022epcas5p42394ac6cf16a9b99596bcac370eba6f8~A5nBNjyNc0166401664epcas5p4_;
	Fri, 10 Jul 2026 10:20:22 +0000 (GMT)
Received: from INBRO002756 (unknown [107.122.3.168]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20260710102020epsmtip2c4aa0ce874eebe45785a71a2893b6f58~A5m-0qtdi2853128531epsmtip2O;
	Fri, 10 Jul 2026 10:20:20 +0000 (GMT)
From: "Alim Akhtar" <alim.akhtar@samsung.com>
To: "'Krzysztof Kozlowski'" <krzk@kernel.org>, "'Peter Griffin'"
	<peter.griffin@linaro.org>
Cc: <robh@kernel.org>, <conor+dt@kernel.org>, <linusw@kernel.org>,
	<linux-samsung-soc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
	<hajun.sung@samsung.com>
In-Reply-To: <9eb6b0ef-cbc1-4b2f-b607-986f28ec46ee@kernel.org>
Subject: RE: [PATCH v3 5/6] arm64: dts: exynos: add initial support for
 Samsung Exynos8855 smdk
Date: Fri, 10 Jul 2026 15:50:19 +0530
Message-ID: <14e201dd1055$b7173940$2545abc0$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQCQM7wiCxtRwyhZTDec7lkhalOHFwIex+rgAd5cQHMByjDVPgF/2VxQAn303Q+4shofcA==
Content-Language: en-us
X-CMS-MailID: 20260710102022epcas5p42394ac6cf16a9b99596bcac370eba6f8
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-543,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20260627165422epcas5p4e4c6bce0e2daa6d08a9ec18afde9ce0e
References: <CGME20260627165422epcas5p4e4c6bce0e2daa6d08a9ec18afde9ce0e@epcas5p4.samsung.com>
	<20260627171228.2687857-1-alim.akhtar@samsung.com>
	<20260627171228.2687857-6-alim.akhtar@samsung.com>
	<CADrjBPqYSTDExrBrYYf2z=23Ci8VqF9zXvbc+njDm1d4Ojrjrg@mail.gmail.com>
	<14cf01dd1052$4de88670$e9b99350$@samsung.com>
	<9eb6b0ef-cbc1-4b2f-b607-986f28ec46ee@kernel.org>



> -----Original Message-----
> From: Krzysztof Kozlowski <krzk=40kernel.org>
> Sent: Friday, July 10, 2026 3:30 PM
> To: Alim Akhtar <alim.akhtar=40samsung.com>; 'Peter Griffin'
> <peter.griffin=40linaro.org>
> Cc: robh=40kernel.org; conor+dt=40kernel.org; linusw=40kernel.org; linux-=
samsung-
> soc=40vger.kernel.org; linux-kernel=40vger.kernel.org;
> devicetree=40vger.kernel.org; linux-gpio=40vger.kernel.org;
> hajun.sung=40samsung.com
> Subject: Re: =5BPATCH v3 5/6=5D arm64: dts: exynos: add initial support f=
or Samsung
> Exynos8855 smdk
>=20
> On 10/07/2026 11:55, Alim Akhtar wrote:
> >>> ---
> >>>  arch/arm64/boot/dts/exynos/Makefile           =7C   1 +
> >>>  .../boot/dts/exynos/exynos8855-pinctrl.dtsi   =7C 574 ++++++++++++++=
++++
> >>>  .../arm64/boot/dts/exynos/exynos8855-smdk.dts =7C  32 +
> >>>  arch/arm64/boot/dts/exynos/exynos8855.dtsi    =7C 204 +++++++
> >>>  4 files changed, 811 insertions(+)
> >>>  create mode 100644
> >>> arch/arm64/boot/dts/exynos/exynos8855-pinctrl.dtsi
> >>>  create mode 100644 arch/arm64/boot/dts/exynos/exynos8855-smdk.dts
> >>>  create mode 100644 arch/arm64/boot/dts/exynos/exynos8855.dtsi
> >>> +       =7D;
> > =5Bsnip=5D
> >>> +
> >>> +       oscclk: clock-oscclk =7B
> >>> +               compatible =3D =22fixed-clock=22;
> >>> +               clock-output-names =3D =22oscclk=22;
> >>> +               =23clock-cells =3D <0>;
> >>> +       =7D;
> >>
> >> Small nit, but I believe oscclk node should be ordered
> >> alpha-numerically by the node name. See
> >> https://docs.kernel.org/devicetree/bindings/dts-coding-
> >> style.html
> >>
> > Thanks, will update in v4
>=20
>=20
> The node feels ordered, no? clock before cpu?
>=20
Right, =22 ordered alpha-numerically by the node name=22

Krzysztof, do you want to send v4 with all the reviewed-by tag collected?=
=20


> Best regards,
> Krzysztof

