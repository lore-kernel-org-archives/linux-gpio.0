Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793389785;
	b=NHxW7lSwTvzRxTZi0GO1EdxUC2FziwoB+MF/+9FscHirVzKr6XOo8V8uf2fRy6yXUjzz
	 IE0zbOyLTSBcCAwcD1jinn8U/CQJ8Z0+uzy+9ix2S386zRYu/HO6nT1/GVl58WqgINlv5
	 vbZWsOOkzFYd/n09YF+ivf+vQIRNoGvzjIgeNQMIi5tZVK3nyG2uGqMPPYmPSh3r9IhII
	 8T8HZT1fnNaHTsmGfYjP8Tcu0/dHJ6vgUSr5ITs3FCYaHLyI8+6K8f9gheKSE3KI/AQ2B
	 ooYVN5SyVSekaYt/WIjDYbxhjUbhDEDjNsjeHo5e0H+GV9Ofu41tWErGp0MLfPvcZ6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793389785;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:
	 X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=tGRSe9LvYJDXqnyp9hHRUXYwQf0o1AOnoi+Z+9njJw0=;
	b=cmRtMCBXrWVNiMau2dTckQrSG5EgKcRhqbpZUKCKDoc4EtYEw0svWnD5Nd7MNeLVYrds
	 JhfaFjerx3hlWHtlnQNdznJE7gDJgg5QpYjORkDz+NKpJGG2cUXt5C6p+Fmny1STxr+Bh
	 MGb/YUcf2leV57x6JJwz26avWshFVVmk/rG0zEJxCiHQr04uIKQS5YV6+IEFveW0YsWNQ
	 L6RWC7h5MYE6mQ0lRaMxesP+3IQf9uzXbap8j/jyBNVgRTvWQzlsBnXDy+2ajXIxiU8tv
	 fbXOT38rQL/d4IHPpBtzMqkeheebez0Ng/KEl2I/DlxIjRrNdAZ4appBk7zXjFGoCmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=IokEpGXr;
	arc=none smtp.remote-ip=35.89.44.33
Received: from omta34.uswest2.a.cloudfilter.net (omta34.uswest2.a.cloudfilter.net [35.89.44.33])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB273606A326
	for <linux-gpio@vger.kernel.org>; Fri, 30 Oct 2026 19:49:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB273606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=IokEpGXr
Received: from eig-obgw-6007b.ext.cloudfilter.net ([10.0.30.166])
	by cmsmtp with ESMTPS
	id MqJpx5xx9aC0UMsbgxDOyU; Fri, 30 Oct 2026 19:49:44 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id MsbfxmH1CkE4RMsbgxTEWg; Fri, 30 Oct 2026 19:49:44 +0000
X-Authority-Analysis: v=2.4 cv=LuaSymdc c=1 sm=1 tr=0 ts=6ae4f4d8
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=M0FbrtG7MMAA:10 a=EUspDBNiAAAA:8
 a=yaG995DJD8wxKFCFxIQA:9 a=CjuIK1q_8ugA:10 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
	:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=tGRSe9LvYJDXqnyp9hHRUXYwQf0o1AOnoi+Z+9njJw0=; b=IokEpGXrQD0n5OejTKC1338Lv7
	nB2qbLUNlHV5stnP9rXGgDLsrG1BzzezifwGK+1Puq504s+/CK+qQZeSYHUy+fWe6vTpXRoNLCcG+
	xvj3fW0MOJ4Nzk1pmdgFcsYZ+Y7Q0K25aG5ngASEqC8zCK+3rmRE4ZqwKU0PVdKMHaqK+/Tcy7JVE
	KY7aoSpK4cWkeF0Qp5vCUmFXS84V+Ti3rKMhaw3CjyFBic+m/0+8CJAZmJkRiKE+zLuQv7G6Q29R3
	MG6D1JOrDScGhEV5WilZ+4rKPqslkRjJgFrVsJqNU3FmWJw5kITj11QQJk1KvoCLL1e7dmb7RY0D0
	PrjC/Iog==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:56876 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xMsbc-00000003tp5-2F1r;
	Sat, 31 Oct 2026 01:19:40 +0530
Date: Fri, 30 Oct 2026 12:49:38 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Yureka Lilian <yureka@cyberchaos.dev>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Hector Martin <marcan@marcan.st>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	Sasha Finkelstein <k@chaosmail.tech>,
	Linus Walleij <linusw@kernel.org>,
	Mark Kettenis <kettenis@openbsd.org>,
	Andi Shyti <andi.shyti@kernel.org>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH 01/10] dt-bindings: watchdog: apple,wdt: Add t8142
 compatible
Message-ID: <ee5a1127-1591-4720-ab34-896c1f037276@roeck-us.net>
References: <20261027-apple-m5-initial-devicetrees-v1-0-1356181bc50d@cyberchaos.dev>
 <20261027-apple-m5-initial-devicetrees-v1-1-1356181bc50d@cyberchaos.dev>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261027-apple-m5-initial-devicetrees-v1-1-1356181bc50d@cyberchaos.dev>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xMsbc-00000003tp5-2F1r
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:56876
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 50
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfLxmdA3x9Gh9wwlqKixJ4ZxjLIGwPWhmMS42MY4Z55+jNY4FxVVJ29eEhRWNZTbvN0tiuc372Zndl60aEMmG6hvHWRyUnD9g6WD8W+/cxV5+CRc8Qegr
 pl/rAubTtUzTp4l9lyFSdg0EjY2E/xgV+yNbGx0plEvAOnbWy3zuXPLMQ8oHNxhoSKVON04Yt26Ws8y0om5jwuR9OCB8MimomiWEy25IzrdYCxnYiTfmwPlx

On Tue, Oct 27, 2026 at 09:03:21AM +0100, Yureka Lilian wrote:
> The watchdog on the Apple t8142 (M5) SoC is compatible with the M1-M4
> SoCs. Add "apple,t8142-wdt" as SoC specific compatible.
> 
> Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Applied.

Thanks,
Guenter
