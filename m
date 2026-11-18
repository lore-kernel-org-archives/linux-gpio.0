Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=44.202.169.39
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794985400;
	b=k3+FLI2Q2JkFqOi/CgZd1dseciw6UH5fSXRbJQRMWHhO+onJ8svp0X9zioLFdwHvwTsj
	 W7D7VvCFU0jgxT4fNnqVZKv3gAmas9vCIMxJXzMonAJCxRgj20cOuJeUqADK/E01yjZr+
	 kB02yqy3BNthQLZTnw1NojR7SFcWZrYEXs/Vxh8DIkv/sdD00GOPgOnp4CfzONtDIbBEq
	 fONfjn94qllSI9vCe25EM4uK1aolk03u4entIIlwlhFkINaMsunfYeKJX3x60sBkvu2jY
	 cGJhYwBq3jtDoNAz5qkq6WZnSgbDFG/2kByvuZcxD3KUG4l7M4UmabJarYiA/p2lzfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794985400;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:X-Source-L:X-Exim-ID:
	 X-Source:X-Source-Args:X-Source-Dir:X-Source-Sender:X-Source-Auth:
	 X-Email-Count:X-Org:X-Source-Cap:X-Local-Domain:X-CMAE-Envelope;
	bh=R1SiC+CmYkm+IcXfzWSyxKFk+upyTEMQGSq3i64NDbk=;
	b=rnDa+58Iqkysv4egyPM9KVulDiZLKVUl4H/nL97g3ZC5owtfA0tWK4ATs/TJx1rszbKm
	 YXG4I2rROZFHAvABfx3LrDsF4JvgQiu1icyTafnVLF6LTVFpQk1gJpzKTlCyhHEsJy0xM
	 YnV3nWKrI14AfagwWTpdhwzI6KajUOSVestr9G2RzhRzVTHH/cdmlR7vTOgYFpl58kfrf
	 UFOgknBE1VSGW/64SQD+X7nrtrcVcGLd9aAQ2hL+Pt2zcaDVtqPIAzZQtN5MzmJRYPtLr
	 ZOliz1Ld9+9rOXXSffT8a+H9UIJwXUWLaq8u4w+KDMIAHs955XgHI2/aaITlv9Sw8Tg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sellers.id.au;
	spf=fail smtp.mailfrom=sellers.id.au;
	dkim=pass header.d=sellers.id.au header.i=@sellers.id.au header.a=rsa-sha256 header.s=default header.b=FbW470EA;
	arc=none smtp.remote-ip=44.202.169.39
Received: from omta040.useast.a.cloudfilter.net (omta040.useast.a.cloudfilter.net [44.202.169.39])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3DDE606A330
	for <linux-gpio@vger.kernel.org>; Wed, 18 Nov 2026 07:03:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3DDE606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sellers.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=sellers.id.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sellers.id.au header.i=@sellers.id.au header.a=rsa-sha256 header.s=default header.b=FbW470EA
Received: from eig-obgw-5007b.ext.cloudfilter.net ([10.0.29.167])
	by cmsmtp with ESMTPS
	id TWxwxs3qdOOJnTZhJxOAeT; Wed, 18 Nov 2026 07:03:13 +0000
Received: from just2044.justhost.com ([173.254.29.206])
	by cmsmtp with ESMTPS
	id TZhDxgzUtxqjjTZhDxOxO3; Wed, 18 Nov 2026 07:03:08 +0000
X-Authority-Analysis: v=2.4 cv=bZxrUPPB c=1 sm=1 tr=0 ts=6afd4db1
 a=pynxHT4M0AVwz8ROpNtnNw==:117 a=tbVZtiplu92VKpH45hjydQ==:17
 a=zJRp6_cAMcgA:10 a=QzMiS2WfBm8A:10 a=11JzboO8rzxrq4yt9xYA:9
 a=sW6rCsXrbcaOzks2YK80:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sellers.id.au; s=default; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=R1SiC+CmYkm+IcXfzWSyxKFk+upyTEMQGSq3i64NDbk=; b=FbW470EAqCjdVxA092sUY+xdNn
	marfmfJ+SrMh+enZG5hTL+CcDCwX3jhdRjGDLWFoVHD/Eq+dLrnO78RH9msYtIWjqVoUD9Et7tqle
	FgXLnz8MpGZiKW87ubTEwqGodOioZlhKHJDyFNlY43IA0fE6xSRdnG5iOGQrdxeH7BN+t3k0xfcie
	vTiQJuGcdv6oi3iL6azho+xo4qS9SMaOfu5tfyEvCKA8ArV9udnzL91/MRNSP2c9CYrsnG937XPGt
	jjtXGgqd7k5LxZB6fRX0eRa8RSLvDTxCDilJ4PbLGmLe1DXh6ID3zUsVOXGA0RaOfW4i1P896PC+3
	4wpEogcA==;
Received: from n110-32-20-158.rdl21.qld.optusnet.com.au ([110.32.20.158]:46974 helo=localhost.localdomain)
	by just2044.justhost.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <dean@sellers.id.au>)
	id 1xTZhC-00000002TMc-2QNn;
	Wed, 18 Nov 2026 00:03:06 -0700
From: Dean Sellers <dean@sellers.id.au>
To: Linus Walleij <linusw@kernel.org>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Dean Sellers <dean@sellers.id.au>
Subject: [PATCH 0/2] pinctrl: sx150x: OSCIO fix and block register transfers
Date: Wed, 18 Nov 2026 18:02:57 +1100
Message-ID: <20261118070259.2557570-1-dean@sellers.id.au>
X-Mailer: git-send-email 2.43.0
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
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - just2044.justhost.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - sellers.id.au
X-BWhitelist: no
X-Source-IP: 110.32.20.158
X-Source-L: No
X-Exim-ID: 1xTZhC-00000002TMc-2QNn
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: n110-32-20-158.rdl21.qld.optusnet.com.au (localhost.localdomain) [110.32.20.158]:46974
X-Source-Auth: dean@sellers.id.au
X-Email-Count: 2
X-Org: HG=bhshared_jh;ORG=bluehost;
X-Source-Cap: cmVhbHN0cjE7cmVhbHN0cjE7anVzdDIwNDQuanVzdGhvc3QuY29t
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfC5sgJ1Nws1QEs3dxdsCv/Wk9A5oeiUyWAicm8pHViCUhO7Vw0+6rYJiKXv+UDoQ6mB0axH9N2Al4sEV/SHJ/1SDmLiwCI+6GFC05gfViKxaXmroC8oW
 amQ4EBF7LEE4OEOCo+m1sy7fp166ToLUtT5C5Uzoz4cOwWChI6pbxhI6CCLxm81keb5h971YQKBM/fT+PjcwbcwIgOOawVPO2BY=

Two changes to the SX150x driver, from bring-up of an SX1509Q-based
board.

Patch 1 stops sx150x_gpio_oscio_set() from writing the whole of
RegClock. That write set the fOSC source in RegClock[6:5] to 00, which
the datasheet documents as disabling the LED driver, keypad engine and
debouncer.

Patch 2 moves 16- and 32-bit registers in one i2c block transfer on the
789 models, relying on the register auto-increment that RegMisc[1]
enables by default. This halves the number of transfers on the
interrupt path.

Testing: these were developed and tested on an SX1509Q on a 5.15-based
kernel. I no longer have access to that hardware, so the versions here,
rebased onto pinctrl devel, are compile-tested only (x86_64
allmodconfig, W=1). Any testing on SX1508/SX1509 hardware would be
welcome.

The rebase onto mainline and the changelogs were prepared with help
from Claude (Anthropic); the code changes are my original work.

Dean Sellers (2):
  pinctrl: sx150x: don't clobber the oscillator source when driving
    OSCIO
  pinctrl: sx150x: move wide registers in a single block transfer

 drivers/pinctrl/pinctrl-sx150x.c | 55 ++++++++++++++++++++++++++++++--
 1 file changed, 52 insertions(+), 3 deletions(-)


base-commit: 95ebc96dcb373d7d278625fc91e602c839f1f388
-- 
2.43.0

