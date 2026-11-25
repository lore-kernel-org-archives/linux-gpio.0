Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=81.169.146.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795589412;
	b=WSb2TvdtjROCsDecmBjbYxgImCoOZ5jEDT3miArE+psa73focPs++5xaN5V0JKoN1LO7
	 vtT+/JE4D0k9XhkpkXmjNvIfSm5vUr4i4q2nN4PWPB8lRWNLlJ6W9F6ZvpDmTu9QEu7Z5
	 oH/ehM4D1P1JY2MQ+Ob6n70/e+OARINN4jmf80WZkHDEUmheOVq/UfJuL0M4tEiSfXeyd
	 AjGlqLiUdAavO36sb+/gfPVLENK/WG9IRSynzH5XbiRlMkfEtwsPB9j9BaQ5Z9tmKe0z9
	 RHVRkFnj1wQdoQ+EpRVIW3LD+oA7oGc01a4CJ27tUpDbz+zflUWzoQcGiXQymxi4Gig==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795589412;
	h=DMARC-Filter:X-RZG-CLASS-ID:DKIM-Signature:DKIM-Signature:X-RZG-AUTH:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	bh=yxPGQ7adaFMydjOyzVt4zAvFH0oIPhQsKsfcMYofYP0=;
	b=pJcDVqw4W7qxFRTW2oIioHsFGYmIpJHulbxmxnFqZpO1iqizo6ck+GJFHD/LJ7M+xN9+
	 INvfBAjK7Uo3GOl7ncp6ujHNIB6NkemGDH8pVWJK6Q0nXU8aLZPj9Q2NYR4wUKDlOjclx
	 dh1SBwwTohbHt9O381rfR07VVrxTKTKraqs7rOwp8l33vJBP6mtff3tTgtTE3LOmDjl0s
	 o3NR6cmUDfQ6VE2ILtGgB2HY9BOONz88ZKs2gnrTkLKv2/q0aZenBw34pMIFranV9sZ50
	 VQKppV9R8NPD/fRICoRG7LNpJ/7ch9xQDKSXgPk0KXxr5+s2Termlng3zDikAEdMWTQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=goldelico.com;
	spf=pass smtp.mailfrom=goldelico.com;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=E8nGfJ9L;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=xbDpmUJL;
	arc=pass header.oldest-pass=0 smtp.remote-ip=81.169.146.170
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de [81.169.146.170])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 010B3606A321;
	Wed, 25 Nov 2026 06:50:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 010B3606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=goldelico.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goldelico.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=goldelico.com header.i=@goldelico.com header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=E8nGfJ9L;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=xbDpmUJL
ARC-Seal: i=1; a=rsa-sha256; t=1795589385; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=JlFqy6YKX7XT3g7z15KkqHtCRwTor0bIJAKUput5rDj9xXxFAsbzXqFSvLnvENxxbU
    ehVYBQU6voN8eNnTZX7WPQ+KqyfbXyJMhdy4XISQIC/I3xQjN3w7xzno8kILBP03j8o9
    OZGjlKbf9KUeF56LQy/y/jErv/QNadWOzlUGXPL4Gx0TwFrMrThZqoVrGrdLu1+40/xa
    XZ2dyJpp080qKnqK3FfxiRcE9hDUhfmNDXn1LmPTNZV4oIShse5sR5x7wW514GdVT6D+
    wBhxohCjdwmol9oEiyWUJiJDSGvh20Esm9NMbiJt5EpVRfoi9ykkwMt/BzdfTk10SO7u
    GmzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1795589385;
    s=strato-dkim-0002; d=strato.com;
    h=Message-ID:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=yxPGQ7adaFMydjOyzVt4zAvFH0oIPhQsKsfcMYofYP0=;
    b=NhEthbSk5bK8W+vEbYhVDPngqfPnkyaOowAJm/RREXtVQWMOqVxfppDMVWKvQErXG+
    IcT91Bt6MFbIwSBgKGxoKZi9sh2C9tD2wDqFA0AGTC3edvCc1roQsrgwA802buipH3xR
    Na2EFYrBWbZsTpoXLa7Z+H7NNisBYXtvcS0heUEaQPySx7tUXiurnjopikZlpSPRRGmD
    bNMZMggYdAeu+5vl8Mb/q9j1vUypZFdGEYjWedD2lsYYXqjM0NnTRi3BxjgajsPaVdUr
    7rBy+vIDqkdtVpkuQsjSvoEVbtzCxGqKtATWJnWJEDkvLBH7COIx/XCLf33DDUDmRsSE
    2/BA==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1795589385;
    s=strato-dkim-0002; d=goldelico.com;
    h=Message-ID:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=yxPGQ7adaFMydjOyzVt4zAvFH0oIPhQsKsfcMYofYP0=;
    b=E8nGfJ9LAS3PXZdBWH7TYqU6yLUlYJkwpjMVXwgZdcKc9ZyV3j6o8/Wd45OT/30+3H
    yR5GNr+jFQ7UpnwZGMq3Ihq0iMHjL10qhcu8YOyzo2tEaGute9B+qwajieTkG9YYV3cc
    GLx4VVBWkS3xQo0Nk4hqa69lr+irA5HUMj2RHgXJaBCI7mqaS5WrfY2WvAvvVz6A/UdC
    XFOIh7m95ICN1a7Zgdbh4miwSamQvG1NLm01NWTPEhvPYLsfkIMdDlochu61vQYoZBF8
    w0CUhffHTy5w5xL/LuKy1i2ltKyDP5CsYjLsZSnwsTsMuQs4cV3R1BBDEi93NvS6o8+F
    /DEQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1795589385;
    s=strato-dkim-0003; d=goldelico.com;
    h=Message-ID:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=yxPGQ7adaFMydjOyzVt4zAvFH0oIPhQsKsfcMYofYP0=;
    b=xbDpmUJLxzvVTXDvZOCNXjYpIUfRMy+CVV7hRFOIej/WP03cDrmVln24MVz7of8PGn
    fqM+BxQM7xXe8S37gSAw==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9qVpwcQVkPW4I1HrS25oMlMiNMn5e/Npe6SVDIvzG+5uG4p/zkDZq"
Received: from iMac.fritz.box
    by smtp.strato.de (RZmta 55.6.3 AUTH)
    with ESMTPSA id Qb56a22AP6nj5ps
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Wed, 25 Nov 2026 07:49:45 +0100 (CET)
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
Subject: [PATCH v5 0/7] pinctrl: ingenic: Add X2600 support
Date: Wed, 25 Nov 2026 07:49:36 +0100
Message-ID: <cover.1795589383.git.hns@goldelico.com>
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

PATCH V5 2026-11-25 07:49:43:
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

Changes since V4:
* Restore Conor Dooley's Acked-by for the DT binding patch,
  originally given in v1 and repeated in v2, as requested
  by Rob Herring.
* Add Reviewed-by from Paul Cercueil to patches 2/7, 5/7
  and 7/7.
* Simplify shadow-register address calculation in patch 4/7,
  as suggested by Paul Cercueil.
* Remove unnecessary line breaks in patch 6/7 and drop the
  unrelated alignment fix from patch 7/7, following Paul
  Cercueil's review.

Thanks to Paul Cercueil for the SoC ID reordering proposal
and detailed driver review, to Hunter Laux for reviewing the
pinmux definitions and identifying incorrect pin assignments,
and to Conor Dooley and Rob Herring for the devicetree binding
review and feedback. Thanks also to the Sashiko bot for
additional automated review findings.

PATCH V4 2026-11-18 18:25:36:
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
 2 files changed, 621 insertions(+), 35 deletions(-)

-- 
2.56.0

