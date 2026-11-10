Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794332394;
	b=pSaUQBmgtOaHlVyB9F/q9UKyasyDqte7tEjaG0Pf0G4mIJrlkm3KcJ54wDF0qB1SKJoz
	 HZRQjE2cey21qn0Q2ugCOTmx1L3vt46AG0AvNujyL/RVk85zAS7Ar5Wq8A3XHPCBkPqAp
	 8mQXH+yA2AAB06u6nyTw6KkilqeGRKceGZaX0QVVWdD0sfD4HKNrfWLCke7H+vccy0Ic6
	 fBxjsCJL/cEan3wR2ZGwnOGmeh2CYFgRcELE26zd5+ytVoRQZkYb/hmbaaF8vychT4Ev8
	 4SuwkmQhoNe17nHbt8xrTIYQM+2QeJkAuQLobxtIGrV7QhMiSEjQCIhVpQ8RO7cTmkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794332394;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=0/ZUbsNW/rTrwtYCty/I8a6/S6q6DnVD6SqTQlAtUic=;
	b=5WLnIQ3fnULyPe+D7FsRbM/5QuP5UkG4CbOjwaFY+j5oxxb+mB2vHdgTDBLA7Ofjyfv4
	 EDdsibw3xSUK4ftx93JLYM11JwHPdbZu3+4wwOTh56y944p+3F+0Cg2h1K7DsLDVCbhzE
	 T7XV6jn5sERir5A2WBny9FHz9nPv21rVjRhHQnhtORuOIak9iosw4WeeuFJX0wze0BL8Y
	 Bu8q5Yqse1Q4pYdMeP8a59cVQvm4y4kSG/hJFXErbA/AwiuXUVA5FcMLy9Q6CsJuLzJwQ
	 3utAGEE9yRazwa6/ynl+2QN40CnP9FwpDgztfuvL78fSX+EfjgAxULj7T6gt6GPcTsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=phrozen.org;
	spf=pass smtp.mailfrom=phrozen.org;
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78DEA606A31C;
	Tue, 10 Nov 2026 17:39:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78DEA606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=phrozen.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phrozen.org
Received: from [2a04:4540:1403:9bfc:b113:5373:d0ec:2ad1] (helo=bertha10..)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <john@phrozen.org>)
	id 1xQpox-001CWh-31;
	Tue, 10 Nov 2026 18:39:47 +0100
From: John Crispin <john@phrozen.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Ahmed Naseef <naseefkm@gmail.com>,
	Benjamin Larsson <benjamin.larsson@genexis.eu>,
	Christian Marangi <ansuelsmth@gmail.com>,
	devicetree@vger.kernel.org,
	lei.dong@airoha.com,
	Linqi.zhang@airoha.com,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	mfd@lists.linux.dev,
	Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>,
	Rajeev.kumar@airoha.com,
	upstream@airoha.com,
	Weifeng.xu@airoha.com,
	zhengping.zhang@airoha.com
Subject: [PATCH 0/7] pinctrl: airoha: add AN7589 support
Date: Tue, 10 Nov 2026 18:39:34 +0100
Message-Id: <20261110173941.301478-1-john@phrozen.org>
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

The Airoha AN7589 has a GPIO controller like the EN7581 one, with a
third bank for 74 GPIOs in total. Its pin functions are selected
differently: a separate IOMUX block holds a 4 bit mode field per pin,
eight pins per register, and mode 0 makes any pin a GPIO.

The first four patches prepare the shared driver and change nothing
for the SoCs it serves today:

 1. The GPIO register layout moves into the match data, so a SoC can
    describe more than 64 pins.
 2. A function group can carry one IOMUX mode per pin. A SoC
    describes its IOMUX in the match data: the width of the mode
    field and, from patch 4, the mode that makes a pin a GPIO.
 3. The chip SCU becomes optional, as the AN7589 needs none.
 4. A pin requested by gpiolib is put into GPIO mode through the
    IOMUX, so no per pin gpio function is needed.

Patch 5 adds the bindings for the pin controller and the GPIO system
controller it sits under. Patch 6 moves the GPIO register offsets to
the common header, so the AN7589 data can describe its own register
table, with no functional change. Patch 7 adds the AN7589 pin data.

The series applies to next-20261105 and has no dependencies.

John Crispin (7):
  pinctrl: airoha: make gpio register layout per SoC
  pinctrl: airoha: add per pin mode field mux
  pinctrl: airoha: make the chip SCU optional
  pinctrl: airoha: mux a requested GPIO through the IOMUX
  dt-bindings: pinctrl: airoha: add AN7589
  pinctrl: airoha: move the GPIO register offsets to the common header
  pinctrl: airoha: add support of an7589 SoC

 .../mfd/airoha,an7589-gpio-sysctl.yaml        |  66 ++
 .../devicetree/bindings/mfd/syscon.yaml       |   1 +
 .../pinctrl/airoha,an7589-pinctrl.yaml        | 533 +++++++++++++
 MAINTAINERS                                   |   3 +
 drivers/pinctrl/airoha/Kconfig                |  11 +
 drivers/pinctrl/airoha/Makefile               |   1 +
 drivers/pinctrl/airoha/airoha-common.h        |  41 +-
 drivers/pinctrl/airoha/pinctrl-airoha.c       | 119 ++-
 drivers/pinctrl/airoha/pinctrl-an7563.c       |   1 +
 drivers/pinctrl/airoha/pinctrl-an7581.c       |   1 +
 drivers/pinctrl/airoha/pinctrl-an7583.c       |   1 +
 drivers/pinctrl/airoha/pinctrl-an7589.c       | 721 ++++++++++++++++++
 drivers/pinctrl/airoha/pinctrl-en7523.c       |   1 +
 drivers/pinctrl/airoha/pinctrl-en7528.c       |   1 +
 14 files changed, 1469 insertions(+), 32 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mfd/airoha,an7589-gpio-sysctl.yaml
 create mode 100644 Documentation/devicetree/bindings/pinctrl/airoha,an7589-pinctrl.yaml
 create mode 100644 drivers/pinctrl/airoha/pinctrl-an7589.c


base-commit: ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
-- 
2.34.1

