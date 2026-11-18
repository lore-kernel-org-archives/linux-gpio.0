Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=44.202.169.37
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794985394;
	b=2Akn1WMP5llp0sNp5hU9GY0YuEOWy/J1eNLEKREWOHbs/36N+9dcJHC4fYKhz6jxTtpz
	 +ykFAuIRBedi8NeBRFWRIWzsICiUouiWzNSs1wtq6nzRHfIyFESlPBdeaFR1i1Am0K0rK
	 tKv2B76bFqIXhW59+HcuShnbFE1U/BpzsfEJ/Gqy3U3Ao/TSTAls6TRZh3+0YbvLv/q59
	 ZZK0ywmfT/P+OirL4JxVxLC/VndWgZgboRBOYkLM6yk8pHlVKh3a3i8JTbGbyQMj3gt/2
	 Vxn1dwB3ccFDzAQ+VYt+6Y/khytasZSdVSKaeP6CDZhs5VpYJbQyEMI+yG38dqXC95w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794985394;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:
	 X-Source-IP:X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=BjcLRLO1ri+BpH+GCxTtQvyte9QyaKnD+yEnGC08KjI=;
	b=sjIZAzp88VmBzX2VqdDm6BcvHn2kYWp75l1PSI8H7SpNmGrCX6BxSUqT6buzph0KbM2u
	 bne9zfehI4aOmurlvo/4W1V0iCllaNjvWJKHJ/6nqUEoz4vEOQ6AUcwOJ1GCpyy1+p9/l
	 +kXLUAEFHZUMOnQKMn1HlgwKcEXXreglnEp6UEYcTCzm9wlaMLEbfgJdsOAaVzjHDWEnN
	 GdUv7AWHrhuCRhajSjPI3gtfavEcYeF2doYCgxw5iTM9KOEasBMFsxY4QMVCsHEDbJFY3
	 zr9k2UBquOkX+VYB+N1dHHn8p6mkjPYkXaT0paRafRr5TL1Hk+psTikzcoeeGBjNAmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sellers.id.au;
	spf=fail smtp.mailfrom=sellers.id.au;
	dkim=pass header.d=sellers.id.au header.i=@sellers.id.au header.a=rsa-sha256 header.s=default header.b=Tuz6ZCbx;
	arc=none smtp.remote-ip=44.202.169.37
Received: from omta038.useast.a.cloudfilter.net (omta038.useast.a.cloudfilter.net [44.202.169.37])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 185E8606A894
	for <linux-gpio@vger.kernel.org>; Wed, 18 Nov 2026 07:03:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 185E8606A894
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sellers.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=sellers.id.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sellers.id.au header.i=@sellers.id.au header.a=rsa-sha256 header.s=default header.b=Tuz6ZCbx
Received: from eig-obgw-6005b.ext.cloudfilter.net ([10.0.30.162])
	by cmsmtp with ESMTPS
	id TQGWxU1rvV16ITZhIx82sn; Wed, 18 Nov 2026 07:03:12 +0000
Received: from just2044.justhost.com ([173.254.29.206])
	by cmsmtp with ESMTPS
	id TZhFx8Zch0288TZhFxqqb2; Wed, 18 Nov 2026 07:03:09 +0000
X-Authority-Analysis: v=2.4 cv=a5Iw9VSF c=1 sm=1 tr=0 ts=6afd4db0
 a=pynxHT4M0AVwz8ROpNtnNw==:117 a=tbVZtiplu92VKpH45hjydQ==:17
 a=zJRp6_cAMcgA:10 a=QzMiS2WfBm8A:10 a=ADz86Hvpe3RKLVHNFJUA:9
 a=sW6rCsXrbcaOzks2YK80:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sellers.id.au; s=default; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=BjcLRLO1ri+BpH+GCxTtQvyte9QyaKnD+yEnGC08KjI=; b=Tuz6ZCbxPnpY
	OamOpQ4oc/6KVLkyQHW2S5GW2usE5DCXNYOoNhYmUklON3l4RflNV0ijhWfMxPq0iNL2+AAWdnsWG
	azvdn/cnrA3WkF9UeN0If58iCUaL5514vsOEFhuwSC3Ni2x8+32DazG8bjeoApwQOsuij6UzEU42P
	z/Q9W/9HEHX+ceEi6Hqs2Qb19Oz2Rig5+XlrB1O4kcicPlJ/cx42Pnh4oS8wZUOdXAiMHfRVnB+jQ
	NbO9Gm2rW2MlSk6dcnEpec5h8xKBuLIo/sx6ATVjloBfeDl8mMABOB2/L1n6XZDyrN0FmA8L1+pj+
	bfR1EHGm5tr1cnigVHluxA==;
Received: from n110-32-20-158.rdl21.qld.optusnet.com.au ([110.32.20.158]:46974 helo=localhost.localdomain)
	by just2044.justhost.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <dean@sellers.id.au>)
	id 1xTZhE-00000002TMc-1KS4;
	Wed, 18 Nov 2026 00:03:08 -0700
From: Dean Sellers <dean@sellers.id.au>
To: Linus Walleij <linusw@kernel.org>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Dean Sellers <dean@sellers.id.au>
Subject: [PATCH 1/2] pinctrl: sx150x: don't clobber the oscillator source when driving OSCIO
Date: Wed, 18 Nov 2026 18:02:58 +1100
Message-ID: <20261118070259.2557570-2-dean@sellers.id.au>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261118070259.2557570-1-dean@sellers.id.au>
References: <20261118070259.2557570-1-dean@sellers.id.au>
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
X-Exim-ID: 1xTZhE-00000002TMc-1KS4
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: n110-32-20-158.rdl21.qld.optusnet.com.au (localhost.localdomain) [110.32.20.158]:46974
X-Source-Auth: dean@sellers.id.au
X-Email-Count: 5
X-Org: HG=bhshared_jh;ORG=bluehost;
X-Source-Cap: cmVhbHN0cjE7cmVhbHN0cjE7anVzdDIwNDQuanVzdGhvc3QuY29t
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfMef1ieDnnOQs04JgRPw0CXeoYEIhPXrM1NaOAAg7USqVp6rNLj4HqANbDHHMDKMEymoJr2DjZrqSlHXsrsq1qUdeG5ApBLBf7oagTfW668N67ILbEig
 BU2n4PbRDsy6r4SWUUzG/0Dv3LKfWhKvhVk+lAGpgPSa3BYRWJBxIHP2Jbhg6iFssX9Vv0wBX/xMzm/UZvq/7ue9qt+IGi+6mCM=

On the 789 models, sx150x_gpio_oscio_set() drives the OSCIO pin as a
static output by writing the whole of RegClock. Only bits [4:0] belong
to OSCIO: bit 4 selects output, and [3:0] select the OSCOUT frequency,
where 0xf is a static high and 0x0 a static low. Bits [6:5] select the
fOSC source, and writing them as 00 turns the oscillator off.

fOSC clocks the input debouncer, the keypad scanner and the LED driver.
The driver does not configure any of those today, but anything that
does, whether firmware or a later driver change, is silently switched
off the first time a consumer drives OSCIO.

Update only bits [4:0].

Fixes: 9e80f9064e73 ("pinctrl: Add SX150X GPIO Extender Pinctrl Driver")
Signed-off-by: Dean Sellers <dean@sellers.id.au>
---
 drivers/pinctrl/pinctrl-sx150x.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-sx150x.c b/drivers/pinctrl/pinctrl-sx150x.c
index 04a0e6269e5b..c97e9bc3a33f 100644
--- a/drivers/pinctrl/pinctrl-sx150x.c
+++ b/drivers/pinctrl/pinctrl-sx150x.c
@@ -427,9 +427,14 @@ static int __sx150x_gpio_set(struct sx150x_pinctrl *pctl, unsigned int offset,
 static int sx150x_gpio_oscio_set(struct sx150x_pinctrl *pctl,
 				 int value)
 {
-	return regmap_write(pctl->regmap,
-			    pctl->data->pri.x789.reg_clock,
-			    (value ? 0x1f : 0x10));
+	/*
+	 * RegClock[4] makes OSCIO an output and [3:0] set OSCOUT, where
+	 * 0xf is a static high and 0x0 a static low. Leave the oscillator
+	 * source in [6:5] alone.
+	 */
+	return regmap_write_bits(pctl->regmap,
+				 pctl->data->pri.x789.reg_clock, 0x1f,
+				 value ? 0x1f : 0x10);
 }
 
 static int sx150x_gpio_set(struct gpio_chip *chip, unsigned int offset,
-- 
2.43.0

