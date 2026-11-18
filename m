Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=85.215.255.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794987719;
	b=baxXEHdoKqIzfY3gH/2osD8hdW5JoWgxfxUKrWY4Ir3O3+KLIO7qF/x81Lq2pQhnvRBZ
	 Z07HNjYuPGo+U2TB6xfJOXBJwo1n/VtOVOaTg+eZIaLTrfBO3SUsJLk+4Ucx56v86nsWW
	 Uz0Z0raYU5cnvZ4al7Y6mB2mAdTv8gT8+QEpqSQT3HTvDu6CHuhTAjDLtH33VqZdY+a+Z
	 YW24h/cm4FEjtLAdG3yMFvRzeeUTaCbQ8H1y2mPNRFXEq0j637tSrJxQEydtbmI/602ff
	 2HHDJIRX6SbBcb6yeIV6GHmhMw/dOh7xOBfAuZOWzujqtcgiaDbJ4Tvf2zM69zzsLJQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794987719;
	h=DMARC-Filter:X-RZG-CLASS-ID:DKIM-Signature:DKIM-Signature:X-RZG-AUTH:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	bh=uyLUm9fc948/r7gEJkjNRR0H+BFJUsBW+sfJUwZgwMo=;
	b=WEkQsouRBkvo4vdXPFi+vsQgQj4nWpZTtw7JnwlLtT5FdOm64Xd3FuOgxVE3g539AJaO
	 QG6acY8gpI4Ky2XgAd4yWclgn1VMMo/nDDbfv+xx8h4EEGpUet5gDgfTXelwOdUxBYjeg
	 8bhcKEWjyn8V3xbR+hzuhV84i4i5sIIUJdnhcJTLRn2kx3hTOPOe4etzlxHn1UeJahJZh
	 aCszVUXmI8AqUv8E26wQF8Cs/zinEXPXjML+qRQPR+yw4G+TjBwm+Se7GoGv0pKhWM0u6
	 hMblyYPJ9BdJOqH6blLreN2ov1NcrSuiJ3pIVikk1QXNqQh/tEEp26hnOrJd7NGOfuA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=goldelico.com;
	spf=pass smtp.mailfrom=goldelico.com;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=FFo9fk1w;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=z+59Xh0C;
	arc=pass header.oldest-pass=0 smtp.remote-ip=85.215.255.51
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [85.215.255.51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE71C606A894;
	Wed, 18 Nov 2026 07:41:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE71C606A894
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=goldelico.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goldelico.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=goldelico.com header.i=@goldelico.com header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=FFo9fk1w;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=z+59Xh0C
ARC-Seal: i=1; a=rsa-sha256; t=1794987702; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=XRD7O4vv7g8JA3dGp2EBfQEjQGkokjRydtuktv5tVZKUeQ1vmTNvTiKjuMAjVCxxaK
    psbP9cGYtUYyezXqloC+y9RODUAmPUqAkrR+1sZgBos+TlO23P6QgYkk69TqGF9DJoH8
    iHw/y1COLAQKk0sgN7w+96m896mxwHluXkVwH5XOlD96MgFjQ/5KKX4EY9sj2RFqxZFv
    pDTOY+XFBWbCMf6aSv+SbhuKR3rsKXkU5B6gk4wQwGIzhGx8WHssSziRc9YlnNQL/Z6E
    peyY41yPsSXQ9iLUIi2cnLwJb3gkQDtdKExdHlMptoKPzRfNw5h2P10nZcBAbn+TmiDx
    Erdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1794987702;
    s=strato-dkim-0002; d=strato.com;
    h=Message-ID:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=uyLUm9fc948/r7gEJkjNRR0H+BFJUsBW+sfJUwZgwMo=;
    b=n28E38k2bU3JnZ0TymkP9kw04P9Bb4Sh85Ar06geqJx829aFktNqUKS/CNqD6c8r/e
    OSsnrSaZsU2mJEMmR7uzY4RURWbzAIoEG+6+U90PNDW+gBpCBh4gbHiHVQPC4VTBnxeP
    FR8Q1d6sOLppNjR+jwNNpSp0SnNDlbv0S8A0VJ9+ecTK1/m9P+DEI81CBY/VSV9bcs4L
    kKEePSSP1PjLiRmDjivWQo9Xf6dcHsr3KeC0+nKoFARqDyrcISfMypIzXRaM+H5Iuh9v
    trkN8LB6X1MTqwpYoPMwBYeUme++10VA9syUUKJ3xfA5ZM4+ALvv/DDDVWI6pD6Oy99Y
    j6bA==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1794987702;
    s=strato-dkim-0002; d=goldelico.com;
    h=Message-ID:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=uyLUm9fc948/r7gEJkjNRR0H+BFJUsBW+sfJUwZgwMo=;
    b=FFo9fk1wzRTDpp0XPV0JxuUpZALSPfeNkQxHgELKBv39RetEG83z+yV3H3oxm5u8vo
    0jaCg4GePx5JUKaPKU5PzkqD6qK+H5czLngOh82QqHknl9pyy4LgafiSmHt2hgojn+M9
    953xvFBBEdQLZqO0n42mWkAGjEw0kKJhX9gaxp3bKt2sy6YKOFqSnwAH2ttiaPRfQuwE
    pcZjSUlSUYv5303ey3hJKIlj9P8tU4As+0OvcZsEKd1vIOn9kPugoK5FIB9QhHKOHeQ2
    OjbhOjMbfvTkkB1CRwIArl76lQTsLXZ3qk/22AbtNA6jyjR01Sj95/eHIleaY/WH8Y5S
    0XOw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1794987702;
    s=strato-dkim-0003; d=goldelico.com;
    h=Message-ID:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=uyLUm9fc948/r7gEJkjNRR0H+BFJUsBW+sfJUwZgwMo=;
    b=z+59Xh0CEUT7cxZQNIHBUAJmwvM5L/PhlQHUaMEXa8rFaWBI1t4CVtDV65T49M0U2k
    eZEwBsoNHLO7/umVXgDw==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9qVpwcQVkPW4I1HrV2Jpcm8iNZLZ2IBizV+3wFb55dglUeZzcEX9J"
Received: from iMac.fritz.box
    by smtp.strato.de (RZmta 55.6.3 AUTH)
    with ESMTPSA id Qb56a22AI7fgaVW
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Wed, 18 Nov 2026 08:41:42 +0100 (CET)
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
Subject: [PATCH v3 0/7] pinctrl: ingenic: Add X2600 support
Date: Wed, 18 Nov 2026 08:41:34 +0100
Message-ID: <cover.1794987700.git.hns@goldelico.com>
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

PATCH V3 2026-11-18 08:41:40:
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
 drivers/pinctrl/pinctrl-ingenic.c             | 650 +++++++++++++++++-
 2 files changed, 629 insertions(+), 31 deletions(-)

-- 
2.56.0

