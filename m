Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792938262;
	b=cwuqyfD8S0iLdSiwjXxA3iR4knkVqqlwEw4QVKueX5fQImtFO0Oj+VMuxmHyWer1Jw62
	 K2M3Pv4nVPvZadx4Q8yxz5/LjCIPst26NzcUnjOq3bDiU/uuTUF00zU9QqOfSkbKn558R
	 qGZx1l7ZUzboTXbl63Fhq1D+rJ0oqlk2h0dOYOss1fDGDJRCERnlEhi8PWDZh3lStD7wQ
	 AS8f3AjCrVo4F0kPu7tGeaj2dKT12ZdHllCKbwzshqOO6fEYtMGcshBsmufK+DIecKzMn
	 eiW6BDOq4Z5R1pfkI/j9i1vAnOmr0nWmi9rzcn6krVbYKD1hM0TLS8mdDpkKwv1cjWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792938262;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=4O/RvzgiTmhk2/YkAfbJDc508W14Kdf1yTv/20bx6AA=;
	b=Rba8+jwoFWUg0BNe6T2B0iqvF8fQriiAt3A+QIfTfq9Y5l0FpyyReGYvbd+jytcWD5AP
	 0uk9M3zjOdk2K6C2+YBJ0bfUe3c7+kJF6u0WPwtMRzy/C3XgRO1DvZHxMILEh7MqhaLUI
	 UPzTjnpNGEF+x65zHdeUkQkaDwTSlBZxmEwtQTH7Ozkd5oqDymXBIDQwv5AWjJgEC0hF7
	 2Qad3nO9uU7nw2eUJEbgpnzMMFUDYwYYpgetEF0sx8DO0s0V9DaBWlX1yi+8HOMTZAt17
	 3NxsUzRjy0KoLMtXs4amO0pjGzDjmSDP62twSGZxlB2PQaNlWEOQxZ2HLbau9o7Kd5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=dj7AoADT;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2DA5606A31B
	for <linux-gpio@vger.kernel.org>; Sun, 25 Oct 2026 14:24:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E2DA5606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=dj7AoADT
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a215e64962so14798135e9.1
        for <linux-gpio@vger.kernel.org>; Sun, 25 Oct 2026 07:24:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792938260; x=1793543060; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4O/RvzgiTmhk2/YkAfbJDc508W14Kdf1yTv/20bx6AA=;
        b=dj7AoADTnEBgdCyYS0JghCvO6BccdqmC5lzxKqs1Zhzg645SPfsLFi1zmZAndrh5iN
         MHAU5cyNTNepv3G802hUXihBqAVYe+fJKebXuBynMSeauFl4lBw2Si5WzsAIluxEWOH6
         mQmcCyzvI5Lnmqw9ks1ZYZcA0XYcNZj+mra42vq64B5y/P9HfQwkMxJKqcxlSQp538Vw
         TWOWx5Ggi+fNxBqeO+KD3RHOCK5fvcUQPuupzsWb0gQ5kImt1tn0QO9JHNWqaJIf/BOw
         VYfndGweeXhDp4g/L9JHTAAqZfOInNehTUy0POg2+Ri7+OLVw0cjmv5SMt8+eUiOBmrA
         0Klg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792938260; x=1793543060;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4O/RvzgiTmhk2/YkAfbJDc508W14Kdf1yTv/20bx6AA=;
        b=ZGnUMgpsPShB6hXFjmwIM0kqFIBwZpOnG/2sgkmgZz3LESN5MGxOLYoYs7FFMDWbX7
         J/igoSS/fdBoexXVE5hNZHh8GVzs/wGAobPpBtVLjsjLwH2Cp4E6+rUyQ/nLLUSDihdi
         uRhUvZgWz+j+MjUUbZIPMGAAKjlQ/EqhXy8QuY/FLuEizBIKqkEsWgo1d0U+oGvqWfMf
         Vsap+z2O/gcFoPpeNBVxodFkdvjW5xrDUbUB2yk233u/mNKP4A9sdbzJaK+t51S8hDOs
         Xtk+D9lpr6i6xsxmiiGVkucICb29E2lOfpzM+xc16tXFEyie78/TGjUyhrQiEXEORzP6
         5B2w==
X-Forwarded-Encrypted: i=1; AKwUvBwnr14NRphZHN6UrQ3TOE4DMzR8dMkpP+fWTR6EPwMcToIDbyv4yDh3YbZbQDuqj+leRAvTiqPTetZe@vger.kernel.org
X-Gm-Message-State: AFq9FYJ3y4jyrqSNTHekTraHLJt5s4kJWQENOZlRtbHENOk6OoLWWxWd
	74nk9Z2M+zNsuyYKJ0DPYosmXtsKA4beyIKhfET1xZwfrUGaS0zpFJWU
X-Gm-Gg: AYBFou03G6UejM2PAnvis2eVUZ2zlkBZPVHJ5T6Kq+Jvk89z5gPua0pSOHFNfAg8CJP
	iBYYSCoP/FKtl+nG35xonORdekdRJMIeXhWm1e9efxZN5qzidr1i12XsgTjEllR3DCnXrlkdwAv
	DEJs0qEVftj4/1QO2/5E9ZO8tOgpZ+XwjQxFlZGX+JzZOsQ4mNbBVadiGKGrdnZROXihEdazmVa
	5mjDunnk7O3zZFtqyaHT0Qo4MdJmnuUMHEqsJYu2inyh4ww0Yxt+SIv9+4LcvfHObRK9Xok8Y6x
	CGomHEa480Lq2rny1i9SFgi3ibJNYD/5Tea+ZnDxG7uwzHERkD1Sn/yhRVkoDXwIsmh69Kh6bXD
	kx587FqFekvTa59qn/+G9z2AG4y0ytAKvI8N0pcXjKXLKQEucL7ikXian+gWdLET0sJ2VGkn1KH
	YFaFA2V9Dj7WCnLrX0VZ39JNX9tLr/MsH83c8QiCBOTAxrIiFtFdvjJZQ6Xjy+FxCEJUtqKmmf+
	VF/q8fl0d99oRVBePGI78z2s6NjIbzrAuOVf4+EkZg/75TckpK87Hz0TLhp3vmZb+8pi5W5xqpf
	MChYfjhEbCTdKA==
X-Received: by 2002:a05:600c:3b2a:b0:4a2:148b:c890 with SMTP id 5b1f17b1804b1-4a35ac45770mr72563585e9.1.1792938260396;
        Sun, 25 Oct 2026 07:24:20 -0700 (PDT)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a0aa0bcsm157074265e9.4.2026.10.25.07.24.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 07:24:19 -0700 (PDT)
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
Subject: [PATCH v3 0/3] pinctrl: sunxi: number the IRQ banks from the first one that has IRQs
Date: Sun, 25 Oct 2026 14:24:09 +0000
Message-ID: <20261025142412.112216-1-pmazzini@gmail.com>
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


base-commit: 4f0dbdbdb3ad122e8bbfb1d722fd584bac7124db
-- 
2.52.0

