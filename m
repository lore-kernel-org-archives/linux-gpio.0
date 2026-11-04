Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793829603;
	b=q2sKTb5APKki1S6NqYM46+gyNH2GmkrvPlVtHYJO2f3plV9tk3m708HpeMrLwlr4qRgD
	 ZgRbUfIy8xrlbKMGaAmlMirQE2iLa75tUX2A7BuB12bzmngE4XM3Fzc4joO4E4aoYLusC
	 TsOnqrVCTML5pH6AwFlXWmImHzc4yLBRzbp78wtRd4PjNdwE/zng7WYwGyihbu7ny5Wr/
	 EnTPc0vJrtEn77u8BRlx479LGBXGG1O3wSO9r1HaEM/VY77G2fJnGrx2XTVQqkEhjVG7a
	 m1vW+AlmMFyDxgq2AI1rN+MiJajdL/3PGv9eEgoZR1pyvwYEhA97R5hVgzox/t7WEug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793829603;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=QdTFClJEcyQ2skUjhMpJ7JAqchbY3BE2cskvPjfKm94=;
	b=L4wi5vk5yz1c8+ucYU24QCARSljzOJHptq1JqxmqZEbnXIckIqIy+j+XQc9Ea1kqrQGF
	 skZUp6Yrf5oddY12g/t59eolKlBSv+91NSYEV1v65FMHBc+rCyGWtz8emrs6Rc5XcQGNr
	 wPDeA5JKRU7RVPauLQ3Q41mS6ZnJLPywaIS97XH1h8Bt0kutY0I5D5G4sg8PU0XO6yN5S
	 hJGoWsy5CL5ocZZaWvVovExVscpMtZiixmXDnodP6m0/Axh1+6AjRDaZbwx3Bkuqlc7z6
	 9xG1D0sBMV37lH7g7AwHgl3hqplbq3WPKpjinbj/G2ui7X7/0d//M/RHPKelw3CF5Pw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XWOchdt0;
	arc=none smtp.remote-ip=209.85.214.176
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09C4C606B395
	for <linux-gpio@vger.kernel.org>; Wed,  4 Nov 2026 22:00:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09C4C606B395
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XWOchdt0
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2e942864693so7376095ad.1
        for <linux-gpio@vger.kernel.org>; Wed, 04 Nov 2026 14:00:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793829602; x=1794434402; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QdTFClJEcyQ2skUjhMpJ7JAqchbY3BE2cskvPjfKm94=;
        b=XWOchdt0PSrtvFhgV+EbI5Ik73InYESfTmGWf2FrM49HyiL1WyGqLQKjUNGdPOOB+6
         2cWNZtpiTKrI53YQY1/jlXeqyXJYKIfQcv/Y3bqHNS32L8KabMOguu/wrZgE+hhTYHKU
         HZEyIVvLJT5yMIhiRP1i2q8rDG/O2au3YPAhgv+MaFQvytnd1gDm0PENqh5Tg1kqrV1O
         sRqJEnIeyz2VToedqY3jVIOWhXXsJrPAiaUoE8KdWRtErZHM7g8YWdO3CSYGfOrlmZl5
         eiJhE5qYl/4A8AgX79v3CxT8CaEJE6JsSgMUdMUXUc2oepbLGPsbqr0QIEurwOtjNksG
         S/ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793829602; x=1794434402;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QdTFClJEcyQ2skUjhMpJ7JAqchbY3BE2cskvPjfKm94=;
        b=Gmb1UYip646ZYNXgAE5avmxDZ+VsGbWUVC9AwUKN6y0g35+NJhbl2d7Mwqmpq0VG83
         QIZwz3nSMQKb1psUUJ+8ykt6jYrCEAl/hK/JQpYKMY+0nMnc39mAuFvlhe5AfV7ZzWCQ
         9UVNuliQLIKeQksfeud3cBzZTHep2p++XShiOeegDH2ZSSoL1+bDgJXolYbYXbJtH1+3
         e93hGb121ltixxBYKSBRe/o5AKdC0sSyETcLOqiGLnllxwBl9Amb2j23JnQWu4p1H0tG
         yBo1iySJYxdDKE0M8hOThzAw+ku95MQ+CHHXKv3tad5blmVC/Xq/M6Wf5m4SNoEeYKIF
         3P9w==
X-Gm-Message-State: APuU4Z9KvTkAqWab2XP6oVNePr4nZlpZZO/DH+CTlOjKi9SSCpMry5LT
	FOvj2otpqapeRFpbwfU59pRykTYnaJ/lCnv1G1mF2aw8m3f0UB+kjg62B5+Kxw==
X-Gm-Gg: AYBFou3DPwtoN/RWYJ9R5Jd7L9GgM71T9b0ADU5dv9KKpvFZ0dJUaExHW7TJ5wYKImK
	ZtD1BzniEAVT2yR9b5Qx4X3i6kdPOzJnMe38wsFI9jLZ5rBdin1/On3im3k4FmC6Y2aZeEEazX6
	48Ga7BfK1vzW0f+sWkMQMpe2iOzliF8w3tXPKPlQer4kbl8NbzXw52Cpx6dLKn3clNH2KFgVWCn
	6ztZ7nAgyqiHiV2XG+VYWDvhhTtXKgvKaPufkO6Mg7JQ0T+UckZbcLHD8It/z4jvyitlnTfF4kR
	i2gxUb8JcZhNBzdnOvopDEBttNq21x3H6er6FCuj9bBeeiQOJiaYWQLZ+GAy7m7HtaZRedJAq4x
	+gjUOihN4n0lCHUIx5k8B6us2TChqEqhtVnNF1rR1ax7o8QUgPeYN3JCIfOp+mI97ZjMcKLoump
	9Le8xnknoQ0M621SKWTc7znpBEfGR0AUulCe2YVlSMOh/qAaCZ3+Tai+abPZTQ+u/Sv+9RIpGQt
	GFSV+VbNsGSLe+lv+lAEnN3R3q+YZXS3U5evW6GVrA+O5tKtVl03xZ0p4X2oj+bI3uPKAj0xZ39
	SvFyQU1jgCv/u+TOtwjowUTRgyoGoE7+yy6+H0MQdmEJkm35WBB0BG5lF4TSGz/IOQnJMUKpreb
	e8vaDsLcM+OdT0Dt/+iZdY1AAS/seWCc8dKny7NYR4HQzg5j1aD7IM4eJPncvOm7qK1EBeNPheE
	g0JZU=
X-Received: by 2002:a17:902:ce81:b0:2ea:dacd:1663 with SMTP id d9443c01a7336-2eb364f23a4mr180965875ad.47.1793829602218;
        Wed, 04 Nov 2026 14:00:02 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed08fe1e4dsm11237865ad.21.2026.11.04.14.00.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 14:00:01 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 0/5] gpio: ppc44x: assorted cleanups
Date: Wed,  4 Nov 2026 13:59:54 -0800
Message-ID: <20261104215959.24035-1-rosenp@gmail.com>
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

A follow-up to the earlier ppc44x GPIO conversion to gpio-mmio. With the
driver now built on gpio_generic_chip, a few leftovers can go:

 - Patch 1 drops the label and parent assignments that
   gpio_generic_chip_init() already does.
 - Patches 2-3 deduplicate the OSR/TSR source selection shared by both
   direction callbacks and fold the single-caller __ppc44x_gpio_set()
   into ppc44x_gpio_dir_out().
 - Patch 4 expresses the MSB-first pin masks with BIT() and GENMASK().
 - Patch 5 trims includes, switches to devm_kzalloc_obj() and tidies
   up probe and the OF match table.

No functional change intended.

An AI coding assistant (Claude) was used to help prepare this series.

Rosen Penev (5):
  gpio: ppc44x: drop redundant label and parent assignments
  gpio: ppc44x: factor out the OSR/TSR source selection
  gpio: ppc44x: fold __ppc44x_gpio_set() into ppc44x_gpio_dir_out()
  gpio: ppc44x: use BIT() and GENMASK() for the pin masks
  gpio: ppc44x: tidy up includes and probe

 drivers/gpio/gpio-ppc44x.c | 89 ++++++++++++++++----------------------
 1 file changed, 37 insertions(+), 52 deletions(-)

-- 
2.56.0

