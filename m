Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CED1F3D7D9C
	for <linux-gpio@vger.kernel.org>; Thu, 30 Jul 2026 22:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785448985; cv=none; b=bhP0t3EasRygwGl6dDRRTC8VIbfMClGybFfjS0TuiRBCCZXhbx04eTyfZoAa99Lnl8jmTay1E6ANXEQtZL/K8xgYhLvbEOOcniIsstgXlIjCHIq1ULTkFP2aOxt5p4Kk6+sJ5zn7MkJelak87dkU7IgK7ZXb6NM+t/gfadZkGkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785448985; c=relaxed/simple;
	bh=D9dcnj5LECTV8a7RoNcBDar1wfZuvDpORRSo9O2acMA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UYZOz8gPcXnRKdmt7cqxmhR1guwT9ND4kQBaO6Q1fYjD0I8aOfkMG/t1oGz/dPIUeD55h+8Dl/x/SwL6/1bPWn3r7VMCACx3s/MEWHDDZORaYKNyOkbNo6mQ9Bajzp5KiVoZBTsQu0zlRm3gNHyg4e+FD1asJyby5bAo+DEaBBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b=iwEklnMJ; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b="iwEklnMJ"
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com [209.85.221.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 0C8F53F97C
	for <linux-gpio@vger.kernel.org>; Thu, 30 Jul 2026 22:03:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1785448981;
	bh=/U6NCYIqKYeny+V7yFbvYYYCTzc3996iTQiY0kja4rs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version;
	b=iwEklnMJxi3ctpoL+9cv1inmFPr3WKWlB/IO5aHflQ9krboCv3SxaX+AuumJ0WUdO
	 bJ3QSYktQYE7kZgFqOvF/KBSng1Yo/DEL3aMrDeKCrcM6ap8w/1C+KB8ZJl0qzfy9U
	 RVklmTKOj1hAjc36xEVptj/aoHEnV1zSaRbDvbW6X2wvqI4jgF83XR/CCfe28g1nqB
	 m8VQozsInuHZg03D+cwU83WNpDDtQAi1iUsALJoCtpJrYNjjhu2YaW5r46fAJIStJl
	 Cx9ookYB3MuMG1aUBwqjCayYPKe8V0XLruG56W6GAGZH+/0BDB/q68NO4GnG6c2pcl
	 Ljv8S/y97vzhCPp8IILwAcYnlt9H+qY9FNGzLSDcOgU9UO2HJqKwkFJZ0kj2comQAO
	 fOUpPh4VqVa4a3hvZufo7/ChjalbGcouf+YcSA5/8r5wNJ7/MIxG7eCKMp7WIrYRY5
	 lQ6kFgdr2HdHHYv2Q6XKTvZ+HPd0YRWSQAdEr4VXblROnWW/8ZF1kqWkvNDlw3IwjA
	 I5JWbHmRt+pi8gBrUOsULBvPXnC+PFYZhHTZoRlQ9uDHOYfruZ7Eh1jI/6hdy2h7hR
	 fHKzPSDrQRIQi84g2BhWOqo2LmB6zgCkNZn8VgVjTI5aRJK6sAko+sGtufPK3WRAo+
	 CTpd265pa8G6stWoz93lmL9c=
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-47f8580ed9eso156871f8f.0
        for <linux-gpio@vger.kernel.org>; Thu, 30 Jul 2026 15:03:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785448980; x=1786053780;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/U6NCYIqKYeny+V7yFbvYYYCTzc3996iTQiY0kja4rs=;
        b=reK/eGJXZBjgBuQlepu5paM6SDpk9SZlK5aS4PbhG+CPL/fsLeB31I+/KPqjv3VJzj
         Hap32+WY6EHQHBqDRsP1heo5BNQhYTe/55OONTTeL0QXm0BemWjGON1owxj9utOM8GjJ
         NVf95bf0WhUqz+hyy0k32acQORj0Gy4bbE1P1Ac3Iga6hxoZUmacQhMOOzHMdB9enLyh
         fV/kU3MT4XSyF7d0QmXafWWK71rfCvrijPfQA+v9cz8CJiWTbR5WL9vi+zgI74/h1MA3
         gxRpMEZyOp3sEL03AoQt3e3VY0YVoq7OjOAXYEvVs2jsD4F0Gr5TWosFf2O0ZdrokiH+
         +IBQ==
X-Forwarded-Encrypted: i=1; AHgh+RpEAa2e8VBEZ41bb+Du+FawF6vLbtmlBL51RVQjE0HrNC3l10ia5X1yM9QgmoVMW29Kyowlzc3Y+MxB@vger.kernel.org
X-Gm-Message-State: AOJu0Yyt6B7iivaAzpc3eqFbAKn00168ObhyTr2XtDbOGtARx94DQZbv
	sE8KOPUYaXEav9P+uIdCPpEiJQ+d6Oj3rJavSxJoajBTIgcS+EcSEZVImrrZCgNjMEYwRnPmTWq
	puKnVe5jEwHQkj6iPTLpM78iCz6ZC00QBMiylDevcpbOxKdCN4DHlrWe+sjHIYnwjpFRgzj2ySz
	fLR98=
X-Gm-Gg: AR+sD13xlNlNGmh1/OpmppwgDcRq8S8axYS/aZo5+PjHnImpQftqWFNW+TMkESbaMOO
	M8zEk5ct4rBnGBK4K9EyKyHdfruYDDIEnNOo/mJf45HLvtIj8QpRmZwD5d6PBgG+MaPTosJHvtd
	qIfLi7e7rvRmGYSu/zf10pBFI7ofLoNCYhjPXbyhKy3QIvpwf/2DDVUIqHT5vvh+DEZgVkDPXbe
	VNRpEFiTCC3ZVRt0dfpDWyJcLKxaMv/PI5hXAvnB9Amv8DPC6zso/TUf9uSJbCS5hqWLOSK4uIo
	zQOkGaL7E2Y+w+AK52Zk6kOE+UIzb1UUWGS7B7xh0oO6lNmF62QAJHGO3iGPG7iMAC17QeVLKJp
	opoEw
X-Received: by 2002:a05:6000:310b:b0:47e:1d9a:1123 with SMTP id ffacd0b85a97d-47fc81e0112mr6445744f8f.3.1785448980574;
        Thu, 30 Jul 2026 15:03:00 -0700 (PDT)
X-Received: by 2002:a05:6000:310b:b0:47e:1d9a:1123 with SMTP id ffacd0b85a97d-47fc81e0112mr6445717f8f.3.1785448980173;
        Thu, 30 Jul 2026 15:03:00 -0700 (PDT)
Received: from localhost ([176.43.219.221])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fc8941717sm9947002f8f.34.2026.07.30.15.02.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 15:02:59 -0700 (PDT)
From: Cengiz Can <cengiz.can@canonical.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] gpio: sloppy-logic-analyzer: fix debugfs UAF on unbind
Date: Fri, 31 Jul 2026 01:02:56 +0300
Message-ID: <20260730220258.358169-1-cengiz.can@canonical.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Patch 1 fixes a use-after-free. The "trigger" debugfs file uses
debugfs_create_file_unsafe() with a hand-rolled ->write that dereferences
the devres-freed gpio_la_poll_priv without holding a debugfs reference, so
an unbind racing a write frees the object under the handler. Switching to
debugfs_create_file() makes debugfs_remove_recursive() drain the handler
first.

Patch 2 converts the sibling "buf_size" and "capture" files to
debugfs_create_file() as well, for consistency. They were already safe via
DEFINE_DEBUGFS_ATTRIBUTE(); this is the cleanup requested on v1.

v1 was a single patch that fixed only "trigger". v2 splits it so the fix
carries the stable tag on its own, and adds the consistency conversion as a
separate cleanup.

Note: while testing this I found a pre-existing deadlock in the driver
(gpio_la_poll_remove() holds blob_lock across debugfs_remove_recursive(),
which drains the buf_size/capture handlers that also take blob_lock). It is
unrelated to this series; I will send it separately.

Cengiz Can (2):
  gpio: sloppy-logic-analyzer: fix use-after-free via debugfs trigger on
    unbind
  gpio: sloppy-logic-analyzer: use debugfs_create_file() for buf_size
    and capture

 drivers/gpio/gpio-sloppy-logic-analyzer.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

-- 
2.43.0

