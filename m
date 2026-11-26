Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795690871;
	b=IdpILMX3a6fISCt8Y4gESoLaQGGYHchXMc6W1MPVVumfrnx2W7GEfT223pZ7zv9JX/E4
	 nxJ/kDAF2VUFZXFxZoSNQ0ucN3w0sCmY955KWkjcfMv/ArsTfCvh9b9YKh1/t+JVm1mvX
	 zfshbswiaonUiqoXtMztmni3bSW6K74dRQaVja6gS8W7ZI5m0tASR6T2qCNm2PFRWYsID
	 ncGSZPG8HZC83LfPGaeM/aE+/ptcr1oKzelQ2VAfNpE+4oCl7d1FJxD3S+bt+2I7iaO6L
	 0VjCb7NZ3l9+bJO90YPCt72FHibA9n83Mm/jKkDVuYkLtfMCrJmgs6GPDkcvdpd705Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795690871;
	h=DMARC-Filter:DKIM-Signature:Date:From:To:Cc:Subject:X-Priority:
	 X-Mailer:In-Reply-To:References:X-NTES-SC:Content-Transfer-Encoding:
	 Content-Type:MIME-Version:Message-ID:X-Coremail-Locale:X-CM-TRANSID:
	 X-CM-SenderInfo:X-Coremail-Antispam;
	bh=U8H2aecc49XjNXoZYCGoat5dqHjwUPyU50NiRAmq9e4=;
	b=Rkyjl2w5IwF7kk72Z3W/UYhPF6N7/Lud9TQ41hWgODpzm8JYuB8pvlLlMoUUgn3qyAW8
	 9/knm+qHDBeRsqyRiDOVPef6pq6lwxPBnL9WWnzTdLFXvwLqlB67kO9fz67PqNL/H6PcX
	 SntDkEI9uy87l7iXI3Acs6XkYYYSmDIjEplRf1nuq0JbBu5rZbcs+3O9OKdxaFHIuO6Cs
	 qaU23dn7D9vF//mRzbjosFDjK8sijm0xhUeTja0dm/u6/s1uuYSmEYktvrOD0hX5Oyl4g
	 kK6Z05cze4+XnGCzoCNsKDIUQENAYZqvSaAvmkNHUy+xKC4dknSvn1PBfDKH2aQGkQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=gjKgQltO;
	arc=none smtp.remote-ip=117.135.210.4
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7BA4606A31C;
	Thu, 26 Nov 2026 11:01:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7BA4606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=gjKgQltO
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=U8H2aecc49XjNXoZYCGoat5dqHjwUPyU50NiRAmq9e4=; b=g
	jKgQltOPCmnpIb9/x4OOtqzeC2kwbpu93CT2bhPQi0XrrydD1aP5tY8txbXHmofN
	zcXHp3ANbVbxpCA2d3DriavnjUhQYRIqctN/6jsESEFNY8KRmgvLFg1ZIaTVWcFp
	MmdxL077LGSb40iYs+pDtn7V41VqXg24ncRtEhHV6E=
Date: Thu, 26 Nov 2026 19:00:20 +0800 (CST)
From: zl020895  <zl020895@163.com>
To: "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>
Cc: longzhao@ambarella.com, "Bartosz Golaszewski" <brgl@kernel.org>,
	linux-gpio@vger.kernel.org, "Linus Walleij" <linusw@kernel.org>,
	"Michael Walle" <mwalle@kernel.org>, "Rob Herring" <robh@kernel.org>,
	"Krzysztof Kozlowski" <krzk@kernel.org>,
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>,
	"Krzysztof Kozlowski" <krzysztof.kozlowski@oss.qualcomm.com>,
	"Conor Dooley" <conor+dt@kernel.org>,
	"Mika Westerberg" <westeri@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re:Re: [PATCH v15 03/14] gpio: regmap: remove gpiochip before
 tearing down irqchip
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20260511(2e539873) Copyright (c) 2002-2026 www.mailtech.cn 163com
In-Reply-To: <av6n3oNVl2pyeLBK@ashevche-desk.local>
References: <20261118-cv75-gpio-v15-0-e3c563673fe1@ambarella.com>
 <20261118-cv75-gpio-v15-3-e3c563673fe1@ambarella.com>
 <av6n3oNVl2pyeLBK@ashevche-desk.local>
X-NTES-SC: AL_Qu2SB/qSv0Ap5iCcZOkdnUoTj+Y/XMK0uvwk1YdVc/MEkifv/wIGZm5NPWTN9f+eISWCghu2SxtW7+p4VrR6I6RwpZ+lUdQD0+jxaPLqQw==
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
Message-ID: <58bc2391.8c7d.1a2178371d0.Coremail.zl020895@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:eCgvCgDXv+hFEQhrB8Z2AA--.1666W
X-CM-SenderInfo: d2oqjiqyzvqiywtou0bp/xtbC7gQyo2sIEUQsGAAA35
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

QXQgMjAyNi0xMS0xOSAxNTo0MDoxNCwgIkFuZHkgU2hldmNoZW5rbyIgPGFuZHJpeS5zaGV2Y2hl
bmtvQGxpbnV4LmludGVsLmNvbT4gd3JvdGU6Cj5TbywgQUZBSVIgTWljaGFlbCByb3NlIHRoZSBx
dWVzdGlvbiB0aGF0IHRoaXMgcGF0Y2ggbWFrZXMgdGhlIHVucmVnaXN0ZXIgZmxvdwo+bm90IHJl
dmVyc2Ugc3ltbWV0cmljYWwgdG8gdGhlIHJlZ2lzdGVyIG9uZS4gSSB0b29rIGEgbG9vayBhdCB0
aGlzIGFuZCBJIGNhbgo+c2F5IHRoYXQgdGhpcyBpcyBhIGJpdCB0d2lzdGVkLiBUaGUgcHVyZSBj
cmVhdGlvbiBwYXJ0IGlzIGluZGVwZW5kZW50LCBidXQKPnRvIGZ1bmN0aW9uIGl0IHJlcXVpcmVz
IEdQSU8gY2hpcCB0byBiZSBpbnN0YW50aWF0ZWQuIFNvLCB5ZWFoLCB0aGlzIHBhdGNoCj5pcyBh
IGJpdCBjb250cm92ZXJzaWFsLiBMZXQgbWUgc2VlIHdoYXQgd2UgY2FuIGRvIGhlcmUuCkhpIEFu
ZHksCgpBbnkgY29uY2x1c2lvbiBvbiB0aGUgdW5yZWdpc3RlciBvcmRlcmluZyBpbiAwMy8xND8g
SSBoYXZlIGEgdjE2IHJlYWR5CihTYXNoaWtvIElSUS1kZWZlciBmaXgpLiBPSyB0byBzZW5kIHYx
NiBhcy1pcywgb3Igc2hvdWxkIEkgd2FpdCBmb3IgeW91ciBwcm9wb3NhbApvbiB0aGUgdGVhcmRv
d24gb3JkZXI/CgpCZXN0IHJlZ2FyZHMsCkxvbmcgWmhhbwo=
