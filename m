Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D8EF3E4C96;
	Sat, 26 Sep 2026 10:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790418550; cv=none; b=pf1/qEYbiK4e7fTo/U06tIvCIFje4Mt7LYRzTkh0C8dH0v1xhoBEbSnC5q4LfMZ2qi1931j0BW4XbsQ6hm5OCHeckTpZhN9STEQvz+4Br1tX8ZDm9vY9VElLUh8OviN6Ubekke6W9QeVuU+ZHLOIgQ2gwDhtS5L4O28g0c/TuWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790418550; c=relaxed/simple;
	bh=P5VwNjmEWnrl21IUUSTUQWIlNQ59SIvqMp4GQYAA1rI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=iTSp3wdtyISiyyheH/+wGUNiAoI9rsXv3uqGtfAGjoKqrIJ65qhtwxcYRc/nEm5IWV6cr6CjYVXq7d99M9AKZOT4tCHYTYdUWNoHEtm5fV+Udbb5uhF8ft4xMLgBXkPvJgVMwQAL2iBbMlHzdNO6YlyZd3Tp7QXz/CeUYRpIMrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=T4Su1o7w; arc=none smtp.client-ip=117.135.210.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="T4Su1o7w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=P5VwNjmEWnrl21IUUSTUQWIlNQ59SIvqMp4GQYAA1rI=; b=T
	4Su1o7wHOCwlk8Z+jkQDa0ZL/NKP32ammIlvErXOxfZy+N1OlXvmYbpRBHfPOVZh
	gS97dhN5b6POylqJBxwBh21VeSgGydLgUngOcF3v7sHJ9YUWDeBx/UOtCiRv1Jhm
	ly8bKuMRpRHktoXkafaFPNn86PeClJ9RRnWO23U6nw=
Date: Sat, 26 Sep 2026 18:28:40 +0800 (CST)
From: "jiale yao" <19888972804@163.com>
To: "Biju Das" <biju.das.jz@bp.renesas.com>
Cc: "Linus Walleij" <linusw@kernel.org>,
	"Andy Shevchenko" <andriy.shevchenko@linux.intel.com>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re:Re:RE: [PATCH] pinctrl: mcp23s08: reject devices without match
 data
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20260511(2e539873) Copyright (c) 2002-2026 www.mailtech.cn 163com
In-Reply-To: <34472b57.1961.1a0dd3dff12.Coremail.19888972804@163.com>
References: <20260925133804.2231004-1-yaojiale02@163.com>
 <TY3PR01MB11346E0C01A9337A3AF4D97DC868F2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <34472b57.1961.1a0dd3dff12.Coremail.19888972804@163.com>
X-NTES-SC: AL_Qu2SAviat00p5iWdZOkcn08ShO49XMOyvfoi2YFTc8EEly7wyiUqcW1xI3HY/emGMCKDnD2bQTNR1MdDW4hBW+nZTjcs5tdawWp4wTJFfQ==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <1358a442.197f.1a0dd4289ef.Coremail.19888972804@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:gSgvCgD3vy9YnrdqRW5OAA--.560W
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbC7xhGgGq3nlisLwAA3p
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

QXQgMjAyNi0wOS0yNiAxODoyMzo0MiwgImppYWxlIHlhbyIgPDE5ODg4OTcyODA0QDE2My5jb20+
IHdyb3RlOgo+SGkgQmlqdSwKPgo+QXQgMjAyNi0wOS0yNiAxODowNzoxNCwgIkJpanUgRGFzIiA8
YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+IHdyb3RlOgo+PkhpLAo+Pgo+Pj4gLS0tLS1Pcmln
aW5hbCBNZXNzYWdlLS0tLS0KPj4+IEZyb206IEppYWxlIFlhbyA8eWFvamlhbGUwMkAxNjMuY29t
Pgo+Pj4gU2VudDogMjUgU2VwdGVtYmVyIDIwMjYgMTQ6MzgKPj4+IFN1YmplY3Q6IFtQQVRDSF0g
cGluY3RybDogbWNwMjNzMDg6IHJlamVjdCBkZXZpY2VzIHdpdGhvdXQgbWF0Y2ggZGF0YQo+Pj4g
Cj4+PiBBIGRldmljZSBib3VuZCB0aHJvdWdoIGRyaXZlcl9vdmVycmlkZSBuZWVkIG5vdCBtYXRj
aCBhbiBlbnRyeSBpbiB0aGUgZHJpdmVyIHRhYmxlcy4gSW4gdGhhdCBjYXNlCj4+PiBzcGlfZ2V0
X2RldmljZV9tYXRjaF9kYXRhKCkgcmV0dXJucyBOVUxMLCBidXQgbWNwMjNzMDhfcHJvYmUoKSBs
YXRlciBwYXNzZXMgdGhlIHJlc3VsdCB0byB0aGUgcmVnbWFwCj4+PiBzZXR1cCBhbmQgZGVyZWZl
cmVuY2VzIGl0IHdoaWxlIHNldHRpbmcgdXAgZWFjaCBkZXZpY2UuCj4+Cj4+SSBiZWxpZXZlIHRo
aXMgaXMgYW4gaW52YWxpZCB1c2UgY2FzZSBhcyB0aGUgdXNlciB0cnlpbmcgZHJpdmVyX292ZXJy
aWRlCj4+YW5kIHRoZSBwcm9iZSByZXR1cm5zIGVycm9yLiBBbSBJIG1pc3NpbmcgYW55dGhpbmcg
aGVyZT8KPgo+WWVzLCBteSBjb21taXQgbWVzc2FnZSB3YXMgbm90IGNsZWFyIGVub3VnaC4gVGhp
cyBwYXRjaCBpcyBpbnRlbmRlZCB0byBmaXgKPmEgcmVncmVzc2lvbiBpbnRyb2R1Y2VkIGJ5IGNv
bW1pdCAyZTQ0NTU1YjA1YzAsIHJhdGhlciB0aGFuIHRvIG1ha2UgYW4KPnVubWF0Y2hlZCBkZXZp
Y2UgcHJvYmUgc3VjY2Vzc2Z1bGx5IHRocm91Z2ggZHJpdmVyX292ZXJyaWRlLgo+Cj5CZWZvcmUg
dGhhdCBjb21taXQsIG1pc3NpbmcgbWF0Y2ggZGF0YSBlZmZlY3RpdmVseSByZXN1bHRlZCBpbiB0
eXBlIDAsCj53aGljaCBmZWxsIHRocm91Z2ggdG8gdGhlIGRlZmF1bHQgc3dpdGNoIGNhc2UgYW5k
IHJldHVybmVkIC1FSU5WQUwuCj5Db21taXQgMmU0NDU1NWIwNWMwIHJlcGxhY2VkIHRoZSB0eXBl
IHZhbHVlIHdpdGggYW4gaW5mbyBwb2ludGVyLCBidXQgdGhlCj5TUEkgcGF0aCBtaXNzZWQgdGhl
IGNvcnJlc3BvbmRpbmcgTlVMTCBjaGVjayBiZWZvcmUgZGVyZWZlcmVuY2luZwo+aW5mby0+dHlw
ZS4gVGhlIEkyQyBwYXRoIHByZXNlcnZlZCB0aGUgcHJldmlvdXMgZXJyb3IgaGFuZGxpbmcgd2l0
aCBhbgo+ZXhwbGljaXQgTlVMTCBjaGVjayBhZnRlciB0aGUgc2FtZSBjb252ZXJzaW9uLgoKSnVz
dCBsaWtlLgotLS0KKyAgICAgICBpbmZvID0gaTJjX2dldF9tYXRjaF9kYXRhKGNsaWVudCk7Cisg
ICAgICAgaWYgKCFpbmZvKQorICAgICAgICAgICAgICAgcmV0dXJuIGRldl9lcnJfcHJvYmUoZGV2
LCAtRUlOVkFMLCAiaW52YWxpZCBkZXZpY2UgdHlwZVxuIik7Ci0tLQpUaGUgcmV0dXJuIHZhbHVl
IG9mIHNwaV9nZXRfZGV2aWNlX21hdGNoX2RhdGEgc2hvdWxkIGJlIGNoZWNrIGFsc28uCgo+Cj5D
b25zZXF1ZW50bHksIGFuIHVubWF0Y2hlZCBkZXZpY2UgYm91bmQgdGhyb3VnaCBkcml2ZXJfb3Zl
cnJpZGUgdXNlZCB0bwo+ZmFpbCBjbGVhbmx5LiBJdCBjYW4gbm93IGNhdXNlIGEgTlVMTCBwb2lu
dGVyIGRlcmVmZXJlbmNlIHdoZW4gYSB2YWxpZAo+c3BpLXByZXNlbnQtbWFzayBwcm9wZXJ0eSBp
cyBwcmVzZW50LiBUaGlzIHBhdGNoIHJlc3RvcmVzIHRoZSBwcmV2aW91cwo+ZmFpbHVyZSBiZWhh
dmlvci4KPgo+Pgo+PkNhbiB5b3UgcGxlYXNlIHByZXBhcmUgYSBwYXRjaCB0aGF0IG1ha2VzIHRo
ZSBkcml2ZXIgcHJvYmUgc3VjY2VzcyBieSB1c2luZyBkcml2ZXJfb3ZlcnJpZGUKPj5GZWF0dXJl
PyBBbHNvIHBsZWFzZSBzaGFyZSBzb21lIGxvZ3MgdG8gc2VlIGhvdyBpdCB3b3JrcyBpbiByZWFs
IGRldmljZQo+Pgo+PkNoZWVycywKPj5CaWp1Cj4+Cj4+PiAKPj4+IFJlamVjdCBkZXZpY2VzIHdp
dGhvdXQgbWF0Y2ggZGF0YSBiZWZvcmUgcmVhZGluZyBkZXZpY2UgcHJvcGVydGllcy4KPj4+IAo+
Pj4gRml4ZXM6IDJlNDQ1NTViMDVjMCAoInBpbmN0cmw6IG1jcDIzczA4OiBTaW1wbGlmeSBwcm9i
ZSgpL21jcDIzczA4X3NwaV9yZWdtYXBfaW5pdCgpIikKPj4+IFNpZ25lZC1vZmYtYnk6IEppYWxl
IFlhbyA8eWFvamlhbGUwMkAxNjMuY29tPgo+Pj4gLS0tCj4+PiAgZHJpdmVycy9waW5jdHJsL3Bp
bmN0cmwtbWNwMjNzMDhfc3BpLmMgfCAyICsrCj4+PiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0
aW9ucygrKQo+Pj4gCj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9waW5jdHJsL3BpbmN0cmwtbWNw
MjNzMDhfc3BpLmMgYi9kcml2ZXJzL3BpbmN0cmwvcGluY3RybC1tY3AyM3MwOF9zcGkuYwo+Pj4g
aW5kZXggYmFjZWJjZmY2N2VmLi45MjYwMzRmY2Q1MTIgMTAwNjQ0Cj4+PiAtLS0gYS9kcml2ZXJz
L3BpbmN0cmwvcGluY3RybC1tY3AyM3MwOF9zcGkuYwo+Pj4gKysrIGIvZHJpdmVycy9waW5jdHJs
L3BpbmN0cmwtbWNwMjNzMDhfc3BpLmMKPj4+IEBAIC0xNDYsNiArMTQ2LDggQEAgc3RhdGljIGlu
dCBtY3AyM3MwOF9wcm9iZShzdHJ1Y3Qgc3BpX2RldmljZSAqc3BpKQo+Pj4gIAl1OCB2Owo+Pj4g
Cj4+PiAgCWluZm8gPSBzcGlfZ2V0X2RldmljZV9tYXRjaF9kYXRhKHNwaSk7Cj4+PiArCWlmICgh
aW5mbykKPj4+ICsJCXJldHVybiAtRU5PREFUQTsKPj4+IAo+Pj4gIAlyZXQgPSBkZXZpY2VfcHJv
cGVydHlfcmVhZF91OChkZXYsICJtaWNyb2NoaXAsc3BpLXByZXNlbnQtbWFzayIsICZ2KTsKPj4+
ICAJaWYgKHJldCkgewo+Pj4gLS0KPj4+IDIuMzQuMQo+Cj5DaGVlcnMsCj5KaWFsZQo+Cg==
