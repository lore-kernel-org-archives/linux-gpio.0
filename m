Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=183.62.165.209
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794820953;
	b=QHhhX2Xg1iqwnCTm3zKmZG3VtJV8a7rCkYlZZlKsa7k2QcWlUWjLP+XXkTkD+7MJIcMX
	 a/wl5JpzddEWuW/wUt9/wuM3gr3xrFr6+2PYtB3Jg2uKRRxgW8MnuZIGFBRawCnzowbrg
	 OjBDAydJ4xyXERsB+nI4k8v8xTUScy2iMsBOHP798L647hrpPjxeTPcS+/L0T+mLzeRUx
	 G0iMPC0IuFZVtqy6QWLyHJKilbZXTM9HL+2UxBOgiL2uw1Di49kIM4UfOn01xMoewv5fL
	 kIV7w9UKOrwposv4tA9hmxMqwKpeT0VDWwQi6ddWBIJlbfctwkgUeaX9PoPAuhMC/aQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794820953;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 X-Zmail-TransId:X-Mailer:Message-ID:In-Reply-To:References:Date:
	 Mime-Version:From:To:Cc:Subject:Content-Type:X-MAIL:X-TLS:
	 X-ENVELOPE-SENDER:X-SOURCE-IP:X-CLEAN:X-Fangmail-Anti-Spam-Filtered:
	 X-Fangmail-MID-QID;
	bh=k7leMxQfqf8PPrgW+Q3IBRWJMlU+OBdpAzRmEk7fea4=;
	b=jJJag0Y9LGUAeyPVqAuB+ZJYbc1pJvW20GkJuFhFRlq62Lf3bkvEkwDcK3hoxQtGBPyN
	 NGk7QYTKPuriVwvKSKCZ7kIM0I/5WuDdIo/9IU+s5bmJIcmMPTDw75LbZgp40EvqoJGrI
	 t+cFFENwLz23T/uQbTnmJlAhGLHVvk5klZH7TVWMT9rDjO23e+lZaMrAXgxyX3Pc27iXF
	 5iwwLMh6cvWeDC4DjEVn8UsNKonfnMEaAFtrRdu13Q6PZ+LNAXfrBbPn5vjqIrSmFfJdM
	 xE2b63B19ouNclvu0zk+T4Ic61Sh/M8w73tgyvZSrWIKcsYfZiPAN5hUbBCw8yKYntQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=zte.com.cn;
	spf=pass smtp.mailfrom=zte.com.cn;
	dkim=pass header.d=zte.com.cn header.i=@zte.com.cn header.a=rsa-sha256 header.s=z202610 header.b=umCfM3bE;
	arc=none smtp.remote-ip=183.62.165.209
Received: from mxct.zte.com.cn (mxct.zte.com.cn [183.62.165.209])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 158BA606A31C;
	Mon, 16 Nov 2026 09:22:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 158BA606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=zte.com.cn header.i=@zte.com.cn header.a=rsa-sha256 header.s=z202610 header.b=umCfM3bE
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxct.zte.com.cn (FangMail) with ESMTPS id 4jSj7Q2J2Gz52SFw;
	Mon, 16 Nov 2026 17:22:26 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=zte.com.cn;
	s=z202610; t=1794820946;
	bh=fyvZnV/+CL7Bbw0SbXZ+6H+Qa+U3QCb633XuJdxKUdU=;
	h=In-Reply-To:References:Date:From:To:Cc:Subject;
	b=umCfM3bEtUEyso1Ya9lKRjim8CsOCwE9rWZRW27iBXuva6qUoRV/T56MvCwdHTn5n
	 W24TiCDzJTaTvWKXSIcMi2yBdH2qpUev5UyVETlFIcsRvLsugaZM0LH+yINFA9QFbp
	 hHSm+gVVVXKjukExVJ73HIsEww7h1n7pdJTWhV31EynE2qsYoEJW4aCVb5vAzQdsfW
	 rAUkmXwsDdr1jK/x//c0qi0202+qa7TVt5PJtqKXZZDXIXoLf9B9xbecNv5jEbyicz
	 MFCO5ib50ov+hkZAZPfTXiBgacTqoQn21lLShn2QySsowfcBtwKN/+4kRseB4pm+4p
	 a499QE6PPrZwg==
Received: from xaxapp02.zte.com.cn ([10.88.97.241])
	by mse-fl1.zte.com.cn with SMTP id 6AG9MHZl099726;
	Mon, 16 Nov 2026 17:22:17 +0800 (+08)
	(envelope-from shao.mingyin@zte.com.cn)
Received: from mapi (xaxapp04[null])
	by mapi (Zmail) with MAPI id mid32;
	Mon, 16 Nov 2026 17:22:20 +0800 (CST)
X-Zmail-TransId: 2afb6afacb4c398-4cb53
X-Mailer: Zmail v1.0
Message-ID: <20261116172220285RZF6Zcof9cL_fYGhfKKyA@zte.com.cn>
In-Reply-To: <34da61f7-c1c9-4a40-8ce3-fde8c03d0199@kernel.org>
References: 20261110232903548MKw1ilhZfMJtzbTnK9nSv@zte.com.cn,34da61f7-c1c9-4a40-8ce3-fde8c03d0199@kernel.org
Date: Mon, 16 Nov 2026 17:22:20 +0800 (CST)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
From: <shao.mingyin@zte.com.cn>
To: <krzk@kernel.org>, <linux-gpio@vger.kernel.org>
Cc: <linusw@kernel.org>, <brgl@kernel.org>, <linux-kernel@vger.kernel.org>,
        <andrew@codeconstruct.com.au>, <wbg@kernel.org>,
        <florian.fainelli@broadcom.com>,
        <bcm-kernel-feedback-list@broadcom.com>, <jelonek.jonas@gmail.com>
Subject: =?UTF-8?B?UmU6IFtQQVRDSCB2MiAxLzRdIGdwaW86IGFzcGVlZC1zZ3BpbzogcHJvcGFnYXRlIElSUSBzZXR1cCBlcnJvciBpbiBwcm9iZQ==?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl1.zte.com.cn 6AG9MHZl099726
X-TLS: YES
X-ENVELOPE-SENDER: shao.mingyin@zte.com.cn
X-SOURCE-IP: 10.5.228.132 unknown Mon, 16 Nov 2026 17:22:26 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6AFACB52.000/4jSj7Q2J2Gz52SFw

Hi Krzysztof,

Thank you for the direct reply. You are right about the patch, and you
are right about the wider pattern. I was wrong on both, and I am
responsible for them.

I cannot show how the parent interrupt controller could defer probing,
and stable was not justified for this change. I should have established
that before sending it. I am withdrawing it (v2 1/4); there will be no
v3.

As I wrote in my reply to Gregory Price:

  https://lore.kernel.org/all/20261115051526117H0NSID837XMXH6qUeh_JS@zte.com.cn/

I sent too many patches, across too many subsystems, faster than I could
properly judge them. I started from the belief that finding defects with
an LLM and sending the patches was a contribution to the community, and
I did not weigh the review time every submission takes from maintainers,
including the ones that are rejected. The mm patches were the clearest
example: they were noise, and the cost to you and the other maintainers
was real. I used an LLM to help find and draft these submissions; I was
the one who decided to send them, so the responsibility is mine.

I will not send another patch until I can state a reachable trigger and
a user-visible effect, and I will hold myself to that bar. I do want to
contribute to the Linux community, and I understand that this means
reducing the review burden I create, not adding to it. I am sorry for
the time this has cost you, and I will not waste maintainers' time
again.

Thanks,
Shao
