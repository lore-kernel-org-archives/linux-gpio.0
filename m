Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B82A230566F;
	Mon, 17 Aug 2026 04:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786940712; cv=pass; b=D1/ACbBojr6tkHJF4kBW7ok1l96KwlsP6EHQmujxYzITXgb0SO8itfgYNkrJqqgn62vYc03WJU5L1t/JGOUjpBMazQABRHLkeY+cBQGyHX3B6ed4K99nv0T70h4Y3hwOQhDBuAHyOR9/ornrNYVIrer5WpYfnXJgQXEf3vJ+5Kg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786940712; c=relaxed/simple;
	bh=tj/YUrP0Y20IM9wcPZHGiH136Mn0RSuTkslJFuKAkY8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Eb3/1G0bX2J8DKHF+3VmDZJ4Ofe1ewkELu1LM2b7Ra2BO749n+D1pLE3aBrX3xY6knZRTH5d7I0xix+D9F5YRP8uiIXlcG1WRDS302QOqG/CZlNm426obnXAv1yedJ7/D/eH66jPCu/F2WEXsWMNGFwRQwDK4DzT/ItaMqQ0TnY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=icenowy.me; spf=pass smtp.mailfrom=icenowy.me; dkim=pass (2048-bit key) header.d=icenowy.me header.i=uwu@icenowy.me header.b=HT7ksXPE; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=icenowy.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icenowy.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icenowy.me header.i=uwu@icenowy.me header.b="HT7ksXPE"
ARC-Seal: i=1; a=rsa-sha256; t=1786940677; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=KzI1Y4GT+H6j9FEFK0hC47a08RldjqCxo5u3mTr9qqfKlDZVmoOyUfrXICQG2NwgpZ8FE+Ubh+4UDRciq9CJeHPkxgDzNKgqBl/Yc7CnKd5BKlAw4d8eyYUrBtYaF88x0PBTj8ufzJawkNoFIx2YqR47wv0jdVR13M5opHN3mhk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1786940677; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=ZSlZwiisO+mhc+1mZ7YoDuogysbfOwIRDw36DrAX+ww=; 
	b=Aj1FAqPjgK//aBsflzglzkpsIq1CFmmkhwPTMRpw8QY3komjD3d3hIFDz+1EsBOYfH43VRJlBf9SdcMhp3oZJbu88LJtuRVSJKCyJH4uxcb9TCDkt82Exeu41HlBHQTR8YovOzeK73oE61S/5rHI8AKlD9pRVkfAOu1DIjGsbW8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1786940677;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=ZSlZwiisO+mhc+1mZ7YoDuogysbfOwIRDw36DrAX+ww=;
	b=HT7ksXPEC2RKhnKUehEHLxm7khUfsKuBuVPRjd073C8/12ktpJHyDz4j/gGZbo+E
	xPufyVRRYjkXwSygr+EjDBIKq7Cneonu+it5XdiRURMqzCd00KOV1RUnr0Q+8Rr9hAq
	SDqkRDksgLZ0Au33T6acXvJzZnKPLb64VCWYYOk8XPr4MFvfBrrbD1bj4ZyxrFrYsIb
	JhW/c+XIqKuZdn0SOuq4cjJYIPxfaLpY055c118UZ/XMuDkgTyVeQBYwoqlY3dyPNhE
	FM0owtXUDG+0pC1nV9lQrAKteqTvnCOwyctLIoky65KZgPjh8kJvDOP9Tmep2u/Szpn
	HErGxyxb/g==
Received: by mx.zohomail.com with SMTPS id 1786940674891707.3346436865633;
	Sun, 16 Aug 2026 21:24:34 -0700 (PDT)
Message-ID: <3f0268a19aab46d602dffc9e14fc6683af7a20cd.camel@icenowy.me>
Subject: Re: [PATCH 02/12] clk: thead: th1520-ap: add support for MISC
 subsys clocks
From: Icenowy Zheng <uwu@icenowy.me>
To: Drew Fustini <fustini@kernel.org>
Cc: Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, Michael Turquette
	 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring	
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley	
 <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>, Neil Armstrong	
 <neil.armstrong@linaro.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>,  Paul Walmsley	 <pjw@kernel.org>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou	 <aou@eecs.berkeley.edu>, Alexandre
 Ghiti <alex@ghiti.fr>, Jisheng Zhang	 <jszhang@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, 	linux-riscv@lists.infradead.org,
 linux-clk@vger.kernel.org, 	devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, 	linux-gpio@vger.kernel.org,
 linux-phy@lists.infradead.org, 	linux-usb@vger.kernel.org, Han Gao
 <rabenda.cn@gmail.com>, Yao Zi	 <ziyao@disroot.org>
Date: Mon, 17 Aug 2026 12:24:26 +0800
In-Reply-To: <aoH9cvTC8vD4NYpB@x1>
References: <20260507081710.4090814-1-zhengxingda@iscas.ac.cn>
	 <20260507081710.4090814-3-zhengxingda@iscas.ac.cn>
	 <aier9XppLeCkJydw@thelio>
	 <93b867c1b7f5526cc25cb04f838432cd752f5981.camel@icenowy.me>
	 <aievi0s-3SO8hV6a@thelio> <aijpEqzJ7fM7rGMH@thelio> <aoH9cvTC8vD4NYpB@x1>
Organization: Anthon Open-Source Community
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ZohoMailClient: External

=E5=9C=A8 2026-08-16=E6=97=A5=E7=9A=84 11:12 -0700=EF=BC=8CDrew Fustini=E5=
=86=99=E9=81=93=EF=BC=9A
> On Tue, Jun 09, 2026 at 09:33:22PM -0700, Drew Fustini wrote:
> > On Mon, Jun 08, 2026 at 11:15:39PM -0700, Drew Fustini wrote:
> > > On Tue, Jun 09, 2026 at 02:01:43PM +0800, Icenowy Zheng wrote:
> > > > =E5=9C=A8 2026-06-08=E4=B8=80=E7=9A=84 23:00 -0700=EF=BC=8CDrew Fus=
tini=E5=86=99=E9=81=93=EF=BC=9A
> > > > > On Thu, May 07, 2026 at 04:17:00PM +0800, Icenowy Zheng
> > > > > wrote:
> > > > > > The TH1520 SoC contains a MISC_SUBSYS clock controller,
> > > > > > which
> > > > > > allows
> > > > > > controlling of USB related clocks and MMC/SD controller AHB
> > > > > > bus
> > > > > > clocks.
> > > > > >=20
> > > > > > Add support for this clock controller, in order to enable
> > > > > > USB
> > > > > > support.
> > > > > >=20
> > > > > > Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
> > > > > > ---
> > > > > > =C2=A0drivers/clk/thead/clk-th1520-ap.c | 64
> > > > > > +++++++++++++++++++++++++++++++
> > > > > > =C2=A01 file changed, 64 insertions(+)
> > > > > >=20
> > > > > > diff --git a/drivers/clk/thead/clk-th1520-ap.c
> > > > > > b/drivers/clk/thead/clk-th1520-ap.c
> > > > > > index 3a6847f1c950f..24f785f0b329a 100644
> > > > > > --- a/drivers/clk/thead/clk-th1520-ap.c
> > > > > > +++ b/drivers/clk/thead/clk-th1520-ap.c
> > > > > [...]
> > > > > > @@ -1609,6 +1663,12 @@ static int th1520_clk_probe(struct
> > > > > > platform_device *pdev)
> > > > > > =C2=A0			return ret;
> > > > > > =C2=A0	}
> > > > > > =C2=A0
> > > > > > +	if (plat_data =3D=3D &th1520_ap_platdata) {
> > > > > > +		ret =3D devm_clk_hw_register(dev,
> > > > > > &usb_suspend_div_clk.hw);
> > > > > > +		if (ret)
> > > > > > +			return ret;
> > > > > > +	}
> > > > >=20
> > > > > Should usb_suspend_div_clk.hw instead be registered under
> > > > > 'if (plat_data =3D=3D &th1520_ap_platdata)'?
> > > >=20
> > > > Do you mean misc_platdata?
> > > >=20
> > > > Yes, this is an copy-n-paste error that deserves a fix.
> > >=20
> > > Hah, yes, I also had a typo :)
> >=20
> > Assuming that gets fixed in the next rev:
> >=20
> > Reviewed-by: Drew Fusini <fustini@kernel.org>
>=20
> I will fixup the typo and apply to thead-clk-for-next once 7.3-rc1 is
> released.

BTW I think the binding patch should go through your tree too.

Thanks,
Icenowy

>=20
> Thanks,
> Drew
