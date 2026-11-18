Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=85.215.255.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795022745;
	b=GuEfXaYOVyj71TlU+DMsMfbsjqZrRBroSfod+WhsIdP/+DyZA6f4UI5/GXE1fesTe5Qd
	 NAsOKWWeBlmP6HeL/hm/dIa98U+WYucLR8qx9VH7noyHl+XgjZJ30UWCb6vObeGfAiRNO
	 pbM3O3RacyJo+dvkReIXGKPAny96pI4iZJmT9a2VYiMwEn7scyxCRugoa0C0ylk3cAGfL
	 clE9+nuHojLT0dP1DBgIcbi9486NuEEz4DiR2oN7LPyxxO0uWq2YfKh+eT1af9VzOPf6d
	 WvWs9i0jacnB7DsgiN7I+vEUANznjLI57Hw6H82rJTm6yXURv61A0i41fnIxFQT/2sA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795022745;
	h=DMARC-Filter:X-RZG-CLASS-ID:DKIM-Signature:DKIM-Signature:X-RZG-AUTH:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	bh=TwJFoll/UcGtAeAt1MH9NvExxOjtP3mBxYd68V58F9g=;
	b=xHvrjRrxNpCKjIQhTxNqGbw/rmg1XFspQ9RawatTeFjCtoSJpv8WW4jV54zGIYoSHqWE
	 0bY24FLPwm0TEmHJ7Xh5+Fl5YJuqI4wqGiTZoBnX0IJRurZmU8vdOPTV1AK3v5dJcqKY9
	 Ckyy/P4Ag59azkmEFuxVlh7XfgD4MQyL/g4toQIw59ZBV/eqya2C6orR6dtcTB0t8bG3l
	 pT1V1LTcnBqB7SVn31pTTTSl/FMIFWbmL4jJHIGf0/WUNKANytf9X4D69HSBGnCyQj95U
	 EPkFrt0LlPlXTsChMKTlJ0FTWUWPUxthhEiXcSwGBHWn3g26/Bu3tjIoWM49RkgGtdw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=goldelico.com;
	spf=pass smtp.mailfrom=goldelico.com;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=mu2p2HqZ;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=X0nvg4DR;
	arc=pass header.oldest-pass=0 smtp.remote-ip=85.215.255.51
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [85.215.255.51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15CF6606A320;
	Wed, 18 Nov 2026 17:25:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15CF6606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=goldelico.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goldelico.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=goldelico.com header.i=@goldelico.com header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=mu2p2HqZ;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=X0nvg4DR
ARC-Seal: i=1; a=rsa-sha256; t=1795022739; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=pfFjUePlYtqB6BPaZGBvb3/YQPjh16xbPELrbww9fRMILtYHKRTSVm6/sRz4eCJX6y
    cgUW9/jQoRK0RLUHVoaknQKLEOLiAZfWOsVvvqCt1NqoKj6SEf4pIb1Y2IjEkY0dNaJa
    fOHT4gErt9w9H4OUq93aAjdi7dcNoPfLEjde4uiyoDJgSkp7IdP4AyhHXlnFJF4yEq7n
    vtHLqFe5+CAxvB7lPiumCUODBbATFJEyK0RKE4X675EQNRLmat4iAyxH44UvdZCYYwJV
    gyyXWNinZ61tgpjZFEdbHc0hqpIpBpI+jF1DR6dLDcDdf70WC+lSrfd9a3eGsxITPEpJ
    hBxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1795022739;
    s=strato-dkim-0002; d=strato.com;
    h=Message-ID:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=TwJFoll/UcGtAeAt1MH9NvExxOjtP3mBxYd68V58F9g=;
    b=mdbGu5NlWU+8f2sDKJnLqy5MuOMTvFOT68Qz25PhfQ54hhSrE2L258OhjYlxiCfnm+
    MsamrgSxhw18opOZGzWz7tlj3bws6Zsb+F4uSSkSigyDGX7+hTukFS/OlcoqisBdaCcF
    aYxJCZ3ZSto/33HK5x9409nxLoQutE8IqI/FoRdS8rIF0L5IeGrrHW2s4yvm7KbclDwL
    4VoETSh/KyhYDAWRV4cNy9Ds40LDwSEUCEMp30QQ6Y/6DpRhGGFA+jBhqLiolQ68PKLV
    WpkZQ3UKwF6fJNC+tWsXZil9xLoNsiD1BwblamhrT1gipSpBgZpSjLthpzmmcr6fq/6F
    Q1Qw==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1795022739;
    s=strato-dkim-0002; d=goldelico.com;
    h=Message-ID:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=TwJFoll/UcGtAeAt1MH9NvExxOjtP3mBxYd68V58F9g=;
    b=mu2p2HqZc8C0EOhceyucorKgb9YSltNnv3kEtVU0Wu1Lyi2McENbJxUeN44SsJo9Lc
    PFQLFD3RsezW4XQ9aMhI3O8wmRYmxtEahhqDWtJJrzYh4AkxKneMYFDIDs0Acu9EwGUb
    O5jNPauuJOtGLEHk+g3x5QVrJz7n9meRkuUE/9lDn+VjolgiKnGEiHKJkZqNIo5ZL9qq
    aA6qK21qCf8VxySA+YTQxsk16GJsGHs/FmqRd5y0OaIZiCfShYyjTsM8x+CsOp3yh/tx
    7jPyom4d0SjSk5rPy3c+EsWY3QzZtYq7OKdoOKmyWOIA2inhnJLt8e2AZ8fQoVGHzFIS
    0gBw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1795022739;
    s=strato-dkim-0003; d=goldelico.com;
    h=Message-ID:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=TwJFoll/UcGtAeAt1MH9NvExxOjtP3mBxYd68V58F9g=;
    b=X0nvg4DR3uzry19z86Oa3efJQ21GxI49YPEN4iXt7qiSKzXIDaFMYUyHs9k75g2lSc
    +0NnkXng7gcXnSy1WUDg==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9qVpwcQVkPW4I1HrV2Jpcm8iNZLZ2IBizV+3wFb55dglUeZzcEX9J"
Received: from iMac.fritz.box
    by smtp.strato.de (RZmta 55.6.3 AUTH)
    with ESMTPSA id Qb56a22AIHPcdiS
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Wed, 18 Nov 2026 18:25:38 +0100 (CET)
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
Subject: [PATCH v4 0/7] pinctrl: ingenic: Add X2600 support
Date: Wed, 18 Nov 2026 18:25:30 +0100
Message-ID: <cover.1795022736.git.hns@goldelico.com>
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

PATCH V4 2026-11-18 18:25:36:
This series adds pinctrl and GPIO support for the Lumissil X2600 SoC.
It extends the devicetree bindings, supports the X2600 GPIO register
layout with 0x1000 bank spacing and per-port shadow registers, and adds
pin groups and mux functions.

The series also fixes hardware dual-edge GPIO interrupt handling on
X1600 and X2000 in a separate patch, following review feedback.
X2600 Port E uses different pull enable/selection semantics and has
an additional Schmitt trigger control bit; these are handled separately.

Hardware testing reported by the author:
  X1600: GPIO button press/release and dual-edge register readback
  X2000: GPIO button press/release and dual-edge register readback
  X2600: GPIO button press/release and dual-edge register readback
  JZ4780 (CI20): regression testing

Changes since v3:
- Correct Fixes: and Cc: stable trailers following review
  feedback from Paul Cercueil and Sashiko.
- Consolidate the common shadow-register paths and simplify
  hardware dual-edge IRQ handling, as suggested by Paul Cercueil.
- Simplify GPIO port indexing for the legacy global shadow-load
  register, as suggested by Paul Cercueil.
- Merge the shadow-load correction into the X2600 register
  support patch.
- Retest X1600 and X2000 hardware dual-edge IRQ handling using
  evtest and devmem2. Both button transitions are detected, while
  PAT0, PAT1 and EDG remain unchanged.

PATCH V3 2026-11-18 08:41:40:
Changes since v2:
  - suggested by https://sashiko.dev/#/patchset/cover.1794940166.git.hns@goldelico.com?part=2
    - add Fixes: tags
    - remove redundant check for is_soc_or_above(jzgc->jzpc, ID_X2000)

PATCH V2 2026-11-17 19:29:26:
Changes since v1:
  - Reorder the X1600 and X1830 IDs using Paul Cercueil's change.
  - Isolate hardware dual-edge corrections from X2600 support.
  - Correct GPIO mux function associations and remove empty lcd-none.
  - Adjust UART mux selectors and SLCD pins following review feedback.
  - Extend X2600 pull capability masks to documented GPIO pin ranges.
  - Handle X2600 Port E pull enable/selection and Schmitt controls.
  - Remove redundant X2600 IRQ flag-clear special case.
  - Add JZ4780/CI20 regression test coverage.

Thanks to Paul Cercueil for the SoC ID reordering proposal and review,
and to Hunter Laux for reviewing the pinmux definitions and identifying
several incorrect pin assignments. Thanks also to the Sashiko bot for
additional automated review findings.

This series is based on the pinctrl-ingenic driver after Brian Masney's
subsys_platform_driver_probe() conversion, which has already been accepted
upstream.

The author used ChatGPT to assist with source review, patch organization
and commit-message wording. Development and hardware testing was performed
by the author.

PATCH V1 2026-11-13 09:13:47:

This series adds pinctrl and GPIO support for the Lumissil X2600
SoC.

It introduces the devicetree bindings, adapts the register access
and GPIO interrupt handling to the X2600 hardware, and adds the
pin groups and mux functions.

The changes also correct hardware dual-edge GPIO interrupt
configuration on X1600 and X2000.

The updated driver has been tested on X1600, X2000, and X2600
hardware including GPIO dual-edge interrupt handling by a
gpio-button.

The code has been tested by ChatGPT which also helped to formulate
the messages.

H. Nikolaus Schaller (6):
  pinctrl: ingenic: Fix hardware dual-edge interrupts on X1600
  dt-bindings: pinctrl: ingenic: Add X2600 support
  pinctrl: ingenic: Add X2600 register and GPIO IRQ support
  pinctrl: ingenic: Add X2600 pin groups and functions
  pinctrl: ingenic: Handle X2600 Port E Schmitt trigger
  pinctrl: ingenic: Handle X2600 Port E pull configuration

Paul Cercueil (1):
  pinctrl: ingenic: Swap ID_X1600 and ID_X1830

 .../bindings/pinctrl/ingenic,pinctrl.yaml     |  10 +-
 drivers/pinctrl/pinctrl-ingenic.c             | 646 +++++++++++++++++-
 2 files changed, 624 insertions(+), 32 deletions(-)

-- 
2.56.0

