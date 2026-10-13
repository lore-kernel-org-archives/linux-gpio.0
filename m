Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17B15377AB4;
	Tue, 13 Oct 2026 08:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791881814; cv=none; b=gQ1HK6dlS8fxkNotYZUuA0inRZb15ozywlvwkKviyVzPzOyvUeMNjeHebPlUXolq8vZqZEsoI02ug7PtYxsEkOKD1bLzRIj80LUzTwpLE+k6OELUhqu96iwvx38OgWZ4FQ6+kTFMoSsb3DLygHINdZ5+9PqV771Kzj50L1Mjurs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791881814; c=relaxed/simple;
	bh=vxOMSdfPa+Xb0USiShfPSDz9LeNQL2Y6IdmTQrlBJ0k=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=C+NopHYa6CV9qD4GoPbQFFuk2PON9FBpXad+tamKNDhVnh7VGDmKJ9WRlNz++HKkmHvRBRYNVa4a91DSOtVKKC97ndhk/k0tHhUIrlr61vSHdKdOK3CZ1suuv0eNggpLMhzc5Tor6n0mhDPqZVFpeJiNFAhagTnFQOLZC9ELLSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=ho1bbIlU; arc=none smtp.client-ip=117.135.210.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="ho1bbIlU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=vxOMSdfPa+Xb0USiShfPSDz9LeNQL2Y6IdmTQrlBJ0k=; b=h
	o1bbIlUQ6oNFDlE0sN2VO5YSznYnZtUr++KM8obOIYR+xGy6QZlLWL0Oz0oCs8uV
	H6+jtTKS2L7p75yxwyNY84lpKgJ2d212/Y9xxlmBgPeWVJ9iW6dwB2g5Ti4wADdG
	j+A8Vu+8qMajNidXYVBNrk35Ji7ISQhH9ngabZfXHk=
Date: Tue, 13 Oct 2026 16:56:14 +0800 (CST)
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
Subject: Re:Re: [PATCH 6/7] gpio: pl061: switch data path to gpio-regmap
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20260511(2e539873) Copyright (c) 2002-2026 www.mailtech.cn 163com
In-Reply-To: <as3amWxGvbUdwE7k@ashevche-desk.local>
References: <20261009-cv75-gpio-v1-0-5836bd438423@ambarella.com>
 <20261009-cv75-gpio-v1-6-5836bd438423@ambarella.com>
 <as3amWxGvbUdwE7k@ashevche-desk.local>
X-NTES-SC: AL_Qu2SA/STvk8s4iaeYekdnUoTj+Y/XMK0uvwk1YdVc/wElDLh/QIGXnx4LVn57NCEASONoSqOQD9f5t9aVplHj7jKciQPGAkDwdzae/FgZA==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <e1c092a.7c2c.1a1347a0650.Coremail.zl020895@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:dCgvCgDX30Mu8s1qRY1XAA--.13256W
X-CM-SenderInfo: d2oqjiqyzvqiywtou0bp/xtbC7Q7VR2rN8i7BfQAA32
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

SGkgQW5keSwKClNvcnJ5IGZvciB0aGUgY2h1cm4gYW5kIHRoYW5rcyBmb3IgdGhlIHJldmlldy4K
Ckxvb2tpbmcgYmFjayBhdCB5b3VyIHY5IHJldmlldyBvZiB0aGUgY29udmVydCBwYXRjaCwgdGhl
IG9ubHkgcG9pbnQgSQpkaWQgbm90IGZvbGxvdyBpcyB0aGUgZGF0YS1yZWdpc3RlciBwYXRoLiBZ
b3UgbWFya2VkIHRob3NlCnJlZ21hcF93cml0ZSgpIHNpdGVzIHdpdGggX3NldF9iaXRzKCkuIEkg
ZGlkIHN3aXRjaCBkaXJlY3Rpb24gYW5kIElSUQplbmFibGUgdG8gcmVnbWFwX3Rlc3RfYml0cygp
IC8gcmVnbWFwX2NsZWFyX2JpdHMoKSAvIHJlZ21hcF9zZXRfYml0cygpLApidXQgSSBsZWZ0IHRo
ZSBkYXRhLXJlZ2lzdGVyIHdyaXRlcyBhcyByZWdtYXBfd3JpdGUoKSwgYmVjYXVzZQpyZWdtYXBf
c2V0X2JpdHMoKSBjYW5ub3QgY2xlYXIgYSBiaXQgdG8gZHJpdmUgdGhlIGxpbmUgbG93LiAKSW4g
dGhlIG5leHQgdmVyc2lvbiBJIHdpbGwgdXNlIHJlZ21hcF9hc3NpZ25fYml0cygpCnRoZXJlLgoK
SSBkaWQgbm90IGZpbmQgdGhlIG90aGVyIG5vdGVzIGZyb20gdGhpcyBtYWlsIKGqIGRyb3AgZmFz
dF9pbywga2VlcCB0aGUKcmVnbWFwX2NvbmZpZyBpbiB0aGUgY29udmVydCBwYXRjaCwgYW5kIHRo
ZSBndWFyZCgpIGJsYW5rIGxpbmVzIKGqIGluCnRoZSB2OSBjb21tZW50cy4gSSB3aWxsIGZpeCB0
aG9zZSBpbiB0aGUgbmV4dCB2ZXJzaW9uIGFzIHdlbGwsIGFsb25nCndpdGggcmV2ZXJzZSBDaHJp
c3RtYXMgdHJlZSBpbiBpcnFfdHlwZSBhbmQgYSBwcmVjdXJzb3IgdG8gZHJvcCB0aGUKcmVkdW5k
YW50IGlmIChwZW5kaW5nKSBjaGVjay4KCkJlc3QgcmVnYXJkcywKTG9uZyBaaGFvCgpBdCAyMDI2
LTEwLTEzIDE1OjE1OjM3LCAiQW5keSBTaGV2Y2hlbmtvIiA8YW5kcml5LnNoZXZjaGVua29AbGlu
dXguaW50ZWwuY29tPiB3cm90ZToKPk9uIEZyaSwgT2N0IDA5LCAyMDI2IGF0IDA2OjU3OjU5UE0g
KzA4MDAsIExvbmcgWmhhbyB2aWEgQjQgUmVsYXkgd3JvdGU6Cj4KPj4gTW92ZSBnZXQsIHNldCBh
bmQgZGlyZWN0aW9uIG9udG8gZ3Bpby1yZWdtYXAuIEFSTSBQTDA2MSBzZXRzCj4+IEdQSU9fUkVH
TUFQX1FVSVJLX1NFVF9BRlRFUl9ESVIgc28gdGhlIG91dHB1dCB2YWx1ZSBpcyB3cml0dGVuCj4+
IGFmdGVyIHRoZSBkaXJlY3Rpb24gY2hhbmdlLgo+PiAKPj4gS2VlcCBhIGN1c3RvbSBpcnFjaGlw
IGFuZCBpcnEgZG9tYWluLiBDcmVhdGUgdGhlIGRvbWFpbiB3aXRoCj4+IHRoZSBQTDA2MSBwcml2
YXRlIGRhdGEgYW5kIGxldCBncGlvLXJlZ21hcCBhdHRhY2ggaXQuCj4+IAo+PiBDaGVjayB0aGUg
Y2hhaW5lZC1oYW5kbGVyIHJlZ21hcF9yZWFkKCkgcmV0dXJuIGFuZCBhbHdheXMgcnVuCj4+IGNo
YWluZWRfaXJxX2V4aXQoKS4gaXJxX3R5cGUgc3RpbGwgaWdub3JlcyBNTUlPIHdyaXRlIHJldHVy
bnMuCj4+IAo+PiBpcnFfc2V0X3BhcmVudCgpIG5lc3RzIHRoZSBHUElPIGlycV9kZXNjIHVuZGVy
IHRoZSBBTUJBIHBhcmVudAo+PiBmb3IgaXJxX3NldF93YWtlKCkgYW5kIGxvY2tkZXA7IGNoZWNr
ZWQgd2l0aCBQUk9WRV9MT0NLSU5HIG9uCj4+IENWNzUuCj4KPi4uLgo+Cj4+IC1zdGF0aWMgYm9v
bCBwbDA2MV9pc19kYXRhX3JlZyh1bnNpZ25lZCBpbnQgcmVnKQo+PiAtewo+PiAtCXJldHVybiBp
c19wb3dlcl9vZl8yKHJlZykgJiYKPj4gLQkgICAgICAgcmVnID49IEJJVChQTDA2MV9EQVRBX09G
RlNFVCkgJiYKPj4gLQkgICAgICAgcmVnIDw9IEJJVChQTDA2MV9EQVRBX09GRlNFVCArIFBMMDYx
X0dQSU9fTlIgLSAxKTsKPj4gLX0KPj4gLQo+PiAtc3RhdGljIGJvb2wgcGwwNjFfdm9sYXRpbGVf
cmVnKHN0cnVjdCBkZXZpY2UgKmRldiwgdW5zaWduZWQgaW50IHJlZykKPj4gLXsKPj4gLQlzd2l0
Y2ggKHJlZykgewo+PiAtCWNhc2UgR1BJT01JUzoKPj4gLQljYXNlIEdQSU9JQzoKPj4gLQkJcmV0
dXJuIHRydWU7Cj4+IC0JZGVmYXVsdDoKPj4gLQkJcmV0dXJuIHBsMDYxX2lzX2RhdGFfcmVnKHJl
Zyk7Cj4+IC0JfQo+PiAtfQo+PiAtCj4+IC1zdGF0aWMgY29uc3Qgc3RydWN0IHJlZ21hcF9jb25m
aWcgcGwwNjFfcmVnbWFwX2NvbmZpZyA9IHsKPj4gLQkucmVnX2JpdHMgPSAxNiwKPj4gLQkudmFs
X2JpdHMgPSA4LAo+PiAtCS5yZWdfc3RyaWRlID0gNCwKPj4gLQkubWF4X3JlZ2lzdGVyID0gR1BJ
T0lDLAo+PiAtCS52b2xhdGlsZV9yZWcgPSBwbDA2MV92b2xhdGlsZV9yZWcsCj4+IC0JLmZhc3Rf
aW8gPSB0cnVlLAo+PiAtCS51c2VfcmF3X3NwaW5sb2NrID0gdHJ1ZSwKPj4gLX07Cj4KPk5vLCBJ
IGhhdmUgYWxyZWFkeSB0b2xkIHlvdSBkbyBub3QgbW92ZSB0aGVzZS4gSWYgeW91IG5lZWQgdG8g
cmVuYW1lLCBqdXN0IG1ha2UKPnN1cmUgaXQncyBuYW1lZCBhY2NvcmRpbmdseSBpbiB0aGUgcHJl
dmlvdXMgcGF0Y2ggdGhhdCBpbnRyb2R1Y2VkIHRoaXMuCj4KPi4uLgo+Cj5JIGhhdmUgYSBmZWVs
aW5nIHRoYXQgeW91IGlnbm9yZWQgbXkgbGFzdCByZXZpZXcuIEkgc3RvcCBpdCBoZXJlLCB5b3Ug
bmVlZCB0bwo+Y2FyZWZ1bGx5IHJlYWQgKmFsbCogdGhlIGNvbW1lbnRzIGFuZCBhY3QgYWNjb3Jk
aW5nbHkuCj4KPi0tIAo+V2l0aCBCZXN0IFJlZ2FyZHMsCj5BbmR5IFNoZXZjaGVua28KPgo=
