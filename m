Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.128.198.184
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794802187;
	b=QXDizvjM8NECef0Vkk0avlhRFvwdy28Dm59ND1vNhuFhgiWV7tzg9jbjRAnoJnTE8DAZ
	 NwMWQubeFvmkg8JAiCzGt23UOs0Zgsj1rQhUu1K+yF7aJp4eYhtv2M+VmZtP+XInHt/zw
	 0PXCR8GtvAVLMZvVh9dEwuVHQComHtnyf2Lu8ZWfLZrjA3fYMuR6fzz8i7qdA6+CKWaDh
	 yfq2BubZldZze4FhGWAqJ0MNNQzTj+X+4xlt1zkuLylOyJguXvrn90+8Db8gONYJx4PR7
	 /1MSkhvM002Po3QrPV05wS8GTCA5waA/cL7VR4bQUpS65NNsPZn7X+Dc52lyxLtMQlQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794802187;
	h=DMARC-Filter:Received:Received:Received:From:To:CC:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 Content-Type:X-Originating-IP:X-ClientProxiedBy:X-DKIM-Results:
	 X-DNSRBL:X-SPAM-SOURCE-CHECK:X-MAIL;
	bh=9qJRGK8FBzw3qsx6BCksBJ7d8jSqTZwCkoSlKjJtisA=;
	b=au5pKN9oxZR5jsfRNT83r1CtQtTwmbmVsjBcJ4/9PFlWI7nh0j7U/n9uOeQGg3rIuOQt
	 UvDx9zKh/cpMRLE4W/uqo2HT924ywWpVIguRU9nWIiclFEUaK1dkY6qm5Ior8fMzbRJd4
	 yHMYf3/Aj/ez+dSGRpGeHbe+Uw1pnbcqBIkgPSS97kjqw/GWgS9dkj0EBf9FlFsDh2PQX
	 EZejCamIzoVOVNxO9FEFDpkVyYajyrKyPZDh5fZWdSASd/2FhdtLRk0a6rSkkpAUtJmrf
	 A8/FlYOaXt5bMJuPpf/nTxhQddclpWB9SNl5y9Mi7+T1RqdmFeQrHOn0U9Y44ODbkcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=andestech.com;
	spf=pass smtp.mailfrom=andestech.com;
	arc=none smtp.remote-ip=220.128.198.184
Received: from Atcsqr.andestech.com (atcsqr.andestech.com [220.128.198.184])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0AFC606A323;
	Mon, 16 Nov 2026 04:09:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0AFC606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=andestech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=andestech.com
Received: from mail.andestech.com (atcpcs53.andestech.com [10.0.1.153])
	by Atcsqr.andestech.com with ESMTPS id 6AG49Tpo084334
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 16 Nov 2026 12:09:29 +0800 (+08)
	(envelope-from cl634@andestech.com)
Received: from ATCPCS34.andestech.com (10.0.1.134) by atcpcs53.andestech.com
 (10.0.1.153) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.56; Mon, 16 Nov
 2026 12:09:29 +0800
Received: from swlinux02.andestech.com (10.0.15.183) by ATCPCS34.andestech.com
 (10.0.1.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 16 Nov
 2026 12:09:28 +0800
From: CL Wang <cl634@andestech.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: CL Wang <cl634@andestech.com>, <linux-gpio@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <tim609@andestech.com>
Subject: [PATCH 0/3] gpio: Add support for Andes ATCGPIO100 GPIO controller
Date: Mon, 16 Nov 2026 12:09:11 +0800
Message-ID: <20261116040914.368298-1-cl634@andestech.com>
X-Mailer: git-send-email 2.34.1
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
X-MAIL:Atcsqr.andestech.com 6AG49Tpo084334

This series adds support for the Andes ATCGPIO100 GPIO controller, an
IP integrated in the Andes AE350 platform and in SoCs such as Qilai.

The controller provides up to 32 lines with optional pull, interrupt
and debounce features, all reported by its configuration register.
The driver builds the data path on the generic MMIO GPIO library and
adds:
 - Pull-up and pull-down bias
 - Edge (rising, falling, both) and level (high, low) interrupts
 - Hardware input debounce, clocked from pclk or an optional extclk
 - Wakeup through the parent interrupt
 - System suspend and resume

CL Wang (3):
  dt-bindings: gpio: Add support for ATCGPIO100 GPIO controller
  gpio: atcgpio100: Add ATCGPIO100 GPIO driver
  MAINTAINERS: Add entry for Andes ATCGPIO100 GPIO

 .../bindings/gpio/andestech,ae350-gpio.yaml   |  92 +++
 MAINTAINERS                                   |   6 +
 drivers/gpio/Kconfig                          |  16 +
 drivers/gpio/Makefile                         |   1 +
 drivers/gpio/gpio-atcgpio100.c                | 641 ++++++++++++++++++
 5 files changed, 756 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/andestech,ae350-gpio.yaml
 create mode 100644 drivers/gpio/gpio-atcgpio100.c


base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
-- 
2.34.1

