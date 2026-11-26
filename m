Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.27.42.3
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795718536;
	b=bhoTa0cgEXDrweE426/ACDmUpsKaHQAsFpI+E9vu8/Sj2uJG++A3ckp1Srlv8/3OQrQ5
	 7RVJPaB65//wRgRfwtcpVEgfERiUfwVdSVhs4uVVWWhZISJ6zB3Qx5LIN2qaBJH1Oqdkn
	 ISLbClJbQ0kqhS6S2nrNpMIkbq9fjfBVgCpvTscwbR5PBjLz88RDYOkGAUkd1SOFdx+1p
	 AjSX1SHkv5MVukxEliuYuy9OKXxSVy1mLTBX1YsS6liWgMnH/akzmJi0KY1Unok1C1PI/
	 /uKS24Yr1J0uwCU8WaWY3pQ1geXuUW1JKKIj6JhpXj+r4Gl/Dq63DKBkYpJHHPzYPoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795718536;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=TmIlGqYRKL1N0DbrflYbwLWHTPbsYPsvR4Gqt4JhWS0=;
	b=ziK6gDDPR/kklxgAUnT4/XyVAsJn0ubTODnU9BGOskZ7yyZXiG+u/EOyne8J/1n12Qyo
	 nKwKe2I8RS/QaS2/X+qqXw70dR0/2EgUAqcA65c5PwhUx6O1H5Doq6DUJmOOiJ74KUFZp
	 c2Wjo9KreSfKtloNCMTIIPBJCP5jQULLhtWhUr2+/AmsK40oi9WmHAQEKB7v3wGcALvzr
	 QuWlX31Q6ZTkgn3comSa0srnzeFgUF4/QkORd1lcRQeHcjoHS3aecbcm3I3l6PM3w5Ujz
	 gnYklno3IIeScosbbTJXp6Q0R3hYcILAhnQdO19AUrMSZdC9IXQIsXRdjijvo0aDr5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=free.fr;
	spf=pass smtp.mailfrom=free.fr;
	dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256 header.s=smtp-20201208 header.b=Aa6U7TmI;
	arc=none smtp.remote-ip=212.27.42.3
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87D69606A31E;
	Thu, 26 Nov 2026 18:42:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87D69606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=free.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=free.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr header.a=rsa-sha256 header.s=smtp-20201208 header.b=Aa6U7TmI
Received: from L30177.local (unknown [78.240.251.125])
	(Authenticated sender: vjardin@free.fr)
	by smtp3-g21.free.fr (Postfix) with ESMTPSA id 60E9A13F8A7;
	Thu, 26 Nov 2026 19:41:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
	s=smtp-20201208; t=1795718527;
	bh=RdqlfcRYRyRN/alGMnwzCeIIWGVeJlTeO4EFT1U28HY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Aa6U7TmI2pqdSQbqnVAZ9wKX17hNwrxb7sJCGV9smHxFQfk8SZWDVGYgaykp5Bf+o
	 Opuxeg1dm6O2Towg5dhvaWuHtmKMVxBIpCDJOJUzALDj0tAlCADAWMldG++WYO4dsN
	 tDKK5u0vaKg0Hh0rViFgV+Z7rXpZrG6kvHPnaxKg9+faXcARzsIOmnPngTAZJ1RQeY
	 AZKeO66aAoBCbr2OWpSffyoctoL1hHR+Y9O5W9fT+//ct768q/Pc8Nn2hEz+EkLXrS
	 fh+6gnFi83iGV1NNb8Hvel5dZrW6Ix3LBfLHl8lPGGBHCoQYeaY5+SmE2AeSVI3HwU
	 ecFfi6TA2wvLg==
Date: Thu, 26 Nov 2026 19:41:40 +0100
From: Vincent Jardin <vjardin@free.fr>
To: Linus Walleij <linusw@kernel.org>
Cc: Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>, Jacky Bai <ping.bai@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	NXP S32 Linux Team <s32@nxp.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev, Vladimir Oltean <vladimir.oltean@nxp.com>,
	Ioana Ciornei <ioana.ciornei@nxp.com>
Subject: Re: [PATCH v8 0/6] lx2160a: change the pad muxes through the RCW
 override
Message-ID: <awh9ZB5V3vG0gg4S@L30177.local>
References: <20261118-for-upstream-lx2160a-rcw-pinmux-v1-v8-0-d01bc837593e@free.fr>
 <CAD++jLnRWZrLfyBGGOikx_eeYXirahuB7E7yuDhB6KoSAQoA5w@mail.gmail.com>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAD++jLnRWZrLfyBGGOikx_eeYXirahuB7E7yuDhB6KoSAQoA5w@mail.gmail.com>

Hi Linus,

On Thu, Nov 26, 2026 at 01:53:00PM +0100, Linus Walleij wrote:
> Once the review is complete, can I merge all patches except the DTSI
> patch through the pin control tree, i.e. does it have the right ACKs?

Yes for patch 1/6 to 4/6, however, I believe that 1/6 needs an ack't
from a DTS maintainers. The status is the following:

- 1/6 dt-bindings: pinctrl: Reviewed-by Frank Li and Vladimir Oltean,
  but TBC if any DTS maintainer Ack, is needed ?

- 2/6 dt-bindings: soc: fsl: Reviewed-by Rob Herring, Frank Li and
  Vladimir Oltean

- 3/6 soc: fsl: guts: Acked-by Frank Li (fsl tree) and Christophe Leroy,
  Reviewed-by Vladimir Oltean

- 4/6 pinctrl: Reviewed-by Frank Li and Vladimir Oltean

Regarding the DTS, if my understanding is correct, please,
Rob, Krzysztof, Conor: could you have a look at 1/6 ?

Then, the two DTSI patches, 5/6 and 6/6, will go through Frank once 1/6 to 4/6
are in your tree, as he wrote:
   https://lore.kernel.org/all/awebHKtul2FHepc7@SMW015318/

Thank you,
  Vincent
