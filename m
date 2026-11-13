Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.10.4.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794550063;
	b=TbYrsIfY47DcgvzUBmcskaqAVUXWKMq0TVo3Hf8HG+DXjAKoOR5/yLtfKaqr53CQxEEh
	 IJ/vbqPfWHoiZ3STgycxVo1MT22XHDO6yBojN5ODX51izQrx8HArHiXSqcRcM3s3a+ayb
	 tx9W5H2zVVryfGxEu50zWP/4sHlL0ZIGyQTu7Axg9Dx8fS4l/zzvHwPi+qdXQaSlqen7/
	 0GpcNoK8b9OwLrZdFwKFnBK2rY1lytqXL1diIdnTHfpAHg8yoDx2gwWH9rxsmF7PZh5gB
	 t/1YbayKX+5ci6smsKaZ5kNWxLYToKHY6PGiOhzhB+R7ZHsWVC8ll5rAYEaCGhkAhNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794550063;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy:X-TM-AS-Product-Ver:X-TM-AS-Result:
	 X-TMASE-MatchedRID:X-TM-AS-User-Approved-Sender:
	 X-TM-AS-User-Blocked-Sender:X-TMASE-Result:X-TMASE-Version:
	 X-TM-SNTS-SMTP;
	bh=KgxanPyLG1oE6QUC51vvwCcoOIoWUeqHJFzBqSVEx8A=;
	b=tSWtddYZXZjDueR81UvFprd/6Rxd3lWNEClSMH7OKrhEQOD77jGCDBGP33jOVY2VScuu
	 ve71rCGUjXnA2nz2aPPgldYKOanKnHxi48NdDnecFGdtef6r/xmmYVTyI/UwJRS4tze0H
	 iju4KfHcYsap+HoPJ7yh5pm21JgQBtJs3T/sZXPrILIv1NobaQDa6pSI7BqpaSJy1FGkr
	 0Cgd0krDEgvDfi3lDXSxD+EhaQhnjyScGawIBId2S5Msz5pnex3Ojcx9NjlicLUzokqIP
	 mHKoRoB6je2bB/PskzgqrBe73fLTZhEQOevQZMcDv39t7L0D7+J1vvPa38ULuAHpIXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=asmedia.com.tw;
	spf=pass smtp.mailfrom=asmedia.com.tw;
	dkim=pass header.d=asmedia.com.tw header.i=@asmedia.com.tw header.a=rsa-sha256 header.s=asmediacomtw header.b=qWERUPRv;
	arc=none smtp.remote-ip=103.10.4.13
Received: from ms.asus.com (ms.asus.com [103.10.4.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB0EC606A321;
	Fri, 13 Nov 2026 06:07:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB0EC606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=asmedia.com.tw
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asmedia.com.tw
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=asmedia.com.tw header.i=@asmedia.com.tw header.a=rsa-sha256 header.s=asmediacomtw header.b=qWERUPRv
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=asmedia.com.tw; i=@asmedia.com.tw; q=dns/txt;
  s=asmediacomtw; t=1794550063; x=1826086063;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=kESxTKefuWiEkIIdkkSEjVtoE/CLYY1e2PeOpFjFCz4=;
  b=qWERUPRvuI0vxmyOx0XUvMiRUVN/GKJIbze6os+7RG7MM0ittZ7k0cEQ
   YWAjAjghf/e1asSaKWbN1YiZnSyWl2xv1KzcHeGmN5SghcyqNCdBwHfD6
   F+yqb91y8u3MqKyg8hPvP9TGq0W6TmAJ3Hs3nB5OO/ZvuNJNhFPJ4X5ob
   o=;
X-CSE-ConnectionGUID: wWDM4HShRLCIk00GgJcbjA==
X-CSE-MsgGUID: f49iQX8ET4GILGfKqsAdJw==
Received: from apza006tmd.corpnet.asus ([172.22.47.66])
  by ms.asus.com with ESMTP; 13 Nov 2026 14:07:20 +0800
Received: from mymail.asus.com (42.79.126.46) by APZA006TMD.corpnet.asus
 (172.22.47.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Fri, 13 Nov
 2026 14:07:18 +0800
From: Szuying Chen <Chloe_Chen@asmedia.com.tw>
To: <linusw@kernel.org>, <Markus.Elfring@web.de>,
	<linux-gpio@vger.kernel.org>, <brgl@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <Yd_Tseng@asmedia.com.tw>,
	<Jesse1_Chang@asmedia.com.tw>, <Richard_Hsu@asmedia.com.tw>, Szuying Chen
	<Chloe_Chen@asmedia.com.tw>
Subject: RE: RE: [PATCH v3] gpio: amdptpci: add support for AMD PT PCI controller
Date: Fri, 13 Nov 2026 14:06:59 +0800
Message-ID: <20261113060700.4127-1-Chloe_Chen@asmedia.com.tw>
X-Mailer: git-send-email 2.48.1
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: APZA002EXB.corpnet.asus (172.22.6.14) To
 APZA006TMD.corpnet.asus (172.22.47.66)
X-TM-AS-Product-Ver: SMEX-14.0.0.3239-9.1.2019-30316.004
X-TM-AS-Result: No-10--14.867700-8.000000
X-TMASE-MatchedRID: +mH4VGfbtsxu4DGBDoAs85GPSO6O5JCagKzitR6I0vS4jV9yUdXXgZ0i
	AknL6Q/Z0bs03Cj/zdbJbpWeSB+0RtZSVIh2F3SJ39nur6FlBV43RfriMbLZ1hERyafywvMoBK5
	jsahkTKn+DLKQ2zS90DIdfNkCBOiLQtOofzK6nhO7/BkSrGh1ljSSxxZ1ewmwZAvO4QbJLKOQ+u
	G18dpupfx3IL7oOgVqyrzRjZhtElOvngkjHjojpAqMtasBG2xzmuMpo5XKw2858Sarp97J84ckZ
	T5abrxuV93NVRFdgSfmji6nqi0orDLPaFtwcF939eSlccz0Gku+z+D0qBfeLusO3zrvD+9awACm
	bLFOQ7c=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--14.867700-8.000000
X-TMASE-Version: SMEX-14.0.0.3239-9.1.2019-30316.004
X-TM-SNTS-SMTP:
	60F52F02C5E85A09FC7FC9409B0FF82CE6C5264498604BF7A42B3D3736557EB02000:8

Hi Linus,

Thanks for the review and feedback.

>> +#include <linux/bits.h>
>> +#include <linux/compiler.h>

>Why this include?? Add a comment next to it why it is included if this is really necessary.

Not need will drop it in V4.

>> +#include <linux/kernel.h>

>I think this generic include should not be used in new code, use specific includes.

Agreed, I will replace it with the specific headers in v4.

>> +static int pt27_irq_reqres(struct irq_data *d) {
>> +       struct gpio_chip *gc   = irq_data_get_irq_chip_data(d);
>> +       irq_hw_number_t   hwirq = irqd_to_hwirq(d);
>> +       int ret;
>> +
>> +       ret = gpiochip_reqres_irq(gc, hwirq);
>> +       return ret;
>> +}
>> +
>> +static void pt27_irq_relres(struct irq_data *d) {
>> +       struct gpio_chip *gc   = irq_data_get_irq_chip_data(d);
>> +       irq_hw_number_t   hwirq = irqd_to_hwirq(d);
>> +
>> +       gpiochip_relres_irq(gc, hwirq); }

>These are reimplementations of gpiochip_irq_reqres() and gpiochip_irq_relres() so use these instead?

Agreed these are redundant as they stand.
However, v3 does not keep the device in D0 while an IRQ is in use,
so I will extend the callbacks to hold a runtime PM reference in v4.
They can't be replaced by the generic helpers.

>Eh? Get rid of this horrid footer.
Sorry about that! I have asked our IT team to disable this disclaimer
for external emails, so it should be gone from v4 onward.

Best regards,
Szuying

