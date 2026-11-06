Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793932126;
	b=laXQOeSW6Wh04QkDAiMpEpODj3+dHL2siX3AJCwS5E2IkQJ0Ti+LbPpVRh8Ch0CKv81L
	 ti5manBLURwhSztWbM6xez5XnTIbPWxt7q1USvMuPKPWk4kJs7BYp8to0DfDpxhTlZyb1
	 /ICJ7RtldrCToed5bVW5LrtnVkJXm95++eHf9gPTQprteet3CECWRK5VXNwA6NW9bcvWM
	 Qjks+hw/JJE4iNarIfjKysN4i8yuakwDty7boQlqNX+wOc2G1Y99EYNfv0tV3Z8B6MTV7
	 NnJ3FpBSv2mbCViwM14AUAXnbA7v14u2Bf/N0Q2oT8BE+DHezTGQ07OfUW7oNsQip9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793932126;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=mVFhMdPaOpZaZhoFk4x/27qwSHFs/IDKrnB1S7WQ5Wo=;
	b=PydzcHXtlcLuZA8M5cDgO6DedMvxYxx59rz68G8vA6k6FZ48/VKe00grvVWetqA5a1Bm
	 4ZVcX2PbiJ6BokS8LTw8A9uFxIjCEuieNe8JdGoy27fqsqdRyAlsAHueUG5a2+H1vLnFN
	 jKp3ihKAAUfAMLJY6XY4CSWfxI4eeeJeLy6Ul1BreAcifL3mArsdBOIqx3rwEdM0oPZjO
	 /EI+P7U5V9H51tAqYYfBuYTV7d5JHCnKge7KUL1iW7Di40S2qa4oR2y5UJa67dqxOBWjy
	 CKJ06zHjCbuYCbQ2IQPfSw+uqX3yMbeJfdPyPNhlRGY9E6hZvmTJS0M8IICcWBl67AQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=V4uaPxWj;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5C8E606A31B
	for <linux-gpio@vger.kernel.org>; Fri,  6 Nov 2026 02:28:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5C8E606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=V4uaPxWj
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-36e99cf7bb3so279847eec.0
        for <linux-gpio@vger.kernel.org>; Thu, 05 Nov 2026 18:28:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793932125; x=1794536925; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mVFhMdPaOpZaZhoFk4x/27qwSHFs/IDKrnB1S7WQ5Wo=;
        b=V4uaPxWjkVoous4zrIsNkoyKhInuO7jZxNmIUliG6mOWkHMnHdRmXNxB/t6yC843BU
         FIBulfB70A6G++DwfHF+3dAkfdszEW60CSWhgm/hHygI8CgdbQdLTpj5QJ8y2WQWAOpF
         OUiytJMUSD+8SffcvsGK3MeV6Shjslmxa0v5Z0Um3cH+EncLu/YQNPKaf3h4sgIVkgqW
         LUXfFkvrmVMropFNSDHAHkSjaGUv6XHqvhRsyRD9SOjdjgqyMJxpWIIo1jV4Y2n0NlTM
         cYbagB4SkDHdGqBxqbj8/20WZQ8tzitgAojQZHDSaw5CYkMHSL+VU42l68aAPZITxrIv
         4ufA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793932125; x=1794536925;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mVFhMdPaOpZaZhoFk4x/27qwSHFs/IDKrnB1S7WQ5Wo=;
        b=qyw+kzhM9BRQJN3x2fGjmYO3KELbqYJyG214gUY5FlEALaDRX/J7dUJF6aL5ojo7K9
         6u1uJOacCfV7zdDKZXNnA1Q6PufuMhx8vE4j9Gzqi4BQVLBPFaciLDEQCJBowtU4yzNb
         tgnR6BwBj9Ic3fBGPpMdDlrkX6FVp6h+yQ4Va0XfG1gCtQeOvwAc88cTBst0agY7xCe3
         AEdbsnHQqbAe4d1eXabyEpcc7wJqF4iap5G48PIWDJQ9FZU0iYsu7RvFZj7O31sJX9QF
         MyDSt09oG3qFq1z1c297AAgV/CNt1fDta7uezFMR6FXjq5rbFu0e3a5Bk74gbjt0af0d
         OYBg==
X-Forwarded-Encrypted: i=1; AKwUvBw0lXFxdAbRsZnERNXhfdx8mk+r1Jo8eg3UbffpbdKhdG6zNMmuBFJGE0mdqI2XlyM/jf0Do0aS73+O@vger.kernel.org
X-Gm-Message-State: APuU4Z+yaPLRKXOwcP4pF41HO6d9Fp4V704/aN+oerYF9JQmMrebab3e
	lcc6HwYyE87zZC5h27vBw0y1AzKmldI4Tp5Rl8dB19MidfHR0tnWkA7w
X-Gm-Gg: AYBFou3VeQBvUVTLPqNf3V6hW4eWjrKn/HBHim5LjKzK0o92NCdH/kDu5uxfsP3aq5V
	SKRo4caNXARMqCiA+uAAD03tF+vf525tkX8zlh0n87MV2BMJJsAbXcUM7Z0UBq0h0xlLqe1nT/Y
	of+UawYclYL8Ek66eA7Ypm50zgCnvGTPBk3Qev5W19U58uM3QAoE7GhbEWlq9znrGXDo01gBt90
	HQujmi7QlszHlyt+EGcqGmLrl2qoOHsYsCNUjB6ay/XXentzt0H5S6kmO3VcQVyQKtdVum3skrD
	1D86UFrFwz1KUpVl43MvgOEk9faUQmTM06pwSMuGXyRdKulL2xcKXKs5o00lg5eFUwov45wZL/N
	9a2AnyKI0a0fuxg8LIEuBgfe/7pG22bra+/agr2cPvD3hh+5Z0aZMVQ1eKjng5CctZP1ZltwLLH
	EL8LCaJudUxad0Waodi8n2KxbgSIHU82OM060x0GM7z5kBJu/S4JlzoKbVCiFd/AGiD+CdXKQoY
	RB4qAxVp9+cuknvnC80vQaTDlEJPfrXocssQBi6V2tJykwgfQmWAXRhiHpJRoAZLBrGTqt2KdAW
	ZDSoAVKe4RsPeCDJEUj671Ug5ub9Q8UsCnXYuxO6RS1+mA==
X-Received: by 2002:a05:7301:929:b0:369:ef63:ea95 with SMTP id 5a478bee46e88-36f76814c3bmr1285854eec.6.1793932124917;
        Thu, 05 Nov 2026 18:28:44 -0800 (PST)
Received: from debian.prasanth ([103.183.205.43])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa8e3a47esm1697186eec.6.2026.11.05.18.28.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 18:28:44 -0800 (PST)
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
Date: Fri,  6 Nov 2026 07:58:33 +0530
Message-ID: <20261106022835.10709-1-prasanth.padarthi10@gmail.com>
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

