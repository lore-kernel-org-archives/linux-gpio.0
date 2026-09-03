Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4546E39A070;
	Thu,  3 Sep 2026 09:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788427930; cv=none; b=IPwft5DEc8JV4XJQ33smHrOWPN7s7J8dhXNyxmkAdJPKtX/ijn+i3ZcYKVROxtottn+Z6PtX0QRXMH67ne6yiExKzTa9fKMHfLMJiShnzV3vbbuyUMfHXjpe1pcOx5iMkimJwrbKj4AbTc7CvqxGgl9u+3P8CYD3MwAyNZ84f40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788427930; c=relaxed/simple;
	bh=pfH9mQvLNVY4phDf/hhUwui/efTa85nJBtOgspLvbQw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ic2EGy7shkJX6aL6nxgFV4oMd1j7YFSC/hDIs/EbxD5cKwQmaS9dCi3SW/aER0bT5ZcXhvn4PLKOA4ruxoj9xtNlnNDjd+HAzVHW6avpL8mo41P+haLKlpZiUV7M42OK21HqWsTOUQfEyXt68wXg6K/gMuHoKqsvJA4BNwQq7I8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aPdkMDYg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aPdkMDYg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6EA41F000E9;
	Thu,  3 Sep 2026 09:32:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788427928;
	bh=pfH9mQvLNVY4phDf/hhUwui/efTa85nJBtOgspLvbQw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=aPdkMDYgyrUlKs9L7JR9DUIfvvoJ+fbBsEmvZTWs2buAZTTCj57ryIRWCtNIVEYp3
	 STBr6CnV3TntagkIcZbPxrvbhiHhFkhtoyJ6UNFK2kCfZ8x1HLLveWk9vLBH8rLNDs
	 uJXcKNZVpRzk0j/MkWS2YUViWTybv3Jz0oUQS3QCs9VpujMZryMVa0GT0oWTjloA9h
	 vG/8fNe9gvXZ8nzT93ycgpnrweevEEwqWNc0nyOtSv/shmKYuJ74I8KYKsTDfsNdIO
	 iF2ypOsoCty51lGBnx7TQBDsp4F7R8P4Wn5sb1aZpd5In7/fUvev02KBPJOTsuSIcj
	 zMm8pmOMMsL2Q==
Date: Thu, 3 Sep 2026 11:32:05 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linusw@kernel.org" <linusw@kernel.org>
Subject: Re: [PATCH v1 2/2] soc: starfive: Add JHB100 UART Routing driver
Message-ID: <20260903-precise-diamond-loris-ae2da7@quoll>
References: <20260830065118.51551-1-changhuang.liang@starfivetech.com>
 <20260830065118.51551-3-changhuang.liang@starfivetech.com>
 <417251d0-c2cc-4e10-940d-b75ab20acdec@kernel.org>
 <ZQ4PR01MB12022D97EFD74D5A80DBBE34F2A92@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
 <5f99fc90-02e0-40ab-8d1f-c2e7bcce7a5e@kernel.org>
 <ZQ4PR01MB1202FB18CF51DB252C393D0FF2A92@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
 <20260831-dramatic-phrasing-beb1b360cd58@spud>
 <ZQ4PR01MB12029CCB91CB5673761C6F95F2A82@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <ZQ4PR01MB12029CCB91CB5673761C6F95F2A82@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>

On Tue, Sep 01, 2026 at 01:38:15AM +0000, Changhuang Liang wrote:
> > > > > I may have misunderstood something=EF=BC=8Cplease correct me if I=
'm wrong:
> > > > >
> > > > > I have found two subsystems related to multiplexing so far:
> > > > >
> > > > > /drivers/pinctrl and /drivers/mux. However, neither of them seems
> > > > > to provide a user-space interface for switching multiplexing valu=
es.
> > > > >
> > > > > Do you have any suggestions on this?
> > > >
> > > > pinctrl has some interface, not sure if writable, though. If
> > > > interface is missing, it should be added via such subsystem.
> > >
> > > Okay, this needs a bit more time for deeper research.
> > >
> > > >
> > > > >
> > > > > Also, could you confirm whether the implementation in
> > > > > drivers/soc/aspeed/aspeed-uart-routing.c
> > > > > is there for historical reasons?
> > > >
> > > > I supposed sneaked in without SoC maintainers noticing.
> >=20
> >=20
> > My first reaction when this flew by over the weekend was whether it sho=
uld
> > be in the pinctrl subsystem. I know there's no sysfs interface there, b=
ut I don't
> > even see an explanation for why changing this at runtime is a requireme=
nt.
> >=20
> > I'd have thought that each BMC would only have one host, and so since y=
ou've
> > got like 12 uarts there'd be enough for a permanent routing.
> >=20
> > Even without a permanent routing, the driver consuming the pinctrl shou=
ld be
> > able perform the switching (uart in this case) whenever it was needed?
>=20
> I can give you an example:
>=20
> BMC typically has a use case like this.
>=20
> When some customers use our SoC to design their own baseboards, in order =
to save=20
> I/O resources, they usually reserve only one pin, IO6, which by default r=
outes UART6=20
> to IO6 for the BMC console. However, sometimes when they want to check th=
e data=20
> from the Host UART (UART0), they need a user interface to route UART0 to =
IO6 so=20
> that they can view the UART0 data.

So the pin is physically multiplexed and user wants to change it only
form time to time? IOW, users accept that they will loos the BMC console
logs or host console logs the moment they switch the UART?

Anyway, as you pointed out there is already one code like this - Aspeed
- thus this is a second one and that makes it reasonable to make a
proper common user-space API.

Just like in entire rest of kernel development - we do not multiple
interfaces or frameworks per each driver, but use a common part. That
de-duplication is the biggest difference comparing to downstream
approaches and comparing to all the people tried to send us with
arguments "but I want to solve my problem" (if you disagree, then please
watch old Greg's talk: I don't want your code).


Best regards,
Krzysztof

