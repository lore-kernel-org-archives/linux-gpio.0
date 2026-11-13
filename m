Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.27.42.3
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794587973;
	b=UJA5H3oZJZt557ihdcFQHS+iciDtSMWIqGNnasC9UAiPh8Wniv9WF3hbQq/ngswirQmU
	 IpGBtyVTYwurJdOGT0l2FWnOtogrEL7pBvobtlakmsvNnaq8cOLEk4wDUWMcIfIuQCLds
	 mD3oHNyctNLQZXAG1ygK1A3DzhaFkIyZUC14CykYreDEDmcMDFdj+321XKmxgnSCuCnmY
	 fJSY+0tfpwum+2ElJ42n9EIkZKHZk0aoYUKbOXFYVXAiiUi+CedtPDWx7kh34jGU1Y1PS
	 Xdvn/PJAKOGw6vC03CqtnsUhMfMkus2f/Xl1FgzE85i1GAplGHkrF7p41tVqp0jNWog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794587973;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=ZIaozk2aBHaH1oFJEjjG6pq54xGfHGZXMiLG49FuxWM=;
	b=OCNriIX5sDAPrs96esMs2t5ekKzx22mVJGdLUJA+ys6fJhAnVe2Wg06gpHwP4ahDiNOg
	 H1r4Q1xFQmxjNTFV2C4ffpHjYWXX4Buua3Sc2u0yK/wS8fBphog5LWzx6lLEMNAZJ1fHm
	 UEqPrzXDatsmdvNYx3k75N0c58FbRhumjwXhLUY+lJWVbCqIEmBL79bulYkBwbTlwnqkG
	 rreNL3uU8x7tjH+8SRbcHM1QK76QO7qMAyX997Mgd2VQ/7ARsSlkoXsZHKT+HKwtx231C
	 tVG5PJJYE5Ldo+9C6bX2ynM2hV4HlmztURZETzwW6Xwdl7X1AHsZ1oHAmVx0LeWYFrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=free.fr;
	spf=pass smtp.mailfrom=free.fr;
	dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256 header.s=smtp-20201208 header.b=Y27pSlBF;
	arc=none smtp.remote-ip=212.27.42.3
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A0CD606AFE3;
	Fri, 13 Nov 2026 16:39:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A0CD606AFE3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=free.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=free.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256 header.s=smtp-20201208 header.b=Y27pSlBF
Received: from L30177.local (unknown [158.255.110.170])
	(Authenticated sender: vjardin@free.fr)
	by smtp3-g21.free.fr (Postfix) with ESMTPSA id ECC3913F8AE;
	Fri, 13 Nov 2026 17:39:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
	s=smtp-20201208; t=1794587970;
	bh=Nq5VMxuAxZkNVKKpbGt5VbkTDNOsTH++OiONsbi9n9A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Y27pSlBF6JC60hVZAj8IPVqa48C/9DgkKqOkQDESe2muCIMq1QiH0t2hpY74zGNor
	 OtZzOAz4r2ULrN4s+CBzg/XtDOlc9O89iXA+G0s6SUgY7mlQnzDErXQV+ELA5RNaVW
	 PK2PDB4K43IBDzZj9SO+65cyDlC491QsHI1NYeRwF/XtNGdaiyb8ChPIcKkIUVC2In
	 dvO1b1pdQocvaDngZ6qUQv0TZJtqExY4YIAmBF+5gHhlvome38PHRk5sKV9ag8cLbe
	 xkXCmw2A00qeLS/JkZrIUoxtz0CyY8rdsqNrklwxDAO/6T8FiPaISATPfhBBiQvTEd
	 tKScOcofIrrdA==
Date: Fri, 13 Nov 2026 17:39:05 +0100
From: Vincent Jardin <vjardin@free.fr>
To: Christophe Leroy <chleroy@kernel.org>,
	Vladimir Oltean <vladimir.oltean@nxp.com>
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
	imx@lists.linux.dev
Subject: Re: [PATCH v3 3/5] soc: fsl: guts: add the RCW override of any RCWSR
Message-ID: <avc9KbxQ4dxlibGQ@L30177.local>
References: <20261108-for-upstream-lx2160a-rcw-pinmux-v1-v3-0-5a0063f1da9e@free.fr>
 <20261108-for-upstream-lx2160a-rcw-pinmux-v1-v3-3-5a0063f1da9e@free.fr>
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
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261108-for-upstream-lx2160a-rcw-pinmux-v1-v3-3-5a0063f1da9e@free.fr>

Hi Christophe, or Vladimir,

Le 08/11/26 11:06, Vincent Jardin via B4 Relay a écrit :
> From: Vincent Jardin <vjardin@free.fr>
> 
> fsl_guts_rcw_rmw() only serves the SerDes lane modes. Export it for
> other fields of the RCW:
>  - fsl_guts_rcw_read() reads a status register
>  - fsl_guts_rcw_override() changes fields of one under rcwcr_lock and
>    waits for the status register to follow
>  - fsl_guts_rcw_override_supported() tells whether the DCSR view of DCFG,
>    which holds the override registers, is mapped

May I ask for your advise on this topic ?

I am looking for the review of this serie, then I'll adapt it
for u-boot along with the integration of Linux.

thank you,
  Vincent
