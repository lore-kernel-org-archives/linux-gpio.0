Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 252505221D3;
	Tue, 13 Oct 2026 15:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791905836; cv=none; b=amPxFAp/rb9r0EfdOlCo6nA7N/3e3BUwOpaqyWpL/REcJCitQXl40WV5X0suv62O08s9BJhvXqY66rzyfW9iL183XhccZPFiMDUJuRsS3KTmD7H9P/fT/eO2NIYoVLtlz5Aw+vKhPJXNxc5tAsB1UM+wTkhAh+wX9jNNL+HO9ws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791905836; c=relaxed/simple;
	bh=Qkbn0WuH2H9J22IDpkqhPIsmmDiKKL7qr4cIGjwzim0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=qSUYARNdvy8Ow3488maC64jslJZXlfd6GunNAOkrU4y7Vpxcu5zqGPwjhS5fRTkP3qHtaozWB0jWMneGuVYZwLKPMU95YEhb60WOVUM9Xl5EvqPELGAf3rhcNAc1+5Wcq4UAdJXK+9TjFQQ6CAHkIMiZ8EoeERgd7G58LUkQnoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=Eat++qsN; arc=none smtp.client-ip=117.135.210.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="Eat++qsN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=Qkbn0WuH2H9J22IDpkqhPIsmmDiKKL7qr4cIGjwzim0=; b=E
	at++qsNsOrRp9wxPXUR2fEsuVrAjdzoyKw/xspfwfQHzDv8ATwc8d7y8dHvSe+bb
	7EgG/0BpYjyg1Ni90pn6stLxP5GOTfcwvGnuF6eujF2c4GNz8K5ozL+pCqVddifO
	jVYU5MWe5HDkwYMcMS+BO96WCFPSZTbFptmRv9QFDA=
Date: Tue, 13 Oct 2026 23:36:20 +0800 (CST)
From: zl020895  <zl020895@163.com>
To: "Bartosz Golaszewski" <brgl@kernel.org>
Cc: longzhao@ambarella.com,
	"Long Zhao via B4 Relay" <devnull+longzhao.ambarella.com@kernel.org>,
	"Linus Walleij" <linusw@kernel.org>,
	"Michael Walle" <mwalle@kernel.org>,
	"Andy Shevchenko" <andriy.shevchenko@linux.intel.com>,
	"Rob Herring" <robh@kernel.org>,
	"Krzysztof Kozlowski" <krzk@kernel.org>,
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>,
	"Krzysztof Kozlowski" <krzysztof.kozlowski@oss.qualcomm.com>,
	"Conor Dooley" <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Conor Dooley" <conor.dooley@microchip.com>,
	"Chanho Min" <chanho.min@lge.com>, linux-gpio@vger.kernel.org
Subject: Re:Re: Re:Re: [PATCH 0/7] gpio: add Ambarella CV75 PL061 support
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20260511(2e539873) Copyright (c) 2002-2026 www.mailtech.cn 163com
In-Reply-To: <CAMRc=MeDEfaqciXt+u6a7riof=KObrWB2qJ96LjFEzoGwi=eSQ@mail.gmail.com>
References: <20261009-cv75-gpio-v1-0-5836bd438423@ambarella.com>
 <CAMRc=MezU71ByUoO-GMxSwsFsGZTUmQisYYrYEwtdbwyFiEqsw@mail.gmail.com>
 <73c4ceaf.9c2f.1a13599e8ca.Coremail.zl020895@163.com>
 <CAMRc=MeDEfaqciXt+u6a7riof=KObrWB2qJ96LjFEzoGwi=eSQ@mail.gmail.com>
X-NTES-SC: AL_Qu2SA/Wbuk8j5iCebekdnUoTj+Y/XMK0uvwk1YdVc+MEpS7JyCwnWU9tAFfdweisFT6RohuNQSVQzMdUe413VehHBbQVcItEaM2+sBTpGQ==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <1e8db23.a299.1a135e85172.Coremail.zl020895@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:bCgvCgBn9_z0T85qiRhYAA--.381W
X-CM-SenderInfo: d2oqjiqyzvqiywtou0bp/xtbC7hRf0GrOT-SNyAAA3v
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

QXQgMjAyNi0xMC0xMyAyMzowOToyNSwgIkJhcnRvc3ogR29sYXN6ZXdza2kiIDxicmdsQGtlcm5l
bC5vcmc+IHdyb3RlOgo+T24gVHVlLCAxMyBPY3QgMjAyNiAxNjoxMDo0MSArMDIwMCwgemwwMjA4
OTUgPHpsMDIwODk1QDE2My5jb20+IHNhaWQ6Cj4+IEhpIEJhcnQsCj4+Cj4+IFllcy4gVGhpcyBp
cyBlZmZlY3RpdmVseSBhIHYxMCBvZiB0aGUgR1BJTyBwYXRjaGVzIGZyb20gdGhlIGNvbWJpbmVk
IENWNzUgc2VyaWVzLiBJIHNwbGl0IHRoZW0gb3V0IGFuZCByZXN0YXJ0ZWQgdGhlIG51bWJlcmlu
ZyBhdCB2MSBiZWNhdXNlIHNvbWUgbWFpbnRhaW5lcnMgcHJlZmVycmVkIHNlcGFyYXRlIHNlcmll
cywgc28gSSBhbSB0cnlpbmcgdGhhdC4KPj4KPgo+UGxlYXNlIGRvbid0IHRvcCBwb3N0IG9uIG1h
aWxpbmcgbGlzdHMgYW5kIHdyYXAgeW91ciBtZXNzYWdlcyBhcm91bmQgODAgbGluZXMuCj4KPk1h
eSBJIGFzayB3aGljaCBtYWludGFpbmVyIGFza2VkIHlvdSB0byByZXNldCB0aGUgbnVtYmVyaW5n
PyBUaGlzIGRvZXNuJ3QgbWFrZQo+YW55IHNlbnNlLCB0aGlzIGlzIGEgY29udGludWF0aW9uIG9m
IHRoZSBvdGhlciBzZXJpZXMgYW5kIHNob3VsZCBiZSBudW1iZXJlZCBhcwo+djEwIGFuZCBpbmNs
dWRlIHRoZSBjaGFuZ2Vsb2cuCj4KPkJhcnQKSGkgQmFydCwKCk5vYm9keSBhc2tlZCBtZSB0byBy
ZXNldCB0aGUgbnVtYmVyaW5nLiBJIHRob3VnaHQgdGhhdCBvbmNlIHRoZSAKcGF0Y2hlcyB3ZXJl
IHNwbGl0IG91dCB0aGV5IGNvdW50ZWQgYXMgYSBuZXcgc2VyaWVzLCBzbyBJIHN0YXJ0ZWQKYWdh
aW4gYXQgdjEuIEkgd2lsbCBzZW5kIHRoZSBuZXh0IHBhdGNoIHZlcnNpb24gYXMgdjEwLgoKQmVz
dCByZWdhcmRzLApMb25nIFpoYW8=
