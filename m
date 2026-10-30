Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.15.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793358415;
	b=hsKb9GG6LIit0dCrVFFeV7c6OGvJ4NqNAjrKN08HLSzbsToBT+gNstGWilM80CZ5MMWb
	 0Uqp1iFCJIg1NRvZuRc2gPsPSNtmYYshjDqo3MyGphfyBnGSQfgLi9PXttX/lsKImC2v2
	 JeiW6c+KVT16fSOkfKBRBu9NKNl5FB7rtpZ9OjaHM+niZ5S4fbZi+wOUQrfCvGaN7ixj4
	 Oo21Vglt/nSOCGmMMZRQsmsgX0AGbVnESAFIdWsDPWXI8VZcaoSN1ktFYiiRVwE7WUBIJ
	 6aOBFBiPmrjzXN+jclrHwUTheg7IEYxyHBzx75HvJiu9yYC++9OOT149OqpW6JRLWjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793358415;
	h=DMARC-Filter:DKIM-Signature:X-UI-Sender-Class:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=A0FsVY5sIJAbs/Fwv04RNuQaETeFSVOQymRFQf752jE=;
	b=ovcJtNOtl8Ad4PBNOcMl246iZeLxP6+RplRcd4mUnDxRYGYlrg52BtfkUacypgrV1RQO
	 wxWNQoq9fOdIvt8LLH2g/ukRsILdEa3rWcR08nxG79aR+Gm2QR6CuQZeP1bHr5e9b1euw
	 7h5A0srCGVQo1NLBaXh2AK0lRy86qbLkoKUGTYJx/uasWL+mByXdXT8woffoMGGMGt8up
	 M7uzcz7EReoIOktdd66fDGPjn/+41840F5cEwEtkLeKjpt/xqqZbt6i32cjcQ7gQ/6+Xc
	 Mp9wJ3rZCbURujjDnqzAY+NmL06dYs9ElYKR577TkXVLyiyL/Wy6x/lCm1rNYy5MiXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=web.de;
	spf=pass smtp.mailfrom=web.de;
	dkim=pass header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=FFxOQmqk;
	arc=none smtp.remote-ip=212.227.15.4
Received: from mout.web.de (mout.web.de [212.227.15.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 307EC606A31C;
	Fri, 30 Oct 2026 11:06:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 307EC606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=FFxOQmqk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1793358406; x=1793963206; i=markus.elfring@web.de;
	bh=A0FsVY5sIJAbs/Fwv04RNuQaETeFSVOQymRFQf752jE=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=FFxOQmqkq3FKYsrQ92PPUN/tWDPm4hbPxFCHDDHOKHXgtKpza5x0WNg/QPy6ohvD
	 0CZXOLhXbdaYx8noTxeOuCl9rV29zyCR3Mb8wJXbRpHkKGFPpeothUInsOgsOEQiW
	 21TyPBUyOsWrRVxpvygC3liDUC6Eb/PkVuSA9J22m0zzHsfJjy7Swz0v5djVUA6Og
	 66b3QkmjwW4ZY5pYVYVtkbAQmhJXsHHiYfFJSKR987ggdJgigFtlHZMiuc/DTbv40
	 wwpTv1jGSNlPSjjEvp2y98hUoBWJm33yYCvDGXVWEGfX9fOy1dQ2DOPNWt8vAAOkj
	 Q2jzkrN3mgm7DnmrxQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1Mmyqx-1weaCf0wBL-00h9Xa; Fri, 30
 Oct 2026 12:06:46 +0100
Message-ID: <dccd52a6-4002-4500-b557-b87c3753d940@web.de>
Date: Fri, 30 Oct 2026 12:06:27 +0100
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] gpio: amdptpci: add support for AMD PT PCI controller
To: Szuying Chen <Chloe_Chen@asmedia.com.tw>,
 YD Tseng <Yd_Tseng@asmedia.com.tw>, linux-gpio@vger.kernel.org,
 Bartosz Golaszewski <brgl@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
 Jesse Chang <Jesse1_Chang@asmedia.com.tw>,
 Richard Hsu <Richard_Hsu@asmedia.com.tw>
References: <20261028084531.6237-1-Chloe_Chen@asmedia.com.tw>
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20261028084531.6237-1-Chloe_Chen@asmedia.com.tw>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64
X-Provags-ID: V03:K1:jvJxE390sHSRGD1ygIAtcR/UN/V3hqkS5qk6Sfu1LMkvEW8DAx7
 oy5+VHkKRSox1w3pHoVVCFCwHChPNiu8+74r8lrU1fgpaWzLrmUahdDiA29Oq+j7fl907Gq
 TecYumIC+zLVWD/4VxJTQ6cnUMwZXQ0f6s4rBHegfoZD0ZefBOC2HTzFNWwRxSYweMqQCle
 y2g7a6SO4l/dxfGebgelQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Cf+BCpecG2U=;d/u/VfsL424RZp10EU9M9Ztdwqb
 +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
 m/084Tir/Q/kFiYczD1G/0hoRFOiS6S1evktQ==

4oCmDQo+ICtNT0RVTEVfTElDRU5TRSgiR1BMIik7DQo+IC0tDQo+IDIuNDguMQ0KPiANCj4gPT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09DQo+
IFRoaXMgZW1haWwgYW5kIGFueSBhdHRhY2htZW50cyB0byBpdCBjb250YWluIGNvbmZpZGVudGlh
bCBpbmZvcm1hdGlvbiBhbmQgYXJlIGludGVuZGVkIHNvbGVseSBmb3IgdGhlIHVzZSBvZiB0aGUg
aW5kaXZpZHVhbCB0byB3aG9tIGl0IA0K4oCmDQoNCkkgZmluZCBzdWNoIGEgc2lnbmF0dXJlIGlu
YXBwcm9wcmlhdGUgZm9yIGEgY29udHJpYnV0aW9uIGluIGEgcHVibGljIG1haWxpbmcgbGlzdC4N
Cg0KUmVnYXJkcywNCk1hcmt1cw0K
