Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.27.42.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794070689;
	b=yfmYlquTP8u8BjP/bY+ZWP9Bk8TspJ32IgmPFMVfEBoW42nYw5irLkUI7IbDSy2qdM6U
	 ZOtX7iY/so8+s2v/Bihis6ow2a1WXf9igemHYLtViRDyXJ3wlxGSvRIGWu/6b+2RQ6jnc
	 FuCRUBX1g0o+DtsfUX6JwZSiJut0QP7lQ8EnOwgGZUZ/KaEHfdW43wcl9tahXURrDAZgp
	 dWn8kqhDpbubvFQ55Oj5jV04yPtVNfgRK1ErP98VEn6YHPzDO9/q+YxS6U3v61YcSKiB+
	 qxQ/Eznsp9SgYUaDiJZijYl1ht1l930/t7BH9jCQPk+vY3Un+g8PslHbkb2Cf3JsQIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794070689;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=J3tz+cSiafPLwvvRm44v5Y4E466QIE4boG9uIUbrsH8=;
	b=S9/w6P5ukoDHHmYkGwzOZ6Z8yxMPB3hDbpYN6YrD5CtBjCjRPLRzwg8lnwQS6UIxqAje
	 ZmlepDz1DtHVU/NQTZW9iV+Xn5j88PsKbhMoeJDXYfEDWYpNRQWqDB/Aqp1p34DjR4hFR
	 /s71YuAy7fixM7SjhTrJ1qQ3EVNT6G1VX11TSfVW+0roEUOEWAXqSpEWEat56makd5H69
	 iU9YbGzzNWRsSbC2P9i23fcKIlfd6LC5jEe5OBdVC2uybHjy3kOjZLCi43hVSTHC0xdvO
	 32dxuz/mP73Qj3jshyHZ2mPeEIWxgFFMVLMtu0QIi9jgg/GFpVYH1nWYVxjg15Ss1+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=free.fr;
	spf=pass smtp.mailfrom=free.fr;
	dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256 header.s=smtp-20201208 header.b=K6io2DjS;
	arc=none smtp.remote-ip=212.27.42.4
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E71A2606A32D;
	Sat,  7 Nov 2026 16:58:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E71A2606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=free.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=free.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr header.a=rsa-sha256 header.s=smtp-20201208 header.b=K6io2DjS
Received: from l3017727.home (unknown [IPv6:2a01:e0a:ac2:22b0:71d9:bc2b:4a47:20c2])
	(Authenticated sender: vjardin@free.fr)
	by smtp4-g21.free.fr (Postfix) with ESMTPSA id 7AF7219F5C3;
	Sat,  7 Nov 2026 17:57:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
	s=smtp-20201208; t=1794070680;
	bh=O13tiZdfp/UEGvWDyX95aSMMi3lIWkI/aVlJE/2wuXs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=K6io2DjSWYhFOZfsmOqsqU363wQkYaCYKDCLPsn1jo9U0yhsl/la94ukFdngDKeIg
	 CAswLnqCHWtAa+HWFrndk6DAUroYhIlRxK23ZEXOctOVb5LYKFtNqDkSBEPKvu/O5H
	 Rov12EgGF3LzvNgi8GwTlYCwSQ2CPRI9XBi1TkCzgyTImZMC2VUqeMtdGgN6b9GcDN
	 AXAVW5zFL1UBb06ZpBUsdUCBActaakISAv+M3SzoD23oIwniPG5CKbGDTEafInSNrY
	 2bHpKVrIyC2uDI+zmRR1KraZ8Uv8xPMk1AfFmMPs0dVYJd85cExToldBNf6uMu+LgF
	 JPjANULTh01Rw==
Date: Sat, 7 Nov 2026 17:57:39 +0100
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
Message-ID: <au9YgytCc4TKfETI@l3017727.home>
References: <20261103-for-upstream-lx2160a-rcw-pinmux-v1-v2-0-3aad0860b984@free.fr>
 <20261103-for-upstream-lx2160a-rcw-pinmux-v1-v2-4-3aad0860b984@free.fr>
 <CAD++jL=Np+_+wTkuLCiqjNY5EBqn5qq8zKTJB6F-=1G0R+7=Ww@mail.gmail.com>
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
In-Reply-To: <CAD++jL=Np+_+wTkuLCiqjNY5EBqn5qq8zKTJB6F-=1G0R+7=Ww@mail.gmail.com>

Hi Linus,

> Can this be applied separately once reviewed?

I do not see how: this 4th patch needs fsl_guts_rcw_read(), and
few other fsl_guts_*() which are from the patch 3.

There are the following cross tree dependencies / maintainer depencies:
 patch 1, 2: DT bindings -> to reviewed by Rob/Krzysztof/Conor, but bindings travel with the driver that uses them
 patch 3   : drivers/soc/fsl/guts.c -> soc/fsl, Christophe Leroy (via arm-soc)
 patch 4   : drivers/pinctrl/ -> pinctrl, (you) Linus Walleij
 patch 5   : fsl-lx216x.dtsi -> i.MX DTS, Shawn Guo or Frank Li (via arm-soc)

Could an ack of Christophe Leroy be enough on patch 3 to 1...4 could land into the pinctrl tree ?
Then, patch 5 could be managed apart.

best regards,
  Vincent
