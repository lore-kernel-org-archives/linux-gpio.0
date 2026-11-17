Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=81.169.146.166
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794898245;
	b=rtqUswgyva7ROmlaFYsIjT5T7Zh9FuTPrkeYUratFDAGxUI4ewtG8mnutj2A3sGHFAjH
	 F2vbAo5V8wm4i+0gfN0jyp2CEoBRvC4JvcgfqqUda2yekRQpmmUy/Tz7UPWFX3tQSGy4e
	 PXZq38ev0NRXxUgw4bhDO30c5Jv7PMP9GjYVaAy4dg+T5m9Uv6FZxzV+xxj7wBt+cnZsJ
	 H8SNbTgiLZQqoPW6fL8+g9NEeAxGOzIabTV965lnzne6e0tS7O9bg+9QpTCcUidRZnWD2
	 yUVW1+EEsynXFa/n/hRcAN1KLrKdZTZi+WubsY9VjX22P3y5iZhFPvgQgAcIDgfMO5A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794898245;
	h=DMARC-Filter:X-RZG-CLASS-ID:DKIM-Signature:DKIM-Signature:X-RZG-AUTH:
	 Received:Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Content-Transfer-Encoding:Message-Id:References:To:X-Mailer;
	bh=kN/jr6xyg28Ydyr+Qj0RhkF8SbAklwXrcNPjICsMfKU=;
	b=Rt6DqGnJnTQ6MNqBI1oizrOgW6SheHfSpKWQ+EFtxZtijrOas/I0SH3WTe5jo3NwRHix
	 pEzb9X8ayl7HUwn5gJeWFWdUle+gkEtc+ywrf/oifiX65tUV7yriDgkDVGO1fr1WrfvIN
	 UrsCm2UfNGbR/7fhOsu+BJ16hcolHKLNCC43C4LfDc5ssa+UR/YXtyQU4ZdbucAeKuDpQ
	 10xDdCM5OJDbF+9pYWqfy+CP1QtosmYTjXiDQq7mWAYPMjUC5qyz5GChunSfvskVXeb5S
	 xqALFNU6KqenBzKPmcGAVVx4ljV4zVO9EdPt6PR/ZtpRy4FlGYQqugaZof9NwXj0vww==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=goldelico.com;
	spf=pass smtp.mailfrom=goldelico.com;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=t2Xn6A7G;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=kTiKdP0G;
	arc=pass header.oldest-pass=0 smtp.remote-ip=81.169.146.166
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [81.169.146.166])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12B86606A31C;
	Tue, 17 Nov 2026 06:50:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12B86606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=goldelico.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goldelico.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=goldelico.com header.i=@goldelico.com header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=t2Xn6A7G;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=kTiKdP0G
ARC-Seal: i=1; a=rsa-sha256; t=1794898221; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=BXJabg1znsc/I3P6qWoycDnIxuY9MlcsOSFA/2NCfjAU+D6uUiA8We3tnoYvsooikm
    pDunKgNsON+wC0mzVYp51NiXNSVkVi54Z5S+w/3mxpsTWhRGzlFKz0EOj41d1llVYZWA
    vkfIa640ieGg/d+H3WxFvIRg91Y+X8YKogbNi3UZBNy1xoTWfcVeWtott9KoVJZkCoa1
    J92P+cB4XH3oA6M9MM9r9z8B6XoFp9AFyIGYuE8cxAnv06uy58RTXJQBpK7L2fwTkaHq
    Wh5hv08YFuktUW95FCrOhD8/pEEinguNwoTrVlwMMcE9dU8xORqActB0IvOK6EboAtdF
    2iLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1794898221;
    s=strato-dkim-0002; d=strato.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=kN/jr6xyg28Ydyr+Qj0RhkF8SbAklwXrcNPjICsMfKU=;
    b=HNKDeCNyqju2s+vNK49o3H+SHfbJz2yUToUA91kxQOg3gpFMZxFZu5ULQwMIlGTPd1
    ajPDUxcuO++fhpdoNBkqF+0hhVD7srVwnGMb4HQbBAkIyxCud6oPjRe6WUPrv/vU+RRY
    nHBGg9c48/IC5LDFHLFRVCibK8r2JyYKRHpHMyJJwuMowc67hIxGEA0dvujdyMWBqOys
    WTeuEI5913PEbzjPzV0HcAV2++Oop2KjGQ6YvT55OAM400vN4h0MlK01vI2uFikIWEZG
    g0YMQ3WzQ/Yu1BEPT8IWGfMOnHGm8qdWR6L9J05Iw8HwCPCcLqOC4gcEyubTtyfVW247
    sS2Q==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1794898221;
    s=strato-dkim-0002; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=kN/jr6xyg28Ydyr+Qj0RhkF8SbAklwXrcNPjICsMfKU=;
    b=t2Xn6A7GCsuyi/r+IxalSSKJ8L06khBEVHeBXRtD/Ck9s3VtLcSnNRdPbFRk59Bghk
    EJt5wKvI2vbqZnDyzU0LdRvCFLkL+3/FtSkewgFjp7zbif3k4bTOpSFVXpWKnN1sMFK2
    hM/QWDsTA1mP0/1qXWpdfEg/hOhbeJgymfhpXd0f3ja85sHNUOpxWW3ZwWcfUqtrT9Wy
    Nk8vmSrki9hpX+8InA4CvylIc5mfAAJIdbmxy9QbfjQ2JvIhc2thtkC0+cT6BI7509l0
    oH++LPJaM5db9Vak2IjHeDFpa5r9IFVGVqaHz+SmZOEmQ62CUk1cz3ipOmZ9hl6Pa06o
    p2mw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1794898221;
    s=strato-dkim-0003; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=kN/jr6xyg28Ydyr+Qj0RhkF8SbAklwXrcNPjICsMfKU=;
    b=kTiKdP0Gdd/AP6XDzwGuM2vy6WJsbE3KeR5w2rSRu8efQXWuE5W2TJZ8MO46uy9mn9
    oQbB/FbqYhCaFNA7BfCg==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9qVpwcQVkPW4I1HrQ3ppelMiNKoEY92nD9kO01+3QZuyyF4VcrvHZ"
Received: from smtpclient.apple
    by smtp.strato.de (RZmta 55.6.3 AUTH)
    with ESMTPSA id Qb56a22AH6oLUtO
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
	(Client did not present a certificate);
    Tue, 17 Nov 2026 07:50:21 +0100 (CET)
Content-Type: text/plain;
	charset=us-ascii
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81.1.10\))
Subject: Re: [PATCH 3/3] pinctrl: ingenic: Add X2600 pin groups and functions
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <179487827555.2153459.1199232821591145638@gmail.com>
Date: Tue, 17 Nov 2026 07:49:50 +0100
Cc: Linus Walleij <linusw@kernel.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Paul Cercueil <paul@crapouillou.net>,
 Bartosz Golaszewski <brgl@kernel.org>,
 linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org,
 letux-kernel@openphoenux.org
Content-Transfer-Encoding: 7bit
Message-Id: <E4751395-0CE1-4073-ABEA-9F4BF57304A6@goldelico.com>
References: <cover.1794557697.git.hns@goldelico.com>
 <afd42cc2ca2c93501ff1769b7d7a25559ef68a2f.1794557697.git.hns@goldelico.com>
 <179487827555.2153459.1199232821591145638@gmail.com>
To: Hunter Laux <hunterlaux@gmail.com>
X-Mailer: Apple Mail (2.3826.700.81.1.10)



> Am 17.11.2026 um 02:17 schrieb Hunter Laux <hunterlaux@gmail.com>:
> 
> Hi Nikolaus,
> 
> On Fri, Nov 13, 2026 at 09:14:58AM +0100, H. Nikolaus Schaller wrote:
>> + INGENIC_PIN_GROUP("uart1-data-c", x2600_uart1_data_c, 1),
>> + INGENIC_PIN_GROUP("uart2-data", x2600_uart2_data, 1),
>> + INGENIC_PIN_GROUP("uart4-data-b", x2600_uart4_data_b, 2),
>> + INGENIC_PIN_GROUP("uart5-data-b", x2600_uart5_data_b, 2),
> 
> Per the X2600 PM, shouldn't these be 2, 0, 1 and 1?
> 
>> +static int x2600_slcd_ctrl_pins[] = {
>> + 0x34, 0x3c, 0x3d, 0x3e, 0x3f,
>> +};
> 
> PB20 (0x34) has no function 1. Did this come from the X2000 table?
> Should 0x34 be dropped?
> 
>> + INGENIC_PIN_GROUP("pcm", x2600_pcm, 3),
> [...]
>> + INGENIC_PIN_GROUP("pwm11", x2600_pwm11, 0),
>> + INGENIC_PIN_GROUP("pwm12", x2600_pwm12, 0),
>> + INGENIC_PIN_GROUP("pwm13", x2600_pwm13, 0),
>> + INGENIC_PIN_GROUP("pwm14", x2600_pwm14, 0),
>> + INGENIC_PIN_GROUP("pwm15", x2600_pwm15, 0),
>> + INGENIC_PIN_GROUP("pwm-trig-c", x2600_pwm_trig_c, 1),
>> + INGENIC_PIN_GROUP("pwm-trig-d", x2600_pwm_trig_d, 1),
> [...]
>> + INGENIC_PIN_GROUP("wait", x2600_wait, 3),
> 
> These groups aren't in any function.
> 
>> + 0x000007ff, 0xffffffff, 0x7ffbfff, 0x0000ffff, 0x000ffffe,
> [...]
>> + 0x000007ff, 0xffffffff, 0x01ffff1, 0x0001e000, 0x000fffff,
> 
> Port C is missing a digit?
> 
> On port E, 0x80 is pull enable and 0x90 selects up/down (PEPE/PEPS).
> Doesn't that make the X2000 pull code wrong there?

All points are valid (and there are some more), and already in my
update queue especially port E pullup/down.

I just didn't find to work that into a v2 because the swappingof X1600 and
X1830 must come before...

BR and thanks,
Nikolaus

