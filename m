Received: from mail-08.mail-europe.com (mail-08.mail-europe.com [57.129.93.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B97B24D6C5E
	for <linux-gpio@vger.kernel.org>; Fri, 25 Sep 2026 15:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.129.93.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790351224; cv=none; b=MaawkpCNWeEY9TOhhY7Av8PZC+WWPQRZf5y3XCitiAzOiNwhf1/Y8iCTjGXtzhGG9MIZtJ8dCoq8QKqV7tv4uI7zgSiogWPRN9O6qGhBn0o+i2N7Kp+sVF8izJnrBwDiXEkFGuzYANE6DfAR/m78OOYUl6ob+fLXhX7AUYB3lsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790351224; c=relaxed/simple;
	bh=3k82jz7EW3OaAVx1EUKJzZ2eOhY+TmEyQjeVG3kPoZQ=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=f+22ybgoYhLg0W7/1mLYoET5qtkUd1K90Ovf5A2ycPk+Qx4z+pHiLsWdpcBZXUcbyJXgKVzBZQwxaHn3Qf0gK7/AkR5ktHBwmrKyo5BrptFXLMQJhmx4EUkI015we0AiWw/yV+n+Sv9dULoEJ0+dBEfvBGpw+ILxVl8drcHhiuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=XLwyQx64; arc=none smtp.client-ip=57.129.93.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="XLwyQx64"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1790351206; x=1790610406;
	bh=na3aVGqjVNrIst8t4bZU+RdCofbxvyiF0JPAdioBs6Y=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=XLwyQx64z2iyxd1UeoZJECbemV+ta5QXWJiLBX6K23/igwuCfxITBLcaLKZE8Ks0t
	 4aNWWIyfeSivXGoxKfgODCRWHANiS3J8LDqJjR/zdT3W+DYI4s2/MC/Tqs4BakdX4T
	 EdHadd9YR4ud1WAflvlUOU8LJb0iauSmttydSsmNpZf2YoiMZufVxz6mcqTWKk3adn
	 3X0/8uuR6USRz8faqpmZAvXDdAfUbfenQxZ12SP7hFfnWTIYjMqXNq6qb5XdXOEyQd
	 ql0uRQxY6JtmlFCOgx7BW4H66EhQBBuIzzgTJryhLlwUGDbW6rwct2+Tn/UuF+iL/C
	 aVCjzsfeEjffw==
Date: Fri, 25 Sep 2026 15:46:40 +0000
To: Sean Wang <sean.wang@kernel.org>, Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Andy Teng <andy.teng@mediatek.com>
From: Yassine Oudjana <y.oudjana@protonmail.com>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>, linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v9 0/6] MediaTek pinctrl DT binding cleanup and MT6735 pinctrl support
Message-ID: <20260925-mt6735-pinctrl-v9-v9-0-bfb19d8bb87c@protonmail.com>
Feedback-ID: 6882736:user:proton
X-Pm-Message-ID: 298bd0783ccbf19c0263703409127e6a6a5ea5df
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

These patches are part of a larger effort to support the MT6735 SoC family =
in
mainline Linux. More patches (unsent or sent and pending review or revision=
) can
be found here[1].

This series adds a driver for the pin controller found on the MediaTek MT67=
35
and MT6735M SoCs. The two differ in the last 6 physical pins, which are use=
d
for MSDC2 on MT6735 but don't exist on MT6735M (since MSDC2 doesn't exist o=
n it
to begin with). In preparation to document DT bindings for this pin control=
ler,
the existing documents for MT67xx SoCs are combined into one in order to
eliminate duplicate property definitions and standardize pin configuration =
node
names. Necessary cleanup is done along the way.

[1] https://gitlab.com/mt6735-mainline/linux/-/commits/mt6735-staging

Changes since v8:
 - Merge recently added slew-rate description in MT6795 bindings into MT677=
9
   bindings.
 - Remove "capitalize pinmux description" which was not done from 2/6 commi=
t
   description.
 - Add ARM64 || COMPILE_TEST as kconfig dependency for MT6735 driver.
 - Set _x_addrs for GPIO_RDSEL of pin group 5 which spreads across 2 regist=
ers.
 - Add entries for virtual EINT pins to pull_type array.
 - Set db_time in mtk_eint_hw struct. Debounce times match those of MT6765.
 - Add pull_type array for MT6735M.
Changes since v7:
 - Wrap &mtk_paris_pinctrl_pm_ops with pm_sleep_ptr to fix build error repo=
rted
   by kernel test robot.
Changes since v6:
 - Mention changing MT6797 DT in 1st patch commit message.
 - Squash MT6735 DT binding patches.
 - Add debounce time to eint_hw struct. MT6735 supports the same debounce
   times as MT6765 so reuse debounce_time_mt6765.
Changes since v5:
 - Revise and fix all register bits for all group register types (IES, SMT,
   RDSEL, TDSEL, PUPD_R0_R1, PULLEN and PULLSEL).
 - Add pull_type array.
 - Use proper getters/setters for bias and drive.
 - Add minItems for MT6795 interrupts.
Changes since v4:
 - Remove patches that were applied previously.
 - Define interrupts items for each variant (bringing back maxItems: 1 to t=
he top
   level definition then adding maxItems: 2 under the MT6795 condition caus=
es a
   dt_binding_check error for some reason)
 - Move example changes to the patch they belong to
 - Don't unnecessarily move the allOf block.
Changes since v3:
 - Improve interrupts description to make clear what sysirq means.
 - Set drive-strength constraints per variant.
 - Set maxItems for reg in MT6795.
 - Add blank lines between conditionals.
 - Add ref for both pinmux-node.yaml and pincfg-node.yaml.
 - Make pinctrl subnode-related changes in separate patch.
 - Fix up some pinctrl subnode property descriptions.
 - Add interrupts items descriptions to MT6765 and MT6735.Changes since v3:
 - Improve interrupts description to make clear what sysirq means.
 - Set drive-strength constraints per variant.
 - Set maxItems for reg in MT6795.
 - Add blank lines between conditionals.
 - Add ref for both pinmux-node.yaml and pincfg-node.yaml.
 - Make pinctrl subnode-related changes in separate patch.
 - Fix up some pinctrl subnode property descriptions.
 - Add interrupts items descriptions to MT6765 and MT6735.
Changes since v2:
 - Add interrupt descriptions.
 - Change interrupts property item limits.
 - Move pinmux examples from node description to example dts.
 - Properly add myself as maintainer for MT6735 pinctrl driver and DT bindi=
ngs
   document.
 - Remove tabs from a few defines in pinctrl-mt6735.c.
Changes since v1:
 - Combine other documents into existing mediatek,mt6779-pinctrl.yaml
   instead of creating a new document with wild card in its name.
 - Split first patch into smaller patches focused on specific changes.
 - Remove syscon compatible from MT6779 DT to avoid a check error.
 - Fix interrupt count for MT6795.

Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
---
Yassine Oudjana (6):
      dt-bindings: pinctrl: mediatek,mt6779-pinctrl: Pull pinctrl node chan=
ges from MT6795 document
      dt-bindings: pinctrl: mediatek,mt6779-pinctrl: Improve pinctrl subnod=
e and property descriptions
      dt-bindings: pinctrl: mediatek,mt6779-pinctrl: Add MT6795
      dt-bindings: pinctrl: mediatek,mt6779-pinctrl: Document MT6765 pin co=
ntroller
      dt-bindings: pinctrl: mediatek,mt6779-pinctrl: Add bindings for MT673=
5 pin controller
      pinctrl: mediatek: Add MT6735 pinctrl driver

 .../bindings/pinctrl/mediatek,mt6779-pinctrl.yaml  |  196 +-
 .../bindings/pinctrl/mediatek,mt6795-pinctrl.yaml  |  236 --
 MAINTAINERS                                        |    9 +
 drivers/pinctrl/mediatek/Kconfig                   |    7 +
 drivers/pinctrl/mediatek/Makefile                  |    1 +
 drivers/pinctrl/mediatek/pinctrl-mt6735.c          | 1118 ++++++
 drivers/pinctrl/mediatek/pinctrl-mtk-mt6735.h      | 3993 ++++++++++++++++=
++++
 .../dt-bindings/pinctrl/mediatek,mt6735-pinfunc.h  | 1148 ++++++
 8 files changed, 6455 insertions(+), 253 deletions(-)
---
base-commit: 4c253ac4b29b8c6cc6fdef8f92d4facde62e63b9
change-id: 20260924-mt6735-pinctrl-v9-30c26357d432

Best regards,
-- =20
Yassine Oudjana <y.oudjana@protonmail.com>


