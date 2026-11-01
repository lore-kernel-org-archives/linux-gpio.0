Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=162.62.57.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793532709;
	b=mNacLWKUwF65WcaPnwkNtwjjyVV9sgOtGEg3MSEM24TVh0/WQQVSxJiyu8IFa9lfo4q9
	 iT1mkpfcfBPxSDSWapfGyPnCMJ6lAQCSud46m8TKjnSIpZoeqL+lNWyvY46YmWD1hLK0p
	 EotShNq234iwtbZIr3x9v04HTb5g1rkNdBFVjrMan2p2EnBLrYej/mERBN535nu+6xl+F
	 EQjju24K3LkSuSlcNLletWtC9J/pqFsnaSOkt/sNER7bVxjVoStmYmnEGkxxMhXJPGz7q
	 t+DG8844kb0XKGe44vovx8OQTWoNKG3YEPH00rFPzoG+E2YJqzcoeNcVc8uXfoMtAxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793532709;
	h=DMARC-Filter:DKIM-Signature:X-QQ-XMRINFO:X-QQ-XMAILINFO:From:To:Cc:
	 Subject:Mime-Version:Content-Type:Content-Transfer-Encoding:Date:
	 X-Priority:Message-ID:X-QQ-MIME:X-Mailer:X-QQ-Mailer:References:
	 In-Reply-To:X-QQ-mid;
	bh=4PXzGc2Rw2fCXjkklglmjwOBpwPL/t0RkrO1+a8BwTs=;
	b=eWpxdfLbN7f2BEIJMUTaqRLXlSjuvsv/IH8cV2pl7w/e5zz+W9s4TUnFSKWF7xmyciSE
	 G7D3Ti5kul4N8itOYOy3pvWLYgkrM4PGKvJvk2kVLbASAGe/tqf/O0JmYAkfR93uLLDUl
	 v0jEBVChDFCLafMTekyLh034W395nmQ11V3wIGJelJHk9EGg/r82ltjnzYjRnDAM16dPS
	 UAsC2HZqsp6QVjakqnT/GY0fHWSbinoPW7A1oxu6A3PsLplY/oMAkSKo3VJ1YfWgFWYSt
	 eeSG9p6SYwGhvGPCgqD1Dqt2kA62rrh2xBENRJurakI0FiFKY9Iis/0+NxWruHutYMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=qq.com;
	spf=pass smtp.mailfrom=qq.com;
	dkim=pass header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=zuHVTW5t;
	arc=none smtp.remote-ip=162.62.57.49
Received: from out162-62-57-49.mail.qq.com (out162-62-57-49.mail.qq.com [162.62.57.49])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4CA9606A324;
	Sun,  1 Nov 2026 11:31:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4CA9606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=zuHVTW5t
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1793532694; bh=4PXzGc2Rw2fCXjkklglmjwOBpwPL/t0RkrO1+a8BwTs=;
	h=From:To:Cc:Subject:Date:References:In-Reply-To;
	b=zuHVTW5traxZzn7gUPJQzknvG+nR+QwyXrFO3v5WEaqzbrVbjLyfuHkhh46TEzDZD
	 9w07+o/XwWCYXC+BFh021ps/ZUDKzZM6kbsTbPEsJADmRVRn3E2KfsSfodVAMBNL3B
	 1/UnuvVzzFFVwL9ap+Go3dS1sz3JMr/wkGaEt3RQ=
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
X-QQ-XMAILINFO: N55iztL8edgQybSWYxuz+O1+9mOuF4a6o9IlPHWQBhRVZDIrch1h77KPomNJ/B
	 Nw0cRyirxwQuJC/Zmd9tvtdVZv9PIkx4G8zIqW3WkKGx3+cz5H6hAW0nO2abi4WxCICewmrkz24Y5
	 4gDCn5unlZ9E3H60lTVIBbeedRLttniY1vF6P9OkMwhsxezC6F/Wdf7dIRvfr+YD+120vBhn/EVBX
	 Z0N4RXfibxF4cTfeJfIO9XgA7m9H/qNUUUk8L/7XCfIxNeszcTEPCGxFw6cbzvCR8bK0urlao9GMp
	 b37eQJj1TNDomNLU4TlauNG2MLLe/m6YT/3/daLN4faXMG9c3Xv8RaIs6t2zXF5M9/eeO1kd6UZ2b
	 qRRMx99oge2xpz0V8EtCD10Y5P1nGdSQfF2s8jOzNVqJGx6NJyHBDk0jc+rhHR9yR/SPYT8f6qrW1
	 4AH8rJhciGcs722AuzpnWmRIZU+HlMtmSespSzXPb/TB+bLm4QWrGZ43zbe9ossVbsrsjxrneGKmS
	 iJ3OANCDWjL62o2EH5AQxN87S9cp0sdIgWeXC2gkMiPbP52LwlhXkgqI13Wp61sJdjNESXD/tYMw/
	 FDqhNQEC/MuXxCKLRbfplE+7AKq2OIADHhXFBVNHxB+rPvcsspfezSH0BGT51y7K47ikmjMehRln2
	 XWXJ1TbdnuKbJHEt16Itz/HLx9CBfKekPE8HES17zLT+hFZ35ZGBKcUbidyOyFfPbkvr1ptXCJ5vi
	 jCfJJRhxeq4WHq0tXZBSqCzc2y6d7t/BOfI7Gb0ixJuT8p+VxWRBzVmqtHW85fHoTA37+dT4zoSOY
	 w8K/yEhg2nELVC6UMYix9sTVhxJsTDFQTbuITdWsJ9n0meTHwLdzzhm1rdiJobHe0SUzQm5WxIxta
	 3wh2swzy6RCJswD+r8vpyXjztAdk2Mk9f5zgSuLLHtAAiUwfAyvc0pBoQQRWitDOALiwngHR9cfSh
	 9+4rckDH+rQFDCSdGXFPIvdjjpbNrKpevfwBSE9Msw10Uq7yxuPAgGU2didtugTq2H4sFXiiObg9Q
	 bIM9UM6CLnA2PE5SoggXwT3z2442zqIKO00Li2FJRLYqZppzIxLq1grqXRclociJt+SPB
From: "=?utf-8?B?Q3VuaGFvIEx1?=" <1579567540@qq.com>
To: "=?utf-8?B?QmFydG9zeiBHb2xhc3pld3NraQ==?=" <brgl@kernel.org>
Cc: "=?utf-8?B?bGludXgtY2xr?=" <linux-clk@vger.kernel.org>, "=?utf-8?B?ZGV2aWNldHJlZQ==?=" <devicetree@vger.kernel.org>, "=?utf-8?B?bGludXgtYXJtLWtlcm5lbA==?=" <linux-arm-kernel@lists.infradead.org>, "=?utf-8?B?bGludXgtcm9ja2NoaXA=?=" <linux-rockchip@lists.infradead.org>, "=?utf-8?B?bGludXgta2VybmVs?=" <linux-kernel@vger.kernel.org>, "=?utf-8?B?bGludXgtZ3Bpbw==?=" <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH 09/27] gpio: rockchip: Add RK3572 GPIO support
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
Date: Sun, 1 Nov 2026 19:31:33 +0800
X-Priority: 3
Message-ID: <tencent_82A28995065FC62D017F243F201551C14F05@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
References: <20261022-add-board-ok3572-c-v1-0-0b0fd85a31ee@qq.com> <20261022-add-board-ok3572-c-v1-9-0b0fd85a31ee@qq.com>
	<CAMRc=MeNF_=T2Yb6wzsQFFcpO+w7sLgaKR=sZhZRzRDFcpgumw@mail.gmail.com>
In-Reply-To: <CAMRc=MeNF_=T2Yb6wzsQFFcpO+w7sLgaKR=sZhZRzRDFcpgumw@mail.gmail.com>
X-QQ-mid: xmsezb41-0t1793532693thpegsapc

SGksCgo+PiAgIHBlbmRpbmcgPSByZWFkbF9yZWxheGVkKGJhbmstPnJlZ19iYXNlICsgYmFu
ay0+Z3Bpb19yZWdzLT5pbnRfc3RhdHVzKTsKPgo+IFBsZWFzZSBzcHJpbmtsZSBpbiBzb21l
IG5ld2xpbmVzIGZvciByZWFkYWJpbGl0eSBoZXJlLi4uCj4KPj4gKyBmb3IgKHVuc2lnbmVk
IGludCBpID0gMDsgaSA8IGJhbmstPm5yX2lycXM7IGkrKykgewo+PiArIGlmIChiYW5rLT5p
cnFzW2ldID09IGlycV9kZXNjX2dldF9pcnEoZGVzYykpIHsKPj4gKyBwZW5kaW5nICY9IGJh
bmstPmlycV9tYXNrc1tpXTsKPj4gKyBicmVhazsKPj4gKyB9Cj4+ICsgfQo+Cj4gLi4uIGhl
cmUgLi4uCj4KPj4gICBmb3JfZWFjaF9zZXRfYml0KGlycSwgJnBlbmRpbmcsIDMyKSB7Cj4+
IC4uLgo+PiArIGFzc2lnbmVkIHw9IGJhbmstPmlycV9tYXNrc1tpXTsKPj4gKyB9Cj4KPiAu
Li4gaGVyZSwgZXRjLgo+Cj4+ICsgYmFuay0+aXJxX21hc2tzWzBdID0gfmFzc2lnbmVkOwoK
SSB3aWxsIGFkZCBibGFuayBsaW5lcyBhdCB0aGVzZSBwbGFjZXMgdG8gaW1wcm92ZSByZWFk
YWJpbGl0eSBpbiB0aGUKbmV4dCB2ZXJzaW9uLgoKPj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUv
c29jL3JvY2tjaGlwL3JvY2tjaGlwX3NpcC5oIGIvaW5jbHVkZS9zb2Mvcm9ja2NoaXAvcm9j
a2NoaXBfc2lwLmgKPgo+IFRoZSBjaGFuZ2VzIGluIGhlYWRlcnMgaW4gb3RoZXIgc3Vic3lz
dGVtcyBzaG91bGQgYmUgaW4gc2VwYXJhdGUgcGF0Y2hlcy4KCkkgYW0gYWxyZWFkeSB3b3Jr
aW5nIG9uIHNwbGl0dGluZyB0aGUgcGF0Y2hlcyBieSBzdWJzeXN0ZW0sIGFuZCBJIHdpbGwK
cHV0IHRoZXNlIGhlYWRlciBjaGFuZ2VzIGludG8gc2VwYXJhdGUgcGF0Y2hlcy4gSSB3aWxs
IHJlc3VibWl0IHRoZSBHUElPCnBhcnQgbGF0ZXIgd2l0aCB0aGVzZSBjaGFuZ2VzIGFkZHJl
c3NlZC4KClRoYW5rIHlvdSBmb3IgdGFraW5nIHRoZSB0aW1lIHRvIHJldmlldyBteSBwYXRj
aCEKCkJlc3QgcmVnYXJkcywKQ3VuaGFvIEx1Cg==

