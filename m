Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.36.163.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794202106;
	b=iplruzyCpBJUzmaYX106bXHpiblXKJlu4hndvUrl3jnOQ4m2hUiiI6JwGz9ncHUJlA2O
	 oqe2V0X1UYgNz6FbalsVzHSCMMY1mjsqMGXRr88a95zzFPDN17JY06RJRDwnQhttMoTGr
	 Pyw63inVoeU/Do3vJkCDrH4nDfSimKj6OSW5NaplQ+gZ9pQjGUyLkYXnitm7jl51qeUsD
	 apy0CycoQqxPF8adA+1RpnTE0DquAs8Ab5iJR4a5ISRsP0ajrIQntnWcFb49sWhIMX/DF
	 wQekkOtHWIERpLn0/4MOQfoDxbwwJiDBLRDi9BY4cNIv260OCJI1jOXcedRvZuYnURQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794202106;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-SEG-SpamProfiler-Analysis:
	 X-SEG-SpamProfiler-Score:x-atlnz-ls;
	bh=ZqsMXWIgoteFobR4UEPgr5FlORpalz6vlz2HAMuLbs8=;
	b=4cgnxFi/fHT9MTIk++Sc/dBalppsZII60IlF/B6I+iNR3jr8tXbQYpnp/EIVQXxmI4hx
	 RCT29GYyXu78A9DbLeUiPP0jxipoFgoEXm1JH0tUQfjUpxJNQKlJiSH8GGfDECzPdRpCd
	 ytFa+3GF/qvDiue2kq0PQ7fLjdw81oboD0yDP2qq2i0s7C4BAkSNC4JAwyDpW9iKy9F4J
	 ujsY3rT/8dZXhAw0yLtOWjUU7pJNgZcFICD7fFniJUfIG1iNngxEAPVNSpS9Ui/a+ycsP
	 jieDLbSNTTt95Ty7MHcsADsYvZzBxIRTnCpPVyYzDtc0KKCVdMHlgm+Uwfckdbq3Mfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=alliedtelesis.co.nz;
	spf=pass smtp.mailfrom=alliedtelesis.co.nz;
	dkim=pass header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.a=rsa-sha256 header.s=mail181024 header.b=ruFZPASr;
	arc=none smtp.remote-ip=202.36.163.20
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3AF6606A31C
	for <linux-gpio@vger.kernel.org>; Mon,  9 Nov 2026 05:28:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3AF6606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.a=rsa-sha256 header.s=mail181024 header.b=ruFZPASr
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id CDA032C0404;
	Mon,  9 Nov 2026 18:28:15 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1794202095;
	bh=ZqsMXWIgoteFobR4UEPgr5FlORpalz6vlz2HAMuLbs8=;
	h=From:To:Cc:Subject:Date:From;
	b=ruFZPASrZJy9DNQraAkn6J4qy0QT7pczWhbWW0BhM9+jmaAuTkOGVdALK5enCFQOq
	 KUGcHryFaE5Db7kH92G7bVRBaLAxfV+4tyUaGmZ64ERot0F/d1zwbHLfyoXefQsFSk
	 y333/mKiyMES7OvSSKu8YbOROx3bLyIwzDuCES6Qeb55kwPscZ5pstVYiKYtzmUsMd
	 xTTCWoXjTnMCCDerVXek9cEPj+CvWmWs3WqY/yYLk09LzWXgte1Mu//fGSxApn5UAP
	 HpIht4dUSzd0LjsFMcfSdSWUQ5RVbiMIllvb+s4txouowjsi4sfKHALvvy8TgaKWvA
	 yDKvb5oq09oUQ==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B6af159ef0000>; Mon, 09 Nov 2026 18:28:15 +1300
Received: from joshuas-dl.ws.atlnz.lc (joshuas-dl.ws.atlnz.lc [10.33.25.13])
	by pat.atlnz.lc (Postfix) with ESMTP id 60F2013ED56;
	Mon,  9 Nov 2026 18:28:15 +1300 (NZDT)
Received: by joshuas-dl.ws.atlnz.lc (Postfix, from userid 1634)
	id 5D1955B0036; Mon,  9 Nov 2026 18:28:15 +1300 (NZDT)
From: Joshua Scott <joshua.scott@alliedtelesis.co.nz>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	linux-gpio@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Sander Vanheule <sander@svanheule.net>,
	Bert Vermeulen <bert@biot.com>,
	linux-kernel@vger.kernel.org,
	Joshua Scott <joshua.scott@alliedtelesis.co.nz>
Subject: [PATCH v2 0/2] gpio: realtek-otto: Add RTL9311B support
Date: Mon,  9 Nov 2026 18:28:06 +1300
Message-ID: <20261109052808.3035449-1-joshua.scott@alliedtelesis.co.nz>
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
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.4 cv=S4h6w5sP c=1 sm=1 tr=0 ts=6af159ef a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=zJRp6_cAMcgA:10 a=VwQbUJbxAAAA:8 a=UhqImUyooLHdldx6TLQA:9 a=3ZKOabzyN94A:10
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat

The Realtek RTL9311B is a network switch with integrated ARMv8 CPU. Its
GPIO controller is the same as the RTL9310's. This series adds a
compatible for it, with the RTL9310 compatible as a fallback, and lets
the driver be built for ARCH_REALTEK.

The RTL9311B node lists "realtek,rtl9311b-gpio", "realtek,rtl9310-gpio",
"realtek,otto-gpio". The driver binds through "realtek,rtl9310-gpio",
which keeps the interrupt controller; "realtek,otto-gpio" alone would
bind with interrupts disabled.

Tested on an RTL9311B board with an Infineon SLM9670 TPM on a spi-gpio
bus using GPIO3-6: the TPM probes with tpm_tis_spi and responds to PCR
reads and TPM2_GetRandom. With the v2 compatible list, the controller
binds through the RTL9310 entry and registers its interrupt controller.

These patches were prepared with the help of Claude Code
(claude-opus-5-5), which drafted the code changes and changelogs. I
reviewed them and tested them on hardware.

Changes in v2:
- Use "realtek,rtl9310-gpio" as a fallback for the RTL9311B, and drop
  the driver's "realtek,rtl9311b-gpio" match entry, as the RTL9311B is
  fully compatible with the RTL9310 (Krzysztof)
- The driver patch now only changes Kconfig, so retitle it
  "gpio: realtek-otto: Allow building for the RTL9311B"

v1: https://lore.kernel.org/r/20261103215316.1544492-1-joshua.scott@allie=
dtelesis.co.nz

Joshua Scott (2):
  dt-bindings: gpio: realtek-otto: Add RTL9311B
  gpio: realtek-otto: Allow building for the RTL9311B

 .../bindings/gpio/realtek,otto-gpio.yaml      | 22 ++++++++++++-------
 drivers/gpio/Kconfig                          |  5 +++--
 2 files changed, 17 insertions(+), 10 deletions(-)


base-commit: cbbddb6b08cc9900a87cccaa9b22bbe06aa4f50a
--=20
2.53.0

