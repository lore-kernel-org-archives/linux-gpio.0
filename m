Received: from mail2.nsa.green (mail2.nsa.green [78.141.220.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62D18377ABE
	for <linux-gpio@vger.kernel.org>; Mon,  3 Aug 2026 10:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.141.220.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785751907; cv=none; b=pvCXqT6Mu8fNplJwUaSlhdHJftWxyFXbzT9pAzf5EBFMt5vM4X/2+ORpevtg0QTw2/Q670jOerBKCth5SPmFr/eGhG5Wr4BG+fkqoNCED+g0VDHnY+d/784/VBOsRiRzEaXhKe+g/Hfzks1JVeLYLeI/2+KUklfZ3pn/NSNJlco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785751907; c=relaxed/simple;
	bh=lgALS20BpbCvMEPgTba+8kECHl+ezlecJiFTHB24QS4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fwnHTtfv/p2FHHV9gwR1LlJkncyI0djKJodRkRq+2jOWJx8CaV3cYoikiPe5gNCOvXI7fETBptMzFJjnQ/qaiZEtIeppAjxwymhSVUZYZdjyop9kegUIc0G9qo98NJ3C33OF2JxZVFEBaPY3gJ8yucSP0PdPXqSNGx8MpWpimEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nsa.green; spf=pass smtp.mailfrom=nsa.green; dkim=pass (2048-bit key) header.d=nsa.green header.i=@nsa.green header.b=maWz57cv; arc=none smtp.client-ip=78.141.220.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nsa.green
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nsa.green
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nsa.green header.i=@nsa.green header.b="maWz57cv"
Authentication-Results: mail.nsa.green;
	dkim=pass (2048-bit key; unprotected) header.d=nsa.green header.i=@nsa.green header.a=rsa-sha256 header.s=dkim header.b=maWz57cv;
	dkim-atps=neutral
Received: from mailserver.lev (localhost [127.0.0.1])
	by mail.nsa.green (Postfix) with ESMTP id 4hDC4K1TmtzFsmK
	for <linux-gpio@vger.kernel.org>; Mon,  3 Aug 2026 13:06:09 +0300 (EEST)
Authentication-Results: mailserver.lev (amavis); dkim=pass (2048-bit key)
 reason="pass (just generated, assumed good)" header.d=nsa.green
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nsa.green; h=
	content-transfer-encoding:mime-version:references:in-reply-to
	:message-id:date:subject:to:from; s=dkim; t=1785751568; x=
	1786615569; bh=lgALS20BpbCvMEPgTba+8kECHl+ezlecJiFTHB24QS4=; b=m
	aWz57cv93Ee1ypYTnAdO3QXOjXU0ncZGA5kvSDeklSl7ZmikEEYHV+GnanyePVk9
	UKUj+W0A/j5WLyr9gnnq5dSaz1+LAq5qBA86yJuUbxGibiILYmZzk8wJbonGSER4
	Te02unx+Le9wj+R6Fu/ukOridA49cuFFqUVivBihmUhY4uHM+PoxEnZ8F7dnWkSk
	tmlAEPC5LYHOFNyAOykz1E1q/vPabbJxdxVbggglu8/7ELDzgVyQGe/cmMoDy3Sf
	vv9N6Iz/aHZw0ly/brVs/cre3MYeLTK5iebuXppCYTmPT7X/J9CxCacs3Q727Z4P
	LcAHrC+4OD/wbm9SwKUDg==
X-Virus-Scanned: Debian amavis at mailserver.lev
Received: from mail.nsa.green ([127.0.0.1])
 by mailserver.lev (mailserver.lev [127.0.0.1]) (amavis, port 10026)
 with ESMTP id iBPXLLFAVt2f for <linux-gpio@vger.kernel.org>;
 Mon,  3 Aug 2026 13:06:08 +0300 (EEST)
From: Igor Sakulin <is@nsa.green>
To: Jia Wang <wangjia@ultrarisc.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Igor Sakulin <is@nsa.green>
Subject: Re: [PATCH 0/9] riscv: ultrarisc: add DP1000 SoC DT and pinctrl support
Date: Mon,  3 Aug 2026 13:05:26 +0300
Message-ID: <20260803100534.25017-1-is@nsa.green>
In-Reply-To: <20260515-ultrarisc-pinctrl-v1-0-bf559589ea8a@ultrarisc.com>
References: <20260515-ultrarisc-pinctrl-v1-0-bf559589ea8a@ultrarisc.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Jia,

I have a Milk-V Titan V1.2 (UltraRISC DP1000) and rebased this series ont=
o
v7.2-rc5 to get the board running on a mainline kernel. It works, and the
board now boots mainline with the upstream devicetree - but not with the
series exactly as posted. Three things needed fixing, and two of them com=
e
from the series having been split during merge. Details below, and I am
happy to give a Tested-by on a v2.

Context for anyone reading this later: patches 4/9 (pinctrl binding), 6/9
(pinctrl driver) and 9/9 (defconfig) were taken and are in v7.2-rc5, whil=
e
every DTS patch was left behind. So mainline can currently drive this SoC
but cannot describe any board that uses it.


1. The DTS speaks a pinctrl dialect the merged driver rejects
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

The driver was revised in review; the DTS was not updated to match, and i=
t
is the DTS that was dropped. Two independent skews:

  a) "pins" is a string list in the DTS:

       i2c0_pins: i2c0-pins {
               pins =3D "PA12", "PA13";
               function =3D "func0";
       };

     but the merged binding declares it as an integer array
     (items: minimum/maximum) and the merged driver registers pins by
     number - UR_DP1000_PIN(12, "PA12", ...).

  b) "function" uses the legacy generic names "func0"/"func1", while the
     merged driver only knows the semantic ones: gpio, i2c, uart, spi,
     pwm, lpc, espi. This is the point Krzysztof and Linus both raised on
     4/9 and 6/9; the driver was cleaned up in response, the DTS was not.

Booting v7.2-rc5 with the unmodified DTB gives, in order:

  OF: size of pins in node /soc/pinmux@11081000/i2c0-pins is not a multip=
le of 4
  dw-apb-uart 20300000.serial: error -EINVAL: Error applying setting, rev=
erse things back
  (the same for all four UARTs and all four I2Cs)
  Warning: unable to open an initial console.
  ...
  Kernel panic - not syncing: Attempted to kill init! exitcode=3D0x000001=
00

The panic points nowhere near the cause. The chain is: string "pins" are
parsed as a u32 array, so every pinmux group fails, so all four UARTs fai=
l
to apply their pinctrl, so there is no console device, so init cannot ope=
n
one and exits. Storage and networking are fine throughout - the machine
dies over a devicetree property format.

Worth noting for anyone bisecting this: fixing "pins" alone is not enough=
.
The "not a multiple of 4" messages go away and "Error applying setting"
remains, because func0 is still not a function the driver knows. Both
changes are required, which is why this needed hardware rather than revie=
w
to find - each fix on its own still produces an unbootable board.

The fix is mechanical. Pin numbering taken from the merged driver rather
than typed by hand: PA0..PA15 =3D 0-15, PB0..PB7 =3D 16-23, PC0..PC7 =3D =
24-31,
PD0..PD7 =3D 32-39, LPC0..LPC12 =3D 40-52. Functions by group: i2c*-pins =
->
"i2c", uart*-pins -> "uart", spi*-pins -> "spi", the rest are already
"gpio". So the example above becomes:

       i2c0_pins: i2c0-pins {
               pins =3D <12 13>;
               function =3D "i2c";
               bias-pull-up;
               drive-strength =3D <33>;
       };

Both dp1000-milkv-titan-pinctrl.dtsi and dp1000-rongda-m0-pinctrl.dtsi
need this. I can only test the Titan.


2. riscv,cbop-block-size is missing
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

This one is independent of the merge split - it is in the series as poste=
d
and also in the vendor's own devicetree, so it looks like an omission
rather than something the rebase introduced.

The CPU nodes advertise "zicbop" in riscv,isa-extensions but never state
the prefetch block size, so the kernel refuses the extension, once per
hart:

  Zicbop detected in ISA string, disabling as no cbop-block-size found

Every other cache block size on this SoC reads 64 - riscv,cbom-block-size=
,
riscv,cboz-block-size, i-cache-block-size, d-cache-block-size and the
L2/L3/LLC cache-block-size properties - so 64 is not a guess. Adding

  riscv,cbop-block-size =3D <64>;

to all eight CPU nodes in dp1000.dtsi silences it and Zicbop then appears
in /proc/cpuinfo:

  rv64imafdch_zicbom_zicbop_zicboz_ziccrse_zicntr_...
                     ^^^^^^ absent before

Verified on hardware: message count 8 -> 0.


3. cpu@4..cpu@7 unit-addresses do not match reg
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

In dp1000.dtsi the second cluster is:

  cpu4: cpu@4 { reg =3D <0x10>; ... }
  cpu5: cpu@5 { reg =3D <0x11>; ... }
  cpu6: cpu@6 { reg =3D <0x12>; ... }
  cpu7: cpu@7 { reg =3D <0x13>; ... }

The reg values are right - OpenSBI on this board reports
"Domain0 HARTs 0*,1*,2*,3*,16*,17*,18*,19*", so hart IDs really are 0-3
and 16-19 - but the unit-addresses should follow reg, i.e. cpu@10..cpu@13=
.
Harmless at runtime, but it is a dtc/dtbs_check complaint waiting to
happen.


What I would suggest
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

This is your series and you are active upstream, so I would rather hand y=
ou
the fixes than post a competing v2. Happy to do either:

  - send you the three diffs off-list or as a reply here, or
  - post a v2 with you as author and the fixes folded in, if you prefer.

Either way, on a v2 that carries fixes 1 and 2 you can add:

Tested-by: Igor Sakulin <is@nsa.green>

Tested on Milk-V Titan V1.2 (UltraRISC DP1000, 8 harts, 62 GiB), Linux
v7.2-rc5 with the upstream DTB: boots to userspace, NVMe root, eth0 up,
all four i2c controllers present (all four failed before), RTC bound
(rtc-ds1307 on i2c2 as the DTS declares), and a Mellanox card on RC0
training at Gen3 x16 with 17 MSI-X vectors. Zero "Error applying setting"=
,
zero "unable to open an initial console", no panic.

The other review comments on the v1 thread (shenrongda vendor prefix on
1/9, fixed-clock node naming on 5/9, the disabled gpio-poweroff/gpio-rest=
art
nodes on 7/9) I have not touched - they are yours to resolve and none of
them affect booting.

Thanks,
Igor
