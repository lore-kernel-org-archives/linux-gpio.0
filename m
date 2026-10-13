Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90EFE30C606;
	Tue, 13 Oct 2026 14:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791900742; cv=none; b=i8GuOBXbXsekufnD1s8KMTZBAHzFzP16liFcvzKFs0SI+peSo2txNPrEsvqkBkAaxCwKO5t1IZ+i9JmwXX85Lt+HFvyL0Biau/LkPvTqOVmX1kx/x8QqXAocoVwOtQX8nZjnTOKA+xx/RLsrjBY8EcuyWlbizWIA3NAdVuZpSn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791900742; c=relaxed/simple;
	bh=9hCI+KLlF44LjYuZ2V43HBQqMnF64LjM3PfDokYjQ0U=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=iBHLqsVb24jJkzpw7EycDMpsMGdwSJGSIKffFR0qQXJAXIzqVhWRIIk7ngLd+368KFvZyKhJRy8F5WejPdNDIFRl31Zh84SbJrNTGdaYJM0uNA+9UX575O3gZ2m9WIg43qiBCfUOP6ga0Gx3WU1C5sTdKfoL30uuLL1WEg9UzlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=NxFy8Uyl; arc=none smtp.client-ip=220.197.31.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="NxFy8Uyl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=9hCI+KLlF44LjYuZ2V43HBQqMnF64LjM3PfDokYjQ0U=; b=N
	xFy8UylF7Z9Eh+XhQPDIDNqOP9M2CP8vbAIYSs+teya2vK/Tk7boOafHkRC4Zzow
	QOFFPvFHhzQtJI1b07yhfki8bM5VRUBNhl3LbUT9Z/nbdyogVabgth9C5K5NwCbA
	m/RWbf+cKJT/WKJmrEW6hB6Sz5ar4WDPGAWODdrgwg=
Date: Tue, 13 Oct 2026 22:10:41 +0800 (CST)
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
Subject: Re:Re: [PATCH 0/7] gpio: add Ambarella CV75 PL061 support
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20260511(2e539873) Copyright (c) 2002-2026 www.mailtech.cn 163com
In-Reply-To: <CAMRc=MezU71ByUoO-GMxSwsFsGZTUmQisYYrYEwtdbwyFiEqsw@mail.gmail.com>
References: <20261009-cv75-gpio-v1-0-5836bd438423@ambarella.com>
 <CAMRc=MezU71ByUoO-GMxSwsFsGZTUmQisYYrYEwtdbwyFiEqsw@mail.gmail.com>
X-NTES-SC: AL_Qu2SA/Wbv04v5ySfZekdnUoTj+Y/XMK0uvwk1YdVc84FkSfp3wMjT35qOEXs9/qoFCWqvTu+SwFvxuB9c7JXbkDZ1ziFg3nW8RhAFZ01ug==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <73c4ceaf.9c2f.1a13599e8ca.Coremail.zl020895@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:gygvCgD3fzvhO85qYSchAA--.60W
X-CM-SenderInfo: d2oqjiqyzvqiywtou0bp/xtbC7gFVxmrOO+FTVgAA3H
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

SGkgQmFydCwKClllcy4gVGhpcyBpcyBlZmZlY3RpdmVseSBhIHYxMCBvZiB0aGUgR1BJTyBwYXRj
aGVzIGZyb20gdGhlIGNvbWJpbmVkIENWNzUgc2VyaWVzLiBJIHNwbGl0IHRoZW0gb3V0IGFuZCBy
ZXN0YXJ0ZWQgdGhlIG51bWJlcmluZyBhdCB2MSBiZWNhdXNlIHNvbWUgbWFpbnRhaW5lcnMgcHJl
ZmVycmVkIHNlcGFyYXRlIHNlcmllcywgc28gSSBhbSB0cnlpbmcgdGhhdC4KCkJlc3QgcmVnYXJk
cywKTG9uZyBaaGFvCgpBdCAyMDI2LTEwLTEzIDIwOjU4OjA4LCAiQmFydG9zeiBHb2xhc3pld3Nr
aSIgPGJyZ2xAa2VybmVsLm9yZz4gd3JvdGU6Cj5PbiBGcmksIDkgT2N0IDIwMjYgMTI6NTc6NTMg
KzAyMDAsIExvbmcgWmhhbyB2aWEgQjQgUmVsYXkKPjxkZXZudWxsK2xvbmd6aGFvLmFtYmFyZWxs
YS5jb21Aa2VybmVsLm9yZz4gc2FpZDoKPj4gU3BsaXQgZnJvbSB0aGUgY29tYmluZWQgQ1Y3NSBi
cmluZy11cCBzZXJpZXMuIFRoZXNlIHBhdGNoZXMgY29udmVydAo+PiB0aGUgQVJNIFBMMDYxIGRh
dGEgcGF0aCB0byByZWdtYXAsIHRoZW4gYWRkIHRoZSBDVjc1IGxheW91dC4KPj4KPj4gUGxlYXNl
IHRha2UgdGhpcyBzZXJpZXMgdGhyb3VnaCB0aGUgR1BJTyB0cmVlLiBUaGUgcXVpcmssIHRoZSBQ
TDA2MQo+PiBjb252ZXJzaW9uIGFuZCB0aGUgQW1iYXJlbGxhIGxheW91dCBiZWxvbmcgdG9nZXRo
ZXIuCj4+Cj4+IFRoZSBHUElPIGRyaXZlciBkb2VzIG5vdCBkZXBlbmQgb24gQVJDSF9BTUJBUkVM
TEEuIFRoZSBiaW5kaW5nIHVzZXMKPj4gdGhlIGFtYmFyZWxsYSB2ZW5kb3IgcHJlZml4LCB3aGlj
aCBpcyBhZGRlZCBieSB0aGUgU29DIHNlcmllcyBhbmQgaXMKPj4gbm90IGluIG1haW5saW5lIHll
dDsgZHRfYmluZGluZ19jaGVjayBuZWVkcyB0aGF0IHByZWZpeC4KPj4KPj4gR1BJTyBkYXRhIHBh
dGggdXNlcyBncGlvLXJlZ21hcCB3aXRoIHR3byBsYXlvdXRzIChBUk0gUHJpbWVDZWxsIGFuZAo+
PiBBbWJhcmVsbGEpLiBBUk0gUEwwNjEgc2V0cyBHUElPX1JFR01BUF9RVUlSS19TRVRfQUZURVJf
RElSLiBJUlEgc3RheXMKPj4gYSBjdXN0b20gUEwwNjEgaXJxY2hpcC4gVGhlIGxpbmVhciBkb21h
aW4gaXMgY3JlYXRlZCB3aXRoIHRoZSBQTDA2MQo+PiBwcml2YXRlIGRhdGEgYW5kIGF0dGFjaGVk
IGJ5IGdwaW8tcmVnbWFwLiByZWdtYXAtaXJxIGlzIG5vdCB1c2VkLgo+Pgo+PiBUZXN0ZWQgb24g
dGhlIENWNzUgRVZLLiBUaGUgYm9hcmQgYm9vdHMuIGdwaW8taGFtbWVyIHRvZ2dsZXMgZ3Bpb2No
aXAwIGxpbmUgMjYgdGVuIHRpbWVzLCBhbmQgZ3Bpby1ldmVudC1tb24gb24gbGluZSAyNyByZWNv
cmRzIHRlbiBhbHRlcm5hdGluZyByaXNpbmcgYW5kIGZhbGxpbmcgZWRnZXMuCj4+Cj4+IENoYW5n
ZXMgc2luY2UgdGhlIHBhdGNoZXMgaW4gdGhlIGNvbWJpbmVkIHY5Ogo+PiAtIGR0LWJpbmRpbmdz
OiBleHBsYWluIHRoYXQgQ1Y3NSBpcyBhIG1vZGlmaWVkIFBMMDYxIChDb25vcikKPj4gLSBncGlv
LXJlZ21hcDogbW92ZSBxdWlya3MgYWZ0ZXIgZml4ZWRfZGlyZWN0aW9uX291dHB1dCAoQW5keSkK
Pj4gLSBncGlvOiBwbDA2MTogdXNlIHJlZ21hcF90ZXN0X2JpdHMoKSwgcmVnbWFwX2NsZWFyX2Jp
dHMoKSBhbmQKPj4gICByZWdtYXBfc2V0X2JpdHMoKSBmb3IgZGlyZWN0aW9uIGFuZCBpbnRlcnJ1
cHQgZW5hYmxlIChBbmR5KS4KPj4gICBUaGUgZGF0YSByZWdpc3RlciBzdGF5cyByZWdtYXBfd3Jp
dGUoKTogcmVnbWFwX3NldF9iaXRzKCkgY2FuCj4+ICAgb25seSBzZXQgYml0cyB0byAxLCBzbyBp
dCBjYW5ub3QgZHJpdmUgYSBwaW4gbG93Lgo+PiAtIGdwaW86IHBsMDYxOiBhZGQgQW1iYXJlbGxh
IHJlZ2lzdGVyLWxheW91dCB2YXJpYW50OiBjYWNoZSBEQVQKPj4gICAoUkVHQ0FDSEVfRkxBVF9T
LCBub3Qgdm9sYXRpbGUpIHNvIGdwaW9fc2V0KCkgZG9lcyBub3QKPj4gICByZWFkLW1vZGlmeS13
cml0ZSB0aGUgcGluIGxldmVsIChTYXNoaWtvKS4gRHJvcCB0aGUgUmV2aWV3ZWQtYnkKPj4gICBm
cm9tIEFuZHkgYW5kIExpbnVzIG9uIHRoaXMgY29tbWl0OyB0aGUgY29kZSBjaGFuZ2VkIGFmdGVy
Cj4+ICAgdGhvc2UgdGFncy4KPj4KPj4gTGluazogaHR0cHM6Ly9wYXRjaC5tc2dpZC5saW5rLzIw
MjYxMDAxLWN2NzUtdjUtdjktMC00ODZjYzI4OWE0YjhAYW1iYXJlbGxhLmNvbQo+Pgo+Cj5JcyB0
aGlzIGVmZmVjdGl2ZWx5IGEgdjEwIG9mIHRoaXMgc2VyaWVzIG9yIHNvbWV0aGluZyBlbnRpcmVs
eSBuZXc/Cj4KPkJhcnQK
