Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.27.42.6
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794927477;
	b=uTjNN6TW+zIIv1ENvK170CzHZ4I0xSrD1OceHTHF+wnpbhzZHNaPwh1BSn0GuR7iOri0
	 6zx8idSpFcdhj+FXr++YJO1M4tnFmF6hiltWR6shj3jYQ2u6BXOKv50jVkCT12zGXx4Bk
	 I4mdTdxInHY2HLAF5rlKdNFFmQolrFgRF9JnNW71980587D68U+hiOy5KlF6UJ8ly1M/P
	 EYk0fJgHHTASPDu6nz8MyKgWZetCyEtm+Ea27l7IGsj/oO7F49eJ+jinMLaeJFWpQoRyD
	 U4W0QEBSTlR/Nz9G2+s0qZu6jo06wP4tIpDjVQikr5IzUOrIH8pVfAlp/bvx3LbXPeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794927477;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=s6kZBCjfiQkhSEJV2Z1jyMjdsrciCZ6ttNX5JGYKx+4=;
	b=bEHKnEI7ie6ARrxV1jbDzUtbq24WfytusFf4ZvL0nvjml1AVlGyV4/+PITS8qdLkwlQX
	 rEamRGZDuYo0APNK5kQVAltvuNCLCp5+TcMkcSiLDaZ2/omQyTgOKxxr8pwpKQWn34NAD
	 nibuVGhMJjkd/1LLiYiVSs0v+YEkaFaPzdrWIxAJiYnsfQFAJar9MSHYjja+r/BPBku4p
	 2RI/mfKgHd0eAfN5HP2p/fmhzoeaYlXyb5Cc9Al4Tp+JC7iYIYUgpO/fgTOvXL7o1hA5x
	 NYm0vYPkTAKp4TzgaEfVnH7K/n0jGsyx0R6X1yQWclkGccthblw7laQInWV9P3jlQPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=free.fr;
	spf=pass smtp.mailfrom=free.fr;
	dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256 header.s=smtp-20201208 header.b=agZnjsJQ;
	arc=none smtp.remote-ip=212.27.42.6
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1E05606A883;
	Tue, 17 Nov 2026 14:57:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1E05606A883
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=free.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=free.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr header.a=rsa-sha256 header.s=smtp-20201208 header.b=agZnjsJQ
Received: from L23803.iliad.fr (unknown [213.36.7.12])
	(Authenticated sender: vjardin@free.fr)
	by smtp6-g21.free.fr (Postfix) with ESMTPSA id 3E5A5780510;
	Tue, 17 Nov 2026 15:57:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
	s=smtp-20201208; t=1794927467;
	bh=Kxv9zLHW2Eb4osegyxsTaFPBbgAIfUoYui4bAAK2XVg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=agZnjsJQLzDfu3kiyhn9g9Sy0L9RXmaKwOcrWY/ydd2lvFoEG5S9tDXomzsdJ1VXJ
	 6Efhw+DDCL3WoiHk12XxonGtBUnHIhNCazNoTIrzAfuRtLZMQQFyFcu2UHxCjLQADB
	 hScFR3JbvNWUVxSXxsCfq5BXGNYwnbuxoKWlRjpizBFRUIXTETgyq8CAW+oQJUDFJy
	 /SsNK4xGmX5TYhdANwCFD9lfsmUCExQhiLbR3ofnBYnQDvbmme3MajAzHttOMQiJ/1
	 jY160eWve0YCnHZLGap/GtTdoe2QJs23ebh3cXWuKGWKBwbQ7Bl+Hhl8kUsHfU0Tru
	 O8KB8MTr4ysWA==
Date: Tue, 17 Nov 2026 15:57:23 +0100
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
	imx@lists.linux.dev, Vladimir Oltean <vladimir.oltean@nxp.com>
Subject: Re: [PATCH v2 4/5] pinctrl: freescale: add the LX2160A RCW pad-mux
 driver
Message-ID: <avxrU7frfDp6HeF0@L23803.iliad.fr>
References: <20261103-for-upstream-lx2160a-rcw-pinmux-v1-v2-0-3aad0860b984@free.fr>
 <20261103-for-upstream-lx2160a-rcw-pinmux-v1-v2-4-3aad0860b984@free.fr>
 <CAD++jL=Np+_+wTkuLCiqjNY5EBqn5qq8zKTJB6F-=1G0R+7=Ww@mail.gmail.com>
 <au9YgytCc4TKfETI@l3017727.home>
 <CAD++jLnWcVDbh-vf20w4nfvOSZik619XqoEjXTBZ29sJkX-bCQ@mail.gmail.com>
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
In-Reply-To: <CAD++jLnWcVDbh-vf20w4nfvOSZik619XqoEjXTBZ29sJkX-bCQ@mail.gmail.com>

Hi Linus,

> > Could an ack of Christophe Leroy be enough on patch 3 to 1...4 could land into the pinctrl tree ?
> > Then, patch 5 could be managed apart.
> 
> OK let's try to do it like that.

ok, recorded into the serie 7, but then it should be patch 5 and 6
  https://lore.kernel.org/all/20261117-for-upstream-lx2160a-rcw-pinmux-v1-v7-6-5d7201970629@free.fr/

best regards,
  Vincent
