Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792936687;
	b=LBAmyKXMZVFBZjz/gBQabYBpwM+45iMldup/pEwCdTM+4zxalk+fDmNdPoe6VrXvy/ZH
	 10eqAK9NXihHoSTeOK1q3W46HCrRnp7r+LE3CkM3+U/iGd817VGn96dhZruhXNGd8IUJF
	 D9VlS9b/kSCcDuPPY1peq6arqoPkK4wM+blrcjtLBLFkIls+kXTfUC22vYle3Yd62E5T5
	 WxtPWhowtvKcozmcVAZruURNMaKqn8DLJ04bMR4loSkhB8ONExl3lkDix+C06sE06d7oB
	 ZrnDA8Z9WLYd3hGSlt4xh5qdAy3mpmu8ufGIzQEX6zjAhP1zlRl5ZAu+zGbOOHSjgCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792936687;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=qkMrb47+RHanbLgsTwNr0QXPtl5wufkJw6Ld4BtzfH4=;
	b=C4q/JNVdnHsrnzYdn7E7prrv75J9ZI1ODwm0ppCDrcSXSi6hSGUDLKp/ikKmHFEWE+dg
	 DsM/9jXm3WFVECc9dDCayMM80YOI1ONxLtm4LpAUSTOPnUnKa2pobmrkOeBDyEqGs2SgH
	 Gs/c24k7klUBhPtdwE68GRswE6v5v0b6eXA3/gcSc/JGcTTq6JM8YZNc2ur9ez4pI8jNW
	 BJPUQ8M+fG4xilLYcB8tc8ECNelW9JoNWh9vFQJmq5HPZa6PPsVvxt9YrmJTIxgDyvEbJ
	 IX2ShCFkLK1r8XZMwi6PLbxvl4gUH/fO3+27oLio0hhMBBQ57j95lhMjGLz2FHrjUVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=celnVUjz;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEF79606A31A
	for <linux-gpio@vger.kernel.org>; Sun, 25 Oct 2026 13:58:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AEF79606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=celnVUjz
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48df0fa43c5so1333237f8f.0
        for <linux-gpio@vger.kernel.org>; Sun, 25 Oct 2026 06:58:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792936685; x=1793541485; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qkMrb47+RHanbLgsTwNr0QXPtl5wufkJw6Ld4BtzfH4=;
        b=celnVUjzyZ8riqqT/ARqFvt9z4k/NHLK86xuATMVdPDr6kaLZTTT2r+GCU14BDWnHb
         3fJSaXpBZbkXX0G28U6S/4p/5X9QvkKAcOzdUBcAr9Xxjljg1cLKJlmysIUOrLDb+OsI
         UnMt8FmHp9GKNffFb08sp5UTcTtqZ6Dq8dvaEoLKM7duXoPq8/tzKwbpEfWyIctDGZYJ
         UX0niJD7GNp51iwmyJPaEL5wo5vlEFmIcgnabGuy6uJdKrGX3d0Ji06M1k4f4C6dG3zq
         UfsrphygzVrxpFvHut3PhBzATLc5HaiEV00ON/wK9KDTXJSxU2VDMpFzU7q3UAJqefvD
         RW+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792936685; x=1793541485;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qkMrb47+RHanbLgsTwNr0QXPtl5wufkJw6Ld4BtzfH4=;
        b=BUh/zSGSjcKphPXTHq+SJSef3fZ3JamdnJQEc1HUZtoMrY2evyPTnKA+9pvkTw8nJQ
         U9KICsiv8+65soeLYDvhd2zQJEBlgcQelw8TBD4FxqKRPzzhw81NJmCTlZVCViluqHTu
         snucNXMwtYgCGxVtZeoNEEVDrwbY5cqUaVm/YurRfTRguRLwn8AKTxV8MpvCfqCwLOOY
         MUPzzBwMOQj5gtscMnk1PC/9ixAtzRjHBUCJooS5zcwTDf3i2KtADXwiNfSi4Nkm9PqN
         QdcImr1uXhlrt43KA6w38JHWlkSMD8bOlJ+MSrXrssfPz4CAWk4Z2Uft/dsnbbJy8NC9
         +BYA==
X-Forwarded-Encrypted: i=1; AKwUvByNgTaEyzMC0ye+/2yopRrpERDk0XFKwezr/8jDIT8MBWIsB4BSHlWNfTWJWZyu7f7YceCh6xDAGHcZ@vger.kernel.org
X-Gm-Message-State: AFq9FYJawuc2jntjzLrF1s02sr5F1Zl1TdjlKMDoNwoSASY7IfmqpnxA
	SkGSjiWEiWhadAZ0jgXjd5JU1xnFSl1U2F/xZOYLlotP6oBLTZZ6M/71
X-Gm-Gg: AYBFou2bs2EhgrkLS0xdoMVwe0sFRX1bfBqdcg/MAqE41NMCS7MNxCDftDaHm2OUkp3
	L8WNs9rcPWJHtrQD7lP8omjDtWw2NGLb9tSQ/1W1wcdeuTu5rlo95GQ7LLxWazu786VF2291zJl
	UwW9cK/vjl3taye6q5XbvYSpZmU/qVuARdxASATcdCr2FlhWFMzU+XNTjXD/ss+OCc+rN8acG3/
	e2ncxtnzVHPfT871Undybayaei+4Wj7wb/Raz+zR2kcTKa07uI7rJXyR9WCGGWj2GMYwIK1uLYO
	dNTS5nWH8Sw23JF6fG5CLmnF7ly/Uam0TTrMVMf7oBVy260dVBuFWPuWth51qeDhCTZBKlJ0GTZ
	5lj2Cx4vxXqqtXLDEC1cXPjIOhDVxewRJooCG4xjBMGopxC+pbVfNOzYzdEqNjesimnM2aSLGuo
	XUeG4OnwMR0RmqATbnyeVJTFXtiuQh8qUjnfochDwiX8O1PRTvrmSjnKd9CWg4F6hy7S6kpuBAo
	UDpfE+9ag3L0sVXVucRCD5jn3o5vN6i3aGFbA9C9M1F/9NCLhucDuCV1VRAjvh0Wvct6vrmnCzJ
	FNh7q3Jw0Z+hdg==
X-Received: by 2002:a5d:6308:0:b0:48e:20ed:ce67 with SMTP id ffacd0b85a97d-48e3eb8bf9cmr5477047f8f.23.1792936684892;
        Sun, 25 Oct 2026 06:58:04 -0700 (PDT)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e4806e208sm5663415f8f.40.2026.10.25.06.58.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 06:58:03 -0700 (PDT)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	Andre Przywara <andre.przywara@arm.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v2 0/3] pinctrl: sunxi: number the IRQ banks from the first one that has IRQs
Date: Sun, 25 Oct 2026 13:57:42 +0000
Message-ID: <20261025135745.102970-1-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
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

The DT pinctrl helper numbers the IRQ banks from PA, even when PA has
none. The A523 got a DT interrupt for its unimplemented PA bank to work
around that, the A733 would need the same, and on both PK is written
past the end of irq_array.

Number the IRQ banks like the static drivers do, with irq_bank_map for
the A523 and A733, and drop the PA interrupt from the binding and the
A523 DT. The B288 (IRQ banks on PB, PD, PF and PG) then needs no
made-up interrupt.

v2:
- give the A523 and A733 an irq_bank_map, and drop the PA interrupt
  from the binding and the A523 DT

Pablo Mazzini (3):
  pinctrl: sunxi: dt: number the IRQ banks from the first one that has
    IRQs
  dt-bindings: pinctrl: sun55i-a523: one interrupt per implemented bank
  arm64: dts: allwinner: a523: drop the PA GPIO interrupt

 .../bindings/pinctrl/allwinner,sun55i-a523-pinctrl.yaml   | 8 ++++----
 arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi            | 3 +--
 drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c               | 2 +-
 drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c               | 5 ++++-
 drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c                  | 8 +++-----
 5 files changed, 13 insertions(+), 13 deletions(-)


base-commit: 4f0dbdbdb3ad122e8bbfb1d722fd584bac7124db
-- 
2.52.0

