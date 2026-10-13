Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AED7470EA8;
	Tue, 13 Oct 2026 10:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791888119; cv=none; b=EuzOGkwiMbwelNADMNDcpbB/W93qHbeHx9MyvBxqOzEC4s3NRKvsrYP7i0DMS9WFey+pbx8vr5cFIu8sK6Jwy+j8OxJTykw6IEQR16kh/TiHps2vTYW7LoZMUb2ARiIVE9X+UxWao/x0wRw8AXLDk2+yjgBXXh7UJSkIzo8PzaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791888119; c=relaxed/simple;
	bh=7r3c1Ia85RnoJgFoWAz5nSUTPVvBK4/XpMGW/2DrbQk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=kxDPrDiUfCr09qY4AjN3jD+5jtojeF8vdDA/uyUU2gIc8UBMVQOCHN/qSlghtvmQ14PxqXfjKaA0Fvh+3rHlDr/EZGzhSQdIq17Wuz3HTXODdoVrrb+BPAU9FNRijDTFqViDJ7qgg2/pbNDa5dGVMSm8umuYU6kmF5XjIevngNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=IQ4uXsao; arc=none smtp.client-ip=117.135.210.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="IQ4uXsao"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=7r3c1Ia85RnoJgFoWAz5nSUTPVvBK4/XpMGW/2DrbQk=; b=I
	Q4uXsaoS8ak3ODS1ThkDrR27ehG/xgIiQJijh1qYsoxRg5vuA4HlbyHvKS379GHs
	fESD1NUI+fltJRGlSvdh9sdJ3rko7uA0VrGXmJUV8pqA4bd3c/lgppn0TtJmR+G9
	G8M86C09e1eEZK/U2i0PhHsratQnr2iwHR+I/YrIeU=
Date: Tue, 13 Oct 2026 18:41:27 +0800 (CST)
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
Subject: Re:Re: Re: [PATCH 6/7] gpio: pl061: switch data path to gpio-regmap
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20260511(2e539873) Copyright (c) 2002-2026 www.mailtech.cn 163com
In-Reply-To: <as3-9rn0HgpPuiJp@ashevche-desk.local>
References: <20261009-cv75-gpio-v1-0-5836bd438423@ambarella.com>
 <20261009-cv75-gpio-v1-6-5836bd438423@ambarella.com>
 <as3amWxGvbUdwE7k@ashevche-desk.local>
 <e1c092a.7c2c.1a1347a0650.Coremail.zl020895@163.com>
 <as3-9rn0HgpPuiJp@ashevche-desk.local>
X-NTES-SC: AL_Qu2SA/STt0gj4SaeZOkdnUoTj+Y/XMK0uvwk1YdVc9AFgh//xCUeX3pEDEPZ99CoLAKVkDeISTlh1clcTKlGI4uGbPwHnW7dUFYfP3CejA==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <2c43f87d.9089.1a134da5a78.Coremail.zl020895@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:iygvCgD3fwTXCs5qWspXAA--.10269W
X-CM-SenderInfo: d2oqjiqyzvqiywtou0bp/xtbC7hgHeGrOCthgNwAA3o
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

SGkgQW5keSwKClRoYW5rcyBmb3IgdGhlIGZvbGxvdy11cC4KCkFmdGVyIHlvdXIgdjkgbm90ZSBt
YXJrZWQgdGhvc2Ugc2l0ZXMgd2l0aCBfc2V0X2JpdHMoKSwgSSB0b29rIHRoYXQKdG9vIGxpdGVy
YWxseSBhcyByZWdtYXBfc2V0X2JpdHMoKSBhbG9uZS4gVGhhdCBoZWxwZXIgY2Fubm90IGNsZWFy
IGEKYml0LCBzbyBJIGxlZnQgcmVnbWFwX3dyaXRlKCkgaW5zdGVhZCBvZiBtb3ZpbmcgdG8gYSBo
ZWxwZXIgdGhhdCBjYW4KYm90aCBzZXQgYW5kIGNsZWFyLiBZb3UgYXJlIHJpZ2h0IHRoYXQgcmVn
bWFwX2Fzc2lnbl9iaXRzKCkgaXMgdGhhdApoZWxwZXIuIFRoZXJlIGlzIG5vIHNlcGFyYXRlIGhh
cmR3YXJlIG9yIGNhY2hlIHJlYXNvbiB0byBrZWVwCnJlZ21hcF93cml0ZSgpIGhlcmUuIEkgd2ls
bCB1c2UgcmVnbWFwX2Fzc2lnbl9iaXRzKCkgaW4gdGhlIG5leHQKdmVyc2lvbi4KCkJlc3QgcmVn
YXJkcywKTG9uZyBaaGFvCgpBdCAyMDI2LTEwLTEzIDE3OjUwOjQ2LCAiQW5keSBTaGV2Y2hlbmtv
IiA8YW5kcml5LnNoZXZjaGVua29AbGludXguaW50ZWwuY29tPiB3cm90ZToKPk9uIFR1ZSwgT2N0
IDEzLCAyMDI2IGF0IDA0OjU2OjE0UE0gKzA4MDAsIHpsMDIwODk1IHdyb3RlOgo+PiBIaSBBbmR5
LAo+PiAKPj4gU29ycnkgZm9yIHRoZSBjaHVybiBhbmQgdGhhbmtzIGZvciB0aGUgcmV2aWV3Lgo+
PiAKPj4gTG9va2luZyBiYWNrIGF0IHlvdXIgdjkgcmV2aWV3IG9mIHRoZSBjb252ZXJ0IHBhdGNo
LCB0aGUgb25seSBwb2ludCBJCj4+IGRpZCBub3QgZm9sbG93IGlzIHRoZSBkYXRhLXJlZ2lzdGVy
IHBhdGguIFlvdSBtYXJrZWQgdGhvc2UKPj4gcmVnbWFwX3dyaXRlKCkgc2l0ZXMgd2l0aCBfc2V0
X2JpdHMoKS4gSSBkaWQgc3dpdGNoIGRpcmVjdGlvbiBhbmQgSVJRCj4+IGVuYWJsZSB0byByZWdt
YXBfdGVzdF9iaXRzKCkgLyByZWdtYXBfY2xlYXJfYml0cygpIC8gcmVnbWFwX3NldF9iaXRzKCks
Cj4+IGJ1dCBJIGxlZnQgdGhlIGRhdGEtcmVnaXN0ZXIgd3JpdGVzIGFzIHJlZ21hcF93cml0ZSgp
LCBiZWNhdXNlCj4+IHJlZ21hcF9zZXRfYml0cygpIGNhbm5vdCBjbGVhciBhIGJpdCB0byBkcml2
ZSB0aGUgbGluZSBsb3cuIAo+Cj5DYW4geW91IGVsYWJvcmF0ZSBvbiB0aGlzIGEgYml0PyBFdmVu
IGlmIHRoZSBjYWNoZWQgdmFsdWUgaXMgMCwgeW91IHN0aWxsIHdhbnQKPnRvIHdyaXRlIDAsIGRv
IEkgdW5kZXJzdGFuZCBjb3JyZWN0bHk/IFdvdWxkbid0IGl0IGp1c3QgbWVhbiB0aGF0IHRoZSBy
ZWdpc3RlcnMKPnNob3VsZCBiZSBtYXJrZWQgYXMgdm9sYXRpbGUgb3Igc29tZXRoaW5nIGxpa2Ug
dGhhdD8KPgo+PiBJbiB0aGUgbmV4dCB2ZXJzaW9uIEkgd2lsbCB1c2UgcmVnbWFwX2Fzc2lnbl9i
aXRzKCkgdGhlcmUuCj4KPkhtbS4uLiBJZiByZWdtYXBfc2V0X2JpdHMoKSBkb2Vzbid0IHdvcmsg
Zm9yIHlvdSwgcmVnbWFwX2Fzc2lnbl9iaXRzKCkgd2lsbCBub3QKPndvcmsgZWl0aGVyLgo+Cj4+
IEkgZGlkIG5vdCBmaW5kIHRoZSBvdGhlciBub3RlcyBmcm9tIHRoaXMgbWFpbCChqiBkcm9wIGZh
c3RfaW8sIGtlZXAgdGhlCj4+IHJlZ21hcF9jb25maWcgaW4gdGhlIGNvbnZlcnQgcGF0Y2gsIGFu
ZCB0aGUgZ3VhcmQoKSBibGFuayBsaW5lcyChqiBpbgo+PiB0aGUgdjkgY29tbWVudHMuIEkgd2ls
bCBmaXggdGhvc2UgaW4gdGhlIG5leHQgdmVyc2lvbiBhcyB3ZWxsLCBhbG9uZwo+PiB3aXRoIHJl
dmVyc2UgQ2hyaXN0bWFzIHRyZWUgaW4gaXJxX3R5cGUgYW5kIGEgcHJlY3Vyc29yIHRvIGRyb3Ag
dGhlCj4+IHJlZHVuZGFudCBpZiAocGVuZGluZykgY2hlY2suCj4KPlllYWgsIHNvbWUgbm90ZXMg
YXJlIG5ldywgSSBvbmx5IHJlZmVycmVkIHRvIHRoZSBvbGQgb25lcy4KPkJ1dCBJIGJlbGlldmUg
SSBoYXZlIG1lbnRpb25lZCB0aGF0IHRoZSBjb2RlIGlzIG5vdCBuZWVkZWQgYSBzaHVmZmxlCj5h
cyBpdCBzZWVtcyBhbHJlYWR5IGluIGEgZ29vZCBwbGFjZS4gT3RoZXJ3aXNlIGl0J3MgdW5jbGVh
ciBmcm9tIHRoaXMKPmNoYW5nZSB3aHkgdGhlIGFsbW9zdCB1bm1vZGlmaWVkIGNvZGUgaXMgbW92
ZWQgYXJvdW5kLgo+Cj4uLi4KPgo+PiA+PiAtc3RhdGljIGJvb2wgcGwwNjFfaXNfZGF0YV9yZWco
dW5zaWduZWQgaW50IHJlZykKPj4gPj4gLXsKPj4gPj4gLQlyZXR1cm4gaXNfcG93ZXJfb2ZfMihy
ZWcpICYmCj4+ID4+IC0JICAgICAgIHJlZyA+PSBCSVQoUEwwNjFfREFUQV9PRkZTRVQpICYmCj4+
ID4+IC0JICAgICAgIHJlZyA8PSBCSVQoUEwwNjFfREFUQV9PRkZTRVQgKyBQTDA2MV9HUElPX05S
IC0gMSk7Cj4+ID4+IC19Cj4+ID4+IC0KPj4gPj4gLXN0YXRpYyBib29sIHBsMDYxX3ZvbGF0aWxl
X3JlZyhzdHJ1Y3QgZGV2aWNlICpkZXYsIHVuc2lnbmVkIGludCByZWcpCj4+ID4+IC17Cj4+ID4+
IC0Jc3dpdGNoIChyZWcpIHsKPj4gPj4gLQljYXNlIEdQSU9NSVM6Cj4+ID4+IC0JY2FzZSBHUElP
SUM6Cj4+ID4+IC0JCXJldHVybiB0cnVlOwo+PiA+PiAtCWRlZmF1bHQ6Cj4+ID4+IC0JCXJldHVy
biBwbDA2MV9pc19kYXRhX3JlZyhyZWcpOwo+PiA+PiAtCX0KPj4gPj4gLX0KPj4gPj4gLQo+PiA+
PiAtc3RhdGljIGNvbnN0IHN0cnVjdCByZWdtYXBfY29uZmlnIHBsMDYxX3JlZ21hcF9jb25maWcg
PSB7Cj4+ID4+IC0JLnJlZ19iaXRzID0gMTYsCj4+ID4+IC0JLnZhbF9iaXRzID0gOCwKPj4gPj4g
LQkucmVnX3N0cmlkZSA9IDQsCj4+ID4+IC0JLm1heF9yZWdpc3RlciA9IEdQSU9JQywKPj4gPj4g
LQkudm9sYXRpbGVfcmVnID0gcGwwNjFfdm9sYXRpbGVfcmVnLAo+PiA+PiAtCS5mYXN0X2lvID0g
dHJ1ZSwKPj4gPj4gLQkudXNlX3Jhd19zcGlubG9jayA9IHRydWUsCj4+ID4+IC19Owo+PiA+Cj4+
ID5ObywgSSBoYXZlIGFscmVhZHkgdG9sZCB5b3UgZG8gbm90IG1vdmUgdGhlc2UuIElmIHlvdSBu
ZWVkIHRvIHJlbmFtZSwganVzdCBtYWtlCj4+ID5zdXJlIGl0J3MgbmFtZWQgYWNjb3JkaW5nbHkg
aW4gdGhlIHByZXZpb3VzIHBhdGNoIHRoYXQgaW50cm9kdWNlZCB0aGlzLgo+Cj4uLi4KPgo+PiA+
SSBoYXZlIGEgZmVlbGluZyB0aGF0IHlvdSBpZ25vcmVkIG15IGxhc3QgcmV2aWV3LiBJIHN0b3Ag
aXQgaGVyZSwgeW91IG5lZWQgdG8KPj4gPmNhcmVmdWxseSByZWFkICphbGwqIHRoZSBjb21tZW50
cyBhbmQgYWN0IGFjY29yZGluZ2x5Lgo+Cj4tLSAKPldpdGggQmVzdCBSZWdhcmRzLAo+QW5keSBT
aGV2Y2hlbmtvCj4K
