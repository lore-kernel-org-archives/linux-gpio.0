Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=81.169.146.166
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794557715;
	b=sGT57vZ66c3tyB1EN74TPW5RibLogGuMMQojnC0WZuvvTdU3fwdBdDnn5wMhw07rbpXF
	 Vij7ztLrBjWtr2xntDbu3S4z3TDutSxHW2YqewIdQnqp8A5J38tvF73s5k2MtbY+YIZMV
	 1MJ0DI6hoYZqJ7qIX82Qr2SCttJ1JrcqR8U1J98PHH+88YOH093x8UdDMlt57MJlH1w41
	 qEYMdMvt1qvWJjuFwn/VDk0jsdr6bOSIw/RfvVicQ49yziUBVwUzoIRUMY4fWUW66Uy3k
	 vJBK+ls63AQnKGW1fs/OjsEcNLDq3FIgQZQSPP1+wQ1nirhf727+eqtULU23Nx6+/FQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794557715;
	h=DMARC-Filter:X-RZG-CLASS-ID:DKIM-Signature:DKIM-Signature:X-RZG-AUTH:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	bh=dcGO1COWdGbsuo7eL42p4Dq3J9N4nXYuQs0MMv6Dok0=;
	b=wHEgbGy5TuNh2xxUcHlheugbb7it04SZrCz+sF5FfI59ZdlgpAg+SCQtR+YBM0xRdGZD
	 4VW26Y19BoT0od7pZOB3ibJqtwYgC3Dp/lP11x3wlFhdRybbG5mIcMEWvi4KlfHFe1tUU
	 hNXtRJLB2VOvM5y7dB7SDinh1+Sr/AgoQfXZvZOo64KSTn2+j4eCna19Bua0AIt5OjQbp
	 Zb6VOC20yE0sJ9AuNlKR3FBK8FO5X3OcI9HVooBSc2EzfN0LyecSWhqAKUSmN/3jSgI1O
	 1UkGAmVbgAdzpT/4DnvfQVDyOklZaM0XC0DtduOEGINYOXq5Nu4chC6tRH2CVQGzfKQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=goldelico.com;
	spf=pass smtp.mailfrom=goldelico.com;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=SU7qXr0C;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=o+GPgMoc;
	arc=pass header.oldest-pass=0 smtp.remote-ip=81.169.146.166
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [81.169.146.166])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91D49606A895;
	Fri, 13 Nov 2026 08:15:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91D49606A895
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=goldelico.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goldelico.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=goldelico.com header.i=@goldelico.com header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=SU7qXr0C;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=o+GPgMoc
ARC-Seal: i=1; a=rsa-sha256; t=1794557699; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=blglv86vUIR332EWOPOwvK8fGMKyGGWWbCDMGH/L0OEChRRIDHxcuudE53/WSMXoL5
    1tZ+y8N1z5EyXyuEfs9SfEomSX67ziQyEoZuWujg8gdicwh+kvIVRjiN7raw9kWP8/qY
    6gdHistyOZVAtNBA43AGJFhfARz00cQ6v0sjqCLM8Dt93J/yPXiabMa33oJ3ZUJUNz4i
    uiP9IIYgExn1Nw14QTUyewL5QTT5/T61nd+WNyN1obYckeQfnC7FkyKjuvHnVpqhQ/hk
    LN0oPqmK47BQDXWoIAaXb+0oe40NuzI5KEBPSp6eZwvinWn72SjyzwNLtPOS0VcFxQEe
    7L1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1794557699;
    s=strato-dkim-0002; d=strato.com;
    h=Message-ID:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=dcGO1COWdGbsuo7eL42p4Dq3J9N4nXYuQs0MMv6Dok0=;
    b=jXLsZ2awlAQ0uaqVYZdrRXFSutzTaA4x/7k7EajAbrOeok+hjN3Opk9zeIp4akcf5I
    mUPPbHsGpFpIuh2pi9v6+n1mzgIP7rOgwOTdH5boMAPrb5dKUobeTYBETVrY9cpkux7A
    G5WjRtXh5NwcXhnHgfn4IJgQ95taEl7U+r5yi9RUJl668Q3a6kJRdLiijahya32fxRCO
    lxGoZkPriz4TlMdJset6xQNeChhS/f3EPqQBDsW6/ogmpjGuT2kxJyvSwAA/rZ+Gv4Vw
    TB6EdX+6VKfKd3ErSvwn+7eG4CkzKVxmCSBSrzLUeRpY7Y4T/+hr2HWqtvBsiWfZdFkL
    fFkQ==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1794557699;
    s=strato-dkim-0002; d=goldelico.com;
    h=Message-ID:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=dcGO1COWdGbsuo7eL42p4Dq3J9N4nXYuQs0MMv6Dok0=;
    b=SU7qXr0Cw97JOCMnwmO1iTy2fdTxEsHvBQaxCKV5PY3uvskwDIet9mAEjSqyww1Wij
    9SJ3riJ1XcaGvVFNl9xAbK30GdXP3x6U7povykT826P671xayLE8yyMPTBa1fNW1mgYy
    Fl89WVHDQO+M82jPKaAvdD7f0dOee2SyQEKys5yJ5YbRJrdjmjNUIvZXsSszQsjCbrD3
    G33/lthKWVJzRcMd/HpT62jb4dNub/I/8SdzSuKE2V1nbvENsCGTRdMXxZKXqJqK0aPu
    zmvnhYjtXk6GJZGr7inIEL0Q6HoTlHOpvD5Yu04bdgiTvvzyeYDUc6sS1tSOV0dgSuWg
    NkQA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1794557699;
    s=strato-dkim-0003; d=goldelico.com;
    h=Message-ID:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=dcGO1COWdGbsuo7eL42p4Dq3J9N4nXYuQs0MMv6Dok0=;
    b=o+GPgMoccTxaYYUOGQS2Dk62Tcpng1hzqDm1UZt4vGOokDNgOUmBo8c1Mw63sx59j3
    p/dtBXnWg6g0ZoyU6HCA==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9qVpwcQVkPW4I1HrS2ZoHmMiNHYIZPrro6QPZGBqKLoYar6phQmxG"
Received: from iMac.fritz.box
    by smtp.strato.de (RZmta 55.6.3 AUTH)
    with ESMTPSA id Qb56a22AD8ExFGA
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Fri, 13 Nov 2026 09:14:59 +0100 (CET)
From: "H. Nikolaus Schaller" <hns@goldelico.com>
To: Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Cercueil <paul@crapouillou.net>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	letux-kernel@openphoenux.org,
	"H. Nikolaus Schaller" <hns@goldelico.com>
Subject: [PATCH 0/3] pinctrl: ingenic: Add X2600 support
Date: Fri, 13 Nov 2026 09:14:55 +0100
Message-ID: <cover.1794557697.git.hns@goldelico.com>
X-Mailer: git-send-email 2.56.0
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
Content-Type: text/plain; charset="us-ascii"

PATCH V1 2026-11-13 09:13:47:

This series adds pinctrl and GPIO support for the Lumissil X2600
SoC.

It introduces the devicetree bindings, adapts the register access
and GPIO interrupt handling to the X2600 hardware, and adds the
pin groups and mux functions.

The changes also correct hardware both-edge GPIO interrupt
configuration on X1600 and X2000.

The updated driver has been tested on X1600, X2000, and X2600
including GPIO both-edge interrupt handling.

The code has been tested by ChatGPT which also helped to formulate
the messages.

H. Nikolaus Schaller (3):
  dt-bindings: pinctrl: ingenic: Add X2600 support
  pinctrl: ingenic: Add X2600 register and GPIO IRQ support
  pinctrl: ingenic: Add X2600 pin groups and functions

 .../bindings/pinctrl/ingenic,pinctrl.yaml     |  10 +-
 drivers/pinctrl/pinctrl-ingenic.c             | 573 +++++++++++++++++-
 2 files changed, 566 insertions(+), 17 deletions(-)

-- 
2.56.0

