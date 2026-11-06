Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793945579;
	b=ISuVnlWghj2JZmW0SBK7Q0J3bJNgg3wnhCVjUAfodUHOEBsESfFeFYLmcaceACvY5bv6
	 UwNhEd/EAuoVceGIx3l/waOxhB53dZMVH35kO6ahgJOrEY82MY5QZIqo0V5ZphzKZ68MV
	 MO4Uju3hWpplG/cpDEoRAM8/D8ZtjSStU699uvvVBi+mfwr0i6eRSd6qzYwlETW3ta23o
	 ueVXSil6cuD2cP99n1s+2O8+ztXbjBCWgFX+AKuDMHsExy/MTTtRPufsv0ewLtB5kl6pD
	 yvsrBWWmxfhu9lvvtGlBaWHANJbPD+XmP6Sw1AWR5Lmjqo2ylGjEos+a+GikpIL6nQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793945579;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=yqC5kqEmzZTPK10ulwI68LiQM+78XkN3IO/N+99yYEU=;
	b=Nvvm1ANQDXUOy5fddwbVuiJpnS3nRon3To+bQuCt9d5AW8/M3qf+ft+iNBanFbaKnBCp
	 Djw3UupL/CyRHVx2NqlDN2qgj6R9/epE048GFec5GoHG9ynHFr6BFDPA6cwXFkgeI9tsD
	 i4JFBqhBmFjJiZ982eOrgYTQTXNFjypYK26NEbw4JwbY8kjJQK03t1t/Y4KhyZ06/uH25
	 ej2Eb69jUDAnMTQPkjEHmuA7FSHP+sxxYDgFyPACfxJEVHsNAlpMYK2fl1LmCcnb6g0j6
	 RgOc516mJhO96/yp0LwpaOZ4/IdBQUouqAVG35VKwxLtqhpP21U1awkk1rlxJqif52g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=jclark.com;
	spf=pass smtp.mailfrom=jclark.com;
	dkim=pass header.d=jclark-com.20260707.gappssmtp.com header.i=@jclark-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=dn1UgjEw;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 397E7606A326
	for <linux-gpio@vger.kernel.org>; Fri,  6 Nov 2026 06:12:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 397E7606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jclark.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jclark.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=jclark-com.20260707.gappssmtp.com header.i=@jclark-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=dn1UgjEw
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-36e795af1d4so268937eec.1
        for <linux-gpio@vger.kernel.org>; Thu, 05 Nov 2026 22:12:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jclark-com.20260707.gappssmtp.com; s=20260707; t=1793945577; x=1794550377; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yqC5kqEmzZTPK10ulwI68LiQM+78XkN3IO/N+99yYEU=;
        b=dn1UgjEwd9O1KMrjxmyVATBPLW/7Tg+o2uk2jNpDRJ7zln5a9gi68UkEyZVo8vYyj+
         Iwn2B/rPOzXwdxYUEPeJ3/DFyPZI2ERmxaM5V4W0P0bMsKcvplZ7dI+5BQlasOzp9Ovr
         oAivFEe5Kjmd9p5BPIJ19HEVAh/k7wvsN1fZpM/3LU6z45eCT7E/PPFW/q0o5x37Ga2a
         5GXbjhfxQ0fXJdT8q7bkPlq2Dss94yOEFN1aI3jm8cPSEsMoN8I+oD4fcaBOKZN0g7X0
         bi/Vx5cSU4SRxAMTBdOkquHotduIUnIRokW/O8KCqb5RFuyR9mRiOdh0sXIO+dhsY9XG
         eZcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793945577; x=1794550377;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yqC5kqEmzZTPK10ulwI68LiQM+78XkN3IO/N+99yYEU=;
        b=A09Xbcx//r1LDOlnps18ZUVef/5HR2+OO7o6So730RTi0ntHWM2n9tYKyjO+HYxs6Y
         oI3nQeNplTI+u+F3T80Dp02SZMSneUeHCoXa8cUz2z5p1y4gqbpHtqA7XGKcb4H+0jO7
         2EOFyqkSNWQDxw5+Z3aaxlnxPOGZK3bvioII1pEX+uoLXN2WsoBifdZF+Q5XAU3gXCnp
         82R2WFqWKv2loxq3Bz+9wRmr0mNtUBeaWrCmPKRHRxUadgzcqHvN9OMB00HEet8bKGHG
         mfIwYIxdTS0yugJ5pNkr3IPQ7wb6KxC19Js7BA9WiwkiUTrMZkzXSPq6lFxkBRPh+Wwn
         7oJQ==
X-Forwarded-Encrypted: i=1; AL+hErHF2PKkhZ2kRrBKCzR1xgCVWOZqZw2eN5pOQgA+mEgPGQeBTDnY6bnjpwnGfiBM3mn0MWT9bm4JJyxl@vger.kernel.org
X-Gm-Message-State: APuU4Z/K3uuzDVauKanz8vLtEOwjLRTs8zF36ZoejOI/tROMJOJcLZ5h
	JsiW4SNP3Yqu9OQ4l4QX922qiZ9u5PHOLQ5fT7KP3ojJcWpIxZ5Aj5OdQiHa0FayZA0wChp7yFC
	qUvluKzqH
X-Gm-Gg: AYBFou3H/C8ipWlez3B8E9CYTMvVr91sRUwiuvBh1WhcS25ppChGZ80jw7b3gvovVYp
	wr2Zpfk+ceGzXZYIsaJh2Xa2SUTSp8Y0Iq1M3n2s8mXutGkYP69Z/Wt2lN73Xj/e4rzuBcj3a6G
	a9zaaTcoOgqQV6r2Mdd60ZPNBVg/tMCpPwFMGbU5VdM4BjQq0cGb4/OpHKmIQPptlT3pXwhMGqq
	eN/MFt4hDdGbQyzDTNdwzL353MtI3zClo1W5vTlt11QRRIB628gVIG6batBRPTCNpH6kAzbHHsn
	LA+EfnT9hQ+bPDyBdp3jBlf52nuh5CfdtDwWaExX6IFB7ivjkkrT7A3Afhlz+Y4OgER4s0rzLBR
	jOz40CzFyeDVzpfmshi1LvPAM8OydDWxhJ97k/fyJSJElvfPWZCYDNRjF0MzmaY/Cj0eKRTzc8M
	DTg73Lx3syd4SUB3k0fWFmEJA/lakxVLc+eIEMjWWn4w82SAr6iNjkqMod/Cjg3aha3IMzvGkcu
	5qzfrKQUlIsXoJ9IMSsQ6NPjbAfCQmt/xclOQ4EOmJpqR7slpgHnnG0PElOLKgh5aq7c1nwVEqq
	T9SIDZsTFcbogPD05ft/OuRivGCxm1abl/Yb4dvORBAE+SNR9wHrm7fA0TVOJnY3azXVmZ0gTjp
	y5sZ4HVkhxfssC5DLag==
X-Received: by 2002:a05:7300:8a14:b0:343:5f5f:eef0 with SMTP id 5a478bee46e88-36de7432bb6mr6742335eec.21.1793945577142;
        Thu, 05 Nov 2026 22:12:57 -0800 (PST)
Received: from cantal.lan ([58.136.77.237])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa922c6c7sm3755879eec.10.2026.11.05.22.12.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 22:12:56 -0800 (PST)
From: James Clark <jjc@jclark.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alan Stern <stern@rowland.harvard.edu>
Cc: Johan Hovold <johan@kernel.org>,
	Bastien Nocera <hadess@hadess.net>,
	Matthias Kaehlcke <mka@chromium.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Douglas Anderson <dianders@chromium.org>,
	Robert Nelson <robertcnelson@gmail.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	regressions@lists.linux.dev
Subject: [PATCH v4 0/2] usb: misc: onboard_usb_dev: don't defer probing after the device is configured
Date: Fri,  6 Nov 2026 13:12:49 +0700
Message-ID: <cover.1793941292.git.jjc@jclark.com>
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

v3 added a pre_probe callback to the USB core, which turned out to add
significant complexity. v4 follows Johan Hovold's other suggestion [1]
instead. Patch 1 exports the generic driver's operations. Patch 2
changes onboard_usb_dev to call them itself instead of setting
generic_subclass.

Tested on the BeagleY-AI on top of v7.4-rc1: the board boots normally,
and unbinding and rebinding the onboard-usb-dev platform device works.

I used an LLM coding assistant to help prepare this series.

[1] https://lore.kernel.org/all/auSdA8MfolA8OhdM@hovoldconsulting.com/

v3: https://lore.kernel.org/all/cover.1793669297.git.jjc@jclark.com/
v2: https://lore.kernel.org/all/20261030151919.3511106-1-jjc@jclark.com/
v1: https://lore.kernel.org/all/20261030114705.3159093-1-jjc@jclark.com/

James Clark (2):
  usb: core: export the generic device driver's operations
  usb: misc: onboard_usb_dev: don't defer probing after the device is
    configured

 drivers/usb/core/generic.c         |  4 ++++
 drivers/usb/core/usb.h             |  6 ------
 drivers/usb/misc/onboard_usb_dev.c | 14 +++++++++++---
 include/linux/usb.h                | 10 +++++++++-
 4 files changed, 24 insertions(+), 10 deletions(-)


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.56.0

