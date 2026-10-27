Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.3
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793097153;
	b=SQeuOEpmKRIVCJIIpKswdP3CFI+W5NA8fljI6YYdSMZKSErlUap/85eXbh0eCEDBIXif
	 3Aftay4ASFVmkzPzUFAtIFRtjf2KYOZ39ANxUOMXXqroOMxMHamlBgiQBK4/ZP34D7EPB
	 Vb0Vuc6NcQvyvAVp2Kk0AwE2HFAvzqeAB89ei2AEysadB5z0CtHkFDwN/MMMr7OO+Zsjr
	 yBNvsRl+KbkzfBAQOY9qV3ljDBXWrzPEBXBigDxC96ST05nlzLz5zgDnVB4ejPt0Zrmd4
	 +zSZArqYXWxMlxWGox5ABCWPgKJJHIDRYkcBTm4DCRb+8ccYDIocMSMMyIj5JRRu1nA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793097153;
	h=DMARC-Filter:DKIM-Signature:Date:From:To:Cc:Subject:X-Priority:
	 X-Mailer:In-Reply-To:References:X-NTES-SC:Content-Transfer-Encoding:
	 Content-Type:MIME-Version:Message-ID:X-Coremail-Locale:X-CM-TRANSID:
	 X-CM-SenderInfo:X-Coremail-Antispam;
	bh=HcNws7cwMI9jzF5/RjBavx9UgLoi6+FywEQyWby0ouU=;
	b=yzGdGEdKxK0JObvnHZYkcaXF+aUL2a/K6iZ5Nh1TV9GJt0tbpFDXPtUUzcYlW9dr4wt4
	 6ImFobp1NZU5tP2g+LjcCrxic007YzJCWZipZ6RwskPUAAVyJNYyM13l5uQcCqfVSso52
	 nWZO7zDI+dedQGsfa6kWwK8I26kBFYk7OqZnJ0IbZ1Hxlej1FEKomCF5cwE4X5VuTW5qP
	 TUg7iqOfw8O1lCoVxzLyxZQslsNhBBfHIL6g+o3NSf6bBZf5PqLT3uA2peUmhWwZgLlth
	 Yk4vGOLZqLXII2ya6J9j9JQLyr9fag7b55XWpGCXV8+RVWjgoOSetNAWiq1tfGoOIMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=MANvWgE4;
	arc=none smtp.remote-ip=117.135.210.3
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 655A0606A31A;
	Tue, 27 Oct 2026 10:32:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 655A0606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=MANvWgE4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=HcNws7cwMI9jzF5/RjBavx9UgLoi6+FywEQyWby0ouU=; b=M
	ANvWgE4+K6m7ba1m/CZbyoBDKfOZiDVS2ofb8fIMP4t9YovyoAs6IsOdKXZiT0Qt
	ZqRns0lMg3Pa1tolAUhTJQuZ1jtpdg5ciVsIEk1FRz10R07fcYcTRjzN82NklZXi
	S/mzVRjoeQS6QOZaOxkNh+rRZ70D6PXW//LLHgQnHk=
Date: Tue, 27 Oct 2026 18:32:04 +0800 (CST)
From: zl020895  <zl020895@163.com>
To: "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>
Cc: longzhao@ambarella.com, "Bartosz Golaszewski" <brgl@kernel.org>,
	linux-gpio@vger.kernel.org, "Linus Walleij" <linusw@kernel.org>,
	"Michael Walle" <mwalle@kernel.org>, "Rob Herring" <robh@kernel.org>,
	"Krzysztof Kozlowski" <krzk@kernel.org>,
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>,
	"Krzysztof Kozlowski" <krzysztof.kozlowski@oss.qualcomm.com>,
	"Conor Dooley" <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re:Re: [PATCH v12 09/11] gpio: pl061: switch data path to
 gpio-regmap
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20260511(2e539873) Copyright (c) 2002-2026 www.mailtech.cn 163com
In-Reply-To: <auBbdz_fBiKr1tJb@ashevche-desk.local>
References: <20261027-cv75-gpio-v12-0-c22555400e18@ambarella.com>
 <20261027-cv75-gpio-v12-9-c22555400e18@ambarella.com>
 <auBbdz_fBiKr1tJb@ashevche-desk.local>
X-NTES-SC: AL_Qu2SAfySuEkp4iCcYOkdnUoTj+Y/XMK0uvwk1YdVc+EGqB3O8zoMdFVGDWT9we+IEjCytj+JaDlM+MVbYKx3TNUDNFDcY9m18KvoGf8EAg==
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
Message-ID: <68410604.9376.1a17ceac8d5.Coremail.zl020895@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:jigvCgD3X9ikfeBqs3xhAA--.875W
X-CM-SenderInfo: d2oqjiqyzvqiywtou0bp/xtbC7QRbzGrgfaQ5BQAA3R
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

QXQgMjAyNi0xMC0yNyAxNjowNjoxNSwgIkFuZHkgU2hldmNoZW5rbyIgPGFuZHJpeS5zaGV2Y2hl
bmtvQGxpbnV4LmludGVsLmNvbT4gd3JvdGU6Cj5PbiBUdWUsIE9jdCAyNywgMjAyNiBhdCAxMjox
ODo1NlBNICswODAwLCBMb25nIFpoYW8gdmlhIEI0IFJlbGF5IHdyb3RlOgo+Cj4+ICsJaWYgKGly
cSkgewo+PiArCQlpcnFfc2V0X2NoYWluZWRfaGFuZGxlcl9hbmRfZGF0YShpcnEsIHBsMDYxX2ly
cV9oYW5kbGVyLCBwbDA2MSk7Cj4KPj4gKwkJcGwwNjEtPmlycV9oYW5kbGVyX2luc3RhbGxlZCA9
IHRydWU7Cj4KPkNhbid0IHdlIHJlbW92ZSB0aGUgY2hhaW5lZCBoYW5kbGVyIHVuY29uZGl0aW9u
YWxseT8KPgo+PiArCX0KPgo+LS0gCj5XaXRoIEJlc3QgUmVnYXJkcywKPkFuZHkgU2hldmNoZW5r
bwo+CgpIaSBBbmR5LAoKVGhhbmtzIGZvciB0aGUgcmV2aWV3LgoKT24gdGhlIGNoYWluZWQtaGFu
ZGxlciB0ZWFyZG93bjogcGwwNjFfcmVtb3ZlX2lycSgpIGlzIHJlZ2lzdGVyZWQKYmVmb3JlIGRl
dm1fZ3Bpb19yZWdtYXBfcmVnaXN0ZXIoKSwgc28gb24gdW5iaW5kIGl0IHJ1bnMgYWZ0ZXIKZ3Bp
b2NoaXBfcmVtb3ZlKCkuIGdwaW9jaGlwX2ZyZWVfcmVtYWluaW5nX2lycXMoKSB0aGVyZWZvcmUg
c3RpbGwKc2VlcyB0aGUgaXJxIGRvbWFpbiBhbmQgaXRzIG1hcHBpbmdzOyB0aGUgYWN0aW9uIHRo
ZW4gZGlzcG9zZXMKdGhlbS4gVGhlIGNoYWluZWQgaGFuZGxlciBpcyBpbnN0YWxsZWQgb25seSBh
ZnRlcgpkZXZtX2dwaW9fcmVnbWFwX3JlZ2lzdGVyKCkgc3VjY2VlZHMuIElmIHRoYXQgY2FsbCBm
YWlscywgdGhlCmFjdGlvbiBzdGlsbCBydW5zIGFsdGhvdWdoIG5vIGhhbmRsZXIgd2FzIGluc3Rh
bGxlZCwgd2hpY2ggaXMKd2h5IGlycV9oYW5kbGVyX2luc3RhbGxlZCBleGlzdHMuCgpPcHRpb25z
IGZvciB2MTM6CkEpIEtlZXAgaXJxX2hhbmRsZXJfaW5zdGFsbGVkIGFuZCBkb2N1bWVudCB0aGlz
IG9yZGVyaW5nLgpCKSBTcGxpdCBpbnRvIHR3byBkZXZtIGFjdGlvbnMuIFRoZSBlYXJseSBvbmUs
IHN0aWxsIHJlZ2lzdGVyZWQKICAgYmVmb3JlIHRoZSBncGlvY2hpcCwgb25seSBjYWxscyBpcnFf
ZGlzcG9zZV9tYXBwaW5nKCksIHNvCiAgIHVuYmluZCBvcmRlciBpcyB1bmNoYW5nZWQuIEEgc2Vj
b25kIGFjdGlvbiwgcmVnaXN0ZXJlZCByaWdodAogICBhZnRlciBpcnFfc2V0X2NoYWluZWRfaGFu
ZGxlcl9hbmRfZGF0YSgpLCBjbGVhcnMgdGhlIGhhbmRsZXIKICAgdW5jb25kaXRpb25hbGx5LCBh
bmQgdGhlIGZsYWcgZ29lcyBhd2F5LgoKRG8geW91IHByZWZlciBBIG9yIEI/CgpCZXN0IHJlZ2Fy
ZHMsCkxvbmcgWmhhbwoK
