Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794019007;
	b=MdvnBXJ7rSu8QiP+jBNdtaBKpQx5tn0rwkFrR6gAHsdfIC1dTQwi849SFyLfGSFo1XK5
	 xEpl2e2mVy2g9Os/yRVONMzxcLjP/zoRcnG43ygSOO7MaSPpbh0Db/nKEpB6dQZAIRuWZ
	 lKHs3LgfbrRDd2BCJMJX23QY3E6+0eysr7x1YSFjLetFanw2xNEv3NqvhCys4pHzef+4h
	 TQQIAz6KAPOE6sAn1pJZzSH4F1W6/9q/BRzI4REmshZW6Q7JQgZiPVV8fBNzftcfB9d7R
	 OEer+vH6M2IPJFChrrd5yYXU9wQmyx1IyWogyCScQV2e6wR+Sa+YinUo9O8xw/T/tDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794019007;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=qTahpPHpbDlYYuB1ig8Pwb/kWwkqX6TStG8OWom3lfY=;
	b=So3KSQMuFIejRFZOGYPziiZHCHG1YlHL7eFzehc9e35Jj3XrPbq1OVGpPxgiIw7OMV90
	 zFdbu50C0uMaG733aUt9myxVatpgYUXsroE2Gyqg9FqvaDedlgUy78hX9mCz3XMhagk9y
	 mSEoBs9AQFv63xeDtQ2W+a2+Vu3fa3IjbnLutc3NqPrTTg3DXFm92z7wP5pqA4GqzEdUK
	 3qtrjJTK8TaGFUglYeeEMYRU9Y3IchHV628JIcKG9j32+F2Hv5QjzDJ+fXE0oQ4y7jE/C
	 tUsI2bA9SVOpwnMgEuM8fudicGDERv73cGLXWJRBO2KpK5P5WDhDCN/smra9lPKBDTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=jclark.com;
	spf=pass smtp.mailfrom=jclark.com;
	dkim=pass header.d=jclark-com.20260707.gappssmtp.com header.i=@jclark-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=JkscqRq+;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FDCA606A32E
	for <linux-gpio@vger.kernel.org>; Sat,  7 Nov 2026 02:36:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0FDCA606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jclark.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jclark.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=jclark-com.20260707.gappssmtp.com header.i=@jclark-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=JkscqRq+
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-36ff9c9da34so1641524eec.1
        for <linux-gpio@vger.kernel.org>; Fri, 06 Nov 2026 18:36:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jclark-com.20260707.gappssmtp.com; s=20260707; t=1794019005; x=1794623805; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qTahpPHpbDlYYuB1ig8Pwb/kWwkqX6TStG8OWom3lfY=;
        b=JkscqRq++B+ptNom9a+L3m4CpRfjH6yEuM7WWVpDw0YRYMkSl78OdWOLv8mfU2y98L
         52LmMy5Dy5XuXc64jwh540/dpl2ydJeie+ubyx7da7xcB8m1Y7nkdechckpqrqWw9Q2l
         o9k8yxCMFzhuIlzGc8lCG7zzknmVDAQmVEYnVSOu9or68qsXVSCRTIi4Cr5d1Rx/a+O/
         aWEVheAe+0yT2Z/r5cFzPt1BEn9cN1MuDIv+xiqdTeVhYz0/RpOyJos/pZCqQbeNKCD4
         TNIPN0OOsMA0QaG/R9juiSMHAC8ie4bUIeEnKn0lHS1xgH3XZuMIN8L4DZNZWuegBmnZ
         e5yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794019005; x=1794623805;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qTahpPHpbDlYYuB1ig8Pwb/kWwkqX6TStG8OWom3lfY=;
        b=HvZu5pvlPXzmcBX+jAeoPTw1pGKfGgec9sRiRRJed6CCPO2G5iKDOiza7nXu34aJjw
         xZp4B1phrXkYLJi7sH4o8gUT/RcmzmRe3kh0md12W3PXFTouPyXa5gm3r6Tw+B9EkrcP
         EyiWXchzIQbdHhsKE4yApRCVtjDtX5jmBXoRYY+dNYBANdgT13aQ1qcFXBTmDk/5paKW
         bIj4+IZNc7AoFvlTeKE0I5IDKCWqgH6ngQDFPIJ2saEvvnOaLZ3KUaRqO14MrpEYczLt
         NjwftdvJpdcQBkEVVCfNIM/WxRywy9uv3OceAyyYERehflfrWnkFJq7mcoL9S92K45nf
         6JrA==
X-Forwarded-Encrypted: i=1; AL+hErGXW+DJhRzyGs+JSPI/mIBqnWcv0Bw8WAoc2puG0zepTx5LKCsTByRFGCHyLCKl3B6R0wNBSkG/MQMP@vger.kernel.org
X-Gm-Message-State: APuU4Z9l/1ATZj34ML8JoQkKv/G0m4yJJ1u0UIVqYzCuiRO10ruB3v2a
	OKNX/yrZysg7UNJ1EEb7O+Kls/g+zjSSXINfO0ssHxZ4+Eb0CobmWxfwcfhQ3tQ5Jw==
X-Gm-Gg: AYBFou2o8sACzsN7J0hxDB5IXfXe7phH9xVEc1kusjxp2TWa2QsulqE3ciRfajKuIRS
	tDc8trUXtTugDhjSclj57tsttoTf5G7mHfZiITpHmmihSpekKTNnoWfpxmXepH0y0F76inidoJU
	+ZiFizJOD1MlmgEcPn4+Pos9RQmmS+jsn7M+y6LO6a6rrhwhN6MYwJ2T9AkCj0RYCDs/6vGIVhs
	sHV/CYCLXrQ9+RNUt0bflw2BKxFFDbtp14/rwcdfwfaBm+UakXg4QFhVLnoTGJPkKYlF8V00aWc
	1N89Aak7fHbkpKO4Mn+HSnHYCnBmNKYJEccoFnt9xPELyhUPqqRzqzmib7MERQ4ycRbqAnzVlGX
	yr4W0G0j8sKdAQfelj+QdlY0nONRg1hZEY0wW5P9qwmkb7/a6e2jlULI+vkTrNPWAn7qdW6/Jll
	+D/ieh3uYlJSXmXfs6Y2ezM12oMhfMDHwkqul1nUOWHEyzlAV6QyOJwcj/bI6+Dq5Of3uTeW1d0
	jMkD6fXSrEV4cYcByZ3sLRdO8rlDI/lmR+Y0WT3AiIwdT3I6Fnjd0sK4nhe68fG3qLBeQZMej6k
	p7Ngkqwx7p+kgAi5SqZ7uiC02MleZBVQ1n6szpoTfzdT9pUzeolCIxqr7JwOnIiiPkvURPhj9cd
	1fIzexn8ERcGQrm3NJbc=
X-Received: by 2002:a05:7300:4fa6:b0:36e:e349:f2cb with SMTP id 5a478bee46e88-36fb6a9164dmr5030384eec.19.1794019004825;
        Fri, 06 Nov 2026 18:36:44 -0800 (PST)
Received: from cantal.lan ([58.136.77.237])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36faa4b4680sm10421618eec.20.2026.11.06.18.36.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 18:36:43 -0800 (PST)
From: James Clark <jjc@jclark.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alan Stern <stern@rowland.harvard.edu>,
	Matthias Kaehlcke <mka@chromium.org>
Cc: Johan Hovold <johan@kernel.org>,
	Bastien Nocera <hadess@hadess.net>,
	Arnd Bergmann <arnd@arndb.de>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Douglas Anderson <dianders@chromium.org>,
	Robert Nelson <robertcnelson@gmail.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	regressions@lists.linux.dev
Subject: [PATCH v5 0/2] usb: misc: onboard_usb_dev: don't defer probing after the device is configured
Date: Sat,  7 Nov 2026 09:36:36 +0700
Message-ID: <cover.1794018128.git.jjc@jclark.com>
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

On a BeagleY-AI, kernels since commit f918e3804498 ("arm64: enable
HAVE_SHARED_GPIOS for all ARM64 platforms") no longer boot: the on-board
USB hub is re-probed in a loop, because onboard_usb_dev defers probing
after the hub has been configured.

Following Johan Hovold's suggestion [1], patch 1 exports the generic
driver's operations, and patch 2 changes onboard_usb_dev to call them
itself instead of setting generic_subclass, so that it can defer probing
before the device is configured.

Tested on the BeagleY-AI on top of v7.4-rc1: the board boots normally,
and unbinding and rebinding the onboard-usb-dev platform device works.
With the peer-hub property removed from one hub's node, that hub binds
to the generic driver.

I used an LLM coding assistant to help prepare this series.

Changes in v5:
- Patch 1: added Alan's Acked-by
- Patch 2: stopped matching a device that has no platform device, so
  that the generic driver binds it (Sashiko)
- Link to v4: https://lore.kernel.org/all/cover.1793941292.git.jjc@jclark.com/

Changes in v4:
- Switched to calling the generic driver's operations from
  onboard_usb_dev, instead of adding pre_probe to the USB core
- Link to v3: https://lore.kernel.org/all/cover.1793669297.git.jjc@jclark.com/

Changes in v3:
- Added a patch fixing existing problems in usb_probe_device() (Alan)
- Link to v2: https://lore.kernel.org/all/20261030151919.3511106-1-jjc@jclark.com/

Changes in v2:
- Switched to adding a pre_probe callback to the USB core (Johan)
- Link to v1: https://lore.kernel.org/all/20261030114705.3159093-1-jjc@jclark.com/

[1] https://lore.kernel.org/all/auSdA8MfolA8OhdM@hovoldconsulting.com/

James Clark (2):
  usb: core: export the generic device driver's operations
  usb: misc: onboard_usb_dev: don't defer probing after the device is
    configured

 drivers/usb/core/generic.c         |  4 ++
 drivers/usb/core/usb.h             |  6 ---
 drivers/usb/misc/onboard_usb_dev.c | 67 +++++++++++++++++++++---------
 include/linux/usb.h                | 10 ++++-
 4 files changed, 61 insertions(+), 26 deletions(-)


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.56.0

