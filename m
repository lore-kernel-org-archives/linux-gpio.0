Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793375919;
	b=yRQBVbKyY5XkEbCtMex12WpXAxcWrmX9IUUm/dYndn8okx0e5xEY2pMglSQ8dBOVDjor
	 w5VAvj/VwvckbxiR043ASXkL0H5xS+b27auUYBhArkQjWpJuEHvCmU1QrSn0HEmAscRC+
	 W62TWaVHkiFAqNPTdzkkIW15852PiDMDpGdmw069VEipzrTBLIMDIOXeAd0FjZpy4CumL
	 8U1QVE+iLVybqOQrTWIVEkHx9kAw62vrxPRfcbGv0jeVY0az48w18gc+jdQVnjoXAjpPE
	 WVu4MzmutMwfTY+M+UYPsyA+0hoSAFWCFJ6umf8Rt1eVFLwf21/58W43rSlttdKkbdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793375919;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=pY5J61TIFJyOgKIaQTw1d+jDJ02fxs2l8GZ+SUQWAGo=;
	b=wqOv/ZZj2tVxpfzZ5tB/JCxcDo+LfwAJtV9gUHycoCqwovrgtHJqt12SPT/3L67ZzTX6
	 p0LRKZMxau0MAbzzqpLoLEJ4UKikDdNNVB4LHXbO+oTLzAooTwNqNn8hazqrwCVU5G01Q
	 A171SgkFY7ghH0hHFJ1jaGcbnvn3ZpWJPRBqfhzV88rWr1szJeAUWMKlOL8EN1u8hxxea
	 mb8i94lj6cGba179cCQJ5i4ZQMuTIac2f880CHSImJgjCd9mmFKb34FExxJIzSsxgR3kB
	 IeqQyOO/xhSqayIPWRwKxq2jGsk4VBqCsbYqM0i4V2BxRn9hmXEz9Snnz9bcLc90hhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=oU3dR5ae;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FBA4606A31A
	for <linux-gpio@vger.kernel.org>; Fri, 30 Oct 2026 15:58:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8FBA4606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=oU3dR5ae
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48e46e449e8so566043f8f.3
        for <linux-gpio@vger.kernel.org>; Fri, 30 Oct 2026 08:58:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793375916; x=1793980716; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=pY5J61TIFJyOgKIaQTw1d+jDJ02fxs2l8GZ+SUQWAGo=;
        b=oU3dR5aelx0X9640Axl1wdU5N826Lj2FpiVN7eFTYeHxQKvffig6RMfeuhajBvKn2A
         FdotIcuWDuqVlcGG9FfCu/6MOfjl1iSdOMx/1UV51DLC3Dv6S4QmYoqfWjasf6y74vHV
         psz5P7t8D9evnlDKBVa+fHwsjKGZZ4l7BoOH+PZvufmmPucGIBzQaas8OTMI7UuTINFD
         xiHD+xXapOffintzlul5Ma+QrDa19w89GFgU2MQFkIFklc1RqhHCwJTALtSUolwlZ+o3
         M2P7Q6Y+4C6PIevrACIcSkDust6eWN4yQMQFIt5ZZj14jFWcJKgjNSWoVdgxhYQjEGxo
         8H0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793375916; x=1793980716;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=pY5J61TIFJyOgKIaQTw1d+jDJ02fxs2l8GZ+SUQWAGo=;
        b=KTIh5p2nPeISky8z3ozIImiyBjOHOifF434vxFkOaSut0Pgu7q+LypLIiyHsCvxW0O
         +Na+ojJ0pbxqkZYulLfz8ZQV19N0Sdd4MmLCv7YLPzkFmwKWyoHgMpofkTLq8Sittb5k
         VUNfyBwpVrZbRVn+B3yZjYNiKo7SCi2QqBv3x7F30dmJOCA8ZJme0eImEcq2fng9mlJl
         MzOIBwtmQE50rJ8S0PicQAHH2rZ+cVJswT9ZBHY1SqXWQ7lV4I7F+u7yACIG1F+tX8gH
         6n6P6objUbri04oMnnhmJPOSi56oHLIYk1gtRUnBurVyojwhqRQfDkwWCAsQjdLAlbqd
         3Chg==
X-Forwarded-Encrypted: i=1; AKwUvBwpYI9EbnXNa5oUMupUf34uoMZZdMZWVgFH3bx4U699dA2sGFTCvpUEIaFZCqOwSbDiHYJYdC8dV7Ei@vger.kernel.org
X-Gm-Message-State: AFq9FYJvOhWfB9vyMBiwOLXp2CncGyET5xom/itip12aVkXShq+GPjaC
	vSgsFn9SakMBbam9eVOP/9kzzC4QW+Xl2fBCgtvG0oZSCCmH4+N+Te3180j/3dupgv8=
X-Gm-Gg: AYBFou2Kn99pL7Xcrl8xONXYJzCxAUygmn9QMpAg4nWYabcksv08upSUGWCN9NM733a
	xJ2KkIayXflwmqp2ytKpFzAJWevgyH1JinKs4PHPzFQP74MYiPkpzC16kKi1obho4qGzoh3z4+6
	T5e7G7hd062eCQuQxu4QopmDnlyK1oMdQu6CUGk4MplILi1Rk1StL/CD2uDH0hEx+AKhPlRpO+d
	EUK1utyTmEW+HlbkIF8ghuDoUTPlUIWoCGwOqA/Y6daQR/Y6WF9boy/qsXI9+AOxpnTTmGvtODT
	r+++cZ0iMsZyjkiAxX5UoWvEtp9uWH+YBPlr8p4Y2jKhRpWPk/qKzMlw2mq3obE7/toTxiRIMyz
	sRc0JoPN7pOJ/wYMfnVHfI0REgorB24ZbbNu2aQhjO9muVsnDc/ARIG7ZvyHBYo/F0+jotGvnWm
	daaK1gMQ3akEzMkozU4vxv9QSf8rnFDRgmXOu/9KEXTmi4oeI03BgEMdkDij+vx3Af/fiBypUTM
	zqRMYj2sm1OTNU1Iws2w2GShMhn7BTzxInsHPHmnvpjP6cWPSSOBHAMySGR08YOBY3esFQHHEOx
	eN2OicpjG77NTcBm0MIsRmodI1m4RSviDn35m88+hWzuJVm/zyE=
X-Received: by 2002:a5d:5f88:0:b0:48e:6419:dc6e with SMTP id ffacd0b85a97d-48e6e4f5431mr6781512f8f.16.1793375915915;
        Fri, 30 Oct 2026 08:58:35 -0700 (PDT)
Received: from localhost (140.30.66.37.rev.sfr.net. [37.66.30.140])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b789ecsm3862471f8f.29.2026.10.30.08.58.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 08:58:35 -0700 (PDT)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Subject: [PATCH 00/11] pinctrl: scmi: fixes and GPIO function support
Date: Fri, 30 Oct 2026 16:58:31 +0100
Message-Id: <20261030-clegoffic-pinctrl-scmi-gpio-v1-0-52d92843ad97@baylibre.com>
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
X-B4-Tracking: v=1; b=H4sIAKe+5GoC/yXMwQrCMAwA0F8ZORtotiHir4gHm6U1MtvSbCKM/
 btVj+/yNjCpKgbnboMqLzXNqYEOHfD9lqKgTs3Qu/5IbnDIs8QcgjIWTbzUGY2firFoxvHEQRy
 N3hNBG0qVoO/ffrn+bat/CC/fEvb9A/N85Cx/AAAA
X-Change-ID: 20261030-clegoffic-pinctrl-scmi-gpio-48cfe014bb11
To: Sudeep Holla <sudeep.holla@kernel.org>, 
 Cristian Marussi <cristian.marussi@arm.com>, 
 Linus Walleij <linusw@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
 Oleksii Moisieiev <oleksii_moisieiev@epam.com>, 
 Andy Shevchenko <andy@kernel.org>, Dhruva Gole <d-gole@ti.com>, 
 Bartosz Golaszewski <brgl@kernel.org>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
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
the schmitt mapping, which the platform does not implement. An LLM was
used to review the patches and to set up the tests.

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

 drivers/firmware/arm_scmi/pinctrl.c |  62 +++++++++++--
 drivers/pinctrl/pinctrl-scmi.c      | 170 +++++++++++++++++++++++++++++++++---
 include/linux/scmi_protocol.h       |   9 +-
 3 files changed, 222 insertions(+), 19 deletions(-)
---
base-commit: a39c950806213f6861d00f90729acaaa21f2d95a
base-tree: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
change-id: 20261030-clegoffic-pinctrl-scmi-gpio-48cfe014bb11

Best regards,
--  
Clément Le Goffic <clegoffic@baylibre.com>

