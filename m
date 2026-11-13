Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794567962;
	b=naGuhIOj5Qhj0PiLsSAjUXuu+R3SLAzHbn4wbYTvi0Nd8bKjwOuc20or3m0UOxa+Xut+
	 VZRVkrPXOa3eAuZqe5wr2YG/lh6Sfp3ueBO/zYtiiWBUdHvFWuJ+VwXEH2H1y7HSL5y56
	 KW84Q9gto6iTl7coMCes13SurUbO7CvIqPLvSZ7/975OU8wDTl7yr3HSXHsBLE0/4FGqM
	 dLT1DfwJstWK7QUYZX20nHzK8vLtKfPT/zSUOwvHJIOJPEQJogbEHBxomys87xqlHkBHS
	 rJERkTIHBjCnjHCPi2jMNwq35R76eBG7+Z/pqJywKz3LDv7BW7k8u0oHP7sHqe46H2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794567962;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=5gzZov9JPSIe7T13qi6SZ7Yt/1lSfrV+lnshc+GEkjQ=;
	b=mHgW88/LoZf4EJ2BnCeWX6ZLtIXywh/6vu+s0ej+0fru85aiIY2pK29ZvR/NvkGYxtmw
	 diVtRDv5XieKS/0VSfjRIoaFOfejm7otHiF+rONoyHsyFIvzeLQyLyX/eQD8hQhUbygSy
	 sPSKq3qOLIujC2o45Umk2JWUh+k7bpTQZN/C53ORIG24yWWEAO14N5PxI2kygZDWDuR1d
	 EWalUiQTU/s5bZmOQASmabjFndHVcQA5J2rkbwB9ZVSCLzzM/G3yLi6naHjCdfhbobvr+
	 m8rhpQqAnZ1CzvYHfHL/dE8w+CkgPJm/hJNcDT2knGxQWpbS07jji+ZDro2gvQI5Zug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=K1eQu34B;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55EC160A262F
	for <linux-gpio@vger.kernel.org>; Fri, 13 Nov 2026 11:06:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55EC160A262F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=K1eQu34B
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a215e64962so14100375e9.1
        for <linux-gpio@vger.kernel.org>; Fri, 13 Nov 2026 03:06:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794567959; x=1795172759; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=5gzZov9JPSIe7T13qi6SZ7Yt/1lSfrV+lnshc+GEkjQ=;
        b=K1eQu34BjPPw9A8TdeH/jg7v4pY3cCb0VlJx1dSmFEN8R7m5ua9UHlzQYH2Y0Ace//
         DRJdz8Ln5ye+ygoMB9e2gryU6ygyEVpQvP1lJQmG1FW2VQ6/+768XZvz10zapHQKCeFF
         zKFwoevhbncajAOOGr7leegnosAuHMDN4fW8DoBTPfMu1TU9ujhHCYHBD5sFqqXzo0rM
         JT9gCQB//fuBJqoZlz/GXcn2uWNry8tJ8++9edjh3qqml0unvyYdOeeEATNWm06IrSI/
         2obyX1qTOnZiJ+gmBeXQ/qvjfrIi5+gMwQGjztnWjMMdQ8GWqCZTNYB3cC0ZZ3O13xQU
         eY5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794567959; x=1795172759;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5gzZov9JPSIe7T13qi6SZ7Yt/1lSfrV+lnshc+GEkjQ=;
        b=MGZiiOoktxm9QEGjBx7/bUVrnsYl0CFxT8OONy8MLiG17VrBeLUb/K/RZYCmFdxrN9
         E9iFrhRjYkCeJ/KyjHtOKUYPwvXEiy/VSIPot90rE0xGr0q1OpaOe5IenlBS6mSGiBWL
         kLXc96MLQmK4DLjfaVxU+/eK690SUXtS8NCR5zLArdksckTtjgd2A10HTOxt5uigyQ50
         PG1ICTuI8viv7/7vmzgUNHanNr3uz+ImE94v1MVXunAE/t4HxV5Es/eD+2JqDTEMkdzo
         WyD69btahRJm6S+CVFDL9RYTGqllara9yc9CVK1vl3Z8EgSVlc7w7ZWEVuuDtOrbcmu5
         I7Lw==
X-Forwarded-Encrypted: i=1; AL+hErFeptcND3J6CdtA6ipqzU4sX6qHxLXfymlRDrRxazvY/fzd/tPbBKwpIXSpm/7NaXt06auka7N2GkSh@vger.kernel.org
X-Gm-Message-State: APuU4Z+5LV89lXgIvZrFRWcoVkNl3JJcemwKzTANu+gpcDY+KGwYEqY3
	A2qCS15WuWXTkt4vRXOu1H+5xb8wKLBymoQoyApnThlyPeGSlND3ucDmPRn8nfa2BW0=
X-Gm-Gg: AYBFou2bu+yRY/W2V0Hsub4/yGVQoJR5yrdzCELaeJnhn2DI6qXnS9mmqBRUOBv0wiP
	VH/dff+wfSOz7fqEw/Sh4vsyYFijDftDNgRSt3DuvkTJFXs0ncZV7vWN1j4DImlAUbSwOwFVPc9
	fJDrb/4YV0dfLSPiuQKTLB4TPbgYcH+16xTBHHmRTwoSPSTUWNY7VmZcrZNoC+0F+CYdF/l6EKK
	x3dCoZIxy4E0eBrV7FHS+3bMZNo4p2yRp2Kk2kKNcS5QXQ35l6lMUTC2xi5UgyGYSeQlpKDmJkZ
	3G55ZQbkR8f61QhpTLWyaZUnnGEJp3JByKPxkd3D7OGZ2u83C3IxXnFVkdeipUPnAN0GnRKlu6W
	n5/UGWffopV1akMHMrmDtDK5yGTzDwQ02DYikOyAcvJen8d8gs3OLm/yNjbl0sJTdQP1Lp2b3WX
	xJzDYk5ON3K0x3AdJYmGQeeop46aBAZpMQh9noN3/jTOsl07RtU3BvoFtmIPq1Mr66rvCzopmq2
	ccCVOqLv+QsA1wB0ZnmjuzDT8lddFH/CVpaB6jhW+c3lG1SzYdzwvPrVPAXJpDkFpE9maXaevTp
	Av49v7yWGi+V+001fbDaHaMSOWycjQxO8ba17JhO5bpubKr6EFk=
X-Received: by 2002:a05:600c:6219:b0:4b7:6aac:7406 with SMTP id 5b1f17b1804b1-4bb55a23b41mr38480235e9.3.1794567959161;
        Fri, 13 Nov 2026 03:05:59 -0800 (PST)
Received: from localhost (128.33.83.79.rev.sfr.net. [79.83.33.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb5671059bsm28648085e9.1.2026.11.13.03.05.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 03:05:58 -0800 (PST)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Subject: [PATCH v2 00/11] pinctrl: scmi: fixes and GPIO function support
Date: Fri, 13 Nov 2026 12:05:26 +0100
Message-Id: <20261113-clegoffic-pinctrl-scmi-gpio-v2-0-faccb4685d88@baylibre.com>
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
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAPfu9moC/42NQQ6CMBAAv0J6dk1bUMGT/zAc6LKFNdCSFomE8
 HcBP+BxksnMIiIFpijuySICTRzZuw30KRHYVq4h4HpjoaW+KplKwI4aby0jDOxwDB1E7BmagT1
 kOVqSKjNGKbEVhkCWP0f9Wf44vs2LcNyTu9FyHH2Yj/2kdu+/06RAwkXXhc6ztKqL28NUc8cm0
 Bl9L8p1Xb+9sX7x2wAAAA==
X-Change-ID: 20261030-clegoffic-pinctrl-scmi-gpio-48cfe014bb11
To: Sudeep Holla <sudeep.holla@kernel.org>, 
 Cristian Marussi <cristian.marussi@arm.com>, 
 Linus Walleij <linusw@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
 Oleksii Moisieiev <oleksii_moisieiev@epam.com>, 
 Andy Shevchenko <andy@kernel.org>, Dhruva Gole <d-gole@ti.com>, 
 Bartosz Golaszewski <brgl@kernel.org>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>, 
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.17-dev

Five fixes: the drive strength went out in milliamperes, the schmitt
trigger enable was mapped to the input buffer, the settings Linux
carries without argument went out as disabled, a setting the platform
reports off read as set, and the protocol layer read past a
PINCTRL_LIST_ASSOCIATIONS reply larger than its receive buffer.

Then GPIO function support: report the pin-only and GPIO attributes of
a function, give pin-only functions no groups, mark the GPIO functions,
and select the GPIO function of a pin on a GPIO request.

Tested on R-Car X5H with a v6.18 backport that needed adapting, all but
the schmitt and enable settings, which the platform does not implement.
An LLM was used to review the patches and to set up the tests.

---
Changes in v2:
- patch 4: keep the enables value on get (Sashiko)
- patch 5: error out on a truncated reply (Cristian)
- patch 11: unsigned counts, loop variables in the for (Andy, Cristian)
- patch 11: dev_dbg when no GPIO function is found (Cristian)
- join the lines that fit in 100 columns (Andy)
- collect Reviewed-by tags
- rebase on next-20261112
- Link to v1: https://patch.msgid.link/20261030-clegoffic-pinctrl-scmi-gpio-v1-0-52d92843ad97@baylibre.com

---
Clément Le Goffic (11):
      pinctrl: scmi: send the drive strength in microamperes
      pinctrl: scmi: map the schmitt trigger enable to its SCMI type
      pinctrl: scmi: send the settings without argument as enabled
      pinctrl: scmi: report an off setting as not set
      firmware: arm_scmi: stop reading past PINCTRL_LIST_ASSOCIATIONS replies
      firmware: arm_scmi: report the pin-only and GPIO flags of functions
      pinctrl: scmi: give no groups to pin-only functions
      pinctrl: scmi: mark the GPIO functions
      pinctrl: scmi: report whether a function is GPIO
      firmware: arm_scmi: add an operation to set the function of a single pin
      pinctrl: scmi: select the GPIO function on GPIO requests

 drivers/firmware/arm/scmi/pinctrl.c |  51 ++++++++++--
 drivers/pinctrl/pinctrl-scmi.c      | 161 +++++++++++++++++++++++++++++++++---
 include/linux/scmi_protocol.h       |   8 +-
 3 files changed, 201 insertions(+), 19 deletions(-)
---
base-commit: 6d582d78fad9d828e575ca0cdcff8ea47a77220b
base-tree: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
change-id: 20261030-clegoffic-pinctrl-scmi-gpio-48cfe014bb11

Best regards,
--  
Clément Le Goffic <clegoffic@baylibre.com>

