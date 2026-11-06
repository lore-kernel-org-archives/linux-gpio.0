Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793932157;
	b=kGnE0B8GtWxUnlSa+HYp3rALIkV/OZwyyBLvRJj+ru2QsqDYgHlM3AC5F3miXgU/PJeb
	 +hfx+WNFxR6j/olHE3ksJcFJQ1jCVHMknc4fWDGqh1EqKjs3xVWIIocwCZ6c4bpUtwiOM
	 NXSPTS12+gYzh20W5gaZYuC7AHtyO10/dobTKUVsMAsP759dH5ue6l/N+h5yF/1sFJoNK
	 hBmZA6bBMaeH+8+4KljThWohWAWLT2OKLoDfzrZIoEO5liVzA8g7/IQX4iarSK+VvEx7A
	 NZ4dKrtCrTsL5XPdjfoCMBgLjri73Ii3hnhKET0S0EqfIGTA9WGK6sIrBFp/egy26KA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793932157;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=mVFhMdPaOpZaZhoFk4x/27qwSHFs/IDKrnB1S7WQ5Wo=;
	b=nezKTF+7aAZOAb/xE4xH5bbYHo1/2WRLoRCLIaPW6XfaccL21XzC8K/YKjoNg2pusQYx
	 +9nI/WWmCB/DgwQSPBFrRitP1xPwpGJXqeE+CDIw7b+mMdWvToJSZmo1/Yk2WI+w2+w5l
	 lsTL/1mXjTPcEYzSxSh8e8o7Mrt5o9GQ6oCx0UmGD9KeaFF8L3mGUXIksWMJ/cgW+A5ln
	 pXyyxFk7MyoyArroCWjvT+EecKL53Y3JwU5/sjSDBOZHQ2+AKgHzdWNnaC5jIbduuDDLN
	 7PD7OoYz1exPaA8uLXlC9IAa8ctuxtFDV82Ppah65y91jcesTbHbaSUE3/NLXmO07eQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=acioOQyM;
	arc=none smtp.remote-ip=74.125.82.47
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33363606A326
	for <linux-gpio@vger.kernel.org>; Fri,  6 Nov 2026 02:29:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33363606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=acioOQyM
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-1adbf62dd31so312119c88.0
        for <linux-gpio@vger.kernel.org>; Thu, 05 Nov 2026 18:29:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793932156; x=1794536956; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mVFhMdPaOpZaZhoFk4x/27qwSHFs/IDKrnB1S7WQ5Wo=;
        b=acioOQyMDt8SBMOpA0nkNSSYxzHeJ1SdNn7aOqwlCLt8jEh/Rr55qdnJ5gy4qlsFSn
         1kqKlOx56Oqhfh2fGx2toAhqEslbHh40vvGfTWVaE515lfJCAYYokbNbcDFuh1rKFbG9
         +TB8LIWNHHH+unU+jIoMEXnduWIcnzfetaSvXOYxyHqODyuuz6c0X7juSHOC3s9qDJw9
         jTMjPtxx/hBpUgWUcKHvTptQJhcVyJWFR5ptrxEFf8F3vHwidRZseIWSGjBNJ7F7FcOv
         fLWvk+KGnQah0NeguiEKBKI788nV6SlyQCMPnAltasp91ZrVPzzOlOxWOKaFyYZl61Vq
         8vDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793932156; x=1794536956;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mVFhMdPaOpZaZhoFk4x/27qwSHFs/IDKrnB1S7WQ5Wo=;
        b=QBcL9/z52VkuRNUs97DD16RbUhZfeuNwtVi50Koy9Rgzz4c03gnXpznA3G87QHfGjk
         MvqzWpIuNXUPWZNw+jFeH3KG+EbQp4HltvklgcoU33JPnmsyD+OI24SOJU/zZLrEuHug
         oRRfzKTa/1CahslbHPH3yrBCCtEYRdkhJIZmecTRRTd/oC8nKIndhPEoovgnqtaueE+C
         dzVmx/9gZ9IwC8kiPm/GTeGGFbcCijSNRMASvz8prW6vvLhzdd5A7e+OPSPtqzzVqM/1
         vGV4Uc0tFz0oG4UBJkgPGSs6tc1V7XXLUfbTlw/teY1Yi1aH+154iOOIyElur0Aj4ZPX
         wlTA==
X-Forwarded-Encrypted: i=1; AKwUvBys6ecEv2pYqA8dsJzpg3lHz0PB7VZtTC3W+jnAtduzJ196a4ln0kgRQkQykOdfbKY84UIX4Wq55/UW@vger.kernel.org
X-Gm-Message-State: APuU4Z/Cyp2kG0Og9FbwCP62k9RhmWZl5V3/cscNKqMqB2DtjUkfKRmz
	uin8hqZdpxOmiXJxEunNlLT4UKVhi5fCysq3e12rRCL+u72RiTFG5Bde
X-Gm-Gg: AYBFou07kNS+rACZyjP2Hs8dhz8b6jzGv199TqNWjLmsgIAH8lcps4bj4/GhVw8CmAQ
	MUzSFdVVDd2uOWeXmaWqEajS4XmUEYg2eXRI0/h3E7Cu1yrYmxPharhD/mjKjHh1Oa27dhTDYYf
	Mfc4eQc3UKOd6RwPEFEou9aY/Ayqbveu+jBE3jrYvyWVwCL5u44j+/cYI6UTZ1YMRsZLSeYt0k1
	6J1/zI0B4oueh6KgKqGmuT2KjQHW+0pKK2Kxoe4RiguiXBcSpUgDlRBWvsTqxNzZUES2P8fsS7L
	7HsPnpkKRetjB/pdwLWNWQYuVlKAJYJnc8w0+cTAHEHn5xv2Y6oA4c49gbuX+wygpI2+LqxG5ml
	aAi62CjwCvoOgvk9VxQwEHC/ZDD26vQsjbMApILBHEQp2yXfoAgQEKVmqfFSXvJkiyms1NcvMwN
	yM6LHG+9p9w1dWpygbdAWKS4+LZqnfhKAAD3YbgsEDdGRBMija/uS3Zttj4kWwmcJZnoGdxIhAz
	4Ngtc6xNWlgWjO+LScYHsbhhgl5y/nt9uVRsaz249DiNIAnnVmzpARI5+nscYRQE4+rJq83jzMJ
	C+9pBrYOQcAOn2LE0C27Vk+bH6CZcHNBXP6536xHql1TmQ==
X-Received: by 2002:a05:7300:f58b:b0:368:7c9d:1577 with SMTP id 5a478bee46e88-36f75e295e2mr1519316eec.20.1793932155955;
        Thu, 05 Nov 2026 18:29:15 -0800 (PST)
Received: from debian.prasanth ([103.183.205.43])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa8e3a47esm1700358eec.6.2026.11.05.18.29.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 18:29:15 -0800 (PST)
From: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
To: linusw@kernel.org
Cc: andrew@codeconstruct.com.au,
	joel@jms.id.au,
	ryan_chen@aspeedtech.com,
	billy_tsai@aspeedtech.com,
	brgl@kernel.org,
	tan.siewert@9elements.com,
	linux-aspeed@lists.ozlabs.org,
	linux-gpio@vger.kernel.org,
	openbmc@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
Subject: [PATCH v4 0/2] Aspeed GPIOP handover with managed controller lifetime
Date: Fri,  6 Nov 2026 07:59:05 +0530
Message-ID: <20261106022907.10735-1-prasanth.padarthi10@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261105152348.8567-1-prasanth.padarthi10@gmail.com>
References: <20261105152348.8567-1-prasanth.padarthi10@gmail.com>
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

This series continues the AST2600 global-to-local GPIOP passthrough
handover work, rebased on v7.4-rc1. It adds a shared pinctrl lifetime
fix before the G6 handover change.

The registration lifetime issue was identified by automated review:
the G6 callback data is devm-allocated, while the shared helper used
unmanaged pinctrl registration. Patch 1 switches registration to
devm_pinctrl_register(), ensuring unregister runs before earlier
devres allocations are freed. Patch 2 retains the v3 handover logic.

Changes since v3:
- Add managed registration as a separate prerequisite patch.
- Keep the handover implementation unchanged.
- Add KASAN lifecycle testing in QEMU and on B650D4U hardware.
- Update validation statements to distinguish lifecycle and power tests.

Validation:
- Shared helper and G4/G5/G6 objects compile-tested with W=1 on ARM.
- G7 SOC0 object compile-tested using ARM COMPILE_TEST; this was not
  an ARM64 build or G7 runtime test.
- Generic KASAN boot and one unbind/rebind cycle passed in AST2600
  QEMU and on physical B650D4U hardware. Controller entries disappeared
  on unbind and returned on rebind; a subsequent debugfs pins read
  succeeded. No KASAN reports were observed in the captured tests.
- The final v4 source tree matches the tested v3 tree plus the
  managed-registration change; only commit order and messages differ.
- Earlier remote power-on/off and physical-button power-on testing
  used an OpenBMC 6.18.24-based kernel, not this v7.4-rc1 test kernel.

The unfixed runtime comparison has not been performed. Concurrent
readers, probe-failure injection, mixed-pair forwarding, protected
writes and SCU510[28] hardware handling remain unvalidated. Existing
questions about probe-time normalization policy and concurrent SCU
writers also remain open. Electrical measurements are outside the
scope of this lifecycle test.

Supplementary procedure, exact source/config and logs:
https://github.com/prasanthp20/asrock-b650d4u-bmc-support/tree/64eaccfde9ac4ec35646c0b7a8663486775b5d3b/docs/experiments/03-pinctrl-lifecycle-kasan

Previous version:
https://lore.kernel.org/r/20261105152348.8567-1-prasanth.padarthi10@gmail.com

Please review the shared lifetime fix and the GPIOP handover policy.


Prasanth Kumar Padarthi (2):
  pinctrl: aspeed: Use managed pinctrl registration
  pinctrl: aspeed: Hand over global GPIOP passthrough to local mux
    controls

 drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c | 145 ++++++++++++++++++++-
 drivers/pinctrl/aspeed/pinctrl-aspeed.c    |   3 +-
 2 files changed, 143 insertions(+), 5 deletions(-)


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.47.3

