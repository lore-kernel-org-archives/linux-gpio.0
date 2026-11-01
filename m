Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=162.62.58.211
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793533157;
	b=g4danMqqTNkKBY7dH2P80ykjH370zlSmRB3p2JUqQtlqgBEahMEHV8XTVqkDps6RDG5q
	 ui5wVju8/Y66Xt6cI4EiBjLRco8534ewssZE8Z6FMTX5Ovgd4iAtg5RnL6yWpo41XrD1b
	 4Z3kZMIDpyWHXldrB9FqnM6okT5c/Z7fxclprzPvmbtzuvIfrfV9LlGWOGOBhSThZ7VhG
	 BrE48SWhEMIPWADFUM57cMyjUJke3wbUlYkbYEy3ui8NuzEOMfIdBVxmcTQZn9mcf4/+2
	 pqAXN5iDSbFAwBRWXr2J275eWmeELQC3u0Zw/GFfT1XTDDXsxwSfdetXPxiWVjGc60w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793533157;
	h=DMARC-Filter:DKIM-Signature:X-QQ-XMRINFO:X-QQ-XMAILINFO:From:To:Cc:
	 Subject:Mime-Version:Content-Type:Content-Transfer-Encoding:Date:
	 X-Priority:Message-ID:X-QQ-MIME:X-Mailer:X-QQ-Mailer:References:
	 In-Reply-To:X-QQ-mid;
	bh=5uHMqeGCi5xEjxp7eaOraEh1Wivt/hows3ISRJRA5sc=;
	b=zJ/gXNA2bpusW2+Xg66kfsI5BKMO1uD01/yhRT9LpN9Z4cJ1pd4J4x86YZfJtWOfsu6V
	 dX5wNcjcOxpV37zy1in1Nt1jeMjWiCEQCCb9aiN7RMOiSluKQoSbuOBJ6UPQrrYL3vDVJ
	 eCNLAyAEmTajsvWAineBwMOCVGvsuz9SbfVmXIBlxdtD1vTwid7+1p7G/WoVhFDwEQtXj
	 8Qr4Es2pfff2wDzZ+MCFkwCeaf/6u6tRAhlwoxdNvF2pR4sDzBXLn98V9DLRcfgkU653r
	 3oMLKaOjaYdWNCuLguRNYwhg+F6oUAM7MpEIhQiCstHNxuCYp0xkb2DQlVU364BfUCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=qq.com;
	spf=pass smtp.mailfrom=qq.com;
	dkim=pass header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=XbiFhlDv;
	arc=none smtp.remote-ip=162.62.58.211
Received: from out162-62-58-211.mail.qq.com (out162-62-58-211.mail.qq.com [162.62.58.211])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84C58606A325;
	Sun,  1 Nov 2026 11:39:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84C58606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=XbiFhlDv
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1793533145; bh=5uHMqeGCi5xEjxp7eaOraEh1Wivt/hows3ISRJRA5sc=;
	h=From:To:Cc:Subject:Date:References:In-Reply-To;
	b=XbiFhlDvI6WGK8Bsvq8LH7n0vu1J/qtX7NScBAtj1EFYUeJUcTbZLekmvevT4pDJi
	 L8u+hNlUKJHvEKRoq6/56YUkF+SlBI972ERJOauNdaKGMX/9/22qjutC2Pm6sbAO2q
	 NsM/l0TijMC1xEp+42hCMB2mLk/6qIvFEfR/1PJA=
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
X-QQ-XMAILINFO: NkQGnmzToUyF0HQ0dYoXDCd8WAlZNEOU7fHjxUZdzBCyuy7mN4509D4z/oFOLF
	 mp8O3+8yYpU9EBj+4Wa1B83pgvDaatwTABEjm54x+Tj652l17NWrmh8FnTeBZ8iisLukH531dkto3
	 1epOliaRAypX17H3VMsY07+Wvgqk9e5GsxJ4YxIqwiAtoCfpizYbPcirRK8jekIKSsGuE+TM+9YLr
	 AU2XW7tYus4vIUesvhJ346t5rtR4aUwsMdXBsoOa2HZapPMreMozjuMFK5bwW/iIjH6dIxifSuROa
	 +qzyzbrr2KyhW9UgAZib5YZeiP8HHHXR0+g2tyFZ6e7kSjHC4GSi8qadlRcxWfoIR5YbpJi+I43fA
	 OD2k4aB2C2XdGdWmoTpgLRQsVfJiG8NntDpUwa4rOenYOo/WQzDKvvkNHWxamomjilq3bZLADTeXm
	 8UT/Y6ZANI7fF96dpgTxR2wGcbnrUJDKNfx9J3r/1MdwjKDY3cXo1BfesRbo0WvJI66tWuYxVYT97
	 hQypgWt0hBqWYcOMA672gQq2wzqQ/kq6hNVb5OrxmZ+cxcA0UrSzel4V+8Xqs6/i5LlttU7HCmeut
	 ebxATsgi8CqSuAmOXtopJ34fW38TwplM9fGbTsA5a9Of2Bv1srR0O9+f5EaRTIv//zZLppQMuVNW6
	 vVH1s2yzLyUrEKVp40L4CIUPPFcH/7XQaMu3Ex5YDVDryrVJJJKNvuvwCTN3ynaeI0Drar8n0vbAT
	 LhJek8pdik/8YpUYCFZkMwzPv3IlRP70FA42CdsVe2rb+LQsnLyw5wmYdFPVsEnmprnWWtwtexqlu
	 UT2TSA96rGmBUqgqHO3XCw7Py88VgePSu0+HZXrVQSgQLQM5N9HD7BwemBa8dcccqND2hCHjmd37A
	 dccK23A7bq37MpdZT1/dOdzhlFZNLWXRiORJiyZw/QMfJxce/w6qwZF3vnH92m84vgdj+w5oRVwHe
	 8LaTrvTY26iR0TVigTrR/KMO5P3nrpa8BfiZUAUPYScNOl0stTaTm0q9Z2KOE9Um9F2uhZDng9585
	 ksoGddMClOCvlkKFDu8STVWDH5fhueHuRwyvinVRN8h9L506imQ8DvXDZ698ulVpfx43u
From: "=?utf-8?B?Q3VuaGFvIEx1?=" <1579567540@qq.com>
To: "=?utf-8?B?TWFuaXZhbm5hbiBTYWRoYXNpdmFt?=" <mani@kernel.org>
Cc: "=?utf-8?B?bGludXgtYXJtLWtlcm5lbA==?=" <linux-arm-kernel@lists.infradead.org>, "=?utf-8?B?bGludXgtcm9ja2NoaXA=?=" <linux-rockchip@lists.infradead.org>, "=?utf-8?B?bGludXgta2VybmVs?=" <linux-kernel@vger.kernel.org>, "=?utf-8?B?bGludXgtZ3Bpbw==?=" <linux-gpio@vger.kernel.org>, "=?utf-8?B?bGludXgtcGh5?=" <linux-phy@lists.infradead.org>, "=?utf-8?B?bGludXgtdXNi?=" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH 21/27] phy: rockchip-inno-usb2: Add RK3572 support
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64
Date: Sun, 1 Nov 2026 19:39:03 +0800
X-Priority: 3
Message-ID: <tencent_650649C624E17C043BA00BB1D4CFB8498105@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
References: <20261022-add-board-ok3572-c-v1-0-0b0fd85a31ee@qq.com>
 <20261022-add-board-ok3572-c-v1-21-0b0fd85a31ee@qq.com>
	<179353031285.2955.4272173079718014092.b4-reply@b4>
In-Reply-To: <179353031285.2955.4272173079718014092.b4-reply@b4>
X-QQ-mid: xmsezb41-0t1793533143tqyga0g4o

SGksCgo+PiArIHJlZmNsayA9IGRldm1fY2xrX2dldChycGh5LT5kZXYsICJwaHljbGsiKTsK
Pj4gKyBpZiAoSVNfRVJSKHJlZmNsaykpCj4+ICsgcmV0dXJuIFBUUl9FUlIocmVmY2xrKTsK
Pgo+IFBsZWFzZSBpbnNlcnQgYSBuZXdsaW5lIGJldHdlZW4gZWFjaCBvcGVyYXRpb24gdG8g
aW1wcm92ZSByZWFkYWJpbGl0eS4KPgo+PiArIHJhdGUgPSBjbGtfZ2V0X3JhdGUocmVmY2xr
KTsKPj4gKyBpZiAocmF0ZSAhPSAyNDAwMDAwMCAmJiByYXRlICE9IDI2MDAwMDAwKQo+PiAr
IHJldHVybiAtRUlOVkFMOwoKSSB3aWxsIGFkZCBhIGJsYW5rIGxpbmUgaGVyZSBhbmQgYmV0
d2VlbiB0aGUgb3RoZXIgb3BlcmF0aW9ucyB0byBpbXByb3ZlCnJlYWRhYmlsaXR5LgoKPj4g
KyAvKiBTZXQgdGhlIG5vcm1hbCBsaW5lLXN0YXRlIGZpbHRlciBpbnRlcnZhbC4gKi8KPj4g
KyByZXQgPSByZWdtYXBfd3JpdGUocnBoeS0+Z3JmLCByZWcgKyAweDAwMjAsIDB4MzAxMDAp
Owo+PiArIGlmIChyZXQpCj4+ICsgcmV0dXJuIHJldDsKPgo+IEhlcmUuCj4KPj4gKyAvKiBJ
bmNyZWFzZSBIUyB2b2x0YWdlIGJ5IDUuODklIGFuZCBkb3VibGUgcHJlLWVtcGhhc2lzIGN1
cnJlbnQuICovCj4+ICsgcmV0ID0gcmVnbWFwX3dyaXRlKHJwaHktPmdyZiwgcmVnICsgMHgw
MDBjLCBHRU5NQVNLKDI3LCAyNCkgfCAweDA5MDApOwo+PiArIGlmIChyZXQpCj4+ICsgcmV0
dXJuIHJldDsKPgo+IEFuZCBoZXJlLgoKSSB3aWxsIGFkZCBibGFuayBsaW5lcyBhdCB0aGVz
ZSBwbGFjZXMgdG9vLgoKSSBhbSB3b3JraW5nIG9uIHNwbGl0dGluZyB0aGUgcGF0Y2hlcyBi
eSBzdWJzeXN0ZW0sIGFuZCBJIHdpbGwKcmVzdWJtaXQgdGhpcyBwYXRjaCBhcyBwYXJ0IG9m
IHYyIGFmdGVyIGFkZHJlc3NpbmcgdGhlc2UgY29tbWVudHMuCgpUaGFuayB5b3UgZm9yIHlv
dXIgcmV2aWV3IQoKQmVzdCByZWdhcmRzLApDdW5oYW8gTHUK

