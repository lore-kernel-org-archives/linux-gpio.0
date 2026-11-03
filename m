Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793676860;
	b=Mx30tfdypwbCTBpIyKZ3K4vLO6PyqLPiOqyLgyzdpkbjuxPfidRxPR9kRSKuImNb+m/m
	 9gxme/F5s2XXd/JNWI6+svc9er1+Spq5mABRDr5OdXZd17b1yr/vSW4gOYAHAA20/L4W6
	 UHdCz9Z29hizh6u1ZZATR4f8kDS59ESaSc72qV0DyInfUD+89J5F37D/Gb6r3TtC5551G
	 AM2qETY73f8+hG0fc5vchGB7iptJoytvwf0IuUUoSvSIutaFyO1Ma4Az50/1udobyNlqw
	 Or+nmIgFPCsv5LeHggxk6nePbRIR4r8Q0fdyZ8pnR/ezOiGKh2egdLwD6EUZ8EJJ0Tg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793676860;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=b1Rw55oWDrh7Qrrp6JFBlhT1fM/bU2NaiuzfyjKKcU8=;
	b=w3ud+LcRWAr+kWTlPcU+nZbVZhu+Il/sY+d4WvaBxBzVCO0Yp4sGcW8z/kArwgDH2RNq
	 Hmb0sSibbD7kEL2wmDYpVLUH85wv8IyLfGlr2jI+HdZFoCSGv6Ag7KS3T3oFR+q9suyNN
	 bK+fjUUBvf/n2TDymepPY6mcYyK2krGhXdav6/uD6BqC/Cr3MpE05OJbd3yLw9zmHwMBa
	 VoCC3FSsW7uvd1J/iF+9N+IttnQwb+58m8tiu2emTcWo1lYkyFpm5mAt9jNFJ1RtwQJpd
	 WNykFssILh5P5fuPQgoeX8m1UH+F7zKqekiBac/72dLKUcBYWpTrAO6WLmnR+dDuXUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=jclark.com;
	spf=pass smtp.mailfrom=jclark.com;
	dkim=pass header.d=jclark-com.20260707.gappssmtp.com header.i=@jclark-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=AgiwMN+W;
	arc=none smtp.remote-ip=209.85.215.180
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A8F7606A32D
	for <linux-gpio@vger.kernel.org>; Tue,  3 Nov 2026 03:34:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A8F7606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jclark.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jclark.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=jclark-com.20260707.gappssmtp.com header.i=@jclark-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=AgiwMN+W
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cdac6d19ddaso1460070a12.2
        for <linux-gpio@vger.kernel.org>; Mon, 02 Nov 2026 19:34:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jclark-com.20260707.gappssmtp.com; s=20260707; t=1793676859; x=1794281659; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=b1Rw55oWDrh7Qrrp6JFBlhT1fM/bU2NaiuzfyjKKcU8=;
        b=AgiwMN+WCDb0CzMHKck1ZwBsxIOmlFDhABJrFx0RhXHXhMEgdpcjCQkcKPD4i6PCpd
         tEwCWnQT5COSNU9Kn67nvGjSDZv81kzF3ZnJPRRczxT9628t7vDQF9fGF8hHW938fkta
         UwWxhrKF6jVlZZ8P+LGMzklD9K3D95NJS1MCXZ3SshiMAgYFtOaG97TujFyhlejTBWVj
         LhjWOZ3aVkTJduAlo82JvxBkn8eKoTcDa/w2rzhd1ysfkhrQcksTnSEvQiyayqY3NIHt
         5qWYfAntph4Sj2ZG5nh+jr6+/XCxRiQBA4naC59UJvxwhllk4l8L6iYI9GYF3L6/uCUI
         ZhhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793676859; x=1794281659;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b1Rw55oWDrh7Qrrp6JFBlhT1fM/bU2NaiuzfyjKKcU8=;
        b=uyD2zzfkK6+Qr98N7ib9l3gY630r5TFN0mmEJV9Lh/flU7858Lyr4wVMGibsSrAbdi
         1n3wvzVI9/SJMwy7dYxZ0lg5F54ulcvwQxZ7nvdH/R09RnI+Rw0Oc1Mhv84RpXGg3NUN
         TOkCJ0iHsjrXdV8uMn5h45t44e20Y3kgShuNDS0lmcXYU21SZPN0H9gkNpFuUK9RsufW
         CPjzCd6+Sjvp1CXzA4SS5i9x7p+3M/HjNPyFaraW6W5WiIluUJWUEIYnQdOHxc7fmKKB
         Og1H/15+uDo0zMrs9rxXmstgTT4BqxrsioXlAhRKFI9vnmedtbf6UeoXhh5DED5Fm7Xb
         XcGw==
X-Forwarded-Encrypted: i=1; AKwUvBxgdzY6uv74IOfAFM6rIIQ+MzvVMii6PfYh5BfVZkqsgxw+BN2tizyXJx/99dil3FNXYOPUmiV8Wyl4@vger.kernel.org
X-Gm-Message-State: APuU4Z+czxYlr+y98pZ9jbVxsJFaxJCTf/78974j4FcAbfeeiYwiYp3Z
	qLS8w3U+z1cxX+bA77ow1tw1BKMnzb1mfolO6puKiP7vJp0JCfYfHqfUkH7cXnB3FA==
X-Gm-Gg: AYBFou1P+Oh17o1h1+zg73UgC/qaPpr9KfTbTj6sEhwPjnAdzuytxa2PWt4JnnI1NoT
	TmM6hOmcjxpqGEmpV7ZXEZGJFRrKGMIi1ZSl00cYsL8Ag9e4368/nJo4QrtprrMsWNcY4QABxMb
	aVeLJkmJeYnEW/eD4QOjNPEYgLmm8Z1urVI1piebVet7jQ1qGbcE9sKvS2QIWcM1qinDi3EtDpy
	z4miEr+DzBzr9q8WBaOAl04bb4VBTiSzGQH10Jr9rR8sXRJNRqWcx7G50tRPNuGnx6laaKYIsUh
	IPQjh4GmYuHVnruHPwpvL8w3HbTUkQGJe2IXi7sJfdqdlXkmmMpm5e8mMvaOe44p/+yuWAzIFq0
	cEjr57LUe3QEte7nJYGbixbVU+FYf2nkWAeNlQ5AgzdIOZoCVMCtZn3TN7IxIdL6tBYjmB4wZip
	YbLkjyCixh+OHX5L/qN7WIbPi9hxaTylbg6FIACunF/QwsWb1hPBw4stKWKTPdxNbVEIh9Ed5cK
	mNsbdzH5eS1LeMDiMb35A+7pEvwNdJowWQlL8aImogLY5G59120aXVRnChlKvbiPuDGXul7b/mn
	2sWWDhlRDAJvXvEZxMpQMlzSlQYdd9lq9foZ+uisHYaCAZRMbokrGb7RD3VqPDFu2GTi6cPAsjU
	rxU5t40JuwFOVLT9EHA==
X-Received: by 2002:a17:90b:2d0c:b0:3ad:d29c:5e64 with SMTP id 98e67ed59e1d1-3ae897e30c8mr9894127a91.65.1793676858713;
        Mon, 02 Nov 2026 19:34:18 -0800 (PST)
Received: from cantal.lan ([58.136.77.237])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c29e619sm1965566a91.0.2026.11.02.19.34.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 19:34:18 -0800 (PST)
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
Subject: [PATCH v3 0/2] usb: core: fix failed device driver probes, add pre_probe
Date: Tue,  3 Nov 2026 10:34:11 +0700
Message-ID: <cover.1793669297.git.jjc@jclark.com>
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

On a BeagleY-AI with BeagleBoard's device tree, kernels since commit
f918e3804498 ("arm64: enable HAVE_SHARED_GPIOS for all ARM64 platforms")
no longer boot to a usable system: the on-board USB hub is re-probed in
a loop. Patch 2 fixes this as Johan Hovold suggested, with a pre_probe
callback that lets onboard_usb_dev defer before the hub is configured.

Patch 1 fixes two pre-existing bugs found by a Sashiko review of v2.

Tested on the BeagleY-AI on top of v7.4-rc1: the board boots normally.
The -ENODEV fallback that patch 1 changes is not reached on this board.

I found this by booting commit 85b4bc79dde7 (net/main during the 7.4
merge window) on a BeagleY-AI with BeagleBoard's device tree. A coding
agent identified the problem, explained it to me and proposed an initial
fix, which was revised numerous times on the basis of comments on v1 and
v2, my feedback and local Sashiko reviews. I verified that the series
fixes the problem on top of v7.4-rc1.

v3:
- Add a patch to fix existing problems, as requested by Alan Stern.
- Patch 2: rebased on it, no other change.
v2: https://lore.kernel.org/all/20261030151919.3511106-1-jjc@jclark.com/
v1: https://lore.kernel.org/all/20261030114705.3159093-1-jjc@jclark.com/

#regzbot introduced: f918e3804498

James Clark (2):
  usb: core: clean up before handing a device to the generic driver
  usb: core: add a pre_probe callback for device drivers that may defer

 drivers/usb/core/driver.c          | 42 ++++++++++++++++++++++++++----
 drivers/usb/misc/onboard_usb_dev.c | 15 ++++++-----
 include/linux/usb.h                | 14 ++++++++++
 3 files changed, 59 insertions(+), 12 deletions(-)


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.56.0

