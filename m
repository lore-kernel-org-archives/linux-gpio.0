Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795506232;
	b=l9g7apCHTQVPS7R2sXLdLqD2o8hydY283FayUxA/JMZFHYWzfwt7GfZKvfnNiC4JqC0A
	 M6ucL29r0WgRQdMdtgubhxxcworyh1RNQuudl5v2196bsuIIeajsAtnvEON1bbolyzG+E
	 Q2ikP1Jf3Aoo872AJxu1l/CJN1WySmCufpTLQLmdlpLGbBW/kBmWsuMf8pynBy4IEn9DV
	 Ict+w9MnU4rpp8vmZUZdxsE/Xa/OdxWFvkStajGwdVZ9ANpNt4POX2EOjyHRClVFgbaRe
	 7HGdwrzaz+o2f528swVPCVge+bnuYT47OmNvNq069pn1zeVieHRx3LOdh8YZ0rASN9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795506232;
	h=DMARC-Filter:DKIM-Signature:Date:From:To:Cc:Subject:X-Priority:
	 X-Mailer:In-Reply-To:References:X-NTES-SC:Content-Transfer-Encoding:
	 Content-Type:MIME-Version:Message-ID:X-Coremail-Locale:X-CM-TRANSID:
	 X-CM-SenderInfo:X-Coremail-Antispam;
	bh=egDQpVic8+ZWvGHi/RAoKinxkbY/WeNVCIcjd2qNix8=;
	b=dEJqLOkLYJU5ohzsyVdLNswQAWntHLCdiZzi8vcZ/DgW056FHtQwLTThcgkIg+t/snV1
	 KtCP8wV07IzkSymm1cL+lX7RK+BRR49EQDezEFMPg4gXJsfzkUh/iZRtT7kQTEnvZo7c2
	 mDt+E9XRzZZKJr0+5bwzvF7WjWWM4r/esnSWeCCscov+J7bw0kKTEHREepBqKvCSWS15b
	 Z6RxAqqLqYbLzHzN2qcFb2um82po2tpgqG2/vt41RDTRgq5d1Fa0hX96h+HemDeW1AeU+
	 kav5cm73LQTWso0//MfmL/Ry3P9iZmd9+f027wRab2UyFjDpE2DBZguYz64cAKYVI9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=Gq1e3p+8;
	arc=none smtp.remote-ip=117.135.210.4
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24778606A31E;
	Tue, 24 Nov 2026 07:43:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24778606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=Gq1e3p+8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=egDQpVic8+ZWvGHi/RAoKinxkbY/WeNVCIcjd2qNix8=; b=G
	q1e3p+8vLNdoWPWozO30hvSLWG5qnUe/9uxpmXwfiwaM6Bge4hAmyUYlxVsfylF2
	3lMeyVUGfYMLxk9JNun84LgnAnAU2k9Hg3Vh8xMjFZbL1WdJK8GUHFnhhUwiFJC4
	JpHJ3+Y+r8sCEZuMheJ+GDHHzR4yQg/96rd8z5ym/s=
Date: Tue, 24 Nov 2026 15:42:56 +0800 (CST)
From: zl020895  <zl020895@163.com>
To: "Bartosz Golaszewski" <brgl@kernel.org>
Cc: longzhao@ambarella.com, linux-gpio@vger.kernel.org,
	"Linus Walleij" <linusw@kernel.org>,
	"Michael Walle" <mwalle@kernel.org>,
	"Andy Shevchenko" <andriy.shevchenko@linux.intel.com>,
	"Rob Herring" <robh@kernel.org>,
	"Krzysztof Kozlowski" <krzk@kernel.org>,
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>,
	"Krzysztof Kozlowski" <krzysztof.kozlowski@oss.qualcomm.com>,
	"Conor Dooley" <conor+dt@kernel.org>,
	"Mika Westerberg" <westeri@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Conor Dooley" <conor.dooley@microchip.com>
Subject: Re:Re: [PATCH v14 01/14] dt-bindings: gpio: pl061: add Ambarella
 CV75 variant
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20260511(2e539873) Copyright (c) 2002-2026 www.mailtech.cn 163com
In-Reply-To: <rvkdwpnypgxx3smfkqllik6vidzln3yg6nvshed3dtg7rtkq3j@u4pdrleymwrm>
References: <20261110-cv75-gpio-v14-0-e586aad0467a@ambarella.com>
 <20261110-cv75-gpio-v14-1-e586aad0467a@ambarella.com>
 <rvkdwpnypgxx3smfkqllik6vidzln3yg6nvshed3dtg7rtkq3j@u4pdrleymwrm>
X-NTES-SC: AL_Qu2SB/mbuUks4CCYYekdnUoTj+Y/XMK0uvwk1YdVc/4EnSXq2RASTG1BNnTm3sKdFyWCvRmRUSls8NpHWoJKb2qOrspCRW7Mw2npMoClXg==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-ID: <15be9ea4.6305.1a20c82000c.Coremail.zl020895@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:dSgvCgD3ny0AQAVrT_t0AA--.161W
X-CM-SenderInfo: d2oqjiqyzvqiywtou0bp/xtbC7gAsnWsFQAAdeAAA3U
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

QXQgMjAyNi0xMS0yMyAyMzo0ODoyOCwgIkJhcnRvc3ogR29sYXN6ZXdza2kiIDxicmdsQGtlcm5l
bC5vcmc+IHdyb3RlOgo+SGkhIENhbiB5b3UgYWRkcmVzcyBzYXNoaWtvJ3MgY29tbWVudCBhYm91
dCB0aGUgbWlzc2luZyB2ZW5kb3IgcHJlZml4PwoKSGkgQmFydG9zeiwKClRoZSBhbWJhcmVsbGEg
cHJlZml4IGlzIGFscmVhZHkgaW4gdGhlIHRyZWUsIFJvYiBhcHBsaWVkIGl0IG9uIDE1IE9jdDoK
ICBodHRwczovL2xvcmUua2VybmVsLm9yZy9yLzIwMjYxMDE0LWN2NzUtcHJlZml4LXYxLTEtZmU5
NWVkNTY3ODgwQGFtYmFyZWxsYS5jb20KClNhc2hpa28gaXMgcmUtcmFpc2luZyBLcnp5c3p0b2Yn
cyBjb21tZW50IGZyb20gdjEuCgpCVFcsIHRoZSBzZXJpZXMgd2FzIHJlc3B1biBhcyB2MTUgbGFz
dCB3ZWVrOgogIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyNjExMTgtY3Y3NS1ncGlvLXYx
NS0wLWUzYzU2MzY3M2ZlMUBhbWJhcmVsbGEuY29tCgpCZXN0IHJlZ2FyZHMsCkxvbmcgWmhhbwo=

