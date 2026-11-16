Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.128.198.184
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794802196;
	b=PX43asMx+5mEvhEgXVbMd2189YK9p6aNp16JNP6SXZTi7SGTYK0sSWqFwC7bHq3hYkBK
	 oAi8wqptv/rpMubRfiv5w6RahWrB17cJ3rd6ND+8RzjrelMJDJaEhnfRQ0cd4LX/znuxJ
	 hbns4VO+v+JmmfMPR8/TiyQNtspdpaByTh9Cvk6pCAwK1IbUNY1LX5oirk5bSb3SrUYKC
	 TIvI9GZDYGhXttUIFk24dGeavEpOCMxlEy+c7idZMlfkXRb3pI0t4ZZ/YlXdUzbqKTckZ
	 ihBoOFAd1oQ4F0T4ImikBD0ZlFCjnCZL4ypZce+KB+77CmdBucOWqJVUCBrO0r/NLTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794802196;
	h=DMARC-Filter:Received:Received:Received:From:To:CC:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy:X-DKIM-Results:X-DNSRBL:X-SPAM-SOURCE-CHECK:X-MAIL;
	bh=pZZX6BmLi6Dauf64Y3wJVPnB5bVdPUDvzyAyi7x0gjI=;
	b=Jau2PTwTRX2IZOhBqOSkSkSoTPalrInXRKyN6LBJ+Nef/HyTlyiTa4tqi2ZXvvnFriL1
	 BVhUK/NiEO3/Ko5LW1VIl5kse9YkxIeYeFBQ5Dzr+kMOMTNIuuFzEDe21md2xgU36/+rE
	 DCpbSKyWiZnW2QnMNrVu8nrPDvvswkGFTCBNwPP0ThBHULNKw9xzBPrzyD8gTOxlN8FOo
	 fwil5EX8iXVxjOR46cfbEu/S3mbddgsWIEt/S55rwfgH32bIaLnKk6hSIY7LSk01EcgvS
	 WoVspPDgcUqbG4AYAWA8jytQZSdiFwhfJFfd99t8ELT+Bprt47HVZkASN7n1MsrocMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=andestech.com;
	spf=pass smtp.mailfrom=andestech.com;
	arc=none smtp.remote-ip=220.128.198.184
Received: from Atcsqr.andestech.com (atcsqr.andestech.com [220.128.198.184])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F8A1606A335;
	Mon, 16 Nov 2026 04:09:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F8A1606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=andestech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=andestech.com
Received: from mail.andestech.com (atcpcs53.andestech.com [10.0.1.153])
	by Atcsqr.andestech.com with ESMTPS id 6AG49cbq084379
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 16 Nov 2026 12:09:38 +0800 (+08)
	(envelope-from cl634@andestech.com)
Received: from ATCPCS34.andestech.com (10.0.1.134) by atcpcs53.andestech.com
 (10.0.1.153) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.56; Mon, 16 Nov
 2026 12:09:38 +0800
Received: from swlinux02.andestech.com (10.0.15.183) by ATCPCS34.andestech.com
 (10.0.1.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 16 Nov
 2026 12:09:38 +0800
From: CL Wang <cl634@andestech.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: CL Wang <cl634@andestech.com>, <linux-gpio@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <tim609@andestech.com>
Subject: [PATCH 3/3] MAINTAINERS: Add entry for Andes ATCGPIO100 GPIO
Date: Mon, 16 Nov 2026 12:09:14 +0800
Message-ID: <20261116040914.368298-4-cl634@andestech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261116040914.368298-1-cl634@andestech.com>
References: <20261116040914.368298-1-cl634@andestech.com>
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
X-ClientProxiedBy: ATCPCS33.andestech.com (10.0.1.100) To
 ATCPCS34.andestech.com (10.0.1.134)
X-DKIM-Results: atcpcs53.andestech.com; dkim=none;
X-DNSRBL: 
X-SPAM-SOURCE-CHECK: pass
X-MAIL:Atcsqr.andestech.com 6AG49cbq084379

Add MAINTAINERS entry for the Andes ATCGPIO100 GPIO controller driver.

Signed-off-by: CL Wang <cl634@andestech.com>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 222b7fc2c3aa..ba1930a37596 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2042,6 +2042,12 @@ S:	Supported
 F:	drivers/clk/analogbits/*
 F:	include/linux/clk/analogbits*
 
+ANDES ATCGPIO100 GPIO DRIVER
+M:	CL Wang <cl634@andestech.com>
+S:	Supported
+F:	Documentation/devicetree/bindings/gpio/andestech,ae350-gpio.yaml
+F:	drivers/gpio/gpio-atcgpio100.c
+
 ANDES ATCSPI200 SPI DRIVER
 M:	CL Wang <cl634@andestech.com>
 S:	Supported
-- 
2.34.1

