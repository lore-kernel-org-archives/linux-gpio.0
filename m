Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7CF039768A;
	Mon, 13 Apr 2026 09:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776072386; cv=none; b=uu1nAoYBE9Lxi6xiCojkazblOX6zGmtz7ka0VlljuTt9HvPeKQ1X6TAdV/hsgqJNdXonVF0Ql3rQPHR0OUW1n3IxAl8jKoRwhc2iGVDPbRRe7aZxsAKSi7FOQIT8RkUOgk4mcmgcFhIx84Cl/hcgp+RtRyYOONtnPCZHrS9nU4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776072386; c=relaxed/simple;
	bh=LyTRrutYnATzApAeFIWft4RRx7gSZRf923LkUajEI58=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=V7FN5x53H4HWB2zz3oEylHnEaCbItHw55gU1XMptVHf5jtSRyCmDePPY08WXI774JZ8MV2Kmrfl4pCHUk4lAykzW+RthwW4AcV605TuaDFvXeTUlzOceLTMgk1tS0vLRsRFw4zwpdWeSqJJulV14oybHBjyNnceQ2DB9VTXeO2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=QUOwRZ03; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="QUOwRZ03"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 63D9ND4z83976123, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1776072193; bh=LyTRrutYnATzApAeFIWft4RRx7gSZRf923LkUajEI58=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=QUOwRZ03s5JS1wgUz5eQ7+cw0w7zUStWcsVSVzMw5mnwen6pHeIyiVQ8pi5NdXGFb
	 B24djn7qgmar6G18riwNisBfCLvaLOotjWEsHRrrYfCWRS0AZOR3bOBcEDbukNrGqf
	 Osr1gZzLTfDlpNpLI/F+nA+HwzwTDsQjv2pGmOAAY1FU47amqCbkFDTXpqYtdoqw5q
	 tpoYLUYM1LmrgYjUotV3BkcVj0nuLMhJa8H3T+z81vbs4omCn5W+LRKLG5um0cbgUy
	 vw5BKPdO8n+nwjoWVJrhF+OCk1K9s3JlJEHTRok1E8cBX7FI2qulm8TfqmVMTIOYuL
	 wIAAE0nAROopg==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.26/5.94) with ESMTPS id 63D9ND4z83976123
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 13 Apr 2026 17:23:13 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Mon, 13 Apr 2026 17:23:13 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([fe80::ed72:3015:2840:4458]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::ed72:3015:2840:4458%10]) with mapi id
 15.02.1748.010; Mon, 13 Apr 2026 17:23:13 +0800
From: =?utf-8?B?WXUtQ2h1biBMaW4gW+ael+elkOWQm10=?= <eleanor.lin@realtek.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Linus Walleij
	<linusw@kernel.org>,
        =?utf-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>
CC: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Andrew Jeffery
	<andrew@codeconstruct.com.au>,
        "linux-aspeed@lists.ozlabs.org"
	<linux-aspeed@lists.ozlabs.org>,
        "openbmc@lists.ozlabs.org"
	<openbmc@lists.ozlabs.org>,
        "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
        Joel Stanley <joel@jms.id.au>,
        "linux-realtek-soc@lists.infradead.org"
	<linux-realtek-soc@lists.infradead.org>,
        =?utf-8?B?SmFtZXMgVGFpIFvmiLTlv5fls7Bd?= <james.tai@realtek.com>
Subject: RE: [PATCH 4/4] ARM: realtek: MAINTAINERS: Include pin controller
 drivers
Thread-Topic: [PATCH 4/4] ARM: realtek: MAINTAINERS: Include pin controller
 drivers
Thread-Index: AQHcyOquo2WiRIDaMEumOWsAJK/C+LXctDBA
Date: Mon, 13 Apr 2026 09:23:13 +0000
Message-ID: <45866135c8a54e1d98cac51932ca8e1a@realtek.com>
References: <20260410-pinctrl-testing-v1-0-6f708c855867@oss.qualcomm.com>
 <20260410-pinctrl-testing-v1-4-6f708c855867@oss.qualcomm.com>
In-Reply-To: <20260410-pinctrl-testing-v1-4-6f708c855867@oss.qualcomm.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

PiBObyBkZWRpY2F0ZWQgbWFpbnRhaW5lcnMgYXJlIHNob3duIGZvciBSZWFsdGVrIFNvQyBwaW4g
Y29udHJvbGxlcnMsIGV4Y2VwdA0KPiBwaW5jdHJsIHN1YnN5c3RlbSBtYWludGFpbmVyLCB3aGlj
aCBtZWFucyByZWR1Y2VkIHJldmlldyBhbmQgaW1wcmVzc2lvbiBvZg0KPiBhYmFuZG9uZWQgZHJp
dmVycy4gIFBpbiBjb250cm9sbGVyIGRyaXZlcnMgYXJlIGVzc2VudGlhbCBwYXJ0IG9mIGFuIFNv
Qywgc28gaW4NCj4gY2FzZSBvZiBsYWNrIG9mIGRlZGljYXRlZCBlbnRyeSBhdCBsZWFzdCBjb3Zl
ciBpdCBieSB0aGUgU29DIHBsYXRmb3JtDQo+IG1haW50YWluZXJzLg0KPiANCj4gU2lnbmVkLW9m
Zi1ieTogS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6eXN6dG9mLmtvemxvd3NraUBvc3MucXVhbGNv
bW0uY29tPg0KPiANCj4gLS0tDQo+IA0KPiBUaGlzIHBhdGNoIHNob3VsZCBnbyB2aWEgUmVhbHRl
ayBTb0MgbWFpbnRhaW5lcnMsIG5vdCBwaW5jdHJsLg0KPiAtLS0NCj4gIE1BSU5UQUlORVJTIHwg
MSArDQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykNCj4gDQo+IGRpZmYgLS1naXQg
YS9NQUlOVEFJTkVSUyBiL01BSU5UQUlORVJTDQo+IGluZGV4IDEwZDEyYjUxYjFmNi4uMzc0Y2U1
NWU0ZmI2IDEwMDY0NA0KPiAtLS0gYS9NQUlOVEFJTkVSUw0KPiArKysgYi9NQUlOVEFJTkVSUw0K
PiBAQCAtMzM3Myw2ICszMzczLDcgQEAgRjoNCj4gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL2FybS9yZWFsdGVrLnlhbWwNCj4gIEY6ICAgICBhcmNoL2FybS9ib290L2R0cy9yZWFs
dGVrLw0KPiAgRjogICAgIGFyY2gvYXJtL21hY2gtcmVhbHRlay8NCj4gIEY6ICAgICBhcmNoL2Fy
bTY0L2Jvb3QvZHRzL3JlYWx0ZWsvDQo+ICtGOiAgICAgZHJpdmVycy9waW5jdHJsL3JlYWx0ZWsv
DQo+IA0KPiAgQVJNL1JJU0MtVi9SRU5FU0FTIEFSQ0hJVEVDVFVSRQ0KPiAgTTogICAgIEdlZXJ0
IFV5dHRlcmhvZXZlbiA8Z2VlcnQrcmVuZXNhc0BnbGlkZXIuYmU+DQo+IA0KPiAtLQ0KPiAyLjUx
LjANCg0KQWNrZWQtYnk6IFl1LUNodW4gTGluIDxlbGVhbm9yLmxpbkByZWFsdGVrLmNvbT4NCg==
