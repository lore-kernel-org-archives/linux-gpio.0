Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.27.42.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794650818;
	b=yZzOC8axm6D968Fw3bXEM8GX21AL8yZDxxtuu+CGx4wXwbPXSE3H68R6j3b9euKbgMZX
	 gJyLCyQqDW6WIEmUdAVk+wmpzTNh6xlwrElF66BB7TLQskAzJTu0klMcE1xA7+ozxbFV1
	 KgHEk+SxzP2NuR0gSejoy2hTlWnYKmrCX0kFClGFr9dnuFhPuu7dD8UZdMefZmmzXzePT
	 J38IdADP9Eq1JTikBFCH84TqPRnvH+AawNhYeuH+phlHsd0Ot2ScLKDhcH3WEgJn3JaNu
	 RpGYBAILye7W47Rt0sAAQD2RDo3wdiFO8sgSChR/dSd0pqWw6nu4AhpzqJu0oORw9yQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794650818;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=nA9uVd9Z0U/OOJAJirWA9SKPkRY0C9MO6GKy6l0PlO8=;
	b=UBE7zTkPPM7gerlJsFE2Vj8ImBaItNGZkfsEap43lWONRX4lDWI4rg3Db6iqA+UyJvyr
	 yMLb2Ihutt4xTmgRqumDF9ENpU3qUdz5AVei7p1SJ7Lgi1TnV1D7JJsI8i91F4IIgwKmW
	 fJAoXMr6WDcKfQTPH/RfItd/JQ3gPz/MTaK/nvxzWV9fbV/NfJ76Orq7qQlbD1BNiY6dG
	 p4yMqoQ+jbRZMCwdpbnMSHBv1PFhmHy96hsow1yrVWC4eUVE4oa2bfjMdoSDKxNRyy3qK
	 KtVWhzTld6SxXNfBlr40nDV4JR07iImolWEkMBmIVGKzRJVsiZDSdLiymoNjl2eQ56w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=free.fr;
	spf=pass smtp.mailfrom=free.fr;
	dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256 header.s=smtp-20201208 header.b=AQuAO0+L;
	arc=none smtp.remote-ip=212.27.42.4
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15FA5606A331;
	Sat, 14 Nov 2026 10:06:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15FA5606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=free.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=free.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr header.a=rsa-sha256 header.s=smtp-20201208 header.b=AQuAO0+L
Received: from L30177.local (unknown [78.241.242.250])
	(Authenticated sender: vjardin@free.fr)
	by smtp4-g21.free.fr (Postfix) with ESMTPSA id BBAB619F57E;
	Sat, 14 Nov 2026 11:06:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
	s=smtp-20201208; t=1794650809;
	bh=g0Aj3QD5cJIwmcGFVWYqEOdOoEhMM0NOddv6KOjkgb8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AQuAO0+LZLEF/gQfONel9daJSQ5G+M95vDYtU9EaA81yx0jCh7xMnXqRLFgMJBU9K
	 jeOuqebH4GbanWCKhqhNViberAirFwC36UCWL77DI4wzGunWvC5L7kd1A0VyS2kvzv
	 q1ANqthOBT7i5HnPa6QJVVK1pWT8laUcldqzv5BvOYFdmwEkhliKxq6HWuLnNMJnJc
	 J8eEOBvLyLi+Grsj+LX16XZw2uVEhzq42HFUCJbHMBREzYGMMPbyL5n5bG1NIAiQIT
	 vS8liQaaogXWcElLIw2rjPZBVMty3c9qR5g6YqYGv9+CHx13rwb+N4Vuk3Kbvb3lis
	 Dt0bnTZBHj5YA==
Date: Sat, 14 Nov 2026 11:06:22 +0100
From: Vincent Jardin <vjardin@free.fr>
To: Linus Walleij <linusw@kernel.org>
Cc: Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>, Jacky Bai <ping.bai@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	NXP S32 Linux Team <s32@nxp.com>, Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev, Vladimir Oltean <vladimir.oltean@nxp.com>,
	Ioana Ciornei <ioana.ciornei@nxp.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Subject: Re: [PATCH v4 3/5] soc: fsl: guts: add the RCW override of any RCWSR
Message-ID: <avgynp6NS1u2-2Qv@L30177.local>
References: <20261114-for-upstream-lx2160a-rcw-pinmux-v1-v4-0-eefcea066a55@free.fr>
 <20261114-for-upstream-lx2160a-rcw-pinmux-v1-v4-3-eefcea066a55@free.fr>
 <d0f781bf-a325-4eee-9431-7eb387279934@kernel.org>
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
In-Reply-To: <d0f781bf-a325-4eee-9431-7eb387279934@kernel.org>

Hi Linus,

> Acked-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>

With this ack and the reviews from Rob and Frank, my understanding it
that the patches 1 to 4 can go into the pinctrl tree, while the
patch 5 can go into Frank's tree once the driver is in.

Am I correct ?

Thank you,
  Vincent
