Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E85CA1B87C0;
	Tue, 28 Jul 2026 15:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785251785; cv=none; b=Q61FeZ1NZyoBGwfp+moJ+29L77OVIRBiJlQaKoLKvN0rR2LWf4qKsdT4Er66sdu8WJvvl8TFzo/eHkSeOoJp2LhLwYeqwUB72mfAvTkQIcY0HfGPG2mSk4a/5BTePq6qLbGYu1VWh55xUC5U8E5u1Jo904/y4Ehe3vKDMUMSros=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785251785; c=relaxed/simple;
	bh=sfgfkFhnhWMQTsbh3HciwW3BQkkbqfp/2vdNhNp2Z8Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GbYbEdlAu7/6JIl5lIqfkytGu5/OL8VRZozuuh23511ewQFJIsYr1QNgo9tcPBo7E1gNxNg270K9hxBXDWJoXNwy9rPSnUepXi+rMuQJ3cx5UK9TRY5mbuIwRHvrk75tis2+1VQ1e6/Mp4hfbrm2QJxA1+BH3DCJXYhBrKiB3ro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HT+OWaoN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HT+OWaoN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E90B1F000E9;
	Tue, 28 Jul 2026 15:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785251784;
	bh=AKmCiyijWN/uLTU+ziUJPAExecQNAfC6LNifRhKSbP4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=HT+OWaoNss9dyGIt96cm7kUWxZwr1/upNA8gYJhp4gQu2rcKARW7W4pOrYjLARVxf
	 RSBesFk/vRQugTx6TZM7pRwXl74IO/Txx8FxRdWHjlmN5WuymefVb2lDhkfHHnQu3s
	 0EVMH9FcMJN4tlMqlKlVP9UECW5l2Nwc9d+sk/s612W3JRKWidTIOYMNkyX6JbCkoF
	 dSrozUw+tguv6wSW1oR94DUs3pIF03YW5c8efhF8pK8q2maxPOMN6Ww2enl/ZiybkC
	 NZQrja/3P0XNalniKAg04vcByEm0yaKdJkg0yUZcjjoEVF/aT/l/v9Ya8dGMkl4q2E
	 GK/o9a0lw9dQA==
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
To: Qiang Zhao <qiang.zhao@nxp.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Paul Louvel <paul.louvel@bootlin.com>
Cc: Christophe Leroy <chleroy@kernel.org>,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Herve Codina <herve.codina@bootlin.com>,
	stable@kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v2 00/10] soc: fsl: qe: QE PIC improvement and add support of IRQs to QUICC ENGINE GPIOs
Date: Tue, 28 Jul 2026 17:16:04 +0200
Message-ID: <178525175512.295368.12455063665178901595.b4-ty@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260708-qe-pic-gpios-v2-0-1972044cfbd1@bootlin.com>
References: <20260708-qe-pic-gpios-v2-0-1972044cfbd1@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=openpgp-sha256; l=1713; i=chleroy@kernel.org; h=from:subject:message-id; bh=NeoWdYHUix6Az+HvrAdVP8+jIL8qYnnnjc+0DoSprAs=; b=owGbwMvMwCV2d0KB2p7V54MZT6slMWRlHN/h9Su++WiUD7dlVsxaha17f/VtSplhf185/HDq+ +Qm+9czO0pZGMS4GGTFFFmO/+feNaPrS2r+1F36MHNYmUCGMHBxCsBEZskyMnTPvSXybe57JRbB pSqR+5IfLGLc7XOjQWFmW7/dL9mClZyMDK1S6w04VEN3zDCIlo7Pbd26s4i3/NF/t/8fLUNunHv Ayw4A
X-Developer-Key: i=chleroy@kernel.org; a=openpgp; fpr=10FFE6F8B390DE17ACC2632368A92FEB01B8DD78
Content-Transfer-Encoding: 8bit


On Wed, 08 Jul 2026 12:15:13 +0200, Paul Louvel wrote:
> This series modernizes the QUICC Engine Port Interrupt Controller (QE
> PIC) driver and adds the ability for QE GPIO pins to generate interrupts
> through the QE PIC, completing Christophe Leroy's prior work [1].
> 
> Christophe's series was partially merged; patches 4, 6 and 7 did not
> make it to mainline.
> 
> [...]

Applied, thanks!

[01/10] soc: fsl: qe: Add chained_irq_{enter,exit}() calls in cascade handler
        commit: f9cb22ee1b94a3cc5927a3cf3a6f8d01eff8e569
[02/10] dt-bindings: soc: fsl: qe: Set #interrupt-cells to 2 to support interrupt type encoding
        commit: 5708dd3c5a92b9199e4d12ae835b42aed55fe35d
[03/10] dt-bindings: soc: fsl: qe: Convert QE GPIO to DT schema
        commit: a9fb1bd72af0bac860df82efcd92af9e6d4300b6
[04/10] dt-bindings: soc: fsl: qe: Add support of IRQ in QE GPIO
        commit: 33c35fcd8ac007e497f629de105aaf5f39139d1e
[05/10] soc: fsl: qe: Use generic_handle_domain_irq()
        commit: 2f30a619841dc0fee839eabc47b9d013a34dad7e
[06/10] soc: fsl: qe: Iterate over all pending interrupts in cascade handler
        commit: 8244ee2deae73c12a35616a8eed1a88531dcb36c
[07/10] soc: fsl: qe: Handle spurious interrupts
        commit: 7c1419107a55a8d89938a9d04f9c93d9074a3ea9
[08/10] soc: fsl: qe: Convert to generic IRQ chip
        commit: f585e2fac5750ead5f697a47b8612baf927f3d10
[09/10] soc: fsl: qe: Rename irq variable to parent_irq
        commit: 8cd24ff37c299f8159dee8193f171443b331c708
[10/10] soc: fsl: qe: Add support of IRQs in QE GPIO
        commit: 4a3ba9789922560a8111ffbd09f1fde2abff639a

Best regards,
-- 
Christophe Leroy (CS GROUP) <chleroy@kernel.org>
