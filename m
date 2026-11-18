Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795018678;
	b=3v956PHLVYtigdH6waO6gpPOBVd5KH786pxvc/F7PZBb0StCIj/AwnVU8/ijsM6+V2yw
	 Og1WYC/T2Yu5Ur0+441F0aIrzToYiOllEoqF0Yzfa8ybcg+DPDzl/y5iyvfjUjeTSiwpi
	 nY+SHls3e4KG3aT4JVEp9UuK17BgrWXgi+6HT4x4PKwxlh9uOe7yhAjEN/czDcuZ2NDhG
	 NzY9rix854axtWpO9cE+vbARsY7smD///3Qz+Gngm6WaupnBre/C5yYe34HYa4RAFfO+b
	 ad6QVyfdmj00Cs4BEaLg30pKYpuQ98JGNFliFwnugNzDksPixhU1ydHKhsm6Vyqod6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795018678;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Subject:Date:
	 Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=ta3st23k7aJtViHx8b5Y0gwAd71zJE3W0PZkE87cjbA=;
	b=W4Q7o+0LRpdm6SNqJRq4fL1qCBfMFBdr3uPP0qNcZ49SxiYreqE0ZBdSNgs02v2GPJCw
	 PVRHgkNdGKROdR+k40++l9toK5l3qZ2gaeyVH5xnkwqHQOtnr6ODyZUOFsd2+AjAOc5Kn
	 BG0S8xh3LdhfkCJ8KcvmjpCEYb1MQFrxSm/KN0HiL71MB23dv1DaF46jCNpiXYn0OIXCu
	 WH+crOgRqoo1xY0WvQoDwQT1YIxqBbJp30rKYz/U6KqxnuELsXQh8mRPZDnqfCPGC+Mgy
	 h0dYpe0N3s7NBZf5DgUgNO6dU4HSOUhD8AjraaH35CHPaO6pzzHRYa3+mIjcJb2xBbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xc6Xxqmy;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B48F606A32C
	for <linux-gpio@vger.kernel.org>; Wed, 18 Nov 2026 16:17:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B48F606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xc6Xxqmy
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-4a32576da88so639473f8f.3
        for <linux-gpio@vger.kernel.org>; Wed, 18 Nov 2026 08:17:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795018677; x=1795623477; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ta3st23k7aJtViHx8b5Y0gwAd71zJE3W0PZkE87cjbA=;
        b=xc6XxqmyzRj7lQBrNXY5fekJIw0z3FkGPGRktiNOzf5zUKTVp6yeg/YY8ZOXrUVjhu
         Ll5mMFWWkIV3ZzAXWggdOiVJQK6UxbCQobIv14PllnAqt+8uPjZvuE/ZQkWgB070Mum3
         UErfPdO2l80nUj+spYZORvtk2dYswb5fwR4YQwfZMtMxJzrASV9Ums7hlAoDxGiP5POO
         5efc2QK/CbafNHSwkOA47uHHJ+TeYlRVKI9S8opug/tym5mDQ6pLfH4uguCWARHyG8Cb
         qiUGE5t+qdf2fd5uBlSqE5ocA7YMKDwSmE9UffnoUr5Z46Mv9S4PAfu/B8w6cGZFeoyu
         uXpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795018677; x=1795623477;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ta3st23k7aJtViHx8b5Y0gwAd71zJE3W0PZkE87cjbA=;
        b=KDSF3No/FS95ugZ4jRPDEMo+thJ/pUzDKk8nw6Jjkuu3c4LbhyB8CDLE+mVu64meEv
         8KSjTC6eTHRMit6xALX7Hs8D1+vByOaV4lDK3YxJnfU+smExmlejjSm+Ib1U9ytM3Hbq
         g482XlIuTeP7RvF+L74NSoNikbvAhbCIZ2B5RK026MwvyhzNYbqKDBC/8UZABiIlk23V
         DzesT2Hc5f7fVTYxCFc3b0fRMgr4SUfpOqL8aAGArfOyPvpXNmPJw+VaGjCft85XasDe
         qAHic0OtBbCSsW4MnEnGHKLVlUSO2/In35+1IcMkD4qRaFQOzAUQ2Odyd7tBlbB3Oatf
         JCDA==
X-Gm-Message-State: APuU4Z9RSo/9GiwcObG0VVdKNkXqnVjjMTROeFIfn9kqON35HT7+FOLa
	DMQvnCuFiqpuPTFWsrix+xVZL0uWSbZoBqOPHbewJ147YQPJrxn/InqeZRrsL+ftlCpPNiBPoUw
	=
X-Gm-Gg: AZFdTZdTFTsQYNYcf7T+z8IIMOZMtsmmSz9DZFZe4JrmXBKbkMU3T44xZbLfJqVr016
	WC4bFOTvz3qLNMG6PDX/lcH767BRY+cjm4q2WNcOPRN1obZeCVlOx0yJkv/93QOx5e2cVO0NaHF
	wxz8NXhAmQE1dsLHvySeF1ApJyMTfxjvJwH24bKi/wdlc5lj9b3az0EMLaxslShecDpnpVqiPso
	ZMwQLzJCdo2edZMwAm2Ru/OzmVzb9IuWAN6dNvmuK4RCBHSY/SVEQkSmS4COHBPQ7LqU/r6q18r
	VL/hNDbXeYbC7hyzuuMKS+uVzHBW0UJwD7d2ZVRwKgaQGLRk2Bx8QxwbdzMiKrRiT+DxE4h2Bzm
	ZQ+YMpSaRRRN33CxCUfOVpEAXXJfaK9ZDK/2CY5qQkphCYaGR5BI3SuJOPuyDRNP3CjrVRYbply
	wqlp8+uQ6T8m94sWTVcLOjKnvOe9KusDzOWMAho2IH9V/7kz7Rxv6ayqDIneTa8akhvSXisfD3f
	0dVrOUy+EGKLpYw0kJmsruiUbZgutYa6FDRAwp2WlH5hYvNzWqEmHfoED3MNE2VqrKbMxr9SD/x
	HGTeITF9iVNhlnOgIwNz2EpHKmEzbt/LonaJIwuS/uFZFhaPlyORacAxpRZs3iG+EdevNFOxfEj
	inwL0tov5c9mesFcUGHmyvEn37PbglYskXA==
X-Received: by 2002:a05:6000:3104:b0:4a7:557:fcc with SMTP id ffacd0b85a97d-4a705665645mr5379933f8f.53.1795018676598;
        Wed, 18 Nov 2026 08:17:56 -0800 (PST)
Received: from [10.161.246.232] (host-164-37-100-34.net.onlyservers.com. [164.37.100.34])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a65100bf42sm5329699f8f.1.2026.11.18.08.17.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 08:17:56 -0800 (PST)
From: Alexander Letuchiy <asalde.le1@gmail.com>
Subject: [PATCH v2 0/2] pinctrl: mediatek: Add MT6895 support
Date: Wed, 18 Nov 2026 19:17:35 +0300
Message-Id: <20261118-pinctrl-mt6895-v2-0-0728c4eddcac@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WNQQ6DIBQFr2L+ujSAVKmr3qNxgRT1NwoGqGlju
 HvFrrucZN68DYLxaAI0xQberBjQ2R34qQA9KjsYgo+dgVNeMUYlWdDq6Ccyx0peL0QKyTmndS+
 Uhn20eNPj+wje2x+HV/c0OuZKNkYM0fnP8biy7P2Nr4xQ0tdUaCHKrmTqNswKp7N2M7QppS+y8
 HwtvgAAAA==
X-Change-ID: 20261108-pinctrl-mt6895-84822207f4ac
To: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sean Wang <sean.wang@kernel.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 Alexander Letuchiy <asalde.le1@gmail.com>
X-Mailer: b4 0.15.2

This series adds the pin controller of the MediaTek Dimensity 8000/8100
(MT6895) SoC: the binding and a driver on top of the common Paris code.

The pinmux macro header and the pio node are part of v2
of the MT6895 / Xiaomi Poco X4 GT initial support series [1].

The tables come from the MediaTek driver in the Xiaomi kernel source
release [2]. They were checked field by field against that driver and
against register dumps from the device running the vendor kernel.

Tested on a Xiaomi Poco X4 GT (xaga) on top of next-20261117: pinmux,
pin configuration, GPIO and EINT.

[1] https://patch.msgid.link/20261113-initial-mt6895-v2-0-4ab0aa9fa391@gmail.com
[2] https://github.com/MiCode/Xiaomi_Kernel_OpenSource/tree/56ec519f6
    (branch xaga-s-oss)

Assisted-by: Claude:claude-opus-5-5

---
Changes in v2:
- pinctrl-mt6895: pad mt6895_pull_type[] with entries for the virtual
  EINT pins 227-246 to avoid an out-of-bounds read from
  mtk_pinconf_bias_get_combo() (e.g. via debugfs pinconf-pins)
  (Sashiko)
- Rebased on next-20261117
- Link to v1: https://patch.msgid.link/20261108-pinctrl-mt6895-v1-0-f704c443b31a@gmail.com

---
Alexander Letuchiy (2):
      dt-bindings: pinctrl: mediatek: Document MT6895 pin controller
      pinctrl: mediatek: Add support for MT6895 pinctrl

 .../bindings/pinctrl/mediatek,mt6895-pinctrl.yaml  |  228 ++
 drivers/pinctrl/mediatek/Kconfig                   |   10 +
 drivers/pinctrl/mediatek/Makefile                  |    1 +
 drivers/pinctrl/mediatek/pinctrl-mt6895.c          | 1638 ++++++++++++
 drivers/pinctrl/mediatek/pinctrl-mtk-mt6895.h      | 2717 ++++++++++++++++++++
 5 files changed, 4594 insertions(+)
---
base-commit: 7cfbf79c66c63e807ea452abf0546e6f6d6833a6
change-id: 20261108-pinctrl-mt6895-84822207f4ac

Best regards,
--  
Alexander Letuchiy <asalde.le1@gmail.com>

