Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795810162;
	b=tEYIDVagq8In5qcc//OZGwodFQFmviIADukHEthjmfG14gIQylGaYv3ntAus4It/WmF+
	 NR2urRKzNKkL/PQjvMu7htf54e8sKsa2qqMyIpVtyFKR4zaXZTGjFrdI19FONwA8ZRWRe
	 5oVwtaQUd+eNnzhekg2Vkk+efd46abHIH/S4nwB66jdG1zwtEFv9fwqeYDoy8iSycdzH7
	 x7SoaKODay203oRVQIM+Vx+WchjpatDEr4fzjPtUMoqQWaffmFKmFHc4+XbyTpDoPd8aV
	 x2kS+Kivuyz6PatihHC30exsrJ6GWwgXoNie+uANvgrFA/g21xrjSL+yZc1o4T1VS9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795810162;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:To:Cc:X-Mailer;
	bh=Y38Q04n1Lg42IacHDv9k1WiLdqgHkNmu1tUwxnY3Jao=;
	b=Kpyj1doAR329NS/P9HlrSt/xH5bAT537c4uD2gD36DtD+DiVfdWK/CYXav9jsUK8EvCW
	 GDP5p7l00OvmId1MUe2Lk9dvucWGtdzaGTkiYO1gQFjkEQTpzxgzU/m5ZmDfIQhTh4kvp
	 t/gQ0VIEBLFJ3fArtbVbslfY5gh/n2XW0rVOtUX8DyEj8/Lp9dhQJIjwxvVRb0J6oCGQO
	 ReCOK8AIB5BCrrqP8TQTrAHxiJSo6DsdHU2O2VaaTP9lQhfqVSR6RYBMlm75lbIOrHRQy
	 ANptSL5ThqBWMZA9mBzQbF2H7wzz/bsTpL751ql3UFhOZXGUm9mBmutZUy7Vm9Z8fjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h9fPcADU;
	arc=none smtp.remote-ip=209.85.161.50
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3EB6606A332
	for <linux-gpio@vger.kernel.org>; Fri, 27 Nov 2026 20:09:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3EB6606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h9fPcADU
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-71b0d330acfso6173574eaf.1
        for <linux-gpio@vger.kernel.org>; Fri, 27 Nov 2026 12:09:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795810160; x=1796414960; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Y38Q04n1Lg42IacHDv9k1WiLdqgHkNmu1tUwxnY3Jao=;
        b=h9fPcADU4GZ5pW3JYwai9NK9vzuNpmzEjJhNICf2zBr12Z6HemYOwt1mXoMQ29Iz5O
         bwpdJ30b0dqIEKoLIM8u85sqZBZtUWOOw/ydYRNFxK6jRWWCjz4l9MEZ7B4h4QAMJkxV
         NmjUOppSxa9bnvLyxvJaT+40EKwsfJV9Wr0/E1ZfMlJKiTeQQ8ST3vh9/S/2XBMR0LUu
         g12dpB4+4gv2uPRH6BPsEhmdYr+pZyieZOAb4j1KXo+4w/GhRRj5ouL6QS+WKD8SuamO
         yNva87j4YMOMe8lU07nUKiUQAmxS7YnY+mhFIe67TpRlGp9Z3L2awVYvbMHvS0X27ncN
         qhkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795810160; x=1796414960;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Y38Q04n1Lg42IacHDv9k1WiLdqgHkNmu1tUwxnY3Jao=;
        b=kDWF0BYABVt1oHgB57EWzb5805+WX61whMuP1IfPHhHl5lN6mPA70lIhTlhda7xFlc
         OMqgN9B1rD8Ece/KW4dKYL+WAWVVOG6Z0dR54FjSCgj0yi4XUv7q04Tr7LjDrNeEC3Qq
         zNrFLIq9E5bRIshaW31CCdBfm6z2NII98PTjdhHjp7jdPIof2sOQdzqUCn0CbdQYwqSM
         JOU/rUWDmC0AIU6WGT6uRJRgv4dGBmk9i7m9birP5CwhLdZvUmZzt5muDRJssriwH5xJ
         B+QsIEQ3AFgokZpe9wGM5ZFp9b0lkNGg8dCnRx+btLmuY+RBTFNf5G3NLfUzPhaqhub+
         w9Mg==
X-Forwarded-Encrypted: i=1; AL+hErE/koGozUjsNoHFPqRZfa2qfTQ/LkZ6IpYlQbk8fbAKiHx6nQKzeHT6R2T9PSrx02kgXgoYnVsr2JvW@vger.kernel.org
X-Gm-Message-State: APuU4Z8lqigzA3kOWWoIx4tWlUexhg8CQwZClnlUtnVnVjdgcvbf1H5i
	VyLjnTBM8S68blDy4rWIDG+n49OB5R/M77m+/PT2jSV471qIJ9nB67K7
X-Gm-Gg: AZFdTZclZdYknyrj7sbqgCLQTas9c4+ug4dH3Ndkv9epg7acO6hG5uwAzbE5UU5AHM2
	aubDaRYm9/T0S72gXfrkZePGVzjk9lztYk5wo3SLgUhFryrrioGXPmxyZ+tjo4CVvCICeh5j5XW
	8WQ8wMP2ms0ENNG5Vr20RwRa84u1mrJ2BDUzykX7m2zQOWaE8ILGMofqYAOi2Z2NaTISTV9ocBq
	5uND7cT3bVYkUyoudpUcJB1xBpE481kjEE6wk0O51TAxER8L8RA7TLY/Y6vnsSWHAI20I3+k9Wy
	XejxZh2aL+Nx9Rn8+0AKP/ZS2wgW6x5jCZauixoD8sD+JCJDYY0OroCvn76sKubqb9ewDI0EVEd
	GqyKvGbVX62XSkf6YJsC/dDV8vrN+yYKzSYOQk1ZTO1+YGRifJxih+ewlZNoAiKsxWmrAabnJk7
	z8OUvDEXPgEyJaFxI+RxLCwn2v/WXlCchVRJqj6X8m9rPmntL8KrcKg1I1bkjqs2iTvNlW+NbGd
	h54ic1cq3t3lAz7JbiRAbs0ev23NFLd7Z9QuYoUwiXb/0az33J3edNcn1QxS8720kgtBZLA6+Pm
	ufNfEYiNnIa1SgJ8679ilntagFdp+8+mq5co+Vypr0dCtw3zmTw=
X-Received: by 2002:a05:6820:80e:b0:71a:e27e:cfc5 with SMTP id 006d021491bc7-71b394f3c04mr14876291eaf.18.1795810160517;
        Fri, 27 Nov 2026 12:09:20 -0800 (PST)
Received: from [127.0.1.1] ([150.117.174.129])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b8590ba0fsm4834662eaf.2.2026.11.27.12.09.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 12:09:19 -0800 (PST)
From: Gary Wang <is0124@gmail.com>
Subject: [PATCH v4 0/5] upboard pinctrl support for device id INTC1055 &
 INTC1057 & INTC105E
Date: Sat, 28 Nov 2026 04:08:29 +0800
Message-Id: <20261128-upboard-pinctrl-add-intc1057-intc105e-support-v4-0-029071f417d5@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAD7jCWsC/5XNzYrCMBSG4VuRrD1DcvLT1JX3MbhI86MBbUJSy
 4j03icKQnHX3fnO4nmfpPoSfSWH3ZMUP8ca09iG2O+IvZjx7CG6tglSVIyhgHsekikOchztVK5
 gnIM4TpZR2X0OD/WecyoTeN0NgnrGlRSkmbn4EP/evd9T25dYp1Qe7/zMXt9PiW8szQwQAnJE0
 zOllTuebyZef2y6kVdpxrUut+oIFKymXR90kKoP3zpf62qrzpuumePS9oNBodb6siz/yIAi0KY
 BAAA=
To: Andy Shevchenko <andy@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Thomas Richard <thomas.richard@bootlin.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Daniele Cleri <danielecleri@aaeon.eu>, 
 JunYingLai <junyinglai@aaeon.com.tw>, Louis Chen <louischen@aaeon.com.tw>, 
 BillyChou <BillyChou@aaeon.com.tw>, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Gary Wang <is0124@gmail.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.13.0

Add support for "UP Xtreme ARL","UP Xtreme i14","UP Squared Pro 7000",
"UP Squared i12","UP 7000" and missing groups and functions data for 
INTC1055 & INTC1057 & INTC105E.

Fix pinmux-select set CPLD GPIO OUT not function mode for I2C pins
on the AANT0F04.

There are no compile-time dependencies for each file, all pin groups 
functions data will forward to set default when pinctrl upboard probe.
It shows an error when run-time dependencies are not mapping to right
groups and functions.

The pinctrl-upboard is provide additional driving power and pin mux 
function through native SOC pins->FPGA/CPLD->hat pins for flexible board
level applications. it's probe from ACPI device id AANT0F01 & AANT0F04.

Signed-off-by: Gary Wang <is0124@gmail.com>
---
Changes in v4:
- Add an index for ish_uart.
- Update the fix patch using a better approach.
- Link to v3: https://lore.kernel.org/r/20261126-upboard-pinctrl-add-intc1057-intc105e-support-v3-0-81d35c9ba246@gmail.com

Changes in v3:
- Update detailed description in the cover letter.
- Update fixes patch detailed commit messgae.
- Correct the I2C group mapping names for the UP Squared Pro 7000.
- Link to v2: https://lore.kernel.org/r/20261125-upboard-pinctrl-add-intc1057-intc105e-support-v2-0-c8079f8f569f@gmail.com

Changes in v2:
- Add missing SoB.
- Fix CPLD I2C pinmux-select by good method and update commit message.
- Link to v1: https://lore.kernel.org/r/20261123-upboard-pinctrl-add-intc1057-intc105e-support-v1-2-f2322a91686d@gmail.com

---
Gary Wang (5):
      pinctrl: tigerlake: add ish_uart0 groups and functions for INTC1055
      pinctrl: alderlake: add some groups and functions for INTC1057
      pinctrl: meteorlake: add some groups and functions for INTC105E
      pinctrl: upboard: fix I2C pinmux-select set CPLD GPIO OUT not function mode
      pinctrl: upboard: add device id INTC1055 & INTC1057 & INTC105E based UP boards support

 drivers/pinctrl/intel/pinctrl-alderlake.c  |  40 +++++++++++
 drivers/pinctrl/intel/pinctrl-meteorlake.c |  32 +++++++++
 drivers/pinctrl/intel/pinctrl-tigerlake.c  |   4 ++
 drivers/pinctrl/pinctrl-upboard.c          | 109 ++++++++++++++++++++++++++---
 4 files changed, 177 insertions(+), 8 deletions(-)
---
base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
change-id: 20261124-upboard-pinctrl-add-intc1057-intc105e-support-e87b40e13654

Best regards,
-- 
Gary Wang <is0124@gmail.com>

