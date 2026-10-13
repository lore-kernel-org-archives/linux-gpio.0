Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A1DC2F7EE6;
	Tue, 13 Oct 2026 08:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791881993; cv=none; b=aLcTcJKCjCIFLdbQDMcl0jzq4mhIsMTyG6EXnY+229ZUWkdVOmf1ouOcPyJmvNBBs2OItRmeFVriPV65hWisJir+EDaKmfYtyxEQFN8TxQQP7u+T7ohvWn2LpPJIEPpn6Vw3nIOtKJSQrsUFi1nscRSLTcHwCXlUWzn2DLXZGXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791881993; c=relaxed/simple;
	bh=E+OB+7ryd2uCOa1wQ2cOEUOH0WEIAsx12e86IoqGjbQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=emVfPUC72FRJ4J+qtbxsSZNaf1uOX/9HR0nt/CEBP9st0A390EnQ6X2fkxRzYLQZXb5aS++Ztcq14HY5OZ8eT+M79GBdjTmVEiF+1ofKfrCM0zr/AC5eLMjI0xCDPqlytKEPL/xJL59DYrUG3oBpwLR8IYPpteDEwyrXSbEiYiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=J3HqYlFI; arc=none smtp.client-ip=220.197.31.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="J3HqYlFI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=E+OB+7ryd2uCOa1wQ2cOEUOH0WEIAsx12e86IoqGjbQ=; b=J
	3HqYlFI0x76puVtuzCj6BNmT3kSdkaQzPSezdcdjoS+1Geli47hzqINGyHxCJZ1E
	1DcF8HDysdNHWUXqlsBpKfPafAVy2k/kG0QYuDMqHZDaL77RsoCUMYpSbJkCAafX
	ajwiBjC8VBvrpU678QRST8xkgOZvagtgQBZXI+MNrg=
Date: Tue, 13 Oct 2026 16:59:23 +0800 (CST)
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
Subject: Re:Re: [PATCH 7/7] gpio: pl061: add Ambarella register-layout
 variant
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20260511(2e539873) Copyright (c) 2002-2026 www.mailtech.cn 163com
In-Reply-To: <as3a7UTe9YEyBAY3@ashevche-desk.local>
References: <20261009-cv75-gpio-v1-0-5836bd438423@ambarella.com>
 <20261009-cv75-gpio-v1-7-5836bd438423@ambarella.com>
 <as3a7UTe9YEyBAY3@ashevche-desk.local>
X-NTES-SC: AL_Qu2SA/STvkEt5SmZZukdnUoTj+Y/XMK0uvwk1YdVc/wElDLh/QIGXnx4LVn57NCEASONoSqOQD9f5t9aVplH+dw2VSZJxP0KkMC8A4mHNA==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179f2223.7d43.1a1347ce995.Coremail.zl020895@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:dCgvCgD3Pzfs8s1qv45XAA--.13348W
X-CM-SenderInfo: d2oqjiqyzvqiywtou0bp/xtbC7QsFdmrN8uvmDwAA3C
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

SGkgQW5keSwKCllvdSBkaWQgZ2l2ZSBSZXZpZXdlZC1ieSBlYXJsaWVyLiBBZnRlciB0aGF0CnRh
ZyB0aGUgY29tbWl0IGdhaW5lZCB0aGUgREFUIGNhY2hlLCBzbyBJIGRyb3BwZWQgdGhlIHRhZyBi
ZWNhdXNlIHRoZQpjb2RlIGNoYW5nZWQuIElmIHlvdSBhcmUgc3RpbGwgZmluZSB3aXRoIHRoYXQg
dmVyc2lvbiwgSSB3aWxsIHJlc3RvcmUKaXQuCgpUaGFua3MgZm9yIHRoZSByZXZpZXcuCgpCZXN0
IHJlZ2FyZHMsCkxvbmcgWmhhbwoKQXQgMjAyNi0xMC0xMyAxNToxNzowMSwgIkFuZHkgU2hldmNo
ZW5rbyIgPGFuZHJpeS5zaGV2Y2hlbmtvQGxpbnV4LmludGVsLmNvbT4gd3JvdGU6Cj5PbiBGcmks
IE9jdCAwOSwgMjAyNiBhdCAwNjo1ODowMFBNICswODAwLCBMb25nIFpoYW8gdmlhIEI0IFJlbGF5
IHdyb3RlOgo+Cj4+IEFkZCBhIDMyLWJpdCwgMzItbGluZSBsYXlvdXQgd2l0aCBEQVQvRElSL0lT
L0lCRS9JRVYvSUUvTUlTL0lDIHBsdXMKPj4gTUFTSyBhbmQgRU5BQkxFLiBQcm9iZSB1bm1hc2tz
IHRoZSBiYW5rIGFuZCBlbmFibGVzIHRoZSBjb250cm9sbGVyLgo+PiBJUlEgdHlwZSBjaGFuZ2Vz
IGFsc28gY2xlYXIgdGhlIHBlbmRpbmcgYml0LiBUaGlzIGRlcml2YXRpdmUgZG9lcyBub3QKPj4g
bmVlZCB3cml0ZS1hZnRlci1kaXJlY3Rpb24gb3Igc3lzdGVtIHN1c3BlbmQgc2F2ZS9yZXN0b3Jl
Lgo+PiAKPj4gQ2FjaGUgREFUIChSRUdDQUNIRV9GTEFUX1MsIG5vdCB2b2xhdGlsZSkgc28gZ3Bp
b19zZXQoKSB1cGRhdGVzIG9uZQo+PiBiaXQgZnJvbSB0aGUgb3V0cHV0IHNoYWRvdyBpbnN0ZWFk
IG9mIHJlYWQtbW9kaWZ5LXdyaXRpbmcgdGhlIHBpbgo+PiBsZXZlbCBhY3Jvc3MgdGhlIGJhbmsu
Cj4+IAo+PiBNYXRjaCB0aGUgcGFydCB3aXRoIGRlc2lnbmVyIEFNQkFfVkVORE9SX0FNQkFSRUxM
QSAoSkVQMTA2IGlkZW50aXR5Cj4+IDB4NjgsIGJpdCA3IHNldCkgYW5kIHBhcnQgbnVtYmVyIDB4
MDYxLgo+Cj5JY2s/ISBJIHRob3VnaHQgSSBnYXZlIGEgdGFnIGZvciB0aGlzLiBXaGF0J3MgZ29p
bmcgb24/Cj4KPi0tIAo+V2l0aCBCZXN0IFJlZ2FyZHMsCj5BbmR5IFNoZXZjaGVua28KPgo=
