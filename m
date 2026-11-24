Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795557108;
	b=A47Le+X0fNwDAzSIBqyeKUmZumXxW2y7m3N6fwlsSygMn4IeMN++4sxz5bsR3wbfNaX6
	 OLs8ErrJsqf/zOiOumfS2IifRQ1OWyElXZYC3iVCN1gQOVPBJjC7svO0mJLb7C9qXgS4o
	 qa1kWeZ8zrq491D7M0Hx80Ip/mxY+mrXFTKBjuwtgQas0ysTU53vc248F86ysKs3M459U
	 LQsvzfIOgeFYAqg9YVFTvTd1CtIL2lSseWpvSM8gs/j5VCOWjT/xwP3Te024HGxty0ZRw
	 9HHcw9zp/NlEh6untE7BawyGv2LOMeeR/kz0uYkvvCgoa4ChJzXauclaCbiVSw+35fw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795557108;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Q+MVnOFEFwJuVi0O8xTOZaHRbvIQr13a56K4pIcT3Po=;
	b=AfOAJUXs1+yAdbaLbvfoRuqZPwGWkqW0yuTKyR1xaXyZfCA3Qi7c3v525kiuLMUt7ktz
	 ERcAznUMw9rg3bNeUjLO8zSXgOJ0qnNe2S8dGmTSluMW2u/qrEpxppwyPoEO+H49jEiVJ
	 7hadqJ16DSy4a6wTKOEhKj7TD3U6vp06Yk3RUev0+kxAuGKOpHmtDugUabApFU3zjtTss
	 7QJKku9INLkSbpfeHpP+Dlzw456+S8MfSDAw9Tz3k4SnPMzD4uNWedT2z34ih1KVyeNLX
	 2pg3s1rGe8Zsj956pDSuSiogAA4kScE6LhjMG/mk4kSoy3fNACAUbvTYkAqmO5YNK0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FmqJqJB6;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2A6D606A689
	for <linux-gpio@vger.kernel.org>; Tue, 24 Nov 2026 21:51:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E2A6D606A689
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FmqJqJB6
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48e46e449e8so3265854f8f.3
        for <linux-gpio@vger.kernel.org>; Tue, 24 Nov 2026 13:51:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795557101; x=1796161901; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Q+MVnOFEFwJuVi0O8xTOZaHRbvIQr13a56K4pIcT3Po=;
        b=FmqJqJB67hQrYyaw6JTpSrEOH6WEyZZtcyc5plL8wcZ2keR3VpkWteBgkxRsITP/CZ
         b4J5DSAB2F4oKLbJzWI3QWjUdVmJVtg8k6/Bn5xb3PG5mbq2TEKjdItfhGAv74smzepA
         fwyj5+cySHUuzGVweJ6u6bNnzA9IWOnnpJhGRBuMaAypQwp97X4BDJSOghVxCza5T1E9
         Fw3AxXJCT5Fq0d1pYHNSr94fRnVayeTzufkp81Z/OKs/wStM7rW4FhxYTtBOrP3OnpD7
         MYJGMCMKq9YE334Lle1k5MK5SYkmspKRi7PL18Zt9eIH7QGg0FDy52PLHdqZnFQfl9D4
         8RTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795557101; x=1796161901;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q+MVnOFEFwJuVi0O8xTOZaHRbvIQr13a56K4pIcT3Po=;
        b=gu9ziJQhNFQ12UCf39+ZwWu7OZgkoGHKinCbf3LXbQG9mHncu2sS7HeMuDU1pzG+4m
         5/lzeTnsaIt44bwdQZp09ZTB3c/lFlQuTbz/pQ/lZsJyDC1X3pzzjnmzBIq+f+gVXnIH
         saKgl3xSuYrOvg0+DqDnmf4BgqHw3HJHtcHUDE9hNk0lwLwnow/Gcb/wOsj39rJtYyVn
         4YwkIGXuWGyfrJs45TC5riEuju4aGRgKp61QNrNCPRVeiLRQj4Yf6W2Lpm4oxE3Jffcq
         nWv+p0taD/WAiPbYpuk/qJunAvv3xcsN/L0jOPO/UnjckhllXdcvh6qPt2HFIiRCfUsr
         Iqgg==
X-Forwarded-Encrypted: i=1; AL+hErGrmRQUw8O1KRSgfLWuumzLGJsKH9tkYjnQS8OVGoORgen8C2AkZg/bi3xJPTNATUiJUcNBEDOpyRcz@vger.kernel.org
X-Gm-Message-State: APuU4Z/5g1RZc9Bpqptw4OyOAf9G/86ymvHzlb8DhQZSPzOf65o1Q58k
	w5TuFhjjiXD2HAoOB9go0gSlbGsXdddik8MV/7Ykkgnutau2PpHT/frP
X-Gm-Gg: AZFdTZcTT3L/6I9iz9yl1dlk+o7I69CjPcBG/8oLZcgvlNe6EQ1RKGExMZhBKWiBd+1
	xHNRjKAb9yDmxtj1naynM5Wzu2dzNKRVimv63DpTBEXKqSOtH3D2T/f7aaT+I5vGSvv0jWKjmoR
	h2iY+hxZwam10gG8p5uVMkNMJ0UrJUvdp8F6QMyQw3CyGN5v7VjasHOY7zTtU7djw6lKrihsNBE
	YDWGszk21ZjVGh9wUKQBM08uNDpBLTLJL/BIc8yztTWQV8jQmEGAwqKq2HPTariSjtDDGS1SoA+
	dZHE7fACy/rHJQRgg/fHr3Z2Jh+aU7UE3dC/eyDw04I0ju9CKZVKiFM8rmLf/d/rZB31Aldkig3
	R+yje9OHmyYtHZ/ud9oy+9RJL/08iupzmwOwHL0ByvEttxw9EG7umGTpkhG5UrDZBHb2NX9VjMe
	OXgHm5wYH2gL++R600rB7T2OmYC9N09rk7pdwOCPGPmwvYFLEYh80pnci1AEE8i0VjeeQW0DSdm
	pz9I9Flo181qWarUgVp7JH47bKPpsDGBTd3TIpH4QVKUJq6/sTL6zBhdrkZZQAaIRv5Ffpdi4n1
	0hZVvwa7Ln6ETTXqTMQFUAJeE9AxlsmcTz3EK+YlLw==
X-Received: by 2002:a5d:5d87:0:b0:4b8:db69:1b4a with SMTP id ffacd0b85a97d-4b8db691b7fmr2464923f8f.55.1795557101212;
        Tue, 24 Nov 2026 13:51:41 -0800 (PST)
Received: from debian ([185.57.100.179])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab5ffcad11sm29194685f8f.0.2026.11.24.13.51.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 13:51:40 -0800 (PST)
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
Subject: [PATCH RESEND v3 0/3] pinctrl: sunxi: number the IRQ banks from the first one that has IRQs
Date: Tue, 24 Nov 2026 21:50:45 +0000
Message-ID: <20261124215048.42074-1-pmazzini@gmail.com>
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

RESEND:
- rebased on v7.4-rc1, no changes
- add Rob's ack on 2/3

v3:
- apply irq_bank_map to the A733 register layout too (Sashiko)

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
 drivers/pinctrl/sunxi/pinctrl-sunxi.h                     | 7 ++++---
 6 files changed, 17 insertions(+), 16 deletions(-)


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.52.1

