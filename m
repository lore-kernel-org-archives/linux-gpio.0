Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794162499;
	b=Gir9tKSUwikIJHzPZPRVOLwToJIeUrnTW0s4bpOjxboVp5CC6cg3hUG59WSpNp5haM9E
	 OIZtxo7XIqc1X3d4rfrW4JptilNfaSuD8NFgUA1/08AASt6j/HxxJ1Yg4oWYAKe6DfXkB
	 ix32U5A6w30fwQTlzux/JaqgCyQHNzlxP55NJwFSvy717+d/SXshfPrWsJKvKSvgMj2jq
	 J53I+kjkzqsykQeltNWWMILhYL7K5QExAwF0Qk3yCrF91ftHa7KmfUGSSHKED7LGR4xYt
	 ETxEWH7C6MM49Pu2bBhGoR3OhQ205LPu78zGXm3SbRqok/ONW6BTrP+I9K5jTzawR4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794162499;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Subject:Date:
	 Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=7LOc5o/iR4ccdtew0ZugkEGQ7ajVcmy8+3GKA8lPx8c=;
	b=ynBGwquEtYTvAgzsd92Niwp/hkDo8w4M5dRwLsSDHS7rJRUQ12zMazlhMOiJu7fzt/Bo
	 NCbVG8wPwAF46nqR4ggQOIEChoT73Xdkx20PYj0iZNKCxI+SUUfVohvJ4NoH3BJ0+pKv8
	 LkeFJyGvnDMdKG5SnjfgjVvZp3oAB3xoytd1lnt8IhbKWMIFGI7KBlXZLyoW0/5hOCPgU
	 aSXQKT9EFGnMUFTS0+X1duTyryaICABwY+r8JX8zdr1DKBmd/VSGZmjC2sjGimvw43sWz
	 KJ/F53POBPA1rweBGZ/N70jl7VsFUgTymJp0GfwZR3mLVM13bnOpCd0x52hJddA+Oxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ggr9Rhlc;
	arc=none smtp.remote-ip=209.85.218.47
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DC56606A321
	for <linux-gpio@vger.kernel.org>; Sun,  8 Nov 2026 18:28:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5DC56606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ggr9Rhlc
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c4d21051042so30512766b.0
        for <linux-gpio@vger.kernel.org>; Sun, 08 Nov 2026 10:28:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794162497; x=1794767297; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=7LOc5o/iR4ccdtew0ZugkEGQ7ajVcmy8+3GKA8lPx8c=;
        b=ggr9RhlcaiP+4+478edoxac3okADJCWVpY1iF+8Xi5P9iILzqZDSOzhI4/j1dUXf7A
         Jctj2AVSxth9HClE/DggW0jSecx7Yz8ZmTM7KUpMMUDDpmC0275rfQIaLJ5lRuofLCLF
         H4UhKM4GoX5hCSpZCF6jUg4XEgOaVUC3y5Psfxhq2WC7RYcqp/Q5kNi0JjfJOGxKxdjC
         MtGrkJexY+vEo91JqlQFNy2gr2eaUSS0c8dBb6rCSPXlvSXzMyH2Zk3+Ww5oZQaocrok
         zRSGfzgSJr0F4bHYIf+leTAumLKRgGr9JkI7dRARp3w5ATvZKwSx179h+Mtn8q7+d07K
         seyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794162497; x=1794767297;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7LOc5o/iR4ccdtew0ZugkEGQ7ajVcmy8+3GKA8lPx8c=;
        b=ggv8r712NWfI13yxUZqYpN87/olcxNaTYoQ/YrLaRjEzRTeG8SPFGI+5TBRL6Ww5aI
         ClXgsL89r2C6V2Fod5euYj4UqYQzXjOnzwz/+J9Mfre/JPGC9V0m01hOn0vYD8On1Tii
         ppViOftjYSeCZ1mFxGYgC/nK0kXNpBXmDX4UKgJWqpuZXLZBExECk7akj9HLohqM6qB/
         IEwgL+GoSWnRMPbYY2emA7nFZEdgEBXxvm9aVkl4blMT6RVTfnMO5WOC5zqMgAbSVy6i
         EZSEvlf8H7iZJrBEOhrUoeD88vUtp55A8JkVzuh91LeSUZIJ76sqyFLtIx6xWr9RZKd5
         1iqg==
X-Gm-Message-State: APuU4Z9p87LkR+8k2PQj1wMB3S7yCk+R/gjfTiSsU2mVzIagfMuzBT2x
	9VxXoDcvL8nog5XuwxsZlk9vWlqHz+9vgfyuB15xYkg9r0qdRheeWYPM
X-Gm-Gg: AYBFou2LphM5YAn6wExxerTTH/Fsc2EhgHR25IYTFnTXPRst55ZZ38u6TshX3fZ0I6A
	TNBZIKJbILQQQKeucVFVOQCMgEZhCDevW8cBfF8trsKGLE8CBXpLUTt3+w3vaTzw5Pu3UMkjH/y
	etwOkvI1oISZ3kKsBQA2M9iR2b7MjCy6swtkFFMVxjF5zemo2KM8nASVH5k4hpuU+M72VGGeKNL
	rlty200gbKWFrGxG6OGKS++QTEWb+8+Dt4LTQVs8BGdpIv9mg2jNULacIdJZADXUqLK0mNfPw5h
	O38naK7KOKIwQYDzxP9ghtyUP3661NE9oNv8vOE8Zvv/macU5kIrskWH356qrLXHaM1YdBCvm/R
	VlUkw471DXZ50dZHg/JCaJoIVxvTG/38F3r6uyzIyHJtnyOiVKk9CgqR9LvVT15F4ilvkD7uhbR
	Tn6quy5F6F3VGexlvZU2t5k1z1ArsNkxikqW7CeQ9to42Cx9Lc6zzGz+RWZ8L8OrRKY8bYLeJxt
	WcNplxc1nCgTfOiJuXG8uL/2/f8tjJ7yyiBPDXgpV32U3s/JhFrEnGB1WrL1mOrC7IvqwWcpW9R
	cU861AKPGop3VtT+ikdkL9pvM8ZFJKhPrkYEfAS7xPLiqcUqywJS+14CmAJDwTCL
X-Received: by 2002:a17:906:9f90:b0:c3e:e726:9548 with SMTP id a640c23a62f3a-c4d6d35bdb4mr141902266b.14.1794162496378;
        Sun, 08 Nov 2026 10:28:16 -0800 (PST)
Received: from [192.168.1.100] ([163.245.50.16])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d6a47515dsm75254366b.44.2026.11.08.10.28.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 10:28:15 -0800 (PST)
From: Alexander Letuchiy <asalde.le1@gmail.com>
Subject: [PATCH 0/2] pinctrl: mediatek: Add MT6895 support
Date: Sun, 08 Nov 2026 21:27:09 +0300
Message-Id: <20261108-pinctrl-mt6895-v1-0-f704c443b31a@gmail.com>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ6DIBBA0auYWUsCE6XoVYwLpUM7RtEANk2Md
 y/V5Vv8f0CkwBShLQ4I9OHIq89QZQH2PfgXCX5mA0rUSkkjNvY2hVksSZumFqYyiCgfrhos5Gg
 L5Ph7Dbv+dtzHiWz6X+A8fw6MQLJyAAAA
X-Change-ID: 20261108-pinctrl-mt6895-84822207f4ac
To: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Alexander Letuchiy <asalde.le1@gmail.com>, Sean Wang <sean.wang@kernel.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
X-Mailer: b4 0.15.2

This series adds the pin controller of the MediaTek Dimensity 8000/8100
(MT6895) SoC: the binding and a driver on top of the common Paris code.

The pinmux macro header and the pio node will be sent with the next
version of the MT6895 / Xiaomi Poco X4 GT initial support series.

The tables come from the MediaTek driver in the Xiaomi kernel source
release [1]. They were checked field by field against that driver and
against register dumps from the device running the vendor kernel.

Tested on a Xiaomi Poco X4 GT (xaga) on top of next-20261102: pinmux,
pin configuration, GPIO and EINT.

[1] https://github.com/MiCode/Xiaomi_Kernel_OpenSource/tree/56ec519f6
    (branch xaga-s-oss)

Assisted-by: Claude:claude-opus-5-5
---
Alexander Letuchiy (2):
      dt-bindings: pinctrl: mediatek: Document MT6895 pin controller
      pinctrl: mediatek: Add support for MT6895 pinctrl

 .../bindings/pinctrl/mediatek,mt6895-pinctrl.yaml  |  228 ++
 drivers/pinctrl/mediatek/Kconfig                   |   10 +
 drivers/pinctrl/mediatek/Makefile                  |    1 +
 drivers/pinctrl/mediatek/pinctrl-mt6895.c          | 1617 ++++++++++++
 drivers/pinctrl/mediatek/pinctrl-mtk-mt6895.h      | 2717 ++++++++++++++++++++
 5 files changed, 4573 insertions(+)
---
base-commit: 2637bdec0535a2044cd830eba9a79363651d9043
change-id: 20261108-pinctrl-mt6895-84822207f4ac

Best regards,
--  
Alexander Letuchiy <asalde.le1@gmail.com>

