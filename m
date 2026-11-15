Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.27.42.1
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794743151;
	b=cPeNR1INnfnkPSEUZ8yHQMzhUmmCQup6fLJRbu0BPhLScQzUjV6hMRrez3GKIzZ4+bh0
	 BAWn5usqB7Hgv6ISgbOq9fIi9BawZhm1zKeCgtik+Ujm72hZqJPPRiP/hpvQw5J8hMY/5
	 AODROVyc0n4rQw4zAv/1jUX9R1y7yuYw1vj85sLRGOKThmiHPj1ZJK2KRwHQUsP0uVTtS
	 G/Ub8rW9F9ybw08LFa4xkk1hFiEZEHBogNPoLVahpvDEabhDnsMsnM6FwYu7R1cCJTd9B
	 Jrj3tCqx0iXxtsjuT9w5s4+5oanRQaIlF93mf8IqoqIdvg6YNW6e04mU3qAhrQTa7oA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794743151;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=8ZCc0kYbccT1j2j1nFYSj16fkgBLnDHoEzJYA6Hd1Dg=;
	b=j7xd1vnVx1fqHb88b8H8m7at+gEvVmnl0kXjd0N9h1pil3DJIl6Y5+v6rQnIkAyL4DB9
	 OU4MoCDKMm4qqN+giEajGj+pDkTndkFixvLQ6HTXYzb4lI5MhX7FhOelNJXDnsNl2tBtE
	 pvNi0oJKDC/T9CQgeg/pDTT0wElH8VwyW5PCqOaeR13mer0OUx8cxupizEzLgFvC+plfn
	 O3DbAieTf4cq8y9sUzJrCuitDnJM9efUPsaMkX3z7Yy/V+RXYeEL1UOyCo1E3fytzuZfo
	 4RL/ixbHXU4sUzcWjSyUoPKkhJSV9T4azgFpU/5wQlPQ23O8MiUIlEfsfLGtn6iO/Fw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=free.fr;
	spf=pass smtp.mailfrom=free.fr;
	dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256 header.s=smtp-20201208 header.b=ak4ncVZc;
	arc=none smtp.remote-ip=212.27.42.1
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2728606A31E;
	Sun, 15 Nov 2026 11:45:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2728606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=free.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=free.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr header.a=rsa-sha256 header.s=smtp-20201208 header.b=ak4ncVZc
Received: from L30177.local (unknown [78.242.88.98])
	(Authenticated sender: vjardin@free.fr)
	by smtp1-g21.free.fr (Postfix) with ESMTPSA id 4BB8AB0051B;
	Sun, 15 Nov 2026 12:45:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
	s=smtp-20201208; t=1794743149;
	bh=8W7U3lk1daoKKwP7PjlQ54EL6MrGZ5IE9j29Mm2B3/w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ak4ncVZcgW2qLwK9X4/zElIA1HMdni3U+8SbMT5UJn4dFCQlROXyKI8G9BQvCqj/C
	 85l6Z4oISGhzno9CeY6PTrTRE16V7rEvBAopAKZHId28/ngsYuwohsm5rhE03spsP4
	 nID1pNcGQt1JAF+7EOp6kDRnQEx8qPLR5JJB2oheBDRAzcy1WKl8vf3sph6+E6QF72
	 Oyjb3pyxSWpoFKCVmPAMDn5Eok8cg5T+kAEmQdHs7+LTQNZ+5guh1S2uQc3OBOUn5Q
	 6lMfFyadDcci1ncA09egoRaOrl0cflBClFU7y+lWlhikwoJ5lZuqMlNVeo3IrjQP72
	 SlnDToNGaCUuA==
Date: Sun, 15 Nov 2026 12:45:23 +0100
From: Vincent Jardin <vjardin@free.fr>
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>, Jacky Bai <ping.bai@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	NXP S32 Linux Team <s32@nxp.com>, Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev, Ioana Ciornei <ioana.ciornei@nxp.com>
Subject: Re: [PATCH v5 4/5] pinctrl: freescale: add the LX2160A RCW pad-mux
 driver
Message-ID: <avmbUyfeTd_VMSYH@L30177.local>
References: <20261115-for-upstream-lx2160a-rcw-pinmux-v1-v5-0-d246166ea469@free.fr>
 <20261115-for-upstream-lx2160a-rcw-pinmux-v1-v5-4-d246166ea469@free.fr>
 <avmX2HwOji6MBuhj@skbuf>
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
In-Reply-To: <avmX2HwOji6MBuhj@skbuf>

Hi Vladimir,

> Did you see my feedback on this patch for v4? Comments?
> https://lore.kernel.org/lkml/avjaK3cOj3iQ6G6w@skbuf/

No !, for some reasons, I did miss it..., thanks.

I can prepare a new serie to make it a bit more generic,
but I'd need NXP/your reviews for those CPUs, since I
cannot test.

It seems to be quite easy to update, I'll just
run some basic checks.

best regards,
  Vincent
