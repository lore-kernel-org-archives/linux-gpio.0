Received: from ms.asus.com (ms.asus.com [103.10.4.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9F36483BF3;
	Mon, 19 Oct 2026 06:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.10.4.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792393068; cv=none; b=WWYCAJblyQ9WIgWDo0AYJTudxN3lPAvKSqXNofM8zRMU3uBIOx+eNpeDmtSaKtOSF5W001Z4spHX8ghpVD3nUqp0r8lgvPNOn8fgpirFSK+W0b2uE2HVXR2ztvy4xOrcttN1ytzsPe+soMj34hYKORnRM4PZ4VimyfZnpUHOkB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792393068; c=relaxed/simple;
	bh=l/leG6AzefIuh//lQeTSr/3Ax386tHNwFfHYlSivCss=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ZhuqVgVyepIlCtKSy9xMXABBnygkVDadm03FKDYS00TaehpMpBW7+tQ9xB6uWpPArwR9S/qFBRqakqCC4yZ0M/GcQ/A7KFcHwvhCi5O+2CH7RrwwodIScPNiJUTQ7vMewykjplsU8VjyvjKE9xyml2aMK0uK1leXG9eneo7cWb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=asmedia.com.tw; spf=pass smtp.mailfrom=asmedia.com.tw; dkim=pass (1024-bit key) header.d=asmedia.com.tw header.i=@asmedia.com.tw header.b=doOQIN94; arc=none smtp.client-ip=103.10.4.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=asmedia.com.tw
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asmedia.com.tw
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=asmedia.com.tw header.i=@asmedia.com.tw header.b="doOQIN94"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=asmedia.com.tw; i=@asmedia.com.tw; q=dns/txt;
  s=asmediacomtw; t=1792393066; x=1823929066;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=l/leG6AzefIuh//lQeTSr/3Ax386tHNwFfHYlSivCss=;
  b=doOQIN94ZYJhUGTEs3ezBHrJN9BZApNwZ9rQKAckhr+jhGkyW3FmuYUu
   olmWYCv1LQRFEsMgl6lkyAIkHW/xHgEmn+E7Pu92rp7EFdwEBQXbjeGXL
   S0+hh4KljINNaEdDMPAGtGx+iRV4qZAodl30juIBJFPUzrbjHlARX7iAd
   8=;
X-CSE-ConnectionGUID: mCrMdnQeRB23bEuJK4Fy+Q==
X-CSE-MsgGUID: 3YsrtiejRpSIkgckci4U8g==
Received: from unknown (HELO APZA005TMD.corpnet.asus) ([172.22.47.65])
  by ms.asus.com with ESMTP; 19 Oct 2026 14:57:22 +0800
Received: from mymail.asus.com (42.70.0.11) by APZA005TMD.corpnet.asus
 (172.22.47.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Mon, 19 Oct
 2026 14:57:21 +0800
From: Szuying Chen <Chloe_Chen@asmedia.com.tw>
To: <Markus.Elfring@web.de>
CC: <linusw@kernel.org>, <brgl@kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-gpio@vger.kernel.org>, <Yd_Tseng@asmedia.com.tw>,
	<Jesse1_Chang@asmedia.com.tw>, <Richard_Hsu@asmedia.com.tw>,
	<Chloe_Chen@asmedia.com.tw>
Subject: RE: [PATCH v2] gpio: amdptpci: add support for AMD PT PCI controller
Date: Mon, 19 Oct 2026 14:57:01 +0800
Message-ID: <20261019065702.31436-1-Chloe_Chen@asmedia.com.tw>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ClientProxiedBy: APZA002EXB.corpnet.asus (172.22.6.14) To
 APZA005TMD.corpnet.asus (172.22.47.65)
X-TM-AS-Product-Ver: SMEX-14.0.0.3239-9.1.2019-30266.002
X-TM-AS-Result: No-10--16.773800-8.000000
X-TMASE-MatchedRID: VPleTT1nwdT5ETspAEX/nhhvdi92BBAuUd1JKREWJmRdTMQtEIkUXSc8
	djr4wzMZ1mh3V2G9QO9bLB1l5ZCZImychE78+cDjFm7cDHk2CrxIZTXFTJArQUfA+mhLvGJNjTU
	I8ELfeWUC1IWtBSdZI+57KXgfyjOGgb7nR2R/5qUarEv/I2gPytXNOAQ2MSi22anGH/Lzelys0m
	4CN4NCDVo7GmCOJYd1VXS3CAt+DxiLN8EktMLbcCHhZY8ek8XKtWRczjgeok/+nHQyxv8W5Kbhq
	D2zQeiCsRB7GgmTujN+3BndfXUhXQ==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--16.773800-8.000000
X-TMASE-Version: SMEX-14.0.0.3239-9.1.2019-30266.002
X-TM-SNTS-SMTP: 	7951E8F052E207A0715459B6017E177EBCAECD5BC9089724F72999A80CC40F002000:8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgTWFya3VzLAoKPj4gVGhpcyBjb21taXQgaW1wbGVtZW50cyB0aGUgbmV3IGdwaW8tYW1kcHRw
Y2kgZHJpdmVyIHRvIHN1cHBvcnQgdGhlCj7igKYKCj5TZWUgYWxzbzoKPmh0dHBzOi8vZ2l0Lmtl
cm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3RvcnZhbGRzL2xpbnV4LmdpdC90cmVl
L0RvY3VtZW50YXRpb24vcHJvY2Vzcy9zdWJtaXR0aW5nLXBhdGNoZXMucnN0P2g9djcuMy1yYzcj
bjk0Cgo+PiBTaWduZWQtb2ZmLWJ5OiBTenV5aW5nIENoZW4gPENobG9lX0NoZW5AYXNtZWRpYS5j
b20udHc+Pgo+PiBDby1hdXRob3JlZC1ieTogWUQgVHNlbmcgPFlkX1RzZW5nQGFzbWVkaWEuY29t
LnR3Pj4KCj5TZWUgYWxzbzoKPmh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9r
ZXJuZWwvZ2l0L3RvcnZhbGRzL2xpbnV4LmdpdC90cmVlL0RvY3VtZW50YXRpb24vcHJvY2Vzcy9z
dWJtaXR0aW5nLXBhdGNoZXMucnN0P2g9djcuMy1yYzcjbjUwMgoKPj4gdjEtPnYyOgo+4oCmCj4+
IC0tLQo+4oCmCj4+ICBkcml2ZXJzL2dwaW8vZ3Bpby1hbWRwdHBjaS5jIHwgODkxIAo+PiArKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwoKPlBsZWFzZSBtb3ZlIHBhdGNoIHZlcnNp
b24gZGVzY3JpcHRpb25zIGJlaGluZCB0aGUgbWFya2VyIGxpbmUuCj5odHRwczovL2dpdC5rZXJu
ZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC90b3J2YWxkcy9saW51eC5naXQvdHJlZS9E
b2N1bWVudGF0aW9uL3Byb2Nlc3Mvc3VibWl0dGluZy1wYXRjaGVzLnJzdD9oPXY3LjMtcmM3I243
OTMKCkkgd2lsbCBjb3JyZWN0IHRoZSBwYXRjaCBmb3JtYXQgaW4gdjMuCj7igKYKPj4gKysrIGIv
ZHJpdmVycy9ncGlvL2dwaW8tYW1kcHRwY2kuYwo+PiBAQCAtMCwwICsxLDg5MSBAQAo+4oCmCj4+
ICtzdGF0aWMgaW50IHB0MjdfZ3Bpb19nZXRfZGlyZWN0aW9uKHN0cnVjdCBncGlvX2NoaXAgKmdj
LCB1bnNpZ25lZCBpbnQgCj4+ICtvZmZzZXQpIHsKPuKApgo+PiArCXJhd19zcGluX2xvY2tfaXJx
c2F2ZSgmY2hpcC0+bG9jaywgZmxhZ3MpOwo+PiArCXZhbCA9IHB0MjdfcmQzMihjaGlwLCBQVDI3
X1JFR19ESVIpOwo+PiArCXJhd19zcGluX3VubG9ja19pcnFyZXN0b3JlKCZjaGlwLT5sb2NrLCBm
bGFncyk7Cj7igKYKCj5VbmRlciB3aGljaCBjaXJjdW1zdGFuY2VzIHdvdWxkIHlvdSBiZWNvbWUg
aW50ZXJlc3RlZCB0byBhcHBseSBhIHN0YXRlbWVudCBsaWtlIOKAnGd1YXJkKHJhd19zcGlubG9j
a19pcnFzYXZlKSgmY2hpcC0+PmxvY2spO+KAnT8KPmh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29t
L2xpbnV4L3Y3LjMtcmM2L3NvdXJjZS9pbmNsdWRlL2xpbnV4L3NwaW5sb2NrLmgjTDU5NC1MNTk3
CgpUaGFua3MgZm9yIHRoZSBwb2ludGVyLiBTaW1wbGUgbG9jay91bmxvY2sgc2VjdGlvbnMgbGlr
ZSB0aGUgb25lIGluIApwdDI3X2dwaW9fZ2V0X2RpcmVjdGlvbigpIGFyZSBnb29kIGNhbmRpZGF0
ZXMgZm9yIGd1YXJkKHJhd19zcGlubG9ja19pcnFzYXZlKSwgCmFuZCB3ZSB3aWxsIHVzZSBpdCB3
aGVyZSBpdCBmaXRzIGluIHYzLgoKPlJlZ2FyZHMsCj5NYXJrdXMKCnRoYW5rcywKCkJlc3QgcmVn
YXJkcywKQ2hsb2UgQ2hlbgo9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT0NClRoaXMgZW1haWwgYW5kIGFueSBhdHRhY2htZW50cyB0byBpdCBj
b250YWluIGNvbmZpZGVudGlhbCBpbmZvcm1hdGlvbiBhbmQgYXJlIGludGVuZGVkIHNvbGVseSBm
b3IgdGhlIHVzZSBvZiB0aGUgaW5kaXZpZHVhbCB0byB3aG9tIGl0IA0KaXMgYWRkcmVzc2VkLklm
IHlvdSBhcmUgbm90IHRoZSBpbnRlbmRlZCByZWNpcGllbnQgb3IgcmVjZWl2ZSBpdCBhY2NpZGVu
dGFsbHksIHBsZWFzZSBpbW1lZGlhdGVseSBub3RpZnkgdGhlIHNlbmRlciBieSBlLW1haWwgYW5k
IGRlbGV0ZSANCnRoZSBtZXNzYWdlIGFuZCBhbnkgYXR0YWNobWVudHMgZnJvbSB5b3VyIGNvbXB1
dGVyIHN5c3RlbSwgYW5kIGRlc3Ryb3kgYWxsIGhhcmQgY29waWVzLiBJZiBhbnksIHBsZWFzZSBi
ZSBhZHZpc2VkIHRoYXQgYW55IHVuYXV0aG9yaXplZCANCmRpc2Nsb3N1cmUsIGNvcHlpbmcsIGRp
c3RyaWJ1dGlvbiBvciBhbnkgYWN0aW9uIHRha2VuIG9yIG9taXR0ZWQgaW4gcmVsaWFuY2Ugb24g
dGhpcywgaXMgaWxsZWdhbCBhbmQgcHJvaGliaXRlZC4gRnVydGhlcm1vcmUsIGFueSB2aWV3cyAN
Cm9yIG9waW5pb25zIGV4cHJlc3NlZCBhcmUgc29sZWx5IHRob3NlIG9mIHRoZSBhdXRob3IgYW5k
IGRvIG5vdCByZXByZXNlbnQgdGhvc2Ugb2YgQVNNZWRpYSBUZWNobm9sb2d5IEluYy4gVGhhbmsg
eW91IGZvciB5b3VyIGNvb3BlcmF0aW9uLg0KPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09Cg==

