Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7BC13859D3;
	Sat, 26 Sep 2026 10:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790418255; cv=none; b=or8/BbLiWmGGxWSC/DngGiTICmBbB9lncA4D9fQYSvtITpghcJE0lE5/WFRt2R8wQy6caPcbzAtSLjHvEhxT6VsjWUyoR6eUIQrs9fpYxYKOcddhvoUob9drdalDljZOtvGJbQr14snyRgVXJ2g0MffBj3T0E03nn6RKH0Ue/zc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790418255; c=relaxed/simple;
	bh=JSMDcsb7mQqKZtwVNOAy36EzXynna5sFh1Db6ewgkyA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=iiwmHwIKAsys+MPg9lP7j+2VRqGvuqBzZpS+OEPOJpvAzu1FM+lVBYS263Zylp38o7mAT/ASg8I1d2oLC3X0mCk2X49MqtXNjzJX5Ym/KC/fpTQTUpphm+0XSzRd/qA+d7Uggsz04UodgusLVNMaUsyjxh0fQMfoFtBqObsWdfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=iwFEdYft; arc=none smtp.client-ip=117.135.210.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="iwFEdYft"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=JSMDcsb7mQqKZtwVNOAy36EzXynna5sFh1Db6ewgkyA=; b=i
	wFEdYftA2hrSrtdUVGxGxb8NoGvp3LXhGYjXul/mklgS3SxAuQEoBwEzUYTgR4bz
	IUDDu0uaTWfW74jTQAQe+6Atk0J8NHH8xnZaCT2olIDwVDn6eszwmoDjCo2JhpSb
	twSzE3gTh/Lz5TtSeu84XbuUVHHrFr9n7tAOXL0wUw=
Date: Sat, 26 Sep 2026 18:23:42 +0800 (CST)
From: "jiale yao" <19888972804@163.com>
To: "Biju Das" <biju.das.jz@bp.renesas.com>
Cc: "Linus Walleij" <linusw@kernel.org>,
	"Andy Shevchenko" <andriy.shevchenko@linux.intel.com>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re:RE: [PATCH] pinctrl: mcp23s08: reject devices without match data
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20260511(2e539873) Copyright (c) 2002-2026 www.mailtech.cn 163com
In-Reply-To: <TY3PR01MB11346E0C01A9337A3AF4D97DC868F2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260925133804.2231004-1-yaojiale02@163.com>
 <TY3PR01MB11346E0C01A9337A3AF4D97DC868F2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
X-NTES-SC: AL_Qu2SAviat0op5Cidbekcn08ShO49XMOyvfoi2YFTc8EEly7wyiUqcW1xI3HY/emGMCKDnD2bQTNR1MdDW4hBB7xxOlM4QPo0hT0PJd/eUA==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <34472b57.1961.1a0dd3dff12.Coremail.19888972804@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:gSgvCgC3x2QvnbdqHG5OAA--.501W
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbC7w-6NWq3nS+ecwAA3t
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

SGkgQmlqdSwKCkF0IDIwMjYtMDktMjYgMTg6MDc6MTQsICJCaWp1IERhcyIgPGJpanUuZGFzLmp6
QGJwLnJlbmVzYXMuY29tPiB3cm90ZToKPkhpLAo+Cj4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0t
LS0tCj4+IEZyb206IEppYWxlIFlhbyA8eWFvamlhbGUwMkAxNjMuY29tPgo+PiBTZW50OiAyNSBT
ZXB0ZW1iZXIgMjAyNiAxNDozOAo+PiBTdWJqZWN0OiBbUEFUQ0hdIHBpbmN0cmw6IG1jcDIzczA4
OiByZWplY3QgZGV2aWNlcyB3aXRob3V0IG1hdGNoIGRhdGEKPj4gCj4+IEEgZGV2aWNlIGJvdW5k
IHRocm91Z2ggZHJpdmVyX292ZXJyaWRlIG5lZWQgbm90IG1hdGNoIGFuIGVudHJ5IGluIHRoZSBk
cml2ZXIgdGFibGVzLiBJbiB0aGF0IGNhc2UKPj4gc3BpX2dldF9kZXZpY2VfbWF0Y2hfZGF0YSgp
IHJldHVybnMgTlVMTCwgYnV0IG1jcDIzczA4X3Byb2JlKCkgbGF0ZXIgcGFzc2VzIHRoZSByZXN1
bHQgdG8gdGhlIHJlZ21hcAo+PiBzZXR1cCBhbmQgZGVyZWZlcmVuY2VzIGl0IHdoaWxlIHNldHRp
bmcgdXAgZWFjaCBkZXZpY2UuCj4KPkkgYmVsaWV2ZSB0aGlzIGlzIGFuIGludmFsaWQgdXNlIGNh
c2UgYXMgdGhlIHVzZXIgdHJ5aW5nIGRyaXZlcl9vdmVycmlkZQo+YW5kIHRoZSBwcm9iZSByZXR1
cm5zIGVycm9yLiBBbSBJIG1pc3NpbmcgYW55dGhpbmcgaGVyZT8KClllcywgbXkgY29tbWl0IG1l
c3NhZ2Ugd2FzIG5vdCBjbGVhciBlbm91Z2guIFRoaXMgcGF0Y2ggaXMgaW50ZW5kZWQgdG8gZml4
CmEgcmVncmVzc2lvbiBpbnRyb2R1Y2VkIGJ5IGNvbW1pdCAyZTQ0NTU1YjA1YzAsIHJhdGhlciB0
aGFuIHRvIG1ha2UgYW4KdW5tYXRjaGVkIGRldmljZSBwcm9iZSBzdWNjZXNzZnVsbHkgdGhyb3Vn
aCBkcml2ZXJfb3ZlcnJpZGUuCgpCZWZvcmUgdGhhdCBjb21taXQsIG1pc3NpbmcgbWF0Y2ggZGF0
YSBlZmZlY3RpdmVseSByZXN1bHRlZCBpbiB0eXBlIDAsCndoaWNoIGZlbGwgdGhyb3VnaCB0byB0
aGUgZGVmYXVsdCBzd2l0Y2ggY2FzZSBhbmQgcmV0dXJuZWQgLUVJTlZBTC4KQ29tbWl0IDJlNDQ1
NTViMDVjMCByZXBsYWNlZCB0aGUgdHlwZSB2YWx1ZSB3aXRoIGFuIGluZm8gcG9pbnRlciwgYnV0
IHRoZQpTUEkgcGF0aCBtaXNzZWQgdGhlIGNvcnJlc3BvbmRpbmcgTlVMTCBjaGVjayBiZWZvcmUg
ZGVyZWZlcmVuY2luZwppbmZvLT50eXBlLiBUaGUgSTJDIHBhdGggcHJlc2VydmVkIHRoZSBwcmV2
aW91cyBlcnJvciBoYW5kbGluZyB3aXRoIGFuCmV4cGxpY2l0IE5VTEwgY2hlY2sgYWZ0ZXIgdGhl
IHNhbWUgY29udmVyc2lvbi4KCkNvbnNlcXVlbnRseSwgYW4gdW5tYXRjaGVkIGRldmljZSBib3Vu
ZCB0aHJvdWdoIGRyaXZlcl9vdmVycmlkZSB1c2VkIHRvCmZhaWwgY2xlYW5seS4gSXQgY2FuIG5v
dyBjYXVzZSBhIE5VTEwgcG9pbnRlciBkZXJlZmVyZW5jZSB3aGVuIGEgdmFsaWQKc3BpLXByZXNl
bnQtbWFzayBwcm9wZXJ0eSBpcyBwcmVzZW50LiBUaGlzIHBhdGNoIHJlc3RvcmVzIHRoZSBwcmV2
aW91cwpmYWlsdXJlIGJlaGF2aW9yLgoKPgo+Q2FuIHlvdSBwbGVhc2UgcHJlcGFyZSBhIHBhdGNo
IHRoYXQgbWFrZXMgdGhlIGRyaXZlciBwcm9iZSBzdWNjZXNzIGJ5IHVzaW5nIGRyaXZlcl9vdmVy
cmlkZQo+RmVhdHVyZT8gQWxzbyBwbGVhc2Ugc2hhcmUgc29tZSBsb2dzIHRvIHNlZSBob3cgaXQg
d29ya3MgaW4gcmVhbCBkZXZpY2UKPgo+Q2hlZXJzLAo+QmlqdQo+Cj4+IAo+PiBSZWplY3QgZGV2
aWNlcyB3aXRob3V0IG1hdGNoIGRhdGEgYmVmb3JlIHJlYWRpbmcgZGV2aWNlIHByb3BlcnRpZXMu
Cj4+IAo+PiBGaXhlczogMmU0NDU1NWIwNWMwICgicGluY3RybDogbWNwMjNzMDg6IFNpbXBsaWZ5
IHByb2JlKCkvbWNwMjNzMDhfc3BpX3JlZ21hcF9pbml0KCkiKQo+PiBTaWduZWQtb2ZmLWJ5OiBK
aWFsZSBZYW8gPHlhb2ppYWxlMDJAMTYzLmNvbT4KPj4gLS0tCj4+ICBkcml2ZXJzL3BpbmN0cmwv
cGluY3RybC1tY3AyM3MwOF9zcGkuYyB8IDIgKysKPj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2Vy
dGlvbnMoKykKPj4gCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3BpbmN0cmwvcGluY3RybC1tY3Ay
M3MwOF9zcGkuYyBiL2RyaXZlcnMvcGluY3RybC9waW5jdHJsLW1jcDIzczA4X3NwaS5jCj4+IGlu
ZGV4IGJhY2ViY2ZmNjdlZi4uOTI2MDM0ZmNkNTEyIDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL3Bp
bmN0cmwvcGluY3RybC1tY3AyM3MwOF9zcGkuYwo+PiArKysgYi9kcml2ZXJzL3BpbmN0cmwvcGlu
Y3RybC1tY3AyM3MwOF9zcGkuYwo+PiBAQCAtMTQ2LDYgKzE0Niw4IEBAIHN0YXRpYyBpbnQgbWNw
MjNzMDhfcHJvYmUoc3RydWN0IHNwaV9kZXZpY2UgKnNwaSkKPj4gIAl1OCB2Owo+PiAKPj4gIAlp
bmZvID0gc3BpX2dldF9kZXZpY2VfbWF0Y2hfZGF0YShzcGkpOwo+PiArCWlmICghaW5mbykKPj4g
KwkJcmV0dXJuIC1FTk9EQVRBOwo+PiAKPj4gIAlyZXQgPSBkZXZpY2VfcHJvcGVydHlfcmVhZF91
OChkZXYsICJtaWNyb2NoaXAsc3BpLXByZXNlbnQtbWFzayIsICZ2KTsKPj4gIAlpZiAocmV0KSB7
Cj4+IC0tCj4+IDIuMzQuMQoKQ2hlZXJzLApKaWFsZQoK
